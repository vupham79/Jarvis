<%-- 
    Document   : update_weapon
    Created on : Jul 4, 2018, 12:07:39 PM
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
        <form action="UpdateWeaponController" method="POST">
            <table border="0">
                <tr>
                    <td>Weapon ID: </td>
                    <td><input type="text" name="weaponId" value="<%= request.getParameter("weaponId")%>" readonly/></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="weaponName" value="<%= request.getParameter("weaponName")%>" required/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Update"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
