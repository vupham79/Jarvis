<%-- 
    Document   : add_mission_weapon
    Created on : Jul 3, 2018, 4:12:05 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AddMissionWeaponController" method="POST">
            <input type="hidden" name="avengerId" value="<%= request.getParameter("avengerId")%>"/>
            <input type="hidden" name="avengerName" value="<%= request.getParameter("avengerName")%>"/>
            <input type="hidden" name="missionId" value="<%= request.getParameter("missionId")%>"/>
            <input type="hidden" name="date" value="<%= request.getParameter("date")%>"/>
            <table border="0">
                <tbody>
                    <tr>
                        <td>Weapon ID: </td>
                        <td><input type="text" name="weaponId" required/></td>
                    </tr>
                    <tr>
                        <td>Type: </td>
                        <td>
                            Weapon <input type="radio" name="type" value="Weapon" checked required/>
                            Mark <input type="radio" name="type" value="Mark" required/>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="Submit"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
