<%-- 
    Document   : login.jsp
    Created on : Jun 22, 2018, 12:20:08 AM
    Author     : Vu PH
--%>

<%@page import="vuph.dtos.RegistrationErrorObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/mobile.css">
        <script src="js/mobile.js" type="text/javascript"></script>
    </head>
    <body>        
        <div id="page">
            <div clas="body">
                <h1>Sign In</h1>
                <h2>Fulfill as constructor</h2>
                <form action="MainController" method="POST">
                    <table border="0">
                        <tbody>
                            <tr>
                                <td><input type="text" name="txtUsername" placeholder="Username"/></td>
                                <td><font color='red'>${requestScope.INVALID.getUsernameError()}</font></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="txtPassword" placeholder="Password"/></td>
                                <td><font color='red'>${requestScope.INVALID.getPasswordError()}</font></td>
                            </tr>
                            <tr>
                                <td><input type="submit" name="action" value="Login"</td>
                                <td></td>
                            </tr>
                        <font color="red">
                        ${requestScope.ERROR}
                        </font>
                        </tbody>
                    </table>
                </form>
            </div>
            <div id="footer">
                <div class="connect">
                    <div>
                        <h1>FOLLOW OUR  MISSIONS ON</h1>
                        <div>
                            <a href="http://freewebsitetemplates.com/go/facebook/" class="facebook">facebook</a>
                            <a href="http://freewebsitetemplates.com/go/twitter/" class="twitter">twitter</a>
                            <a href="http://freewebsitetemplates.com/go/googleplus/" class="googleplus">googleplus</a>
                            <a href="http://pinterest.com/fwtemplates/" class="pinterest">pinterest</a>
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
