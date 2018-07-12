<%-- 
    Document   : view_weapon
    Created on : Jun 28, 2018, 8:52:10 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
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
                <%
                    String id = request.getParameter("missionId");
                    String date = request.getParameter("date");
                    String avengerName = request.getParameter("avengerName");
                    String avengerId = request.getParameter("avengerId");
                %>
                <h2 style="text-align: center">
                    WEAPON(S) IN USED<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                </h2>
                <h3 style="text-align: center; font-family: sans-serif; color: #ffffff">
                    Avenger: <%= avengerName%><br/>
                    Mission: <%= id%><br/>
                    Date: <%= date%><br/>
                </h3>
                <%
                    List<String> weapons = (List<String>) request.getAttribute("WEAPONS");
                    if (weapons != null) {
                        if (weapons.size() > 0) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Weapon ID</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (int i = 0; i < weapons.size(); i++) {
                        %>
                        <tr>
                            <td><%= count++%></td>
                            <td><%= weapons.get(i)%></td>
                            <td>
                                <form action="/Jarvis_Web/admin/MainController" method="POST">
                                    <input type="hidden" name="controller" value="DeleteMissionWeaponController"/>
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="avengerName" value="<%= avengerName%>"/>
                                    <input type="hidden" name="avengerId" value="<%= avengerId%>"/>
                                    <input type="hidden" name="missionId" value="<%= id%>"/>
                                    <input type="hidden" name="weaponId" value="<%= weapons.get(i)%>"/>
                                    <input type="hidden" name="date" value="<%= date%>"/>
                                </form> 
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="3">
                                <form action="/Jarvis_Web/admin/MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddMissionWeaponController"/>
                                    <input class="button" type="submit" name="action" value="Add"/>
                                    <input type="hidden" name="missionId" value="<%= id%>"/>
                                    <input type="hidden" name="date" value="<%= date%>"/>
                                    <input type="hidden" name="avengerName" value="<%= avengerName%>"/>
                                    <input type="hidden" name="avengerId" value="<%= avengerId%>"/>
                                </form>
                            </td>
                        </tr>
                        <%
                        } else {
                        %>
                    <h2 style="text-align: center">
                        <font color="red" style="font-family: monospace">
                        NO WEAPONS!
                        </font>
                        <form action="/Jarvis_Web/admin/MainController" method="POST">
                            <input type="hidden" name="controller" value="AddMissionWeaponController"/>
                            <input class="button" type="submit" name="action" value="Add"/>
                            <input type="hidden" name="missionId" value="<%= id%>"/>
                            <input type="hidden" name="date" value="<%= date%>"/>
                            <input type="hidden" name="avengerName" value="<%= avengerName%>"/>
                            <input type="hidden" name="avengerId" value="<%= avengerId%>"/>
                        </form>
                    </h2>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
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
