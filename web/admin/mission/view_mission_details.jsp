<%-- 
    Document   : mission_details
    Created on : Jun 27, 2018, 9:40:40 AM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page import="vuph.dtos.MissionDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JARVIS</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto:500" rel="stylesheet">
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
                    MISSION DETAIL<BR/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <%
                    String id = request.getParameter("missionId");
                    String date = request.getParameter("date");
                %>
                <%
                    List<MissionDTO> list = (List<MissionDTO>) request.getAttribute("DETAILS");
                    if (list != null) {
                        if (list.size() > 0) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Avenger ID</th>
                            <th>Fullname</th>
                            <th>Task(s) Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.DETAILS}" var="detail" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <c:url var="weaponLink" value="ViewMissionWeaponController">
                                        <c:param name="missionId" value="<%= id%>"/>
                                        <c:param name="date" value="<%= date%>"/>
                                        <c:param name="avengerId" value="${detail.getAvengerId()}"/>
                                        <c:param name="avengerName" value="${detail.getAvengerName()}"/>
                                    </c:url>
                                    <a href="${weaponLink}">${detail.getAvengerId()}</a>
                                </td>
                                <td>${detail.getAvengerName()}</td>
                                <td>
                                    <c:if test="${detail.getAvengerStatus().equals('Done')}" var="status">
                                        <font color="#60ff83">
                                        ${detail.getAvengerStatus()}
                                        </font>
                                    </c:if>
                                    <c:if test="${!status}">
                                        <font color="#f95a20">
                                        ${detail.getAvengerStatus()}
                                        </font>
                                    </c:if>
                                </td>
                                <td>
                                    <form action="/Jarvis_Web/admin/MainController" method="POST">
                                        <input type="hidden" name="controller" value="UpdateMissionDetailController"/>
                                        <input type="submit" name="action" value="Edit"/>
                                        <input type="hidden" name="missionId" value="<%= id%>"/>
                                        <input type="hidden" name="avengerName" value="${detail.getAvengerName()}"/>
                                        <input type="hidden" name="avengerId" value="${detail.getAvengerId()}"/>
                                        <input type="hidden" name="date" value="<%= date%>"/>
                                    </form>
                                    <form action="/Jarvis_Web/admin/MainController" method="POST">
                                        <input type="hidden" name="controller" value="DeleteMissionDetailController"/>
                                        <input type="submit" name="action" value="Delete"/>
                                        <input type="hidden" name="missionId" value="<%= id%>"/>
                                        <input type="hidden" name="avengerId" value="${detail.getAvengerId()}"/>
                                        <input type="hidden" name="date" value="<%= date%>"/>
                                        <input type="hidden" name="avengerName" value="${detail.getAvengerName()}"/>
                                    </form> 
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="5">
                                <form action="/Jarvis_Web/admin/MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddMissionDetailController"/>
                                    <input class="button" type="submit" name="action" value="Add"/>
                                    <input type="hidden" name="missionId" value="<%= id%>"/>
                                    <input type="hidden" name="date" value="<%= date%>"/>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%
                } else {
                %>
                <h2 style="text-align: center">
                    <font color="red" style="font-family: monospace">
                    NO DETAILS!
                    </font>
                    <form action="/Jarvis_Web/admin/MainController" method="POST">
                        <input type="hidden" name="controller" value="AddMissionDetailController"/>
                        <input class="button" type="submit" name="action" value="Add"/>
                        <input type="hidden" name="missionId" value="<%= id%>"/>
                        <input type="hidden" name="date" value="<%= date%>"/>
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
