/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TypePet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylibs.DBUtils;

/**
 *
 * @author ADMIN
 */
public class TypePetDao {

    public TypePet getTypePetById(String typepetid) {
        TypePet rs = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Typepet_id],[Name]\n"
                        + "FROM [dbo].[TypePets]\n"
                        + "WHERE [Typepet_id] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, typepetid);
                ResultSet table = pst.executeQuery();

                if (table != null && table.next()) {
                    String m_id = table.getString("Typepet_id");
                    String m_name = table.getString("Name");
                    rs = new TypePet(m_id, m_name);

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;

    }

    public ArrayList<TypePet> getListTypepet() {
        ArrayList<TypePet> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT[Typepet_id],[Name]\n"
                        + "FROM [dbo].[TypePets]";

                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);

                if (table != null) {
                    while (table.next()) {
                        String m_typepetid = table.getString("Typepet_id");
                        String m_name = table.getString("Name");
                        TypePet rs = new  TypePet(m_typepetid, m_name);
                        list.add(rs);

                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
