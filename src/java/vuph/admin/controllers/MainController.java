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

/**
 *
 * @author Vu PH
 */
public class MainController extends HttpServlet {
    
    private static final String VIEW_ACCOUNT_CONTROLLER = "ViewAccountController";
    private static final String UPDATE_ACCOUNT_CONTROLLER = "UpdateAccountController";
    private static final String VIEW_MISSION_CONTROLLER = "ViewMissionController";
    private static final String SEARCH_MISSION_CONTROLLER = "SearchMissionController";
    private static final String UPDATE_MISSION_CONTROLLER = "UpdateMissionController";
    private static final String DELETE_MISSION_CONTROLLER = "DeleteMissionController";
    private static final String ADD_MISSION_CONTROLLER = "AddMissionController";
    private static final String SEARCH_AVENGER_CONTROLLER = "SearchAvengerController";
    private static final String VIEW_AVENGER_CONTROLLER = "ViewAvengerController";
    private static final String UPDATE_AVENGER_CONTROLLER = "UpdateAvengerController";
    private static final String DELETE_AVENGER_CONTROLLER = "DeleteAvengerController";
    private static final String ADD_AVENGER_CONTROLLER = "AddAvengerController";
    private static final String VIEW_MISSION_WEAPON_CONTROLLER = "ViewMissionWeaponController";
    private static final String UPDATE_MISSION_WEAPON_CONTROLLER = "UpdateMissionWeaponController";
    private static final String ADD_MISSION_WEAPON_CONTROLLER = "AddMissionWeaponController";
    private static final String DELETE_MISSION_WEAPON_CONTROLLER = "DeleteMissionWeaponController";
    private static final String VIEW_WEAPON_CONTROLLER = "ViewWeaponController";
    private static final String SEARCH_WEAPON_CONTROLLER = "SearchWeaponController";
    private static final String UPDATE_WEAPON_CONTROLLER = "UpdateWeaponController";
    private static final String ADD_WEAPON_CONTROLLER = "AddWeaponController";
    private static final String DELETE_WEAPON_CONTROLLER = "DeleteWeaponController";
    private static final String VIEW_MARK_CONTROLLER = "ViewMarkController";
    private static final String SEARCH_MARK_CONTROLLER = "SearchMarkController";
    private static final String UPDATE_MARK_CONTROLLER = "UpdateMarkController";
    private static final String ADD_MARK_CONTROLLER = "AddMarkController";
    private static final String DELETE_MARK_CONTROLLER = "DeleteMarkController";
    private static final String VIEW_MISSION_DETAIL_CONTROLLER = "ViewMissionDetailController";
    private static final String UPDATE_MISSION_DETAIL_CONTROLLER = "UpdateMissionDetailController";
    private static final String ADD_MISSION_DETAIL_CONTROLLER = "AddMissionDetailController";
    private static final String DELETE_MISSION_DETAIL_CONTROLLER = "DeleteMissionDetailController";
    private static final String LOGOUT_ACCOUNT_CONTROLLER = "/LogoutAccountController";
    private static final String ERROR = "/error.jsp";

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
            String controller = request.getParameter("controller");
            if (controller.equals("ViewAccountController")) {
                url = VIEW_ACCOUNT_CONTROLLER;
            } else if (controller.equals("UpdateAccountController")) {
                url = UPDATE_ACCOUNT_CONTROLLER;
            } else if (controller.equals("ViewMissionController")) {
                url = VIEW_MISSION_CONTROLLER;
            } else if (controller.equals("SearchMissionController")) {
                url = SEARCH_MISSION_CONTROLLER;
            } else if (controller.equals("AddMissionController")) {
                url = ADD_MISSION_CONTROLLER;
            } else if (controller.equals("DeleteMissionController")) {
                url = DELETE_MISSION_CONTROLLER;
            } else if (controller.equals("UpdateMissionController")) {
                url = UPDATE_MISSION_CONTROLLER;
            } else if (controller.equals("ViewAvengerController")) {
                url = VIEW_AVENGER_CONTROLLER;
            } else if (controller.equals("SearchAvengerController")) {
                url = SEARCH_AVENGER_CONTROLLER;
            } else if (controller.equals("AddAvengerController")) {
                url = ADD_AVENGER_CONTROLLER;
            } else if (controller.equals("DeleteAvengerController")) {
                url = DELETE_AVENGER_CONTROLLER;
            } else if (controller.equals("UpdateAvengerController")) {
                url = UPDATE_AVENGER_CONTROLLER;
            } else if (controller.equals("ViewMarkController")) {
                url = VIEW_MARK_CONTROLLER;
            } else if (controller.equals("SearchMarkController")) {
                url = SEARCH_MARK_CONTROLLER;
            } else if (controller.equals("DeleteMarkController")) {
                url = DELETE_MARK_CONTROLLER;
            } else if (controller.equals("UpdateMarkController")) {
                url = UPDATE_MARK_CONTROLLER;
            } else if (controller.equals("AddMarkController")) {
                url = ADD_MARK_CONTROLLER;
            } else if (controller.equals("ViewWeaponController")) {
                url = VIEW_WEAPON_CONTROLLER;
            } else if (controller.equals("SearchWeaponController")) {
                url = SEARCH_WEAPON_CONTROLLER;
            } else if (controller.equals("AddWeaponController")) {
                url = ADD_WEAPON_CONTROLLER;
            } else if (controller.equals("UpdateWeaponController")) {
                url = UPDATE_WEAPON_CONTROLLER;
            } else if (controller.equals("DeleteWeaponController")) {
                url = DELETE_WEAPON_CONTROLLER;
            } else if (controller.equals("ViewMissionDetailController")) {
                url = VIEW_MISSION_DETAIL_CONTROLLER;
            } else if (controller.equals("AddMissionDetailController")) {
                url = ADD_MISSION_DETAIL_CONTROLLER;
            } else if (controller.equals("DeleteMissionDetailController")) {
                url = DELETE_MISSION_DETAIL_CONTROLLER;
            } else if (controller.equals("UpdateMissionDetailController")) {
                url = UPDATE_MISSION_DETAIL_CONTROLLER;
            } else if (controller.equals("ViewMissionWeaponController")) {
                url = VIEW_MISSION_WEAPON_CONTROLLER;
            } else if (controller.equals("AddMissionWeaponController")) {
                url = ADD_MISSION_WEAPON_CONTROLLER;
            } else if (controller.equals("UpdateMissionWeaponController")) {
                url = UPDATE_MISSION_WEAPON_CONTROLLER;
            } else if (controller.equals("DeleteMissionWeaponController")) {
                url = DELETE_MISSION_WEAPON_CONTROLLER;
            } else if (controller.equals("LogoutAccountController")) {
                url = LOGOUT_ACCOUNT_CONTROLLER;
            } else {
                request.setAttribute("ERROR", "PAGE NOT FOUND!");
            }
        } catch (Exception e) {
            log("ERROR at AdminMainController: " + e.getMessage());
            request.setAttribute("ERROR", "PAGE NOT FOUND!");
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
