<%-- 
    Document   : view_avenger
    Created on : Jun 29, 2018, 10:34:41 AM
    Author     : Vu PH
--%>

<%@page import="java.util.List"%>
<%@page import="vuph.dtos.AvengerDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <font color="red">
        ${requestScope.ERROR}
        </font>
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
                <form action="UpdateAvengerController" method="POST">
                    <input type="submit" name="action" value="Edit"/>
                    <input type="hidden" name="avengerId" value="<%= dto.getAvengerId()%>"/>
                    <input type="hidden" name="avengerName" value="<%= dto.getFullname()%>"/>
                </form>
                <form action="DeleteAvengerController" method="POST">
                    <input type="submit" name="action" value="Delete"/>
                    <input type="hidden" name="avengerId" value="<%= dto.getAvengerId()%>"/>
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
    No avenger left!
    <%
        }
    %>
</table>
<form action="AddAvengerController" method="POST">
    <input type="submit" name="action" value="Add"/>
</form>
</body>
</html>
