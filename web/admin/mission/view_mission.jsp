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
                            <a href="/Jarvis_Web/admin/ViewAccountController">Account</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/admin/ViewAvengerController">Avengers</a>
                        </li>
                        <li class="selected">                            
                            <a href="/Jarvis_Web/admin/ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/admin/ViewWeaponController">Weapons</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/admin/ViewMarkController">Marks</a>
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
                <form action="MainController" style="margin: 0 0 0 60%;max-width: 300px;">
                    <input type="text" name="search" placeholder="Search by ID..."/>
                    <input type="submit" value="Search"/>
                    <input type="hidden" name="controller" value="SearchMissionController"/>
                </form>
                <%
                    List<MissionDTO> list = (List<MissionDTO>) request.getAttribute("MISSIONS");
                    if (list.size() > 0) {
                %>
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
                    <tbody>
                        <%
                            int count = 0;
                            for (MissionDTO dto : list) {
                                count++;
                        %>
                        <tr>
                            <td>
                                <%= count%>
                    <center>
                        <img style="max-height: 100px; border-radius: 50px" src="/Jarvis_Web/images/Missions/<%= dto.getMissionId()%>"/>
                    </center>
                    </td>
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
                        <form action="/Jarvis_Web/admin/MainController" method="POST">
                            <input type="hidden" name="controller" value="UpdateMissionController"/>
                            <input type="submit" name="action" value="Edit"/>
                            <input type="hidden" name="txtId" value="<%= dto.getMissionId()%>"/>
                            <input type="hidden" name="txtDate" value="<%= dto.getMissionDate()%>"/>
                            <input type="hidden" name="txtStatus" value="<%= dto.getMissionStatus()%>"/>
                        </form>
                        <form action="/Jarvis_Web/admin/MainController" method="POST">
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
                            <form action="/Jarvis_Web/admin/MainController" method="POST">
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
                        <form action="/Jarvis_Web/admin/MainController" method="POST">
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
