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
                .invalid-data { border: 1px solid red;}
        </style>
        
        <script>
            try {

    $(function() {
     
        $("form").submit(function(){
          var validated = true;
          $('input').each(function(){
              if($(this).val()=== ""){
                  if($(this).attr("rule") === "required"){
                      $(this).addClass("invalid-data");
                      validated = false;
                  };
              };
          });
          
          return validated;
        });
    });
  } catch (error) {
    console.error("Your javascript has an error: " + error);
  }
  
        </script>
    </head>
    <body>
        <!-- Home -->
        <div data-role="page" id="page1" >
            <div data-theme="" data-role="header" data-position="fixed">
                <h3>
                    Log in
                </h3>
            </div>
            <div data-role="content">
                <form action="FrontController?command=login">
                    <div data-role="fieldcontain" id="userName">
                        <label for="userName">
                            Username
                        </label>
                        <input name="userName" id="userName"  rule="required" placeholder="Username" type="text"/>
                    </div>
                    <div data-role="fieldcontain" id="password">
                        <label for="password">
                            Password
                        </label>
                        <input name="password" id="password" rule="required" placeholder="Password" type="password" />
                    </div>
                   <input id="submitButton" type="submit" value="Log in">
                </form>
                <div data-theme="a" data-role="footer" data-position="fixed">
                    ChoirApp
                </div>
            </div>
        </div>
    </body>
</html>
