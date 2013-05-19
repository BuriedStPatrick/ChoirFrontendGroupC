<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
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
                    var type;
                    if ($('#materialType').val() !== "")
                        type = $('#materialType').val();
                    else
                    {
                        type = $('#newMaterialType').val();
                    }
                    if (type === "audio") {
                        $("#sheetOrAudio").html("<label for='textinput20'>Playing time</label> <input name='playingTime' id='textinput20' placeholder='' value='" + ${material.playingTime} + "' type='text'/>");
                    } else {
                        $("#sheetOrAudio").html("<label for='textinput21'>Page count</label><input name='pageCount' id='textinput21' placeholder='' value='" + ${material.pageCount} + "' type='text'/>");
                    }
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
                    Create/edit Material
                </h3>
            </div>
            <div data-role="content">
                <form action="FrontController?command=saveMaterial" method="POST">
                    <input id="materialType" name="type" type="hidden" value ="${material.type}"/>
                    <input id="newMaterialType" name="newType" type="hidden" value ="${type}"/>
                    <input type="hidden" name="id" value="${material.id}"/>
                    <div data-role="fieldcontain">
                        <label for="textinput13">
                            Title
                        </label>
                        <input name="title" id="textinput13" placeholder="" value="${material.title}" type="text">
                    </div>
                    <div id="checkboxes" data-role="fieldcontain">
                        <fieldset data-role="controlgroup" data-type="vertical">
                            <legend>
                                Voices
                            </legend>
                            <c:forEach var="voice" items="${voices}">
                                <c:set var="checked" value="" scope="page"/>
                                <c:forEach var="materialVoice" items="${material.voices}">
                                    <c:if test="${voice.code == materialVoice.code}">
                                        <c:set var="checked" value="checked='checked'" scope="page"/>
                                    </c:if>
                                </c:forEach>
                                <input id="checkbox${voice.code}" name="voiceCodes" data-theme="c" type="checkbox" value="${voice.code}" ${checked}>
                                <label for="checkbox${voice.code}">
                                    ${voice.name}
                                </label>
                            </c:forEach>
                        </fieldset>
                    </div>
                    <div data-role="fieldcontain">
                        <label for="selectmenu">
                            Music
                        </label>
                        <select id="selectmenu" name="musicId">
                            <c:forEach var="musics" items="${music}">
                                <c:choose>
                                    <c:when test="${material.musicId==musics.id}">
                                        <option selected="selected" value="${musics.id}">${musics.title}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${musics.id}">${musics.title}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput16">
                            Filename
                        </label>
                        <input name="fileName" id="textinput16" placeholder="" value="${material.fileName}" type="text">
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput17">
                            Filesize
                        </label>
                        <input name="fileSize" id="textinput17" placeholder="" value="${material.fileSize}" type="text">
                    </div>
                    <div id="sheetOrAudio" data-role="fieldcontain">
                    </div>
                    <div class="ui-grid-b">
                        <div class="ui-block-a">
                            <input type="submit" value="Save" data-mini="true" data-ajax="false">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
