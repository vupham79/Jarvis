<%-- 
    Document   : add_mission_weapon
    Created on : Jul 3, 2018, 4:12:05 PM
    Author     : Vu PH
--%>

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
                    ADD WEAPON TO MISSION
                    <br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="/Jarvis_Web/admin/MainController" method="POST">
                    <input type="hidden" name="controller" value="AddMissionWeaponController"/>
                    <input type="hidden" name="avengerId" value="<%= request.getParameter("avengerId")%>"/>
                    <input type="hidden" name="avengerName" value="<%= request.getParameter("avengerName")%>"/>
                    <input type="hidden" name="missionId" value="<%= request.getParameter("missionId")%>"/>
                    <input type="hidden" name="date" value="<%= request.getParameter("date")%>"/>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>Weapon ID: </td>
                                <c:if test="${requestScope.WEAPONS.size() > 0}" var="weaponSize">
                                    <td>
                                        <select name="weaponId">
                                            <c:forEach items="${requestScope.WEAPONS}" var="weapon">
                                                <option value="${weapon}">${weapon}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </c:if>
                                <c:if test="${!weaponSize}">
                                    <td>
                                        No weapons left
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <td>Mark ID: </td>
                                <c:if test="${requestScope.MARKS.size() > 0}" var="markSize">
                                    <td>
                                        <select name="markId">
                                            <c:forEach items="${requestScope.MARKS}" var="mark">
                                                <option value="${mark}">${mark}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </c:if>
                                <c:if test="${!markSize}">
                                    <td>
                                        No marks left
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <td>Which to add: </td>
                                <td>
                                    <select name="type">
                                        <option value="Weapon">Weapon</option>
                                        <option value="Mark">Mark</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><input class="button" type="submit" name="action" value="Submit"/></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
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
