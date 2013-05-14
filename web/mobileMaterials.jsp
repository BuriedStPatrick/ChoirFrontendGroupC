<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                    $("li").click(function() {
                        var id = $(this).data("record");
                        $.ajax({url: "AjaxServlet?id=" + id + "&command=ajaxViewMaterial",
                            cache: false,
                            dataType: "json",
                            success: materialReady});
                    });

                    function materialReady(data) {
                        $("#detail").html("<h3>" + data.title + "</h3><br/>" +
                                "<div>Voices: <c:forEach var='voice' items='${data.voices}'><c:out value='${voice.name}'></c:out><br></c:forEach></div><br/>" +
                                "Filename: " + data.fileName + "<br/>" +
                                "File size: " + data.fileSize + "<br/>" +
                                "Playing time: " + data.playingTime + "<br/>" +
                                "Pages: " + data.pageCount + "<br/>" +
                                "<a data-role='button' href='FrontController?command=editMaterial&id=" + data.id + "' data-ajax='false'>Edit</a>" + "</p>");
                    }


                    $("#selectmenu1").change(function() {
                        var id = $(this).find(":selected").data("record");
                        $.ajax({url: "AjaxServlet?voiceCode=" + id + "&command=ajaxListMaterialsByVoices",
                            cache: false,
                            dataType: "json",
                            success: materialsByVoicesList});
                    });

                    function materialsByVoicesList(data) {
                        $(".materialList").empty();
                        $(".materialList").html("<li data-role='list-divider' role='heading' id='heading'>" +
                                "Materials" +
                                "</li>");
                        for (var i = 0; i < data.length; i++) {
                            $(".materialList").append("<li data-theme='c' data-record=" + data[i].id + ">" +
                                    "<a href='#details' data-transition='slide'>" +
                                    data[i].title +
                                    "</a>" +
                                    "</li>");
                        }
                    }

                });

            } catch (error) {
                console.error("Your javascript has an error: " + error);
            }
                </script>
            </head>
            <body>


                <!-- HOME -->
                <div data-role="page" id="page1">
                    <div data-theme="a" data-role="header">
                        <a data-role="button" data-direction="reverse" data-transition="slide" href="FrontController?command=main" data-icon="home" data-iconpos="right" class="ui-btn-left" data-ajax="false"></a>
                        <h3 class="header">
                            Materials
                        </h3>
                    </div>
                    <div data-role="content">
                        <div data-role="navbar" data-iconpos="top">
                            <ul>
                                <li>
                                    <a data-role='button' href='FrontController?command=createMaterial&type=audio' data-transition="fade" data-theme="" data-icon="plus" data-ajax='false' data-iconpos="left">Create Audio</a>
                                    <a data-role='button' href='FrontController?command=createMaterial&type=sheet' data-transition="fade" data-theme="" data-icon="plus" data-ajax='false' data-iconpos="right">Create Sheet</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div data-role="content">
                        <div data-role="fieldcontain">
                            <label for="selectmenu1">
                                Voices:
                            </label>
                            <select id="selectmenu1" name="">
                        <c:forEach var="voice" items="${voices}">
                            <option value="${voice.code}" data-record="${voice.code}">
                                <c:out value="${voice.name}"></c:out>
                                </option>
                        </c:forEach>

                    </select>
                </div>


                <ul class="materialList" data-role="listview" data-divider-theme="b" data-inset="true" data-filter="true">
                    <li data-role="list-divider" role="heading" id="heading">
                        Materials
                    </li>
                    <c:forEach var="material" items="${materials}">
                        <li data-theme="c" data-record="${material.id}">
                            <a href="#details" data-transition="slide">
                                <c:out value="${material.title}"></c:out>
                                </a>
                            </li>
                    </c:forEach>
                </ul>
            </div>


            <div data-theme="a" data-role="footer" data-position="fixed">
                <h3 class="footer">
                    Choir
                </h3>
            </div>
        </div>

        <!-- PAGE FOR MATERIAL DETAILS -->
        <div data-role="page" id="details">
            <div data-theme="a" data-role="header">
                <a data-role="button" data-direction="reverse" data-transition="slide" href="#page1" data-icon="arrow-l" data-iconpos="left" class="ui-btn-left">
                    Materials
                </a>
                <h3 class="header">
                    Details
                </h3>
            </div>
            <div data-role="content" id="detail">

            </div>
            <div data-theme="a" data-role="footer" data-position="fixed">
                <a data-role="button" data-direction="reverse" data-transition="slide" href="#page1" data-icon="home" data-iconpos="left" class="ui-btn-left">
                </a>
            </div>
        </div>
    </body>
</html>
