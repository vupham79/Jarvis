<%-- 
    Document   : add_mission
    Created on : Jun 26, 2018, 8:56:50 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JARVIS</title>
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
                        <li>
                            <a href="ViewAccountController">Account</a>
                        </li>
                        <li class="selected">
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
                <h2 style="text-align: center">
                    ADD AVENGER
                    <br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="MainController" method="POST">
                    <table border="1">
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
                                <select name="txtRole">
                                    <option value="admin">Admin</option>
                                    <option value="ironman">Iron Man</option>
                                    <option value="user">User</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Status: </td>
                            <td>
                                <select name="txtStatus">
                                    <option value="Weak">Weak</option>
                                    <option value="Injured">Injured</option>
                                    <option value="Good">Good</option>
                                    <option value="Excellent">Excellent</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="controller" value="AddAvengerController"/></td>
                            <td colspan="2"><input class="button" type="submit" name="action" value="Submit"/></td>
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
