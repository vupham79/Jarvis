<%-- 
    Document   : view_weapon
    Created on : Jun 29, 2018, 10:33:56 AM
    Author     : Vu PH
--%>

<%@page import="vuph.dtos.WeaponDTO"%>
<%@page import="java.util.List"%>
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
                    WEAPONS<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="MainController" style="margin: 0 0 0 60%;max-width: 300px;">
                    <input type="text" name="search" placeholder="Search by ID..."/>
                    <input type="submit" value="Search"/>
                    <input type="hidden" name="controller" value="SearchWeaponController"/>
                </form>
                <%
                    List<WeaponDTO> list = (List<WeaponDTO>) request.getAttribute("WEAPONS");
                    if (list.size() > 0) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Weapon ID</th>
                            <th>Name</th>
                            <th>Owner</th>
                            <th>Action</th>
                        </tr>
                    </thead>
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
                            <td><%= dto.getAvengerId()%></td>
                            <td>
                                <form action="/Jarvis_Web/admin/MainController" method="POST">
                                    <input type="hidden" name="controller" value="UpdateWeaponController"/>
                                    <input type="submit" name="action" value="Edit"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getWeaponId()%>"/>
                                    <input type="hidden" name="txtName" value="<%= dto.getWeaponName()%>"/>
                                    <input type="hidden" name="txtAvengerId" value="<%= dto.getAvengerId()%>"/>
                                </form>
                                <form action="/Jarvis_Web/admin/MainController" method="POST">
                                    <input type="hidden" name="controller" value="DeleteWeaponController"/>
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getWeaponId()%>"/>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="5">
                                <form action="/Jarvis_Web/admin/MainController" method="POST">
                                    <input type="hidden" name="controller" value="AddWeaponController"/>
                                    <input class="button" type="submit" name="action" value="Add"/>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%
                } else {
                %>
                <h2 style="text-align: center">
                    <font color="red" style="font-family: monospace">
                    NO WEAPONS LEFT!
                    </font>
                    <form action="/Jarvis_Web/admin/MainController" method="POST">
                        <input type="hidden" name="controller" value="AddWeaponController"/>
                        <input class="button" type="submit" name="action" value="Add"/>
                    </form>
                </h2>
                <%
                    }
                %>
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
