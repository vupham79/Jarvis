/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.ironman.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vuph.daos.AvengerDAO;
import vuph.dtos.AvengerDTO;

/**
 *
 * @author Vu PH
 */
public class UpdateAccountController extends HttpServlet {

    private static final String UPDATE = "ViewAccountController";
    private static final String EDIT = "account/update_account.jsp";
    private static final String ERROR = "error.jsp";

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
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("Edit")) {
                url = EDIT;
            } else if (action.equals("Update")) {
                url = EDIT;
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");
                if (!newPassword.equals(confirmPassword)) {
                    request.setAttribute("ERROR", "Confirm password and new password not match!");
                } else {
                    AvengerDAO dao = new AvengerDAO();
                    String avengerId = request.getSession().getAttribute("USERNAME").toString();
                    String password = dao.getPasswordOfOne(avengerId);
                    if (oldPassword.equals(password)) {
                        String fullname = request.getParameter("fullname");
                        String role = request.getParameter("role");
                        String status = request.getParameter("status");
                        dao.updateAvengerAsUser(new AvengerDTO(avengerId, password, fullname, role, status));
                        url = UPDATE;
                    } else {
                        request.setAttribute("ERROR", "Old password not right!");
                    }
                }
            }
        } catch (Exception e) {
            log("ERROR at UpdateAccountController: " + e.getMessage());
            request.setAttribute("ERROR", "Update Account Failed!");
            url = UPDATE;
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
