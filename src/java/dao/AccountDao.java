/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import javafx.animation.Animation;

import mylibs.DBUtils;

/**
 *
 * @author ADMIN
 */
public class AccountDao {

    public Account getAccount(String email, String password) {
        Account rs = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Acc_id],[Email],[Password],[PhoneNumber],[FullName],[Register_Date],[Role],[Status]\n"
                        + "FROM [dbo].[Accounts] \n"
                        + "WHERE [Email] = ? AND [Password] = ? and [Role] = 'Admin'";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet table = pst.executeQuery();

                if (table != null && table.next()) {
                    int m_accid = table.getInt("Acc_id");
                    String m_email = table.getString("Email");
                    String m_password = table.getString("Password");
                    String m_fullname = table.getString("FullName");
                    String m_phonenumber = table.getString("PhoneNumber");
                    Date m_registerdate = table.getDate("Register_Date");
                    String m_role = table.getString("Role");
                    int m_status = table.getInt("Status");
                    rs = new Account(m_accid, m_fullname, m_phonenumber, m_email, m_password, m_registerdate, m_role, m_status);
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

    public ArrayList<Account> getListAccount() {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Acc_id],[Email],[Password],[PhoneNumber],[FullName],[Register_Date],[Role],[Status]\n"
                        + "FROM [dbo].[Accounts] \n";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int m_accid = table.getInt("Acc_id");
                        String m_email = table.getString("Email");
                        String m_password = table.getString("Password");
                        String m_fullname = table.getString("FullName");
                        String m_phonenumber = table.getString("PhoneNumber");
                        Date m_registerdate = table.getDate("Register_Date");
                        String m_role = table.getString("Role");
                        int m_status = table.getInt("Status");
                        Account rs = new Account(m_accid, m_fullname, m_phonenumber, m_email, m_password, m_registerdate, m_role, m_status);
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

    public ArrayList<Account> getAccountsByName(String name) {
        ArrayList<Account> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Acc_id],[Email],[Password],[PhoneNumber],[FullName],[Register_Date],[Role],[Status]\n"
                        + "FROM [dbo].[Accounts]\n"
                        + "WHERE LOWER([FullName]) LIKE ?";

                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, "%" + name.toLowerCase() + "%");
                ResultSet table = st.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int m_accid = table.getInt("Acc_id");
                        String m_email = table.getString("Email");
                        String m_password = table.getString("Password");
                        String m_fullname = table.getString("FullName");
                        String m_phonenumber = table.getString("PhoneNumber");
                        Date m_registerdate = table.getDate("Register_Date");
                        String m_role = table.getString("Role");
                        int m_status = table.getInt("Status");
                        Account rs = new Account(m_accid, m_fullname, m_phonenumber, m_email, m_password, m_registerdate, m_role, m_status);
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

    public int updateStatus(int status, String accid) {
        int rs = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                String sql = "UPDATE Accounts\n"
                        + "SET Status = ?\n"
                        + "WHERE Acc_id = ?;";
                PreparedStatement statement = cn.prepareStatement(sql);

                // Thiết lập giá trị mới
                String newValue = String.valueOf(status);
                statement.setString(1, newValue);

                // Thiết lập điều kiện để xác định hàng cần cập nhật
                String conditionValue = accid;
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

    public Account getAccountByID(String accid) {
        Account rs = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Acc_id],[Email],[Password],[PhoneNumber],[FullName],[Register_Date],[Role],[Status]\n"
                        + "FROM [dbo].[Accounts] \n"
                        + "WHERE [Acc_id]=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, accid);
                ResultSet table = pst.executeQuery();

                if (table != null && table.next()) {
                    int m_accid = table.getInt("Acc_id");
                    String m_email = table.getString("Email");
                    String m_password = table.getString("Password");
                    String m_fullname = table.getString("FullName");
                    String m_phonenumber = table.getString("PhoneNumber");
                    Date m_registerdate = table.getDate("Register_Date");
                    String m_role = table.getString("Role");
                    int m_status = table.getInt("Status");
                    rs = new Account(m_accid, m_fullname, m_phonenumber, m_email, m_password, m_registerdate, m_role, m_status);
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

    public int addCustomer(Account acc) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //insert 1 row vao order
                cn.setAutoCommit(false);
                String sql = "INSERT INTO Accounts (Email, Password, PhoneNumber, FullName, Register_Date, Role, Status)\n"
                        + "VALUES (?,?,?,?,?,?,?);";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, acc.getEmail());
                pst.setString(2, acc.getPassword());
                pst.setString(3, acc.getPhonenumber());
                pst.setString(4, acc.getFullname());
                pst.setDate(5, new Date(System.currentTimeMillis()));
                pst.setString(6, acc.getRole());
                pst.setInt(7, 1);

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

    public ArrayList<Account> getListTopCustomer() {
        ArrayList<Account> list = new ArrayList<>();
        AccountDao d = new AccountDao();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT TOP 5 A.Acc_id, COUNT(*) AS OrderCount\n"
                        + "FROM Accounts AS A\n"
                        + "INNER JOIN Orders AS O ON A.Acc_id = O.Acc_id\n"
                        + "WHERE A.Status != 0 AND A.Role = 'User' \n"
                        + "GROUP BY A.Acc_id\n"
                        + "ORDER BY A.Acc_id ASC, OrderCount DESC;";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                while (table.next()) {
                    String accId = String.valueOf(table.getInt("Acc_id"));
                    Account acc = d.getAccountByID(accId);
                    list.add(acc);
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

    public int getTotalAccountByTime() {
        int rs = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                LocalDate currentDate = LocalDate.now();
                int year = currentDate.getYear();
                int month = currentDate.getMonthValue();

                String sql = "SELECT COUNT(Acc_id) AS Account_Count\n"
                        + "FROM Accounts\n"
                        + "WHERE YEAR(Register_Date) = ? AND MONTH(Register_Date) = ? AND Role = 'User'";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, year);
                st.setInt(2, month);

                ResultSet table = st.executeQuery();

                if (table.next()) {
                    rs = table.getInt("Account_Count");
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

}
