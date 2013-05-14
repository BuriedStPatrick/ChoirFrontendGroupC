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

    });

  } catch (error) {
    console.error("Your javascript has an error: " + error);
  }
        </script>
    </head>
    <body>
        <!-- Home -->
<div data-role="page" id="page1">
    <div data-role="content">
        <form action="FrontController?command=saveArtist" method="POST">
            <input type="hidden" name="id" value="${artist.id}"/>
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <div data-role="fieldcontain">
                        <label for="textinput18">
                            Firstname
                        </label>
                        <input name="name" id="textinput18" placeholder="" value="${artist.firstName}" type="text">
                    </div>
                </div>
                    <div class="ui-grid-a">
                <div class="ui-block-a">
                    <div data-role="fieldcontain">
                        <label for="textinput50">
                            Lastname
                        </label>
                        <input name="name" id="textinput50" placeholder="" value="${artist.lastName}" type="text">
                    </div>
                </div>
                <div class="ui-block-b">
                    <div data-role="fieldcontain">
                        <label for="textinput19">
                            Country
                        </label>
                        <input name="country" id="textinput19" placeholder="" value="${artist.country}" type="text">
                    </div>
                </div>
            </div>
            <div data-role="fieldcontain">
                <label for="textinput17">
                    Date of Death
                </label>
                <input name="dateOfDeath" id="textinput17" placeholder="" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${artist.dateOfDeath}'/>" type="date">
            </div>
            <div data-role="fieldcontain">
                <label for="textinput51">
                    Date of Birth
                </label>
                <input name="dateOfBirth" id="textinput51" placeholder="" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${artist.dateOfBirth}'/>" type="date">
            </div>
            <div data-role="fieldcontain">
                <label for="textinput20">
                    WikiURL
                </label>
                <input name="wikiURL" id="textinput20" placeholder="" value="${artist.wikiUrl}" type="text">
            </div>
            
            <div class="ui-grid-b">
                <div class="ui-block-a">
                    <input type="submit" value="Save" data-mini="true">
                </div>
                <div class="ui-block-b">
                    <input type="submit" value="Cancel" data-mini="true">
                </div>
                <div class="ui-block-c">
                    <input type="submit" value="Reset" data-mini="true">
                </div>
            </div>
        </form>
    </div>
</div>
    </body>
</html>
