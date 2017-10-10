<%@ include file="header.jsp" %>
 
 <td style="width:60%;" align="center">
  

<% if(request.getParameter("brandId")!=null){ 
	request.getSession(true).setAttribute("brandId", request.getParameter("brandId"));
	  %>
	<form action="/Caruca.bg/BrandImgUploadServlet" method="post"
		enctype="multipart/form-data">
		Select Picture to Upload:<input type="file" name="fileName"> <br />
		<input type="submit" value="Upload">
	</form>
	 <%
  }
else if(request.getParameter("ab")!=null){
	%>
	<h1>Wohooo...</h1>
	<form action="/Caruca.bg/AddNewBrand" method="post" >
		Enter Brand Name: <input type="text" name="brandName">  
		<input type="submit" value="Create Brand">
	</form>
	<%
		}
 
else if(request.getParameter("delBrand")!=null) {  
		//DBManager dbm = (DBManager) application.getAttribute("CarucaDBManager");
		try {
			if (!dbm.isConnected()) {
				if (!dbm.openConnection()) {
					System.out.println("Could not connect to the database...");
				}
			}
			Connection c = (Connection) dbm.getConnection();
			c.createStatement()
					.executeUpdate("DELETE FROM brands WHERE id = '" + request.getParameter("delBrand") + "'");
		} catch (Exception e) {
			System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
		}
		response.sendRedirect("/Caruca.bg/addBrand.jsp");
}

else {
			//DBManager dbm = (DBManager) application.getAttribute("CarucaDBManager");
			  sb = new StringBuilder("<html><body>");

			try {
				if (!dbm.isConnected()) {
					if (!dbm.openConnection()) {
						sb.append("Could not connect to the database...");
					}
				}

				sb.append("<h1>Create New Brand</h1><table style='width:70%'>"
						+ "<tr><td><b>Name</b></td><td><b>Photo</b></td><td><b>Delete</b></td></tr>");

				//	String query = DBCarucaQueries.getAllBrands(); 
				ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM brands ");
				while (rs.next()) {
					String name = rs.getString("name");
					String photo = rs.getString("photo");
					int id = rs.getInt("id");
					if (photo != null && photo.contains("/"))
						photo = "<img src='" + photo.replace('/', '\\') + "' height='50' width='80' />";
					else
						photo = "<a href='/Caruca.bg/addBrand.jsp?brandId=" + id + "'>Add Picture</a>";

					sb.append("<tr><td>" + name + "</td>" + "<td>" + photo + "</td>"
							+ "<td align='center'><a href='/Caruca.bg/addBrand.jsp?delBrand=" + id
							+ "'>X</a></td></tr>");
				}
				sb.append(
						"<tr><td><a href='/Caruca.bg/addBrand.jsp?ab=true'>Add New Brand</a></td><td></td><td></td></tr></table>");
			} catch (Exception e) {
				sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			sb.append("</body></html>");

			out.println(sb);
		}
	%>
  
  
   
  
   </td>
<jsp:include page="footer.jsp" />