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
                            <a href="ViewAvengerController">Avengers</a>
                        </li>
                        <li>                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li class="selected">
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
                    WEAPONS<br/>
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
                            <th>Owner</th>
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
                            <td><%= dto.getAvengerId()%></td>
                            <td>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="controller" value="UpdateWeaponController"/>
                                    <input type="submit" name="action" value="Edit"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getWeaponId()%>"/>
                                    <input type="hidden" name="txtName" value="<%= dto.getWeaponName()%>"/>
                                    <input type="hidden" name="txtAvengerId" value="<%= dto.getAvengerId()%>"/>
                                </form>
                                <form action="MainController" method="POST">
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
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <form action="MainController" method="POST">
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
                    <form action="MainController" method="POST">
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
