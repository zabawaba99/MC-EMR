/*
	Copyright ©  Mobile Clinic-Electronic Medical Records.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is included in the section entitled "GNU
    Free Documentation License".
*/

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require_tree .

$(document).ready(function() {
 if ($.browser.opera==true) {
	 
	 $('#menu').css('left', '-280px');
	 $("#menu").addClass("sideleft-mob");
	 
           $("#menu-link").click(function(){
			  if($("#menu").hasClass("sideleft-mob")){
			   $("#menu").removeClass("sideleft-mob");
			    $('#menu').css('left', '0px');
			  }else{
			   $("#menu").addClass("sideleft-mob");
			    $('#menu').css('left', '-280px');
			  }
		   
			});
  }
		
});