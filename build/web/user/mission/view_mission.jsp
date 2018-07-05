<%-- 
    Document   : view_mission
    Created on : Jul 4, 2018, 12:15:05 PM
    Author     : Vu PH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="vuph.dtos.MissionDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a href="index.html" class="logo"><img src="images/logo.png" alt=""></a>
                    <ul id="navigation">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="ViewAccountController">Account</a>
                        </li>
                        <li class="selected">                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="ViewWeaponController">Weapon</a>
                        </li>
                    </ul>
                </div>
            </div>
            <font color="red">
            ${requestScope.ERROR}
            </font>
            <%
                List<MissionDTO> list = (List<MissionDTO>) request.getAttribute("MISSIONS");
                if (list != null) {
                    if (list.size() > 0) {
            %>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Mission ID</th>
                        <th>Date</th>
                        <th>Mission Status</th>
                        <th>My Task(s) Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (MissionDTO dto : list) {
                            count++;
                    %>
                    <tr>
                        <td><%= count%></td>
                        <td>
                            <c:url var="viewDetailLink" value="ViewMissionWeaponController">
                                <c:param name="missionId" value="<%= dto.getMissionId()%>"/>
                                <c:param name="date" value="<%= dto.getMissionDate().toString()%>"/>
                            </c:url>
                            <a href="${viewDetailLink}"><%= dto.getMissionId()%></a>
                        </td>
                        <td><%= dto.getMissionDate()%></td>
                        <td>
                            <%
                                String status = dto.getMissionStatus();
                                if (status.equals("Done")) {
                            %>
                            <font color="green">
                            <%= status%>
                            </font>
                            <%
                            } else {
                            %>
                            <font color="red">
                            <%= status%>
                            </font>
                            <%
                                }
                            %>
                        </td>
                        <td>
                            <%
                                String taskStatus = dto.getAvengerStatus();
                                if (taskStatus.equals("Done")) {
                            %>
                            <font color="green">
                            <%= taskStatus%>
                            </font>
                            <%
                            } else {
                            %>
                            <font color="red">
                            <%= taskStatus%>
                            </font>
                            <%
                                }
                            %>
                        </td>
                        <td>
                            <form action="UpdateMissionController" method="POST">
                                <input type="submit" name="action" value="Edit"/>
                                <input type="hidden" name="missionId" value="<%= dto.getMissionId()%>"/>
                                <input type="hidden" name="date" value="<%= dto.getMissionDate()%>"/>
                                <input type="hidden" name="missionStatus" value="<%= dto.getMissionStatus()%>"/>
                            </form>
                            <form action="DeleteMissionController" method="POST">
                                <input type="submit" name="action" value="Delete"/>
                                <input type="hidden" name="missionId" value="<%= dto.getMissionId()%>"/>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
            } else {
            %>
            No mission left!
            <%
                    }
                }
            %>
            <form action="AddMissionController" method="POST">
                <input type="submit" name="action" value="Add"/>
            </form>
            <div id="footer">
                <div class="connect">
                    <div>
                        <h1>FOLLOW OUR  MISSIONS ON</h1>
                        <div>
                            <a href="http://freewebsitetemplates.com/go/facebook/" class="facebook">facebook</a>
                            <a href="http://freewebsitetemplates.com/go/twitter/" class="twitter">twitter</a>
                            <a href="http://freewebsitetemplates.com/go/googleplus/" class="googleplus">googleplus</a>
                            <a href="http://pinterest.com/fwtemplates/" class="pinterest">pinterest</a>
                        </div>
                    </div>
                </div>
                <div class="footnote">
                    <div>
                        <p>&copy; 1998 BY THE AVENGERS | ALL RIGHTS RESERVED</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
