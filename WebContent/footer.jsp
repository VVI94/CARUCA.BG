<td style="width:20%;"> 
<%@ page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="bg.caruca.dbhelpers.*
    		, bg.caruca.dbmodels.*
    		, java.sql.*"%>
<%

DBManager dbm = (DBManager) application.getAttribute("CarucaDBManager");
StringBuilder sb = new StringBuilder("<html><body>");
 
try {
	if (!dbm.isConnected()) {
		if (!dbm.openConnection()) {
			sb.append("Could not connect to the database...");
		}
	}

	sb.append("<div style='position:absolute;top:115px;right:10px;'><h2>Most Popular</h2><table>" );

	ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM cars order by id desc limit 1,5");
	while (rs.next()) {
		String name = rs.getString("name");
		String photo = rs.getString("photo");
		int price = rs.getInt("price");
		int id = rs.getInt("id");
		if (photo != null && photo.contains("/"))
			photo = "<img src='" + photo.replace('/', '\\') + "' height='55' width='70' />";
		else
			photo = "No Picture";

//		sb.append("<tr><td>" + photo + "</td>" + "<td style='padding-left:10px'>"+
//		         "<a href='/Caruca.bg/showCar.jsp?carId="+id+"' style='text-decoration:none'><b><span style='font-size:8pt'>" + name + "</span></a></b><br>"
//				+ "<b>" + price + "</b> lv</td></tr>" );
		sb.append("<tr><td>" + 
				"<a href='/Caruca.bg/showCar.jsp?carId="+id+"' style='text-decoration:none'><b><span style='font-size:8pt'>" + 
		                                                          name + "</span></a></b></td></tr>"
		          + "<tr>" + "<td align='center'>"+  photo + "<b style='margin-left:10px'>" + price + "</b> lv<br></td></tr>" );
	}
	sb.append(
			" </table></div>");
} catch (Exception e) {
	sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
}
sb.append("</body></html><br />");

out.println(sb);

%>
</td>
</tr>
	</table><table><tr><td><div style='height:80px;'></div></td></tr></table>
<span style="position:relative; left:40%">Copyright &copy;2017 
<a href="http://www.ittalents.bg" style='text-decoration:none'>Peter & Vasilena</a></span>

</body>
</html>