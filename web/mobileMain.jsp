
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
            <div data-theme="a" data-role="header" data-position="fixed">
                <h3>
                    Main
                </h3>
            </div>
            <div data-role="content">
                <div data-role="navbar" data-iconpos="top">
                    <ul>
                        <li>
                            <a href="FrontController?command=listMembers" data-transition="fade" data-theme="c" data-icon="" data-ajax="false">
                                List Members
                            </a>
                        </li>
                        <li>
                            <a href="FrontController?command=listMaterials" data-transition="fade" data-theme="c" data-icon="" data-ajax="false">
                                List Materials
                            </a>
                        </li>
                        <li>
                            <a href="FrontController?command=searchArtists" data-transition="fade" data-theme="c" data-icon="" data-ajax="false">
                                Search Artists
                            </a>
                        </li>
                        <li>
                            <a href="FrontController?command=chatClient" data-transition="fade" data-theme="c" data-icon="" data-ajax="false">
                                Chat Client
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div data-theme="a" data-role="footer" data-position="fixed">
                <a href="FrontController?command=login" class="ui-btn-right" data-transition="fade" data-theme="c" data-icon="" data-ajax="false">
                    Log out
                </a>
            </div>
        </div>
    </body>
</html>
