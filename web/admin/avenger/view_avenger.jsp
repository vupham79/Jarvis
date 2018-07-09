<%-- 
    Document   : view_avenger
    Created on : Jun 29, 2018, 10:34:41 AM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page import="vuph.dtos.AvengerDTO"%>
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
                    AVENGER<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Avenger ID</th>
                            <th>Fullname</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <%
                        List<AvengerDTO> list = (List<AvengerDTO>) request.getAttribute("AVENGERS");
                        if (list.size() > 0) {
                    %>
                    <tbody>
                        <%
                            int count = 0;
                            for (AvengerDTO dto : list) {
                                count++;
                        %>
                    <td><%= count%></td>
                    <td><%= dto.getAvengerId()%></td>
                    <td><%= dto.getFullname()%></td>
                    <td><%= dto.getRole()%></td>
                    <td>
                        <%
                            String status = dto.getStatus();
                            if (status.equals("Excellent")) {
                        %>
                        <font color="green">
                        <%= status%>
                        </font>
                        <%
                        } else if (status.equals("Good")) {
                        %>
                        <font color="green">
                        <%= status%>
                        </font>
                        <%
                        } else if (status.equals("Weak")) {
                        %>
                        <font color="red">
                        <%= status%>
                        </font>
                        <%
                        } else if (status.equals("Injured")) {
                        %>
                        <font color="red">
                        <%= status%>
                        </font>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="UpdateAvengerController"/>
                            <input type="submit" name="action" value="Edit"/>
                            <input type="hidden" name="avengerId" value="<%= dto.getAvengerId()%>"/>
                            <input type="hidden" name="avengerName" value="<%= dto.getFullname()%>"/>
                        </form>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="DeleteAvengerController"/>
                            <input type="submit" name="action" value="Delete"/>
                            <input type="hidden" name="avengerId" value="<%= dto.getAvengerId()%>"/>
                        </form>
                    </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="6">
                            <form action="MainController" method="POST">
                                <input type="hidden" name="controller" value="AddAvengerController"/>
                                <input class="button" type="submit" name="action" value="Add"/>
                            </form>
                        </td>
                    </tr>    
                    </tbody>
                    <%
                    } else {
                    %>
                    <h2 style="text-align: center">
                        <font color="red" style="font-size: 15px;font-family: monospace">
                        NO AVENGERS LEFT!
                        </font>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="AddAvengerController"/>
                            <input class="button" type="submit" name="action" value="Add"/>
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
