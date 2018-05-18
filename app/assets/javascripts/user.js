$(document).on("click", '.pagination a', function () {  
   	location.reload();
}); 
$(document).on("click", '.btn-link', function () {  
   	location.reload();
});
$(document).on("click", '.head_menu', function () {  
   	location.reload();
});
$(document).on("click", ".btn-submit", function () {  
	var pluginArrayArg = [];
	   $(".check_anw:checked").each(function(){
	   	var jsonArg = new Object();
			jsonArg.answer_id = ($(this).attr('data_anw'));
			jsonArg.question_id = ($(this).attr('data_question'));
			jsonArg.user_id = ($(this).attr('data_user'));
			jsonArg.choose_user = ($(this).attr('status'));
			pluginArrayArg.push(jsonArg);
		});
	var data = JSON.stringify(pluginArrayArg);
  $.ajax({
    url: '/pages/'+data+'/page/create',
    type: 'get',
    // contentType: 'application/json',
    success: function(data) {
    	// $('.body').html("<%= j (render 'resultEdit') %>");
   		// window.location.replace("<%= page_path(@r) %>");
   }
});
});
// $(document).ready(function() {
// $(".btn-pref .btn").click(function () {
//     $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
//     $(this).removeClass("btn-default").addClass("btn-primary");   
// });
// });
