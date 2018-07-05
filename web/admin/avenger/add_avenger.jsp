<%-- 
    Document   : add_mission
    Created on : Jun 26, 2018, 8:56:50 PM
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
        <form action="AddAvengerController" method="POST">
            <font color="red">
            ${requestScope.ERROR}
            </font>
            <table border="0">
                <tr>
                    <td>Avenger ID: </td>
                    <td><input type="text" name="txtId" value="${param.txtId}" required/></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="txtPassword" required/></td>
                </tr>
                <tr>
                    <td>Confirm Password: </td>
                    <td><input type="password" name="txtConfirm" required/></td>
                </tr>
                <tr>
                    <td>Fullname: </td>
                    <td><input type="text" name="txtName" value="${param.txtName}" required/></td>
                </tr>
                <tr>
                    <td>Role: </td>
                    <td>
                        Admin <input type="radio" name="txtRole" value="admin" required/>
                        Iron Man <input type="radio" name="txtRole" value="ironman" required/>
                        User <input type="radio" name="txtRole" value="user" checked required/>
                    </td>
                </tr>
                <tr>
                    <td>Status: </td>
                    <td>
                        Weak <input type="radio" name="txtStatus" value="Weak" required/>
                        Injured <input type="radio" name="txtStatus" value="Injured" required/>
                        Good <input type="radio" name="txtStatus" value="Good" required/>
                        Excellent <input type="radio" name="txtStatus" value="Excellent" checked required/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Submit"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
