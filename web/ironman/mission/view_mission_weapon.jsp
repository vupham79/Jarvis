<%-- 
    Document   : view_mission_weapon
    Created on : Jul 4, 2018, 5:02:38 PM
    Author     : Vu PH
--%>

<%@page import="vuph.dtos.WeaponDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("missionId");
            String date = request.getParameter("date");
        %>
        <h1>Marks</h1>
        <h3>Mission: <%= id%></h3>
        <h3>Date: ${param.date}</h3>
        <%
            List<WeaponDTO> weapons = (List<WeaponDTO>) request.getAttribute("WEAPONS");
            if (weapons != null) {
                if (weapons.size() > 0) {
        %>
        <font color="red">
        ${requestScope.ERROR}
        </font>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Avenger</th>
                    <th>Weapon ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (int i = 0; i < weapons.size(); i++) {
                %>
                <tr>
                    <td><%= count++%></td>
                    <td><%= weapons.get(i).getAvengerId()%></td>
                    <td><%= weapons.get(i).getWeaponId()%></td>
                    <td>
                        <form action="DeleteMissionWeaponController" method="POST">
                            <input type="submit" name="action" value="Delete"/>
                            <input type="hidden" name="avengerName" value="<%= weapons.get(i).getAvengerId()%>"/>
                            <input type="hidden" name="missionId" value="<%= id%>"/>
                            <input type="hidden" name="weaponId" value="<%= weapons.get(i).getWeaponId()%>"/>
                            <input type="hidden" name="date" value="<%= date%>"/>
                        </form> 
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                No weapons !
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <form action="AddMissionWeaponController" method="POST">
            <input type="submit" name="action" value="Add"/>
            <input type="hidden" name="missionId" value="<%= id%>"/>
            <input type="hidden" name="date" value="${param.date}"/>
        </form>
    </body>
</html>
