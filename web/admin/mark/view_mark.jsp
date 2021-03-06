<%-- 
    Document   : view_mark
    Created on : Jun 29, 2018, 10:34:21 AM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page import="vuph.dtos.MarksDTO"%>
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
                        <li>
                            <a href="/Jarvis_Web/admin/ViewWeaponController">Weapons</a>
                        </li>
                        <li class="selected">
                            <a href="/Jarvis_Web/admin/ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    VIEW MARK<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="MainController" style="margin: 0 0 0 60%;max-width: 300px;">
                    <input type="text" name="search" placeholder="Search by ID..."/>
                    <input type="submit" value="Search"/>
                    <input type="hidden" name="controller" value="SearchMarkController"/>
                </form>
                <%
                    List<MarksDTO> list = (List<MarksDTO>) request.getAttribute("MARKS");
                    if (list.size() > 0) {
                %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Mark ID</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 0;
                            for (MarksDTO dto : list) {
                                count++;
                        %>
                        <tr>
                            <td>
                                <%= count%>
                    <center>
                        <img style="max-height: 150px" src="/Jarvis_Web/images/Marks/<%= dto.getMarkId()%>"/>
                    </center>        
                    </td>
                    <td><%= dto.getMarkId()%></td>
                    <td>
                        <%
                            String status = dto.getMarkStatus();
                            if (status.equals("Active")) {
                        %>
                        <font color="#60ff83">
                        <%= status%>
                        </font>
                        <%
                        } else {
                        %>
                        <font color="#f95a20">
                        <%= status%>
                        </font>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="UpdateMarkController"/>
                            <input type="submit" name="action" value="Edit"/>
                            <input type="hidden" name="txtId" value="<%= dto.getMarkId()%>"/>
                            <input type="hidden" name="txtStatus" value="<%= dto.getMarkStatus()%>"/>
                        </form>
                        <form action="MainController" method="POST">
                            <input type="hidden" name="controller" value="DeleteMarkController"/>
                            <input type="submit" name="action" value="Delete"/>
                            <input type="hidden" name="txtId" value="<%= dto.getMarkId()%>"/>
                        </form>
                    </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="4">
                            <form action="MainController" method="POST">
                                <input type="hidden" name="controller" value="AddMarkController"/>
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
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    NO MARKS LEFT!
                    </font>
                    <form action="MainController" method="POST">
                        <input type="hidden" name="controller" value="AddMarkController"/>
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
