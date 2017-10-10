<%@ include file="header.jsp" %>
 
 <td style="width:60%;" align="center">
  
				
	<% 




if(false){
	
}
else if(request.getParameter("ac")!=null){
	%>
	<h1>Create New Category</h1>
	<form action="/Caruca.bg/AddNewBrand" method="post" >
		Enter Category Name: <input type="text" name="catName"> 
		<input type="submit" value="Create Category">
	</form>
	<%
}
else if(request.getParameter("delCat")!=null) {  
	try {
		if (!dbm.isConnected()) {
			if (!dbm.openConnection()) {
				System.out.println("Could not connect to the database...");
			}
		}
		Connection c = (Connection) dbm.getConnection();
		c.createStatement()
				.executeUpdate("DELETE FROM categories WHERE id = '" + request.getParameter("delCat") + "'");
	} catch (Exception e) {
		System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
	}
	response.sendRedirect("/Caruca.bg/addCategory.jsp");
}
 
else {
		sb = new StringBuilder("<html><body>");

		try {
			if (!dbm.isConnected()) {
				if (!dbm.openConnection()) {
					sb.append("Could not connect to the database...");
				}
			}

			sb.append("<h1>All Categories</h1><table cellpadding='10' style='width:40%'>"
					+ "<tr><td><b>Name</b></td><td><b>Delete</b></td></tr>");

			ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM categories ");
			while (rs.next()) {
				String name = rs.getString("name"); 
				int id = rs.getInt("id"); 

				sb.append("<tr><td><span style='font-size:16pt'>" + name + "</span></td>" 
						+ "<td align='center'><a href='/Caruca.bg/addCategory.jsp?delCat=" + id
						+ "'>X</a></td></tr>");
			}
			sb.append(
					"<tr><td><a href='/Caruca.bg/addCategory.jsp?ac=true'>Add New Category</a></td><td></td></tr></table>");
		} catch (Exception e) {
			sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
		}
		sb.append("</body></html>");

		out.println(sb);
	}

 

%>			
				
				
 </td>
<jsp:include page="footer.jsp" />