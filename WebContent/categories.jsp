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

	sb.append("<table><tr>" );

	ResultSet rs = dbm.ExecuteResultSet(" SELECT * FROM categories ");
	while (rs.next()) {
		String name = rs.getString("name").toUpperCase();  
		int id = rs.getInt("id");
		sb.append("<td style='padding-left:15px'><a style='text-decoration:none' href='/Caruca.bg/showCategory.jsp?catId="+id+"'>" + name + "</a></td>");
	}
	sb.append(
			"</tr></table>");
} catch (Exception e) {
	sb.append("<h1>ERROR: " + e.getMessage() + "</h1>");
}
sb.append("</body></html><br />");

out.println(sb);

%>