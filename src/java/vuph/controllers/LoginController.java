/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vuph.daos.RegistrationDAO;
import vuph.dtos.RegistrationErrorObj;

/**
 *
 * @author Vu PH
 */
public class LoginController extends HttpServlet {

    private final String ADMIN = "admin/index.jsp";
    private final String IRONMAN = "ironman/index.jsp";
    private final String USER = "user/index.jsp";
    private final String INVALID = "login.jsp";

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
        String url = INVALID;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            RegistrationDAO dao = new RegistrationDAO();
            String role = dao.checkLogin(username, password);
            RegistrationErrorObj errorObj = new RegistrationErrorObj();
            boolean valid = true;
            if (username.isEmpty()) {
                errorObj.setUsernameError("Username can not be empty!");
                valid = false;
            }
            if (password.isEmpty()) {
                errorObj.setPasswordError("Password can not be empty!");
                valid = false;
            }
            if (valid) {
                if (!role.equals("failed")) {
                    HttpSession session = request.getSession();
                    if (session.getAttribute("ROLE") != null) {
                        
                    } else {
                        if (role.equals("admin")) {
                            url = ADMIN;
                            session.setAttribute("USERNAME", username);
                            session.setAttribute("ROLE", "admin");
                        } else if (role.equals("ironman")) {
                            url = IRONMAN;
                            session.setAttribute("USERNAME", username);
                            session.setAttribute("ROLE", "ironman");
                        } else if (role.equals("user")) {
                            url = USER;
                            session.setAttribute("USERNAME", username);
                            session.setAttribute("ROLE", "user");
                        } else {
                            request.setAttribute("ERROR", "Username or Password not right");
                        }
                    }
                } else {
                    request.setAttribute("ERROR", "Username or Password not right");
                }
            } else {
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());
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
