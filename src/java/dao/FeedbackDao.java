/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Feedback;
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
public class FeedbackDao {

    public ArrayList<Feedback> getListFeedback() {
        ArrayList<Feedback> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [Feedback_id],[Feedback_text],[Reply_text],[Reply_date],[Status]\n"
                        + "FROM[dbo].[Feedback]";

                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);

                if (table != null) {
                    while (table.next()) {
                        int m_id = table.getInt("Feedback_id");
                        String m_feedback = table.getString("Feedback_text");
                        String m_reply = table.getString("Reply_text");
                        Date m_replydate = table.getDate("Reply_date");
                        int m_status = table.getInt("Status");
                        Feedback rs = new Feedback(m_id, m_feedback, m_reply, m_replydate, m_status);
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



