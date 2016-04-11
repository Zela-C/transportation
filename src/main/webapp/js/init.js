// Initialize collapse buttonindex.jsp
//$(document).ready(function() {
//$('.button-collapse').sideNav({
//	menuWidth : 200, // Default is 240
//	edge : 'left', // Choose the horizontal origin
//	closeOnClick : false// Closes side-nav on <a> clicks, useful for Angular/Meteor
//})});
$(document).ready(function() {
	$(".button-collapse").sideNav({
		menuWidth : 200,
		closeOnClick : true
	});
	
	$('select').material_select();
	
	$('.collapsible').collapsible({
		accordion : false
	// A setting that changes the collapsible behavior to expandable instead of the default accordion style
	});

	// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	$('.modal-trigger').leanModal();

  $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset().top });
});
      