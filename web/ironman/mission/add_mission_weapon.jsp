<%-- 
    Document   : add_mission_weapon
    Created on : Jul 4, 2018, 5:05:57 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IRONMAN</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
        <script src="js/mobile.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a class="logo"><img src="images/logoo.png" alt=""></a>
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
                            <a href="ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
        <form action="AddMissionWeaponController" method="POST">
            <table border="1">
                <input type="hidden" name="date" value="${param.date}"/>
                <tr>
                    <td>Mission: </td>
                    <td><input type="text" name="missionId" value="${param.missionId}" readonly/></td>
                </tr>
                <tr>
                    <td>Avenger: </td>
                    <td>
                        <c:forEach var="avenger" items="${requestScope.AVENGERS}">
                            ${avenger}<input type="radio" name="avengerId" value="${avenger}" required/>
                            <br/>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td>Mark: </td>
                    <td>
                        <c:if test="${requestScope.MARKS.size() > 0}" var="isAvailable">
                            <c:forEach var="mark" items="${requestScope.MARKS}">
                                ${mark}<input type="radio" name="markId" value="${mark}" required/>
                                <br/>
                            </c:forEach>
                        </c:if>
                        <c:if test="${!isAvailable}">
                            All your marks being used for this mission !
                        </c:if>
                    </td>
                </tr>
            </table>
            <input type="submit" name="action" value="Submit"/>
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
