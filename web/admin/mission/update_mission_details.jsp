<%-- 
    Document   : update_mission_details
    Created on : Jun 28, 2018, 10:38:24 PM
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
        <form action="UpdateMissionDetailController" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Mission ID: </td>
                        <td><input type="text" name="missionId" value="<%= request.getParameter("missionId")%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Avenger ID: </td>
                        <td><input type="text" name="avengerId" value="<%= request.getParameter("avengerId")%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Fullname: </td>
                        <td><input type="text" name="avengerName" value="<%= request.getParameter("avengerName")%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>
                            Task(s) Status: 
                        </td>
                        <td>
                            Done <input type="radio" name="status" value="Done" checked required/>
                            In Process <input type="radio" name="status" value="In Process" required/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name="date" value="<%= request.getParameter("date")%>"/>
            <input type="submit" name="action" value="Submit"/>
        </form>
    </body>
</html>
