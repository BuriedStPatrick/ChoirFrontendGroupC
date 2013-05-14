<!doctype html>
 
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Search Artists</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <style>
  .ui-autocomplete-loading {
    background: white url('images/ui-anim_basic_16x16.gif') right center no-repeat;
  }
  </style>
  <script>
  $(function() {
    function log( message ) {
      $( "#log" ).empty();  
      $( "<div>" ).html( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
      
    }
    $( "#artists" ).autocomplete({
      source: "AjaxServlet?command=ajaxListArtistsByPattern",
      
      select: function( event, ui ) {
        log( ui.item ?
          "<p>" + "Name: " + ui.item.label + "</p>" + "<p><a href=" + ui.item.wikiURL +">" + "WikiURL</a></p>" + "<a data-role='button' href='FrontController?command=editArtist&id="+ui.item.id+"'>Edit</a>":
          "Nothing selected, input was " + this.value );
      }
    });
  });
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="artists">Artists: </label>
  <input id="artists" />
</div>
 
<div class="ui-widget" style="margin-top: 2em; font-family: Arial;">
  Result:
  <div id="log" style="height: 200px; width: 500px; overflow: auto;" class="ui-widget-content"></div>
</div>
 
 
</body>
</html>