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
            #errorReport{height : 150px; 
                         color : red;
                         border: darkgray solid thin ;
                         background-color: ghostwhite;
                         border-radius: 10px;}
        </style>
            
        <script>
            try {

                $(function() {
                    
                    $("#findByNumberBtn").click(function(){
                        var number = $("#numberInput").val();
                        if(isValidPhone(number)){
                            $.ajax({url: "AjaxServlet?nr=" + number + "&command=findMemberByPhone",
                            cache: false,
                            dataType: "json",
                            success: showMemberByPhone});
                        }else
                            alert("Please provide a valid phonenumber containing only numbers.");
                    });
                    
                    function showMemberByPhone(data){
                        $("#textinput13").val(data.firstName);
                        $("#textinput14").val(data.lastName);
                        $("#textinput16").val(data.street);
                        $("#textinput18").val(data.zipcode);
                        $("#textinput19").val(data.city);
                        $("#textinput17").va(data.phone);
                    }
                    
                    $("#submitButton").click(function() {
                        $("#errorReport").empty();
                        var validated = true;
                        $('input').each(function() {
                            if ($(this).val() === "") {
                               var rule = $(this).attr("rule");
                                if (rule.indexOf("required") >= 0) {
                                    $(this).addClass("invalid-data");
                                    $("#errorReport").append("<p>" +($(this).attr("name") + " was empty!" + "</p>"));
                                    validated = false;
                                }
                            } else if ($(this).attr("rule") === "required email") {
                                if (!isValidEmail($(this).val())) {
                                    $(this).addClass("invalid-data");
                                    validated = false;
                                    $("#errorReport").append("<p>" +($(this).attr("name") + " isent a valid email" + "</p>"));
                                }else{
                                    $(this).removeClass("invalid-data");
                                }
                            } else if ($(this).attr("rule") === "required phone") {
                                if (!isValidPhone($(this).val())) {
                                    $(this).addClass("invalid-data");
                                    validated = false;
                                    $("#errorReport").append("<p>" +($(this).attr("name") + " only numeric values allowed!" + "</p>"));
                                }else{
                                    $(this).removeClass("invalid-data");
                                }
                            }else{
                                $(this).removeClass("invalid-data");
                            }
                        });
                        return validation;
                    });
                    function isValidEmail(email) {4
                        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                        return regex.test(email);
                    };
                    function isValidPhone(phone) {
                        var regex = /^[0-9-+]+$/;
                        return regex.test(phone);
                    };
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
                <div data-theme="a" data-role="header" data-position="fixed">
                     <a data-role="button" data-direction="reverse" data-transition="slide" href="FrontController?command=main" data-icon="home" data-iconpos="right" class="ui-btn-left" data-ajax="false"></a>
                    <h3>
                        Create/Edit Member
                    </h3>
                </div>
                <input type="text" id="numberInput"/>
                <button id="findByNumberBtn">Find member by number</button>
                <form action="FrontController?command=saveMember" method="POST">
                    <input type="hidden" name="id" value="${member.id}" rule=""/>
                    <div data-role="fieldcontain">
                        <label for="textinput13">
                            First name
                        </label>
                        <input name="firstName" id="textinput13" placeholder="" value="${member.firstName}" type="text" rule="required">
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput14">
                            Last name
                        </label>
                        <input name="lastName" id="textinput14" placeholder="" value="${member.lastName}" type="text" rule="required">
                    </div>
                    <div data-role="fieldcontain">
                        <label for="selectmenu">
                            Voice
                        </label>
                        <select id="selectmenu" name="voiceCode">
                            <c:forEach var="voice" items="${voices}">
                                <c:choose>
                                    <c:when test="${member.voice.code==voice.code}">
                                        <option selected="selected" value="${voice.code}">${voice.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${voice.code}">${voice.name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div id="checkboxes" data-role="fieldcontain">
                        <fieldset data-role="controlgroup" data-type="vertical">
                            <legend>
                                Roles
                            </legend>
                            <c:forEach var="role" items="${roles}">
                                <c:set var="checked" value="" scope="page"/>
                                <c:forEach var="memberRole" items="${member.roles}">
                                    <c:if test="${role.code == memberRole.code}">
                                        <c:set var="checked" value="checked='checked'" scope="page"/>
                                    </c:if>
                                </c:forEach>
                                <input id="checkbox${role.code}" name="roleCodes" data-theme="c" type="checkbox" value="${role.code}" ${checked} rule="">
                                <label for="checkbox${role.code}">
                                    ${role.name}
                                </label>
                            </c:forEach>
                        </fieldset>
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput15">
                            Date of birth
                        </label>
                        <input name="dateOfBirth" id="textinput15" placeholder="" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${member.dateOfBirth}'/>" type="date" rule="">
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput16">
                            Street
                        </label>
                        <input name="street" id="textinput16" placeholder="" value="${member.street}" type="text" rule="">
                    </div>
                    <div class="ui-grid-a">
                        <div class="ui-block-a">
                            <div data-role="fieldcontain">
                                <label for="textinput18">
                                    Zipcode
                                </label>
                                <input name="zipCode" id="textinput18" placeholder="" value="${member.zipCode}" type="text" rule="">
                            </div>
                        </div>
                        <div class="ui-block-b">
                            <div data-role="fieldcontain">
                                <label for="textinput19">
                                    City
                                </label>
                                <input name="city" id="textinput19" placeholder="" value="${member.city}" type="text" rule="">
                            </div>
                        </div>
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput17">
                            Phone
                        </label>
                        <input name="phone" id="textinput17" placeholder="" value="${member.phone}" type="tel" rule="required phone">
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput20">
                            Email
                        </label>
                        <input name="email" id="textinput20" placeholder="" value="${member.email}"  rule="required email">
                    </div>
                    <div data-role="fieldcontain">
                        <label for="textinput21">
                            Password
                        </label>
                        <input name="password" id="textinput21" placeholder="" value="" type="text" rule="">
                    </div>
                    <div id="errorReport"></div>
                    <div class="ui-grid-b">
                        <div class="ui-block-a">
                            <input id="submitButton" type="submit" value="Save" data-mini="true" data-ajax="false" rule="">
                        </div>
                    </div>
                </form>
                <div data-theme="a" data-role="footer">
                    <a data-role="button" data-direction="reverse" data-transition="slide" href="FrontController?command=main" data-icon="home" data-iconpos="left" class="ui-btn-left" data-ajax="false">
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
