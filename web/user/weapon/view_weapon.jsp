<%-- 
    Document   : view_weapon
    Created on : Jul 4, 2018, 12:06:51 PM
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
        <title>MEMBER</title>
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
                            <a href="/Jarvis_Web/user/ViewAccountController">Account</a>
                        </li>
                        <li>                            
                            <a href="/Jarvis_Web/user/ViewMissionController">Missions</a>
                        </li>
                        <li class="selected">
                            <a href="/Jarvis_Web/user/ViewWeaponController">Weapon</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    WEAPON<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Weapon ID</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <%
                        List<WeaponDTO> list = (List<WeaponDTO>) request.getAttribute("WEAPONS");
                        if (list.size() > 0) {
                    %>
                    <tbody>
                        <%
                            int count = 0;
                            for (WeaponDTO dto : list) {
                                count++;
                        %>
                        <tr>
                            <td><%= count%></td>
                            <td><%= dto.getWeaponId()%></td>
                            <td><%= dto.getWeaponName()%></td>
                            <td>
                                <form action="/Jarvis_Web/user/MainController" method="POST">
                                    <input type="hidden" name="controller" value="UpdateWeaponController"/>
                                    <input type="submit" name="action" value="Edit"/>
                                    <input type="hidden" name="weaponId" value="<%= dto.getWeaponId()%>"/>
                                    <input type="hidden" name="weaponName" value="<%= dto.getWeaponName()%>"/>
                                </form>
                                <form action="/Jarvis_Web/user/MainController" method="POST">
                                    <input type="hidden" name="controller" value="DeleteWeaponController"/>
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="weaponId" value="<%= dto.getWeaponId()%>"/>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="4">
                                <form action="/Jarvis_Web/user/MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddWeaponController"/>
                                    <input type="submit" name="action" value="Add"/>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                    <%
                    } else {
                    %>
                    <h2 style="text-align: center">
                        <font color="red" style="font-size: 15px;font-family: monospace">
                        NO WEAPONS!
                        </font>
                        <form action="/Jarvis_Web/user/MainController" method="POST">
                            <input type="hidden" name="controller" value="AddWeaponController"/>
                            <input type="submit" name="action" value="Add"/>
                        </form>
                    </h2>
                    <%
                        }
                    %>
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
