<%-- 
    Document   : memberEdit
    Created on : Feb 26, 2013, 2:52:00 AM
    Author     : Nicklas Hemmingsen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="choirLayout.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Edit</title>
        <script src="https://s3.amazonaws.com/codiqa-cdn/jquery-1.7.2.min.js">
        </script>
        <script src="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>
        <script src="validation.js">
        </script>
        
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Choir Edit Member Page</h1>
            </div>
            <div class="pages">
                <ul>
                    <li><a href="404.jsp">Does nothing</a></li>
                </ul>
            </div>
            <form
                action="FrontController"
                method="post">
                <input type="hidden" name="id" value="${member.id}"/>
                <div class="content-container1">
                    <div class="content">
                        <table border="0" cellspacing="0" cellpadding="4">
                            <tr> <!-- table row = række -->
                                <th>First name:</th> <!-- table header cell -->
                                <td colspan="2">
                                    <input type="text" name="firstName" size="50" value="${member.firstName}" required="required"/>
                                </td> <!-- table data cell -->
                            </tr>
                            <tr> 
                                <th id="lnr" >Last name:</th>
                                <td colspan="2">
                                    <input type="text" name="lastName" size="50" value="${member.lastName}" required="required"/>
                                </td>
                            </tr>

                            <tr> 
                                <th>Voice:</th>
                                <td colspan="2">
                                    <select name="voiceCode">
                                        <c:set var="selected" value="" scope="page"/>
                                        <c:set var="voiceName" value="" scope="page"/>
                                        <c:forEach var="voice" items="${voices}">
                                            <c:set var="selected" value="value='${voice.code}'" scope="page" />
                                            <c:set var="voiceName" value="${voice.name}" scope="page" />
                                            <c:if test="${member.voice.code==voice.code}">
                                                <c:set var="selected" value="value='${member.voice.code}' selected='${member.voice.code}'" scope="page" />
                                                <c:set var="voiceName" value="${member.voice.name}" scope="page" />
                                            </c:if>
                                            <option ${selected}>${voiceName}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Roles:</th>
                                <td colspan="2">
                                    <c:forEach var="role" items="${roles}">
                                        <c:set var="checked" value="" scope="page"/>
                                        <c:forEach var="memberRole" items="${member.roles}">
                                            <c:if test="${role.code == memberRole.code}">
                                                <c:set var="checked" value="checked='checked'" scope="page"/>
                                            </c:if>
                                        </c:forEach> 
                                        <input type="checkbox" name="roleCodes" value="${role.code}" ${checked}/>${role.name}<br/>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr> 
                                <th>Date of birth:</th>
                                <td colspan="2">
                                    <input type="date" name="dateOfBirth" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${member.dateOfBirth}'/>" required="required" />
                                </td>
                            </tr>
                            <tr> 
                                <th>Street:</th>
                                <td colspan="2"><input type="text" name="street"  size="50" value="${member.street}"/></td>
                            </tr>
                            <tr> 
                                <th>District:</th>
                                <td><input type="text" name="zipCode" maxlength="4" size="4" placeholder="Zip" value="${member.zipCode}" required="required"/></td>
                                <td style="text-align: right;"><input type="text" placeholder="City goes here" name="city" size="35" value="${member.city}" required="required"/></td>
                            </tr>
                            <tr> 
                                <th>Phone:</th>
                                <td colspan="2"><input type="text" name="phone"  size="50" value="${member.phone}" required="required"/></td>
                            </tr>
                            <tr> 
                                <th>Email:</th>
                                <td colspan="2"><input type="email" name="email"  size="50" value="${member.email}" required="required"/></td>
                            </tr>
                            <tr> 
                                <th>Password:</th>
                                <td colspan="2"><input type="password" name="password" size="50" /></td>
                            </tr>
                            <tr class="ButtonRow">
                                <td colspan="3">
                                    <button type="submit" name="command" value="saveMember">Save</button>
                                    <button type="submit" name="command" value="cancelMember">Cancel</button>
                                    <button type="reset" >Reset</button>
                                </td>
                            </tr>
                        </table> 
                    </div>
                    <div class="footer">
                        @CPH-Business, 3rd Semester, KA1
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
