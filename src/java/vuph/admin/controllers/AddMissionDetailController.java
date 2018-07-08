/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.admin.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vuph.daos.AvengerDAO;
import vuph.daos.MissionDAO;

/**
 *
 * @author Vu PH
 */
public class AddMissionDetailController extends HttpServlet {

    private static final String ADD = "mission/add_mission_detail.jsp";
    private static final String SUBMIT = "ViewMissionDetailController";

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
        String url = ADD;
        try {
            String action = request.getParameter("action");
            if (action.equals("Add")) {
                AvengerDAO dao = new AvengerDAO();
                List<String> avengers = dao.getAvengers();
                request.setAttribute("AVENGERS", avengers);
                url = ADD;
            } else if (action.equals("Submit")) {
                MissionDAO dao = new MissionDAO();
                String missionId = request.getParameter("missionId");
                String avengerId = request.getParameter("avengerId");
                String status = request.getParameter("status");
                dao.addMissionDetail(avengerId, status, missionId);
                url = SUBMIT;
            }
        } catch (Exception e) {
            log("ERROR at AddMissionDetailController: " + e.getMessage());
            request.setAttribute("ERROR", "AVENGER ADDED ALREADY!");
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
