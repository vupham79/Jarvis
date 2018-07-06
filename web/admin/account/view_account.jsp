<%-- 
    Document   : admin
    Created on : Jun 23, 2018, 1:29:27 AM
    Author     : Vu PH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JARVIS</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
        <script src="js/mobile.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a class="logo"><img src="images/logoo.png" alt=""></a>
                    <ul id="navigation">
                        <li class="selected">
                            <a href="ViewAccountController">Account</a>
                        </li>
                        <li>
                            <a href="ViewAvengerController">Avengers</a>
                        </li>
                        <li>                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="ViewWeaponController">Weapons</a>
                        </li>
                        <li>
                            <a href="ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
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
            </div>
            <div id="footer">
                <div class="connect">
                    <div>
                        <h1>FOLLOW OUR  MISSIONS ON</h1>
                        <div>
                            <a href="" class="facebook">facebook</a>
                            <a href="" class="twitter">twitter</a>
                            <a href="" class="googleplus">googleplus</a>
                            <a href="" class="pinterest">pinterest</a>
                        </div>
                    </div>
                </div>
                <div class="footnote">
                    <div>
                        <p>&copy; 1998 BY THE AVENGERS | ALL RIGHTS RESERVED</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
