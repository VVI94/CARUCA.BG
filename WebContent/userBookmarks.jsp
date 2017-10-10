<%@page import="java.util.ArrayList"%>
<%@ include file="header.jsp" %>
 
 <td style="width:50%;"> 		
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
	else if(request.getParameter("delB")!=null) {  
		try {
			if (!dbm.isConnected()) {
				if (!dbm.openConnection()) {
					System.out.println("Could not connect to the database...");
				}
			}
			Connection c = (Connection) dbm.getConnection();
			c.createStatement()
					.executeUpdate("DELETE FROM bookmarks WHERE car_id ='"+request.getParameter("carId") + 
					                                    "' AND user_id='"+request.getSession().getAttribute("userId")+"'");
		} catch (Exception e) {
			System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
		}
		response.sendRedirect("/Caruca.bg/userBookmarks.jsp");
	}
	 
	else {
			sb = new StringBuilder("<html><body>");

			try {
				if (!dbm.isConnected()) {
					if (!dbm.openConnection()) {
						sb.append("Could not connect to the database...");
					}
				}

				sb.append("<h1>Bookmarked By "+request.getSession().getAttribute("userName").toString().toUpperCase()+
						   " Caruci</h1> <table cellpadding='10' style='width:80%'>");

				ResultSet rs = dbm.ExecuteResultSet(" SELECT car_id FROM bookmarks WHERE user_id = '"+request.getSession().getAttribute("userId")+"'");
				ArrayList<Integer> cars = new ArrayList<>();
				while (rs.next()) 
					cars.add( rs.getInt("car_id") ); 

				for(Integer i : cars){
				   rs = dbm.ExecuteResultSet(" SELECT * FROM cars WHERE id = '"+i+"'");
				   while(rs.next()){
					    String name = rs.getString("name");
						String photo = rs.getString("photo");
						int price = rs.getInt("price");
						int id = rs.getInt("id");
						if (photo != null && photo.contains("/"))
							photo = "<img src='" + photo.replace('/', '\\') + "' height='100' width='140' />";
						else
							photo = "<a href='/Caruca.bg/addNewCar.jsp?carId=" + id + "'>Add Picture</a>";

						sb.append("<tr><td>" + photo + "</td>" + "<td style='padding-left:10px'>"+
						         "<a href='/Caruca.bg/showCar.jsp?carId="+id+"' style='text-decoration:none'>" + name + "</a></td>"
								+ "<td style='padding-left:15px'>" + price + " lv</td>   "
								+ "<td align='center'  style='padding-left:20px'>"
								+ "<a style='text-decoration:none' href='/Caruca.bg/userBookmarks.jsp?delB=true&carId=" + id
								+ "'>delete</a></td></tr>");
				   }
				}
				
				 
				sb.append("</table>");
			} catch (Exception e) {
				sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			sb.append("</body></html>");

			out.println(sb);
		}
			
%>		 		
 </td>
<jsp:include page="footer.jsp" />