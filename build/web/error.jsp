<%-- 
    Document   : error
    Created on : Jun 26, 2018, 8:41:10 PM
    Author     : Vu PH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <img src="../images/gif/error.gif" alt=""/>
        <br/>
        <font color="red">
        ${requestScope.ERROR}
        </font>
    </body>
</html>
