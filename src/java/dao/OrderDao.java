/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import dto.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import mylibs.DBUtils;

/**
 *
 * @author ADMIN
 */
public class OrderDao {

    public ArrayList<Order> getListOrderByAccid(String accid) {
        ArrayList<Order> list = new ArrayList<>();
        AccountDao d = new AccountDao();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Order_id],[Acc_id],[Total_price],[Order_date],[Payment_id],[Payment_id],[Feedback_id],[Status]\n"
                        + "FROM  [dbo].[Orders]\n"
                        + "WHERE [Acc_id] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(accid));
                ResultSet table = pst.executeQuery();

                while (table.next()) {
                    int orderId = table.getInt("Order_id");
                    int accountId = table.getInt("Acc_id");
                    int totalPrice = table.getInt("Total_price");
                    Date orderDate = table.getDate("Order_date");
                    int paymentId = table.getInt("Payment_id");
                    int feedbackId = table.getInt("Feedback_id");
                    int status = table.getInt("Status");

                    Order order = new Order(orderId, accountId, totalPrice, orderDate, paymentId, feedbackId, status);
                    list.add(order);
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

    public int getQuantityOrderByAccId(int accId) {
        int orderCount = 0;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT Acc_id, COUNT(*) AS OrderCount\n"
                        + "FROM Orders\n"
                        + "WHERE Acc_id = ?\n"
                        + "GROUP BY Acc_id";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accId);
                ResultSet table = pst.executeQuery();
                if (table.next()) {
                    orderCount = table.getInt("OrderCount");
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
        return orderCount;
    }

    public int getQuantityOrderByTime() {
        int orderCount = 0;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT COUNT(*) AS Total_Order\n"
                        + "FROM Orders\n"
                        + "WHERE YEAR(Order_date) = ? AND MONTH(Order_date) = ?";

                LocalDate currentDate = LocalDate.now();
                int year = currentDate.getYear();
                int month = currentDate.getMonthValue();

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, year);
                pst.setInt(2, month);

                ResultSet table = pst.executeQuery();
                if (table.next()) {
                    orderCount = table.getInt("Total_Order");
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
        return orderCount;
    }

    public int getToalPriceOrderByTime() {
        int totalPrice = 0;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT YEAR(Order_date) AS Year,\n"
                        + "       MONTH(Order_date) AS Month,\n"
                        + "       SUM(Total_price) AS Total_Price\n"
                        + "FROM Orders\n"
                        + "WHERE YEAR(Order_date) = ? AND MONTH(Order_date) = ?\n"
                        + "GROUP BY YEAR(Order_date), MONTH(Order_date)";

                LocalDate currentDate = LocalDate.now();
                int year = currentDate.getYear();
                int month = currentDate.getMonthValue();

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, year);
                pst.setInt(2, month);

                ResultSet table = pst.executeQuery();
                if (table.next()) {
                    totalPrice = table.getInt("Total_Price");
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
        return totalPrice ;

    }

}
