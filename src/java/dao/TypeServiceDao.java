/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TypeService;
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
public class TypeServiceDao {

    public TypeService getTypeServiceById(String typeserviceid) {
        TypeService rs = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Typeservice_id],[Name],[Description],[Status]\n"
                        + "FROM [dbo].[TypeServices]\n"
                        + "WHERE [Typeservice_id] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, typeserviceid);
                ResultSet table = pst.executeQuery();

                if (table != null && table.next()) {
                    String m_id = table.getString("Typeservice_id");
                    String m_name = table.getString("Name");
                    String m_description = table.getString("Status");
                    int m_status = table.getInt("Status");
                    rs = new TypeService(m_id, m_name, m_description, m_status);
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

    public ArrayList<TypeService> getListTypeservice() {
        ArrayList<TypeService> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Typeservice_id],[Name],[Description],[Status]\n"
                        + "FROM [dbo].[TypeServices]";

                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);

                if (table != null) {
                    while (table.next()) {
                        String m_typeserviceid = table.getString("Typeservice_id");
                        String m_name = table.getString("Name");
                        String m_description = table.getString("Description");
                        int m_status = table.getInt("Status");
                        TypeService rs = new TypeService(m_typeserviceid, m_name, m_description, m_status);
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
