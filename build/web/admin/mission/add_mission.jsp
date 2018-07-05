<%-- 
    Document   : add_mission
    Created on : Jun 26, 2018, 8:56:50 PM
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
        <form action="AddMissionController" method="POST">
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
                        <td><input type="text" name="txtId" required/></td>
                    </tr>
                    <tr>
                        <td>Date: </td>
                        <td><input type="date" name="txtDate" required/></td>
                    </tr>
                    <tr>
                        <td>Status: </td>
                        <td>
                            In Process <input type="radio" name="txtStatus" value="In Process" required/>
                            Done <input type="radio" name="txtStatus" value="Done" checked required/>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="action" value="Submit"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
