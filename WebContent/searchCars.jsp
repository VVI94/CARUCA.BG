<%@ include file="header.jsp" %>
 
 <td style="width:60%;"> 		
	<%
 				sb = new StringBuilder("<html><body>");

 				try {
 					
 				if (!dbm.isConnected()) {
 					if (!dbm.openConnection()) {
 				sb.append("Could not connect to the database...");
 					}
 				}
 				
 					sb.append("<table>");
 					ResultSet rs = dbm.ExecuteResultSet(
 							"SELECT * FROM cars WHERE name rlike '" + request.getParameter("search") + "' limit 10");
 					if (rs.isBeforeFirst()) {
 						while (rs.next()) {
 							String name = rs.getString("name");
 							String photo = rs.getString("photo");
 							int price = rs.getInt("price");
 							int id = rs.getInt("id");
 							if (photo != null && photo.contains("/"))
 								photo = "<img src='" + photo.replace('/', '\\') + "' height='80' width='110' />";
 							else
 								photo = "<a href='/Caruca.bg/addNewCar.jsp?carId=" + id + "'>Add Picture</a>";

 							sb.append("<tr><td>" + photo + "</td>" + "<td style='padding-left:10px'>"
 									+ "<a href='/Caruca.bg/showCar.jsp?carId=" + id + "' style='text-decoration:none'>"
 									+ name + "</a></td>" + "<td style='padding-left:15px'><b>" + price
 									+ "</b> lv</td></tr>");
 						}
 					}
 					sb.append("</table>");
 				} catch (Exception e) {
 					sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
 				}
 				sb.append("</body></html>");

 				out.println(sb);
 			%>		 		
 </td>
<jsp:include page="footer.jsp" />