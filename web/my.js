

var index = navigator.appVersion.indexOf("Mobile");

if (index === -1) {
    $('head').append('<link rel="stylesheet" href="desktop.css" type="text/css" />');
};
