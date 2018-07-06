<%-- 
    Document   : view_mark
    Created on : Jul 4, 2018, 12:06:51 PM
    Author     : Vu PH
--%>

<%@page import="vuph.dtos.MarksDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IRONMAN</title>
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
                        <li>                            
                            <a href="ViewMissionController">Missions</a>
                        </li>
                        <li class="selected">
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
                    <th>Mark ID</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <%
                List<MarksDTO> list = (List<MarksDTO>) request.getAttribute("MARKS");
                if (list.size() > 0) {
            %>
            <tbody>
                <%
                    int count = 0;
                    for (MarksDTO dto : list) {
                        count++;
                %>
                <tr>
                    <td><%= count%></td>
                    <td><%= dto.getMarkId()%></td>
                    <td>
                        <%
                            String status = dto.getMarkStatus();
                            if (status.equals("Active")) {
                        %>
                        <font color="green">
                        <%= status%>
                        </font>
                        <%
                        } else {
                        %>
                        <font color="red">
                        <%= status%>
                        </font>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <form action="UpdateMarkController" method="POST">
                            <input type="submit" name="action" value="Edit"/>
                            <input type="hidden" name="txtId" value="<%= dto.getMarkId()%>"/>
                            <input type="hidden" name="txtStatus" value="<%= dto.getMarkStatus()%>"/>
                        </form>
                        <form action="DeleteMarkController" method="POST">
                            <input type="submit" name="action" value="Delete"/>
                            <input type="hidden" name="txtId" value="<%= dto.getMarkId()%>"/>
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
            No mark left!
            <%
                }
            %>
        </table>
        <form action="AddMarkController" method="POST">
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
