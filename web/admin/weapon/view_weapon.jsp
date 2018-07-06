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
                                <form action="UpdateWeaponController" method="POST">
                                    <input type="submit" name="action" value="Edit"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getWeaponId()%>"/>
                                    <input type="hidden" name="txtName" value="<%= dto.getWeaponName()%>"/>
                                    <input type="hidden" name="txtAvengerId" value="<%= dto.getAvengerId()%>"/>
                                </form>
                                <form action="DeleteWeaponController" method="POST">
                                    <input type="submit" name="action" value="Delete"/>
                                    <input type="hidden" name="txtId" value="<%= dto.getWeaponId()%>"/>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <%
                    } else {
                    %>
                    No mission left!
                    <%
                        }
                    %>
                </table>
                <form action="AddWeaponController" method="POST">
                    <input type="submit" name="action" value="Add"/>
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
