<%-- 
    Document   : add_mission
    Created on : Jul 4, 2018, 12:15:24 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IRONMAN</title>
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
                            <a href="/Jarvis_Web/ironman/ViewAccountController">Account</a>
                        </li>
                        <li class="selected">                            
                            <a href="/Jarvis_Web/ironman/ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/ironman/ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="body" class="home">
                <h2 style="text-align: center">
                    ADD MISSION<br/>
                    <font color="red" style="font-size: 15px;font-family: monospace">
                    ${requestScope.ERROR}
                    </font>
                </h2>
                <form action="/Jarvis_Web/ironman/MainController" method="POST">
                    <input type="hidden" name="controller" value="AddMissionController"/>
                    <table border="1">
                        <tr>
                            <td>Username: </td>
                            <td><input type="text" name="avengerId" value="${sessionScope.USERNAME}" readonly/></td>
                        </tr>
                        <tr>
                            <td>Mission: </td> 
                            <%
                                List<String> missions = (List<String>) request.getAttribute("MISSIONS");
                                if (missions != null) {
                                    if (missions.size() > 0) {
                            %>
                            <td>
                                <select name="missionId">
                                    <%
                                        for (int i = 0; i < missions.size(); i++) {
                                    %>
                                    <option value="<%= missions.get(i)%>"><%= missions.get(i)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Status: </td>
                            <td>
                                <select name="avengerStatus">
                                    <option value="Done">Done</option>
                                    <option value="In Process">In Process</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="button" type="submit" name="action" value="Submit"/></td>
                        </tr>
                        <%
                        } else {
                        %>
                        <td>No more mission to join !</td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
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
