<%-- 
    Document   : add_mission_weapon
    Created on : Jul 4, 2018, 5:05:57 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
