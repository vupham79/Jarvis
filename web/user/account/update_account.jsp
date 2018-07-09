<%-- 
    Document   : update_account
    Created on : Jul 5, 2018, 11:40:39 AM
    Author     : Vu PH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MEMBER</title>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="../css/mobile.css">
        <script src="../js/mobile.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a class="logo"><img src="../images/logoo.png" alt=""></a>
                    <ul id="navigation">
                        <li class="selected">
                            <a href="ViewAccountController">Account</a>
                        </li>
                        <li>                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="ViewWeaponController">Weapon</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    UPDATE ACCOUNT<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="MainController" method="POST">
                    <input type="hidden" name="controller" value="UpdateAccountController"/>
                    <table border="1">
                        <tr>
                            <td>Avatar: </td>
                            <td>
                                <input type="file" name="avatar" onchange="previewFile()">
                                <br/>
                                <br/>
                                <img id="previewAvatar" src="/Jarvis_Web/images/Avatars/${sessionScope.USERNAME}" height="200" alt="Image preview...">
                            </td>
                        </tr>
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
                                <select name="status">
                                    <option value="Weak">Weak</option>
                                    <option value="Good">Good</option>
                                    <option value="Excellent">Excellent</option>
                                    <option value="Injured">Injured</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="button" type="submit" name="action" value="Update"/>
                            </td>
                        </tr>
                    </table>
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
