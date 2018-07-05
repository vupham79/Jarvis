<%-- 
    Document   : add_weapon
    Created on : Jul 4, 2018, 12:07:18 PM
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
        <font color="red">
        ${requestScope.ERROR}
        </font>
        <form action="AddWeaponController" method="POST">
            <table border="0">
                <tr>
                    <td>Weapon ID: </td>
                    <td><input type="text" name="weaponId" value="${param.weaponId}" required/></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="weaponName" value="${param.weaponName}" required/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Submit"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
