/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.ironman.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vuph.daos.MissionDAO;

/**
 *
 * @author Vu PH
 */
public class AddMissionController extends HttpServlet {

    private static final String SUBMIT = "ViewMissionController";
    private static final String ADD = "/ironman/mission/add_mission.jsp";
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
            String avengerId = request.getSession().getAttribute("USERNAME").toString();
            MissionDAO dao = new MissionDAO();
            String action = request.getParameter("action");
            if (action.equals("Add")) {
                List<String> missions = dao.getMissionsNotJoin(avengerId);
                request.setAttribute("MISSIONS", missions);
                url = ADD;
            } else if (action.equals("Submit")) {
                String missionId = request.getParameter("missionId");
                String avengerStatus = request.getParameter("avengerStatus");
                dao.addMissionOfOne(missionId, avengerId, avengerStatus);
                url = SUBMIT;
            }
        } catch (Exception e) {
            log("ERROR at IronmanAddMissionController: " + e.getMessage());
            request.setAttribute("ERROR", "Add Mission Failed!");
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
