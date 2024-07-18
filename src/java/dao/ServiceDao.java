/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Service;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylibs.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ServiceDao {

    public ArrayList<Service> getListService() {
        ArrayList<Service> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Service_id],[Typeservice_id],[Typepet_id],[Description],[Weight_range],[Expiration_date],[Price],[Discount],[Quantity],[Image],[Status]\n"
                        + "FROM [dbo].[Services]";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int m_serviceid = table.getInt("Service_id");
                        String m_typeserviceid = table.getString("Typeservice_id");
                        String m_typepetid = table.getString("Typepet_id");
                        String m_description = table.getString("Description");
                        float m_weightrange = table.getFloat("Weight_range");
                        Date m_registerdate = table.getDate("Expiration_date");
                        int m_price = table.getInt("Price");
                        int m_discount = table.getInt("Discount");
                        int m_quantity = table.getInt("Quantity");
                        String m_img = table.getString("Image");
                        int m_status = table.getInt("Status");
                        Service rs = new Service(m_serviceid, m_typeserviceid, m_typepetid, m_description, m_weightrange, m_registerdate, m_price, m_discount, m_quantity, m_img, m_status);
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
    
    public Service getServiceByID(String serid) {
        Service rs = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Service_id],[Typeservice_id],[Typepet_id],[Description],[Weight_range],[Expiration_date],[Price],[Discount],[Quantity],[Image],[Status]\n"
                        + "FROM [dbo].[Services] \n"
                        + "WHERE [Service_id] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, serid);
                ResultSet table = pst.executeQuery();

                if (table != null && table.next()) {
                    int m_serviceid = table.getInt("Service_id");
                        String m_typeserviceid = table.getString("Typeservice_id");
                        String m_typepetid = table.getString("Typepet_id");
                        String m_description = table.getString("Description");
                        float m_weightrange = table.getFloat("Weight_range");
                        Date m_registerdate = table.getDate("Expiration_date");
                        int m_price = table.getInt("Price");
                        int m_discount = table.getInt("Discount");
                        int m_quantity = table.getInt("Quantity");
                        String m_img = table.getString("Image");
                        int m_status = table.getInt("Status");
                        rs = new Service(m_serviceid, m_typeserviceid, m_typepetid, m_description, m_weightrange, m_registerdate, m_price, m_discount, m_quantity, m_img, m_status);
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

    public int updateStatus(int status, String serviceid) {
        int rs = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "UPDATE [dbo].[Services]\n"
                        + "SET [Status] = ?\n"
                        + "WHERE [Service_id] = ?";

                PreparedStatement statement = cn.prepareStatement(sql);

                // Thiết lập giá trị mới
                String newValue = String.valueOf(status);
                statement.setString(1, newValue);

                // Thiết lập điều kiện để xác định hàng cần cập nhật
                String conditionValue = serviceid;
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

    public int addService(Service ser) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //insert 1 row vao order
                cn.setAutoCommit(false);
                String sql = "INSERT INTO Services (Typeservice_id, Typepet_id, Description, Weight_range, Expiration_date, Price, Discount, Quantity, Image, Status)\n"
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, ser.getTypeservice());
                pst.setString(2, ser.getTypepetid());
                pst.setString(3, ser.getDescription());
                pst.setFloat(4, ser.getWeightrange());
                pst.setDate(5, ser.getExpiration());
                pst.setInt(6, ser.getPrice());
                pst.setInt(7, ser.getDiscount());
                pst.setInt(8, ser.getQuantity());
                pst.setString(9, ser.getImg());
                pst.setInt(10,ser.getStatus());

                result = pst.executeUpdate();
                cn.commit();
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
        return result;
    }
    
    

}
