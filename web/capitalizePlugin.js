(function($){
    $.fn.capitalize = function(){
    return this.each(function(){
             $(this).on('keyup', function(){
           var first = this.value.charAt(0).toUpperCase();
           var last = this.value.substr(1);
           this.value = first.concat(last);
        });
        
    });
    };
})(jQuery);
