<%-- 
    Document   : update_mission
    Created on : Jun 25, 2018, 11:06:46 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mission</title>
    </head>
    <body>
        <form action="UpdateMissionController" method="POST">
            <table border="0">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Mission ID: </td>
                        <td><input type="text" name="txtId" value="<%= request.getParameter("txtId")%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Date: </td>
                        <td><input type="date" name="txtDate" value="<%= request.getParameter("txtDate")%>" required/></td>
                    </tr>
                    <tr>
                        <td>Status: </td>
                        <td>
                            <%
                                if (request.getParameter("txtStatus").equals("Done")) {
                            %>
                            In Process <input type="radio" name="txtStatus" value="In Process" required/>
                            Done <input type="radio" name="txtStatus" value="Done" checked required/>
                            <%
                            } else {
                            %>
                            In Process <input type="radio" name="txtStatus" value="In Process" checked required/>
                            Done <input type="radio" name="txtStatus" value="Done" required/>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="Update"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
