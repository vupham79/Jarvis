<%-- 
    Document   : mission_details
    Created on : Jun 27, 2018, 9:40:40 AM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page import="vuph.dtos.MissionDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mission</title>
    </head>
    <body>
        <%
            String id = request.getParameter("missionId");
            String date = request.getParameter("date");
        %>
        <font color="red">
        ${requestScope.ERROR}
        </font>
        <h1>Mission: <%= id%></h1>
        <h3>Date: <%= date%></h3>
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
                                <font color="green">
                                ${detail.getAvengerStatus()}
                                </font>
                            </c:if>
                            <c:if test="${!status}">
                                <font color="red">
                                ${detail.getAvengerStatus()}
                                </font>
                            </c:if>
                        </td>
                        <td>
                            <form action="UpdateMissionDetailController" method="POST">
                                <input type="submit" name="action" value="Edit"/>
                                <input type="hidden" name="missionId" value="<%= id%>"/>
                                <input type="hidden" name="avengerName" value="${detail.getAvengerName()}"/>
                                <input type="hidden" name="avengerId" value="${detail.getAvengerId()}"/>
                                <input type="hidden" name="date" value="<%= date%>"/>
                            </form>
                            <form action="DeleteMissionDetailController" method="POST">
                                <input type="submit" name="action" value="Delete"/>
                                <input type="hidden" name="missionId" value="<%= id%>"/>
                                <input type="hidden" name="avengerId" value="${detail.getAvengerId()}"/>
                                <input type="hidden" name="date" value="<%= date%>"/>
                                <input type="hidden" name="avengerName" value="${detail.getAvengerName()}"/>
                            </form> 
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%
        } else {
        %>
        No details!
        <%
                }
            }
        %>
        <form action="AddMissionDetailController" method="POST">
            <input type="submit" name="action" value="Add"/>
            <input type="hidden" name="missionId" value="<%= id%>"/>
            <input type="hidden" name="date" value="<%= date%>"/>
        </form>
    </body>
</html>
