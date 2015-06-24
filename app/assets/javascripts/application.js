
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require turbolinks
//= require_tree .
$(document).on('page:change ready', function() {
    i=0;    
    while (i < document.getElementsByTagName("li").length) {
	if ( document.getElementsByTagName("li")[i].innerHTML.search(document.URL.split("/")[3]) > 0){
	    document.getElementsByTagName("li")[i].className = "active";
	}else {
	    document.getElementsByTagName("li")[i].className = "";
	}
    i++;
    }
    if ( document.URL.split("/")[3] == ""){
	document.getElementsByTagName("li")[0].className = "active";
    }


    $('#myModal').on('show.bs.modal', function (event){
		var button = $(event.relatedTarget)
		var recipient = button.data('img')
		var modal = $(this)
		modal.find('.title_image').text(recipient.substr(0,20))
		modal.find('.modal-body input#containers_image').val(recipient)
	})
    $('#imageModal').on('show.bs.modal', function (event){
		var button = $(event.relatedTarget)
		var recipient = button.data('img')
		var modal = $(this)
		modal.find('.title_image').text(recipient)
		modal.find('.modal-body input#containers_image').val(recipient)
	})
    $('#fileModal').on('show.bs.modal', function (event){
		var button = $(event.relatedTarget)
		var recipient = button.data('cont')
		var modal = $(this)
		modal.find('#article_title').val(button.data('title'))
		modal.find('#article_body').val(recipient)
	})

});