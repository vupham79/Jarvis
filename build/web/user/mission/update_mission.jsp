<%-- 
    Document   : update_mission
    Created on : Jul 4, 2018, 12:15:15 PM
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
        <div id="page">
            <div id="header">
                <div>
                    <a href="index.html" class="logo"><img src="images/logo.png" alt=""></a>
                    <ul id="navigation">
                        <li>
                            <a href="/Jarvis_Web/ironman/index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/ironman/ViewAccountController">Account</a>
                        </li>
                        <li class="selected">                            
                            <a href="/Jarvis_Web/ironman/ViewMissionController">Missions</a>
                        </li>
                        <li>
                            <a href="/Jarvis_Web/ironman/ViewMarkController">Marks</a>
                        </li>
                    </ul>
                </div>
            </div>
            <form action="UpdateMissionController" method="POST">
                <table border="1">
                    <tr>
                        <td>Mission ID: </td>
                        <td><input type="text" name="missionId" value="${param.missionId}" readonly/></td>
                    </tr>
                    <tr>
                        <td>Date: </td>
                        <td><input type="date" name="date" value="${param.date}" readonly/></td>
                    </tr>
                    <tr>
                        <td>Mission Status: </td>
                        <td><input type="text" name="missionStatus" value="${param.missionStatus}" readonly/></td>
                    </tr>
                    <tr>
                        <td>My Task(s): </td>
                        <td>    
                            Done <input type="radio" name="avengerStatus" value="Done" required/>
                            In Process <input type="radio" name="avengerStatus" value="In Process" required/>
                        </td>
                    </tr>
                </table>
                <input type="submit" name="action" value="Update"/>
            </form>
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
