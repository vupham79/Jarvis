<%-- 
    Document   : update_mission_details
    Created on : Jun 28, 2018, 10:38:24 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JARVIS</title>
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
                        <li class="selected">                            
                            <a href="/Jarvis_Web/admin/ViewMissionController">Missions</a>
                        </li>
                        <li>
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
                    UPDATE MISSION DETAIL
                    <br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="/Jarvis_Web/admin/MainController" method="POST">
                    <input type="hidden" name="controller" value="UpdateMissionDetailController"/>
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>Mission ID: </td>
                                <td><input type="text" name="missionId" value="<%= request.getParameter("missionId")%>" readonly/></td>
                            </tr>
                            <tr>
                                <td>Avenger ID: </td>
                                <td><input type="text" name="avengerId" value="<%= request.getParameter("avengerId")%>" readonly/></td>
                            </tr>
                            <tr>
                                <td>Fullname: </td>
                                <td><input type="text" name="avengerName" value="<%= request.getParameter("avengerName")%>" readonly/></td>
                            </tr>
                            <tr>
                                <td>
                                    Task(s) Status: 
                                </td>
                                <td>
                                    <select name="status">
                                        <option value="Done">Done</option>
                                        <option value="In Process">In Proces</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="hidden" name="date" value="<%= request.getParameter("date")%>"/>
                                    <input type="submit" class="button" name="action" value="Submit"/>
                                </td>
                            </tr>
                        </tbody>
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
