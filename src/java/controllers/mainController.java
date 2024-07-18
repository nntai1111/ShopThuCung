/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class mainController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = "";
            String ac = request.getParameter("action");
            if (ac == null) {
                url = "adminhome.jsp";
            } else {
                switch (ac) {
                    case CONSTANTS.ADMINHOME:
                        url = "dashboardController";
                        break;
                    case CONSTANTS.HOME:
                        url = "home.jsp";
                        break;
                    case CONSTANTS.VIEWCUSTOMER:
                        url = "viewcustomer.jsp";
                        break;
                    case CONSTANTS.MANACUSTOMER:
                        url = "manageCustomerController";
                        break;
                    case CONSTANTS.SEARCHCUSTOMER:
                        url = "searchCustomerController";
                        break;
                    case CONSTANTS.DELETECUSTOMER:
                        url = "deleteCustomerController";
                        break;
                    case CONSTANTS.VIEWINFOCUSTOMER:
                        url = "viewInfoCustomerController";
                        break;
                    case CONSTANTS.FORMADDCUSTOMER:
                        url = "formaddcustomer.jsp";
                        break;
                    case CONSTANTS.ADDCUSTOMER:
                        url = "addCustomerController";
                        break;
                    case CONSTANTS.DELETEPET:
                        url = "deletePetController";
                        break;
                    
                    case CONSTANTS.MANASERVICE:
                        url = "manaServiceController";
                        break;
                    case CONSTANTS.VIEWSERVICE:
                        url = "viewservice.jsp";
                        break;
                    case CONSTANTS.DELETESERVICE:
                        url = "deleteServiceController";
                        break;
                    case CONSTANTS.GOADDSERVICE:
                        url = "goAddService";
                        break;
                    case CONSTANTS.ADDSERVICE:
                        url = "addServiceController";
                        break;
                    case CONSTANTS.VIEWINFOSERVICE:
                        url = "viewInFoServiceController";
                        break;
                    case CONSTANTS.TOPCUSTOMER:
                        url = "topCustomerController";
                        break;
                    case CONSTANTS.MANAFEEDBACK:
                        url = "manaFeedbackController";
                        break;
                     case CONSTANTS.VIEWFEEDBACK:
                        url = "viewfeedback.jsp";
                        break;
                    case CONSTANTS.UPDATESERVICE:
                        url = "updateServiceController";
                        break;
                    case CONSTANTS.DASHBOARD:
                        url = "dashboardController";
                        break;
                    case CONSTANTS.LOGIN:
                        url = "loginController";
                        break;
                    case CONSTANTS.FORMLOGIN:
                        url = "formLogin.jsp";
                        break;
                    

                }
                request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
