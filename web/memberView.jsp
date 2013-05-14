<%-- 
    Document   : memberView
    Created on : Feb 26, 2013, 2:51:32 AM
    Author     : Nicklas Hemmingsen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="choirLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member View</title>
    </head>
    <body>
        <div class="container">
        <div class="header"><h1>Choir View Page</h1></div>
        <div class="pages">
                <ul>
                    <li><a href="FrontController?command=listMembers">Memberlist</a></li>
                </ul>
        </div>
        <hr/>
        <form action="FrontController" method="POST">
          <input type="hidden" name="id" value="${member.id}">
          <div class="content-container1">
              <div class="content">
            <table border="1" cellspacing="0" cellpadding="4">
                <tr>
                    <th>ID</th>
                    <td colspan="2">${member.id}</td>
                </tr>
                <tr>
                    <th>Name: </th>
                    <td colspan="2">
                        ${member.firstName} ${member.lastName}
                    </td>
                </tr>
                <tr>
                    <th>Date of Birth: </th>
                    <td colspan="2">
                        ${member.dateOfBirth}
                    </td>
                </tr>
                <tr>
                    <th>Voice: </th>
                    <td colspan="2">
                        ${member.voice.name}
                    </td>
                </tr>
                <tr>
                    <th>Roles: </th>
                    <td colspan="2">
                        <ul>
                             <c:forEach var="role" items="${member.roles}">
                                <li>${role.code} ${role.name}</li>
                             </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th>Street: </th>
                    <td colspan="2">
                        ${member.street}
                    </td>
                </tr>
                <tr>
                    <th>zipCode: </th>
                    <td colspan="2">
                        ${member.zipCode}
                    </td>
                </tr>
                <tr>
                    <th>City: </th>
                    <td colspan="2">
                        ${member.city}
                    </td>
                </tr>
                <tr>
                    <th>Email: </th>
                    <td colspan="2">
                        ${member.email}
                    </td>
                </tr>
                <tr>
                    <th>Phone: </th>
                    <td colspan="2">
                        ${member.phone}
                    </td>
                </tr>
                <tr>
                    <th>Password: </th>
                    <td colspan="2">
                        
                    </td>
                </tr>                   
            </table>
                    <br/><button type="submit" name="command" value="editMember">Edit this member</button>
              </div>
                    <div class="footer">
                        @CPH-Business, 3rd Semester, KA1
                    </div>
          </div>
        </form>
        </div>
    </body>
</html>
