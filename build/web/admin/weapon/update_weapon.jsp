<%-- 
    Document   : update_mission
    Created on : Jun 25, 2018, 11:06:46 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mission</title>
    </head>
    <body>
        <form action="UpdateWeaponController" method="POST">
            <table border="0">
                <tr>
                    <td>Weapon ID: </td>
                    <td><input type="text" name="txtId" value="<%= request.getParameter("txtId")%>" readonly/></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="txtName" value="<%= request.getParameter("txtName")%>" required/></td>
                </tr>
                <tr>
                    <td>Owner: </td>
                    <td><input type="text" name="txtAvengerId" value="<%= request.getParameter("txtAvengerId")%>" required/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Update"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
