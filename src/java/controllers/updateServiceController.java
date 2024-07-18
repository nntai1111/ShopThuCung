/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ServiceDao;
import dto.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class updateServiceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String typeserviceId = request.getParameter("txttypeservice");

            String typepetId = request.getParameter("txttypepetid");

            String description = request.getParameter("txtdescription");

            float weightRange = Float.parseFloat(request.getParameter("txtweightrange"));

            int price = Integer.parseInt(request.getParameter("txtprice"));

            int discount = Integer.parseInt(request.getParameter("txtdiscount"));

            int quantity;
            java.sql.Date expirationDate;

            if (!typeserviceId.equalsIgnoreCase("A") && !typeserviceId.equalsIgnoreCase("B") && !typeserviceId.equalsIgnoreCase("C")) {
                quantity = Integer.parseInt(request.getParameter("txtquantity"));
                String expirationDateString = request.getParameter("txtexpiration");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date expirationUtilDate = sdf.parse(expirationDateString);
                expirationDate = new java.sql.Date(expirationUtilDate.getTime());
            } else {
                quantity = 0;
                expirationDate = new java.sql.Date(System.currentTimeMillis());
            }

            Service ser = new Service(0, typeserviceId, typepetId, description, weightRange, expirationDate, price, discount, quantity, "imgnull.jsp", 1);
            ServiceDao sd = new ServiceDao();
            int result1 = sd.addService(ser);
            String id = request.getParameter("txtserviceid");
            int result2 = sd.updateStatus(0, id);

            if (result1 > 0 && result2 > 0) {
                request.getRequestDispatcher("mainController?action=manaservice").forward(request, response);
            } else {
                response.sendRedirect("error.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(updateServiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(updateServiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
