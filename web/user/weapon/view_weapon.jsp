<%-- 
    Document   : view_weapon
    Created on : Jul 4, 2018, 12:06:51 PM
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
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Weapon ID</th>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <%
                List<WeaponDTO> list = (List<WeaponDTO>) request.getAttribute("WEAPONS");
                if (list.size() > 0) {
            %>
            <tbody>
                <%
                    int count = 0;
                    for (WeaponDTO dto : list) {
                        count++;
                %>
                <tr>
                    <td><%= count%></td>
                    <td><%= dto.getWeaponId()%></td>
                    <td><%= dto.getWeaponName()%></td>
                    <td>
                        <form action="UpdateWeaponController" method="POST">
                            <input type="submit" name="action" value="Edit"/>
                            <input type="hidden" name="weaponId" value="<%= dto.getWeaponId()%>"/>
                            <input type="hidden" name="weaponName" value="<%= dto.getWeaponName()%>"/>
                        </form>
                        <form action="DeleteWeaponController" method="POST">
                            <input type="submit" name="action" value="Delete"/>
                            <input type="hidden" name="weaponId" value="<%= dto.getWeaponId()%>"/>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <%
            } else {
            %>
            No weapon left!
            <%
                }
            %>
        </table>
        <form action="AddWeaponController" method="POST">
            <input type="submit" name="action" value="Add"/>
        </form>
    </body>
</html>
