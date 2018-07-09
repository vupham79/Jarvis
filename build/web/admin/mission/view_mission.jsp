<%-- 
    Document   : newjsp
    Created on : Jun 25, 2018, 9:33:53 PM
    Author     : Vu PH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vuph.dtos.MissionDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JARVIS</title>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="../css/mobile.css">
        <script src="../js/mobile.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a class="logo"><img src="../images/logoo.png" alt=""></a>
                    <ul id="navigation">
                        <li>
                            <a href="ViewAccountController">Account</a>
                        </li>
                        <li>
                            <a href="ViewAvengerController">Avengers</a>
                        </li>
                        <li class="selected">                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="ViewWeaponController">Weapons</a>
                        </li>
                        <li>
                            <a href="ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    MISSIONS<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Mission ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <%
                        List<MissionDTO> list = (List<MissionDTO>) request.getAttribute("MISSIONS");
                        if (list.size() > 0) {
                    %>
                    <tbody>
                        <%
                            int count = 0;
                            for (MissionDTO dto : list) {
                                count++;
                        %>
                        <tr>
                            <td><%= count%></td>
                            <td>
                                <c:url var="viewDetailLink" value="ViewMissionDetailController">
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
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="controller" value="UpdateMissionController"/>
                                    <input type="submit" name="action" value="Edit"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getMissionId()%>"/>
                                    <input type="hidden" name="txtDate" value="<%= dto.getMissionDate()%>"/>
                                    <input type="hidden" name="txtStatus" value="<%= dto.getMissionStatus()%>"/>
                                </form>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="controller" value="DeleteMissionController"/>
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getMissionId()%>"/>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="5">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddMissionController"/>
                                    <input type="submit" class="button" name="action" value="Add"/>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                    <%
                    } else {
                    %>
                    <h2 style="text-align: center">
                        <font color="red" style="font-size: 15px;font-family: monospace">
                        NO MISSIONS LEFT!
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="AddMissionController"/>
                            <input type="submit" class="button" name="action" value="Add"/>
                        </form>
                        </font>
                    </h2>
                    <%
                        }
                    %>
                </table>
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
