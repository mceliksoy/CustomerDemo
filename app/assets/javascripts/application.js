// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function show_confirm_modal(path, question){
    $('#confirm-modal #question').text(question);	
    $('#confirm-modal #delete').live("click", function(){
        $.ajax({
            async: false,
            type: "DELETE",
            url: path,
            success: function() {$('#confirm-modal').modal('hide');},
            dataType: 'script'
        });   
        $('#confirm-modal').modal('hide');    
    });
    $('#confirm-modal').show();
}

$(function(){
    $("a[data-remote='true']").live("click", function(){
        history.pushState({
            path:this.href
            }, "", this.href);
    });
    
    $("#table_div .pagination a, #table_div th a").live("click", function(){
        $.getScript(this.href);
        history.pushState({
            path:this.href
            }, "", this.href.replace("ajax_search=true", "ajax_search="));
        return false;
    });
    
    $("#quicksearch input").live("keyup",function(){
        var form = $("#ajax_search_form");
        var url = form.attr('action') + '?' + form.serialize();
        url = url.replace("ajax_search=true", "ajax_search=");
        history.pushState({
            path:url
        }, "", url);

        $.get(form.attr("action"), form.serialize(), null, "script");        
    });
});


$(function () {  
    $(window).bind("popstate", function () {  
        $.getScript(location.href);  
    });  
}) 
