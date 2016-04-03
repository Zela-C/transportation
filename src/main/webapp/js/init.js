// Initialize collapse button
//  $(".button-collapse").sideNav();
// Initialize collapsible (uncomment the line below if you use the dropdown variation)
//  $('.collapsible').collapsible();
$('.button-collapse').sideNav({
	menuWidth : 200, // Default is 240
	edge : 'left', // Choose the horizontal origin
	closeOnClick : false
// Closes side-nav on <a> clicks, useful for Angular/Meteor
});
$(document).ready(function() {
	$('select').material_select();
});

$(document).ready(function() {
	$('.collapsible').collapsible({
		accordion : false
	// A setting that changes the collapsible behavior to expandable instead of the default accordion style
	});
});
$(document).ready(function() {
	// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
	$('.modal-trigger').leanModal();
});

$(document).ready(function(){
  $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset().top });
});
      