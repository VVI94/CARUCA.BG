<%@ include file="header.jsp" %>
 
 <td style="width:40%;" > 
				
	<% 
	
	 
	
if(request.getParameter("carId")!=null){ 
		request.getSession(true).setAttribute("carId", request.getParameter("carId"));
		  %>
		<form action="/Caruca.bg/CarImgUploadServlet" method="post"
			enctype="multipart/form-data">
			Select Picture to Upload:<input type="file" name="fileName"> <br />
			<input type="submit" value="Upload">
		</form>
		 <%
} 
else if(request.getParameter("delCar")!=null) {  
	try {
		if (!dbm.isConnected()) {
			if (!dbm.openConnection()) {
				System.out.println("Could not connect to the database...");
			}
		}
		Connection c = (Connection) dbm.getConnection();
		c.createStatement()
				.executeUpdate("DELETE FROM cars WHERE id = '" + request.getParameter("delCar") + "'");
	} catch (Exception e) {
		System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
	}
	response.sendRedirect("/Caruca.bg/addNewCar.jsp");
}
else if(request.getParameter("anc")!=null){  
	%>
	<h1>Create New Caruca Offer..</h1>
	<form action="/Caruca.bg/AddNewCar" method="post" > <br />
	<table>
		<tr><td>Car Name:</td><td> <input type="text" name="carName" size="35"/> </td></tr> 
		<tr><td>Price: </td><td><input type="text" name="carPrice" /> </td></tr>
		<tr><td>Choose Category:</td><td><select name="catId">  <%
				try {
					if (!dbm.isConnected()) {
						if (!dbm.openConnection()) {
							out.println("Could not connect to the database...");
						}
					} 
					ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM categories");
					while (rs.next()) {
						String name = rs.getString("name"); 
						int id = rs.getInt("id"); 
						out.println("<option value='"+id+"'>"+name+"</option>");
					} 
				} catch (Exception e) {
					out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
				} 
		%>
		</select> </td></tr>
		<tr><td>Choose Brand:</td><td><select name="brandId">  <%
				try {
					if (!dbm.isConnected()) {
						if (!dbm.openConnection()) {
							out.println("Could not connect to the database...");
						}
					} 
					ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM brands");
					while (rs.next()) {
						String name = rs.getString("name"); 
						int id = rs.getInt("id"); 
						out.println("<option value='"+id+"'>"+name+"</option>");
					} 
				} catch (Exception e) {
					out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
				} 
		%>
		</select> </td></tr>
		<tr><td>Description:</td><td><textarea name="carDescription" rows="10" cols="40">  </textarea> </td></tr>
		<tr><td></td><td><input type="submit" value="Create Offer"></td></tr>
		</table>
	</form>
	<%
		}
		
	else {
		    sb = new StringBuilder("<html><body>");

			try {
		if (!dbm.isConnected()) {
			if (!dbm.openConnection()) {
				sb.append("Could not connect to the database...");
			}
		}

		sb.append("<h1>Your Caruca Offers..</h1><table>");

		String specialClause = " WHERE user_id = '"+request.getSession().getAttribute("userId")+"'";
		if(request.getSession().getAttribute("userRole").toString().contains("admin"))
			specialClause = "";
		
		ResultSet rs = dbm.ExecuteResultSet("SELECT * FROM cars "+specialClause);
				if (rs.isBeforeFirst()) {
					while (rs.next()) {
						String name = rs.getString("name");
						String photo = rs.getString("photo");
						int price = rs.getInt("price");
						int id = rs.getInt("id");
						if (photo != null && photo.contains("/"))
							photo = "<img src='" + photo.replace('/', '\\') + "' height='60' width='80' />";
						else
							photo = "<a href='/Caruca.bg/addNewCar.jsp?carId=" + id + "'>Add Picture</a>";

						sb.append("<tr><td>" + photo + "</td>" + "<td style='padding-left:10px'>"+
						         "<a href='/Caruca.bg/showCar.jsp?carId="+id+"' style='text-decoration:none'>" + name + "</a></td>"
								+ "<td style='padding-left:15px'>" + price + " lv</td>   "
								+ "<td align='center'  style='padding-left:20px'>"
								+ "<a style='text-decoration:none' href='/Caruca.bg/addNewCar.jsp?delCar=" + id
								+ "'>delete</a></td></tr>");
					}
				}
				sb.append("<tr><td><a href='/Caruca.bg/addNewCar.jsp?anc=true'>Create New Offer</a></td>"
						+ "<td></td><td></td><td></td></tr></table>");
			} catch (Exception e) {
				sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			sb.append("</body></html>");

			out.println(sb);
		}
	%>
	
</td>
<jsp:include page="footer.jsp" />	