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
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="../css/mobile.css">
        <script src="../js/mobile.js" type="text/javascript"></script>
    </head>
    <body>        
        <div id="page">
            <div id="body">
                <div class="header">
                    <div class="contact">
                        <h1>LOG In</h1>
                        <h2>Welcome to avengers world</h2>
                        <form action="MainController" method="POST">
                            <h3 style="text-align: center">
                                <font color="red" style="font-family: monospace">
                                ${requestScope.ERROR}
                                ${requestScope.INVALID.getUsernameError()}
                                ${requestScope.INVALID.getPasswordError()}
                                </font>
                            </h3>
                            <input type="text" name="txtUsername" placeholder="Username"/>
                            <input type="password" name="txtPassword" placeholder="Password"/>
                            <input type="submit" name="action" value="Login"/>
                        </form>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div class="connect">
                    <div>
                        <h1>FOLLOW OUR  MISSIONS ON</h1>
                        <div>
                            <a href="" class="facebook">facebook</a>
                            <a href="" class="twitter">twitter</a>
                            <a href="" class="googleplus">googleplus</a>
                            <a href="" class="pinterest">pinterest</a>
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
