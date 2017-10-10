 

//$(document).ready(function(){
//	$("#search-box").keyup(function(){
//		$.ajax({
//		type: "GET",
//		url: "/Caruca.bg/AutocompleteController", 
//		data: 'search='+$(this).val(), 
//		success: function(data){ 
//			$("#suggesstion-box").show();
//			$("#suggesstion-box").html(data).css("background","blue");
//			$("#search-box").css("background","#FFF"); 
//		},
//		error: function(){
//            alert("Errr..");
//       }
//		});
//	});
//});
//To select country name
function selectCountry(val) {
$("#search-box").val(val);
$("#suggesstion-box").hide();
}