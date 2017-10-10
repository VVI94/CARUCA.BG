<%@ include file="header.jsp" %>
 
 <td style="width:60%;" align="center">
	<% 
	
if(request.getParameter("status")!=null){
	out.println("<h1>Great! Now You Can Login..</h1>");
}
else if(request.getParameter("listall")!=null){
	sb = new StringBuilder("<html><body>");

	try {
		if (!dbm.isConnected()) {
			if (!dbm.openConnection()) {
				sb.append("Could not connect to the database...");
			}
		}

		sb.append("<h1>All Users</h1><table cellpadding='10' style='width:50%'>"
				+ "<tr><td><b>Name</b></td><td><b>Phone</b></td><td><b>Delete</b></td></tr>");

		ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM users where role = 'default' ");
		while (rs.next()) {
			String name = rs.getString("name"); 
			String phone = rs.getString("phone"); 
			int id = rs.getInt("id"); 

			sb.append("<tr><td>" + name + "</td><td>" + phone + "</td>"
					+ "<td align='center'><a href='/Caruca.bg/addNewUser.jsp?delUser=" + id
					+ "'>X</a></td></tr>");
		}
		sb.append("</table>");
	} catch (Exception e) {
		sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
	}
	sb.append("</body></html>");

	out.println(sb);
}
	
else if(request.getParameter("delUser")!=null) {  
	try {
		if (!dbm.isConnected()) {
			if (!dbm.openConnection()) {
				System.out.println("Could not connect to the database...");
			}
		}
		Connection c = (Connection) dbm.getConnection();
		c.createStatement()
				.executeUpdate("DELETE FROM users WHERE id = '" + request.getParameter("delUser") + "'");
	} catch (Exception e) {
		System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
	}
	response.sendRedirect("/Caruca.bg/addNewUser.jsp?listall=true");
}
	
else{	
	%>
  <h1>Creating New User..</h1>
  <form action="/Caruca.bg/AddNewUser" method="post" > <br />
	<table>
		<tr><td>Name:</td><td> <input type="text" name="userName" /> </td></tr> 
		<tr><td>Password: </td><td><input type="text" name="userPassword" /> </td></tr> 
		<tr><td>Phone: </td><td><input type="text" name="userPhone" /> </td></tr> 
		<tr><td></td><td><input type="submit" value="Create User"></td></tr>
		</table>
	</form>
	<%
}				
%>		 		
 </td>
<jsp:include page="footer.jsp" />