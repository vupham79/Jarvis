<%-- 
    Document   : view_mission
    Created on : Jul 4, 2018, 12:15:05 PM
    Author     : Vu PH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="vuph.dtos.MissionDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MEMBER</title>
        <link rel="stylesheet" href="/Jarvis_Web/css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="/Jarvis_Web/css/mobile.css">
        <script src="/Jarvis_Web/js/mobile.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a class="logo"><img src="/Jarvis_Web/images/logoo.png" alt=""></a>
                    <ul id="navigation">
                        <li>
                            <a href="/Jarvis_Web/user/ViewAccountController">Account</a>
                        </li>
                        <li class="selected">                            
                            <a href="/Jarvis_Web/user/ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/user/ViewWeaponController">Weapon</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    MISSION<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
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
                                <form action="/Jarvis_Web/user/MainController" method="POST">
                                    <input type="hidden" name="controller" value="UpdateMissionController"/>
                                    <input type="submit" name="action" value="Edit"/>
                                    <input type="hidden" name="missionId" value="<%= dto.getMissionId()%>"/>
                                    <input type="hidden" name="date" value="<%= dto.getMissionDate()%>"/>
                                    <input type="hidden" name="missionStatus" value="<%= dto.getMissionStatus()%>"/>
                                </form>
                                <form action="/Jarvis_Web/user/MainController" method="POST">
                                    <input type="hidden" name="controller" value="DeleteMissionController"/>
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="missionId" value="<%= dto.getMissionId()%>"/>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="6">
                                <form action="/Jarvis_Web/user/MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddMissionController"/>
                                    <input class="button" type="submit" name="action" value="Add"/>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%
                } else {
                %>
                <h2 style="text-align: center">
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    No mission left!
                    </font>
                    <form action="/Jarvis_Web/user/MainController" method="POST">
                        <input type="hidden" name="controller" value="AddMissionController"/>
                        <input class="button" type="submit" name="action" value="Add"/>
                    </form>
                </h2>
                <%
                        }
                    }
                %>
            </div>
            <div id="footer">
                <div class="connect">
                    <div>
                        <h1>FOLLOW OUR  MISSIONS ON</h1>
                        <div>
                            <a href="" class="facebook">facebook</a>
                            <a href="" class="twitter">twitter</a>
                            <a href="" class="googleplus">googleplus</a>
                            <a href="" class="pinterest">pinterest</a>
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
