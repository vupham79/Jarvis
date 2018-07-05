<%-- 
    Document   : update_account
    Created on : Jul 5, 2018, 11:40:39 AM
    Author     : Vu PH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form action="UpdateAccountController" method="POST">
            <table border="1">
                <tr>
                    <td>Avenger ID: </td>
                    <td><input type="text" name="avengerId" value="${param.avengerId}" readonly/></td>
                </tr>
                <tr>
                    <td>Old Password: </td>
                    <td><input type="password" name="oldPassword" required/></td>
                </tr>
                <tr>
                    <td>New Password: </td>
                    <td><input type="password" name="newPassword" required/></td>
                </tr>
                <tr>
                    <td>Confirm Password: </td>
                    <td><input type="password" name="confirmPassword" required/></td>
                </tr>
                <tr>
                    <td>Fullname: </td>
                    <td><input type="text" name="fullname" value="${param.fullname}" required/></td>
                </tr>
                <tr>
                    <td>Role: </td>
                    <td><input type="text" name="role" value="${param.role}" readonly/></td>
                </tr>
                <tr>
                    <td>Status: </td>
                    <td>
                        <font color="purple">Weak <input type="radio" name="status" value="Weak" required/></font>
                        <font color="red">Injured <input type="radio" name="status" value="Injured" required/></font>
                        <font color="orange">Good <input type="radio" name="status" value="Good" required/></font>
                        <font color="green">Excellent <input type="radio" name="status" value="Excellent" required/></font>
                    </td>
                </tr>
            </table>
            <input type="submit" name="action" value="Update"/>
        </form>
    </body>
</html>
