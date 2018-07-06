<%-- 
    Document   : view_mission_weapon
    Created on : Jul 4, 2018, 5:02:38 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MEMBER</title>
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
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="ViewAccountController">Account</a>
                        </li>
                        <li class="selected">                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="ViewWeaponController">Weapon</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h1>Marks</h1>
                <h3>Mission: ${param.missionId}</h3>
                <h3>Date: ${param.date}</h3>
                <%
                    List<String> weapons = (List<String>) request.getAttribute("WEAPONS");
                    if (weapons != null) {
                        if (weapons.size() > 0) {
                %>
                <font color="red">
                ${requestScope.ERROR}
                </font>
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
                            for (String weapon : weapons) {
                        %>
                        <tr>
                            <td><%= count++%></td>
                            <td><%= weapon%></td>
                            <td>
                                <form action="DeleteMissionWeaponController" method="POST">
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="missionId" value="${param.missionId}"/>
                                    <input type="hidden" name="weaponId" value="<%= weapon%>"/>
                                    <input type="hidden" name="date" value="${param.date}"/>
                                </form> 
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        No weapons !
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                <form action="AddMissionWeaponController" method="POST">
                    <input type="submit" name="action" value="Add"/>
                    <input type="hidden" name="missionId" value="${param.missionId}"/>
                    <input type="hidden" name="date" value="${param.date}"/>
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
