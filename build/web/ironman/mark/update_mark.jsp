<%-- 
    Document   : update_mark
    Created on : Jul 4, 2018, 12:07:39 PM
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
        <form action="UpdateMarkController" method="POST">
            <table border="0">
                <tr>
                    <td>Mark ID: </td>
                    <td><input type="text" name="txtId" value="<%= request.getParameter("txtId")%>" readonly/></td>
                </tr>
                <tr>
                    <td>Status: </td>
                    <td>
                        Destroyed <input type="radio" name="txtStatus" value="Destroyed" checked required/>
                        Active <input type="radio" name="txtStatus" value="Active" required/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Update"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
