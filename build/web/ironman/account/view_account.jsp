<%-- 
    Document   : view_account
    Created on : Jul 5, 2018, 11:40:25 AM
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
        <table border="1">
            <tr>
                <td>Avenger ID: </td>
                <td><input type="text" name="avengerId" value="${requestScope.AVENGER.getAvengerId()}" readonly/></td>
            </tr>
            <tr>
                <td>Fullname: </td>
                <td><input type="text" name="fullname" value="${requestScope.AVENGER.getFullname()}" readonly/></td>
            </tr>
            <tr>
                <td>Role: </td>
                <td><input type="text" name="role" value="${requestScope.AVENGER.getRole()}" readonly/></td>
            </tr>
            <tr>
                <td>Status: </td>
                <td>
                    <c:if test="${requestScope.AVENGER.getStatus().equals('Weak')}">
                        <font color="purple">Weak</font>
                    </c:if>
                    <c:if test="${requestScope.AVENGER.getStatus().equals('Injured')}">
                        <font color="red">Injured</font>
                    </c:if>
                    <c:if test="${requestScope.AVENGER.getStatus().equals('Good')}">
                        <font color="orange">Good</font>
                    </c:if>
                    <c:if test="${requestScope.AVENGER.getStatus().equals('Excellent')}">
                        <font color="green">Excellent</font>
                    </c:if>
                </td>
            </tr>
        </table>
        <form action="UpdateAccountController" method="POST">
            <input type="submit" name="action" value="Edit"/>
            <input type="hidden" name="avengerId" value="${requestScope.AVENGER.getAvengerId()}"/>
            <input type="hidden" name="fullname" value="${requestScope.AVENGER.getFullname()}"/>
            <input type="hidden" name="role" value="${requestScope.AVENGER.getRole()}"/>
        </form>
    </body>
</html>
