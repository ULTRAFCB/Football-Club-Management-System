/*
	Custom checkbox and radio button - Jun 18, 2013
	(c) 2013 @ElmahdiMahmoud 
	license: http://www.opensource.org/licenses/mit-license.php
*/   

$('input[name="check-box"]').wrap('<div class="check-box"><i></i></div>');
$.fn.toggleCheckbox = function () {
	alert(3);
    this.attr('checked', !this.attr('checked'));
}
$('.check-box').on('click', function () {
	alert(4);
    $(this).find(':checkbox').toggleCheckbox();
    $(this).toggleClass('checkedBox');
});