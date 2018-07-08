<%-- 
    Document   : view_mission_weapon
    Created on : Jul 4, 2018, 5:02:38 PM
    Author     : Vu PH
--%>

<%@page import="vuph.dtos.WeaponDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IRONMAN</title>
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
                        <li>                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <%
                    String id = request.getParameter("missionId");
                    String date = request.getParameter("date");
                %>
                <h2 style="text-align: center">
                    MISSION'S WEAPON<br/>
                    Mission: <%= id%><br/>
                    Date: ${param.date}<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <%
                    List<WeaponDTO> weapons = (List<WeaponDTO>) request.getAttribute("WEAPONS");
                    if (weapons != null) {
                        if (weapons.size() > 0) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Avenger</th>
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
                            <td><%= weapons.get(i).getAvengerId()%></td>
                            <td><%= weapons.get(i).getWeaponId()%></td>
                            <td>
                                <form action="MainController" method="POST">
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="controller" value="DeleteMissionWeaponController"/>
                                    <input type="hidden" name="avengerName" value="<%= weapons.get(i).getAvengerId()%>"/>
                                    <input type="hidden" name="missionId" value="<%= id%>"/>
                                    <input type="hidden" name="weaponId" value="<%= weapons.get(i).getWeaponId()%>"/>
                                    <input type="hidden" name="date" value="<%= date%>"/>
                                </form> 
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddMissionWeaponController"/>
                                    <input class="button" type="submit" name="action" value="Add"/>
                                    <input type="hidden" name="missionId" value="<%= id%>"/>
                                    <input type="hidden" name="date" value="${param.date}"/>
                                </form>
                            </td>
                        </tr>
                        <%
                        } else {
                        %>
                    <h2 style="text-align: center">
                        <font color="red" style="font-size: 15px;font-family: monospace">
                        NO WEAPONS!
                        </font>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="AddMissionWeaponController"/>
                            <input class="button" type="submit" name="action" value="Add"/>
                            <input type="hidden" name="missionId" value="<%= id%>"/>
                            <input type="hidden" name="date" value="${param.date}"/>
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

