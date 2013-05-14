<%-- 
    Document   : login
    Created on : 26-02-2013, 09:25:29
    Author     : Kasper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choir Login</title>
    </head>
    <body>
        <h1>Choir Login</h1>
        <p>${errorMessage}</p>
        <form>
            <table>
                <tr>
                    <th>User name:</th>
                    <td><input type="text" name="userName" value="User Name"/></td>
                </tr>
                <tr>
                    <th>Password:</th>
                    <td><input type="password" name="password" value="Password"/></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" name="command" value="login">Log in</button>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
