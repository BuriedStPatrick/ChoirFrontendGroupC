<%-- 
    Document   : main
    Created on : 25-02-2013, 16:17:53
    Author     : Kasper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="choirLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choir Main page</title>
    </head>
    <body>
        <div class="container">
            <div class="header"><h1>Choir Main page</h1></div>
            <div class="pages">
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="login.jsp">LogIn</a></li>
                    <li><a href="FrontController?command=listMembers">Show Memberlist</a></li>
                    <li><a href="FrontController?command=listMaterials">Show Materiallist</a></li>
                </ul>
            </div>
            <div class="content-container1">
                    <div class="content">   
                        <h2>Logged in member:</h2> 
                        <p>${loggedIn.name}</p>
                    </div>
                    <div class="footer">
                        @CPH-Business, 3rd Semester, KA1
                    </div>
                </div>
        </div>
    </body>
</html>
