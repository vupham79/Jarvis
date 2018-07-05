<%-- 
    Document   : view_weapon
    Created on : Jun 28, 2018, 8:52:10 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
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
            String avengerName = request.getParameter("avengerName");
            String avengerId = request.getParameter("avengerId");
        %>
        <h1><%= avengerName%></h1>
        <h3>Mission: <%= id%></h3>
        <h3>Date: <%= date%></h3>
        <%
            List<String> weapons = (List<String>) request.getAttribute("WEAPONS");
            if (weapons != null) {
                if (weapons.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
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
                    <td><%= weapons.get(i)%></td>
                    <td>
                        <form action="DeleteMissionWeaponController" method="POST">
                            <input type="submit" name="action" value="Delete"/>
                            <input type="hidden" name="avengerName" value="<%= avengerName%>"/>
                            <input type="hidden" name="missionId" value="<%= id%>"/>
                            <input type = "hidden" name="weaponId" value="<%= weapons.get(i)%>"/>
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
            <input type="hidden" name="date" value="<%= date%>"/>
            <input type="hidden" name="avengerName" value="<%= avengerName%>"/>
            <input type="hidden" name="avengerId" value="<%= avengerId%>"/>
        </form>
    </body>
</html>
