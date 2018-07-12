<%-- 
    Document   : update_mission
    Created on : Jun 25, 2018, 11:06:46 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JARVIS</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto:500" rel="stylesheet">
        <link rel="stylesheet" href="/Jarvis_Web/css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="/Jarvis_Web/css/mobile.css">
        <script src="/Jarvis_Web/js/mobile.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="page">
            <div id="header">
                <div>
                    <a class="logo"><img src="/Jarvis_Web/images/logoo.png" alt=""></a>
                    <ul id="navigation">
                        <li>
                            <a href="/Jarvis_Web/admin/ViewAccountController">Account</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/admin/ViewAvengerController">Avengers</a>
                        </li>
                        <li>                            
                            <a href="/Jarvis_Web/admin/ViewMissionController">Missions</a>
                        </li>
                        <li class="selected">
                            <a href="/Jarvis_Web/admin/ViewWeaponController">Weapons</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/admin/ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    UPDATE WEAPON
                    <br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="/Jarvis_Web/admin/MainController" method="POST">
                    <input type="hidden" name="controller" value="UpdateWeaponController"/>
                    <table border="1">
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
                            <td colspan="2"><input class="button" type="submit" name="action" value="Update"/></td>
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
