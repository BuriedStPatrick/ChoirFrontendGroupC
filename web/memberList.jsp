<%-- 
    Document   : memberList
    Created on : 25-02-2013, 17:58:32
    Author     : Kasper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="choirLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member list</title>
    </head>
    <body>
        <div class="container">
        <div class="header"><h1>Choir Memberlist Page</h1></div>
        <div class="pages">
                <ul>
                    <li><a href="FrontController?command=main">Home</a></li>
                    <li><a href="FrontController?command=createMember">Create Member</a></li>
                </ul>
        </div>
        <div class="content-container1">
            <div class="content">
                <h2>Members:</h2>
        <table>
            <c:forEach var="member" items="${members}">
              <form>
                <tr><td>
                <c:out value="${member.name}"></c:out>
                    </div>
                    <div>
                <input type="hidden" name="id" value="${member.id}"/>
                </div>
                <div>
                        <button type="submit" name="command" value="viewMember">View</button>
                    </td>
                </tr>
             </form>
            </c:forEach>
        </table>
            </div>
                <div class="footer">
                        @CPH-Business, 3rd Semester, KA1
                    </div>
            </div>
        </div>
    </body>
</html>
