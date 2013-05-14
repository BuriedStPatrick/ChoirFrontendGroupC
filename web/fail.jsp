<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Failure</title>
    </head>
    <body>
        <h1>FAILURE in ${cause}</h1>
        <h3>${message}</h3>
        <table>
            <tr>
                <td>
                    ${stackTrace}
                </td>
            </tr>
        </table>
    </body>
</html>
