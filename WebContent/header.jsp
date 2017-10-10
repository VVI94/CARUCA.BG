<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="bg.caruca.dbhelpers.*
    		, bg.caruca.dbmodels.*
    		, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery-2.1.1.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.easing.1.3.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.skitter.min.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/public/custom.js'></script> 
<script type='text/javascript' src='${pageContext.request.contextPath}/public/styles.css'></script> 



<link href='${pageContext.request.contextPath}/dist/skitter.css' type="text/css" media="all" rel="stylesheet" />
   
  <script type="text/javascript" language="javascript">
    $(document).ready(function() {
     
    });
  </script> 
  
<script type="text/javascript"> 

$(document).ready(function(){ 
	
	 $('.skitter-large').skitter({ 
	 		interval:1100,
	 		theme:'clean',
	 		label:false,
	 		dots:true
	      });
	
	$("#search-box").keyup(function(){
		$.ajax({
		type: "GET",
		url: "/Caruca.bg/AutocompleteController", 
		data: 'search='+$(this).val(), 
		success: function(data){ 
		  if(data.length!=794){   // alert(data.length);
			  $("#suggesstion-box").show();
			  $("#suggesstion-box").html(data);
			  $("#search-box").css("background","#f1f1f1"); 
		  }
		  else{
		  	  $("#search-box").css("background","#FFF");
		  	  $("#suggesstion-box").hide();
		  }
		},
		error: function(){
            alert("Errr..");
       }
		});
	});
});

 
</script>
<title>Caruca.bg</title>

</head>
<body>
<table style="width:100%;height:100%;">
<tr>
	<td>
 		<h1><a href="/Caruca.bg" style="text-decoration:none">CARUCA.BG</a></h1>
 		</td>
 	<td>
 		<%@ include file="searchField.jsp" %>
 	</td>
 	<td>
 		<%@ include file="login.jsp" %>
 	</td>
 </tr>
 </table>
 <table style="width:100%;">
 	<tr><td><%@ include file="categories.jsp" %></td></tr>
 </table>
 <table style="width:100%;height:100%;">
		<tr>
			<td style="width:20%;" valign="top">
				<%   // Brands /////
				 sb = new StringBuilder("<html><body>");
				 
				try {
					if (!dbm.isConnected()) {
						if (!dbm.openConnection()) {
							sb.append("Could not connect to the database...");
						}
					}

					sb.append("<table>" );

					ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM brands ");
					while (rs.next()) {
						String name = rs.getString("name");
						String photo = rs.getString("photo");
						int id = rs.getInt("id");
						if (photo != null && photo.contains("/"))
							photo = "<img src='" + photo.replace('/', '\\') + "' height='35' width='50' />";
						else
							photo = "No Picture";

						sb.append("<tr><td>" + photo + "</td>" + "<td style='padding-left:8px'><a style='text-decoration:none' href='/Caruca.bg/showBrand.jsp?brandId="+id+"'>" + name + "</a></td></tr>");
					}
					sb.append(
							" </table>");
				} catch (Exception e) {
					sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
				}
				sb.append("</body></html>");

				out.println(sb);
				 
				 %>
			</td>