<%-- 
    Document   : add_mission_detail
    Created on : Jun 29, 2018, 9:02:30 AM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AddMissionDetailController" method="POST">
            <table border="0">
                <input type="hidden" name="date" value="<%= request.getParameter("date")%>"/>
                <%
                    String missionId = request.getParameter("missionId");
                %>
                <tr>
                    <td>Mission ID: </td>
                    <td><input type="text" name="missionId" value="<%= missionId%>" readonly/></td>
                </tr>
                <tr>
                    <td>Avenger ID: </td>
                    <td><input type="text" name="avengerId" required/></td>
                </tr>
                <tr>
                    <td>Status: </td>
                    <td>
                        In Process <input type="radio" name="status" value="In Process" required/>
                        Done <input type="radio" name="status" value="Done" checked required/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Submit"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
