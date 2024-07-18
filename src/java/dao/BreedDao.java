/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Breed;
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
public class BreedDao {

    public Breed getBreedById(String breedid) {
        Breed rs = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT[Breed_id],[Typepet_id],[Name]\n"
                        + "FROM [dbo].[Breeds]\n"
                        + "WHERE [Breed_id] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1,breedid);
                ResultSet table = pst.executeQuery();

                if (table != null && table.next()) {
                    String m_id = table.getString("Breed_id");
                    String m_typetid = table.getString("Typepet_id");
                    String m_name = table.getString("Name");
                    rs = new Breed(m_id, m_name, m_typetid);

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

    public ArrayList<Breed> getListBreed() {
        ArrayList<Breed> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT[Breed_id],[Typepet_id],[Name]\n"
                        + "FROM [dbo].[Breeds]";

                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);

                if (table != null) {
                    while (table.next()) {
                        String m_breedid = table.getString("Breed_id");
                        String m_typepetid = table.getString("Typepet_id");
                        String m_name = table.getString("Name");
                        Breed rs = new Breed(m_breedid, m_name, m_typepetid);
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
