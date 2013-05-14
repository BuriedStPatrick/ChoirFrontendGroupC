
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <title>
        </title>
        <link rel="stylesheet" href="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <script src="https://s3.amazonaws.com/codiqa-cdn/jquery-1.7.2.min.js">
        </script>
        <script src="https://s3.amazonaws.com/codiqa-cdn/mobile/1.2.0/jquery.mobile-1.2.0.min.js">
        </script>
        <script src="my.js">
        </script>
        <!-- User-generated css -->
        <style>
        </style>
        <!-- User-generated js -->
        <script>
            try {

                $(function() {
                    var id;
                    $(".memberList").on("expand", function() {
                        id = $(this).data('record');
                        console.log(id);
                        $.ajax({url: "AjaxServlet?id=" + id + "&command=ajaxFindMember", cache: false, dataType: "json", success: dataReady});
                    });
                    function dataReady(data) {
                        $("#" + id).html("<li> Date of Birth:" + data.dateOfBirth + "</li>");
                        $("#" + id).append("<li> Voice:" + data.voice.name + "</li>");
                        $("#" + id).append("<li> Roles:" + data.roles.name + "</li>");
                        $("#" + id).append("<li> Street:" + data.street + "</li>");
                        $("#" + id).append("<li> Zipcode:" + data.zipCode + "</li>");
                        $("#" + id).append("<li> City:" + data.city + "</li>");
                        $("#" + id).append("<li> Email:<a href=':mailto'" + data.email + "rel='external'>" + data.email + "</a></li>");
                        $("#" + id).append("<li> Phone: <a href=':tel'" + data.phone + "rel='external'>" + data.phone + "</a></li>");
                        //                       $("#" + id).append("<form><input type=\"hidden\" name=\"id\" value=\"" + id + "\"/><button type=\"submit\" name=\"command\" value=\"editMember\">Edit</button></form>");
                        $("#" + id).append("<a data-role='button' href='FrontController?command=editMember&id=" + id + "'>Edit</a>");
                    }
                    ;
                    $("selectmenu1").change(function() {
                    });
                });

            } catch (error) {
                console.error("Your javascript has an error: " + error);
            }
        </script>
    </head>
    <body>
        <!-- Home -->
        <div data-role="page" id="page1">
            <div data-theme="a" data-role="header" data-position="fixed">
                <a data-role="button" data-direction="reverse" data-transition="slide" href="FrontController?command=main" data-icon="home" data-iconpos="right" class="ui-btn-left" data-ajax="false"></a>
                <h3>
                    Members
                </h3>
            </div>
            <div data-role="content">
                <div data-role="navbar" data-iconpos="top">
                    <ul>
                        <li>
                            <a href="FrontController?command=createMember" data-transition="fade" data-theme="" data-icon="plus" data-ajax="false" data-iconpos="left">
                                Create Member
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
<!--            <div data-role="fieldcontain">
                <label for="selectmenu1">
                    Sort by voice
                </label>
                <select id="selectmenu1" name="">
                    <option id="default">
                        default
                    </option>
                    <c:forEach var="voice" items="${voices}">
                        <option data-code="${voice.code}">
                            ${voice.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div data-role="fieldcontain">
                <label for="selectmenu2">
                    Sort by role
                </label>
                <select id="selectmenu2" name="">
                    <option value="default">
                        default
                    </option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.code}">
                            ${role.name}
                        </option>
                    </c:forEach>
                </select>
            </div>-->
            <div data-role="content">
                <div data-role="collapsible-set" data-inset="false">
                    <c:forEach var="member" items="${members}">
                        <div class="memberList" data-role="collapsible" data-collapsed="true" data-record="${member.id}">
                            <h3>
                                <c:out value="${member.name}"></c:out>
                                </h3>
                                <ul id="${member.id}"  data-role='listview' data-inset='false'></ul>
                        </div>
                    </c:forEach>
                </div>
                <div data-theme="a" data-role="footer" data-position="fixed">
                    ChoirApp
            </div>
            </div>
        </div>
    </body>
</html>
