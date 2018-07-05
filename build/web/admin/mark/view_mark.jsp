<%-- 
    Document   : view_mark
    Created on : Jun 29, 2018, 10:34:21 AM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page import="vuph.dtos.MarksDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
