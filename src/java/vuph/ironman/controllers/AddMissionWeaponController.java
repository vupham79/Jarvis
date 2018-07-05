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
import vuph.daos.AvengerDAO;
import vuph.daos.MarksDAO;
import vuph.daos.MissionDAO;

/**
 *
 * @author Vu PH
 */
public class AddMissionWeaponController extends HttpServlet {

    private static final String ADD = "mission/add_mission_weapon.jsp";
    private static final String SUBMIT = "ViewMissionWeaponController";

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
                AvengerDAO avengerDao = new AvengerDAO();
                MarksDAO markDao = new MarksDAO();
                List<String> marks = (List<String>) markDao.getMarksNotUsedOfMission(request.getParameter("missionId"));
                List<String> avengers = (List<String>) avengerDao.getAvengers();
                request.setAttribute("AVENGERS", avengers);
                request.setAttribute("MARKS", marks);
                url = ADD;
            } else {
                MissionDAO dao = new MissionDAO();
                String weaponId = request.getParameter("markId");
                String avengerId = request.getParameter("avengerId");
                String missionId = request.getParameter("missionId");
                String type = "Mark";
                dao.addMissionWeaponOfOne(weaponId, avengerId, missionId, type);
                url = SUBMIT;
            }
        } catch (Exception e) {
            log("ERROR at AddMissionWeaponController: " + e.getMessage());
            request.setAttribute("ERROR", "Add mission's weapon failed!");
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
