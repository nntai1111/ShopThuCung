/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Pet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mylibs.DBUtils;

/**
 *
 * @author ADMIN
 */
public class PetDao {

    public ArrayList<Pet> getListPet(String accid) {
        ArrayList<Pet> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Pet_id],[Acc_id],[Breed_id],[Typepet_id],[Weight],[Status]\n"
                        + "FROM [dbo].[Pets]\n"
                        + "WHERE [Acc_id] = ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, accid);
                ResultSet table = st.executeQuery();

                if (table != null) {
                    while (table.next()) {
                        int m_petid = table.getInt("Pet_id");
                        int m_accid = table.getInt("Acc_id");
                        String m_breedid = table.getString("Breed_id");
                        String m_typepetid = table.getString("Typepet_id");
                        float m_weight = table.getFloat("Weight");
                        int m_status = table.getInt("Status");

                        Pet rs = new Pet(m_petid, m_accid, m_breedid, m_typepetid, m_weight, m_status);
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

    public int updateStatus(int status, String petid) {
        int rs = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "UPDATE [dbo].[Pets]\n"
                        + "SET [Status] = ?\n"
                        + "WHERE [Pet_id] = ?";
                PreparedStatement statement = cn.prepareStatement(sql);

                // Thiết lập giá trị mới
                String newValue = String.valueOf(status);
                statement.setString(1, newValue);

                // Thiết lập điều kiện để xác định hàng cần cập nhật
                String conditionValue = petid;
                statement.setString(2, conditionValue);

                // Thực thi câu truy vấn
                rs = statement.executeUpdate();

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

}
