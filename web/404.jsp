<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table{
                border: 2px;
                border-collapse: collapse;
                border-color: red;
                }
            td{
                background-color: red;
                width: 580px;
                
                color: white;
                font-family: sans-serif;
                text-align: center;
            }
            #desc{
                background: white;
                color: black;
            }
        </style>
            
        
        <title>404</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>${pageContext.exception.message}</td>
            </tr>
            <tr>
            <td id="desc">
                <c:forEach var="stack" items="${pageContext.exception.stackTrace}">
                    <c:out value="${stack}"/>
                </c:forEach>
            </td>
            </tr>
        </table>
    </body>
</html>
