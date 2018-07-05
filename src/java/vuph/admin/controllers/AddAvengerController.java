/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.admin.controllers;

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
public class AddAvengerController extends HttpServlet {

    private static final String SUBMIT = "ViewAvengerController";
    private static final String ADD = "avenger/add_avenger.jsp";

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
        String url = null;
        try {
            String action = request.getParameter("action");
            if (action.equals("Add")) {
                url = ADD;
            } else if (action.equals("Submit")) {
                String password = request.getParameter("txtPassword");
                String confirm = request.getParameter("txtConfirm");
                if (password.equals(confirm)) {
                    AvengerDAO dao = new AvengerDAO();
                    String avengerId = request.getParameter("txtId");
                    String fullname = request.getParameter("txtName");
                    String role = request.getParameter("txtRole");
                    String status = request.getParameter("txtStatus");
                    dao.addAvenger(new AvengerDTO(avengerId, password, fullname, role, status));
                    url = SUBMIT;
                } else {
                    request.setAttribute("ERROR", "Confirm password does not match!");
                    url = ADD;
                }
            }
        } catch (Exception e) {
            log("ERROR at AddMissionController: " + e.getMessage());
            request.setAttribute("ERROR", "Add Avenger Failed!");
            url = SUBMIT;
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
