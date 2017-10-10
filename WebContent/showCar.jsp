<%@ include file="header.jsp" %>
 
 <td style="width:40%" > 
				
	<%
 						String uid = "peter";
 							String pwd = "root";
 						
 						
 							 sb = new StringBuilder("<html><body>");
 						
 						try
 						{
 							if (!dbm.isConnected()) {
 								if (!dbm.openConnection())  {
 									sb.append("Could not connect to the database...");
 								}
 							}
 							String name = "";
 							String description = "";
 							String photo = "";
 							int price=  0, user_id = 0;
 							String userName = "";
 							String userPhone = "";
 							
 							 
 							ResultSet rs = dbm.ExecuteResultSet( "SELECT * FROM cars WHERE id='"+request.getParameter("carId")+"'" );
 							if(!rs.isBeforeFirst())sb.append( "<H1>No Such Car!</H1>" );
 							while (rs.next())
 							{ 
 								name = rs.getString("name");  
 								photo =  rs.getString("photo").replace('/', '\\');
 								description = rs.getString("description");
 								user_id = rs.getInt("user_id");
 								price = rs.getInt("price");
 							}
 							rs = dbm.ExecuteResultSet( "SELECT name, phone FROM users WHERE id='"+user_id+"'" );
 							rs.first();
 							userName = rs.getString("name");
 							userPhone = rs.getString("phone");
 							
 							sb.append("<h2>" + name + "</h2>");
 							sb.append("<table>");
 							sb.append("<tr><td valign='top'><img src='" + photo + "' height='250' width='360' /></td>");
 							sb.append("<td valign='top' style='padding-left: 10px;'><div style='width:170px;'></div><b>Price: </b>"+price+" lv<br><br>");
 							sb.append("<b>Added By:</b> &nbsp;&nbsp;<b>"+userName+"</b><br /><span style='margin-left:80px'>"+userPhone+"</span><br><br>");
 							sb.append("<b>Description: </b><br>");
 							sb.append("<p style='margin-left:22px;font-size:12pt'><i>"+description.replace("\n", "<br>")+"</i></p>");
 							sb.append("</td></tr>");
 							
 							if( request.getSession().getAttribute("userName") != null){
 							   rs = dbm.ExecuteResultSet( "SELECT * FROM bookmarks WHERE user_id='"+request.getSession().getAttribute("userId")+"' AND car_id='"+request.getParameter("carId")+"'" );
 							
 							   if(!rs.isBeforeFirst() && !request.getSession().getAttribute("userRole").toString().contains("admin")) 
 							     sb.append("<tr><td align='center'><a href='/Caruca.bg/Bookmarker?carId="+request.getParameter("carId")+"&userId="+request.getSession().getAttribute("userId")+"' style='text-decoration:none'>Bookmark This Offer</a></td><td></td></tr>");
 							}
 						   
 							sb.append("</table>");
 							
 						} catch (Exception e) {
 							sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
 						}
 						sb.append("</body></html>");
 						out.print(sb.toString());
 					%>
				
 </td>
<jsp:include page="footer.jsp" />