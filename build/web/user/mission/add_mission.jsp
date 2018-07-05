<%-- 
    Document   : add_mission
    Created on : Jul 4, 2018, 12:15:24 PM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AddMissionController" method="POST">
            <table border="0">
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
                        <%
                            for (int i = 0; i < missions.size(); i++) {
                        %>
                        <%= missions.get(i)%>
                        <input type="radio" name="missionId" value="<%= missions.get(i)%>" required/>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>My Task(s): </td>
                    <td>
                        Done <input type="radio" name="avengerStatus" value="Done" required/>
                        In Process <input type="radio" name="avengerStatus" value="In Process" required/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Submit"/></td>
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
    </body>
</html>
