package bg.caruca.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bg.caruca.dbmodels.DBManager;
 
@WebServlet("/AutocompleteController")
public class AutocompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public AutocompleteController() {
        super(); 
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("application/json");
		
		DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager"); 
		StringBuilder sb = new StringBuilder();
		String pattern = request.getParameter("search");
		
		 
			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 
				 
				ResultSet rs = dbm.ExecuteResultSet("SELECT * FROM cars WHERE name rlike '"+pattern+"' limit 10");
				sb.append("<table width='100%'>");
							while (rs.next()) {
								String name = rs.getString("name");
								String photo = rs.getString("photo");
								int price = rs.getInt("price");
								int id = rs.getInt("id");
								if (photo != null && photo.contains("/"))
									photo = "<img src='" + photo.replace('/', '\\') + "' height='80' width='110' />";
								else
									photo = "<a href='/Caruca.bg/addNewCar.jsp?carId=" + id + "'>Add Picture</a>";

//								sb.append("<div onmouseover=\"this.style.background='#e6e6e6';\" onmouseout=\"this.style.background='#f1f1f1';\" style='width:400px;'>" 
//										+ photo +
//										"<div style='margin-top:40px;margin-left:150px;'><a href='/Caruca.bg/showCar.jsp?carId="+id+"' style='text-decoration:none'>" + name + "</a>"
//										+ "<b>" + price + "</b> lv</div></div>" );
								sb.append("<tr onmouseover=\"this.style.background='#e6e6e6';\" onmouseout=\"this.style.background='#f1f1f1';\"><td>" 
								          + photo + "</td>" + "<td style='padding-left:10px'>"+
								         "<a href='/Caruca.bg/showCar.jsp?carId="+id+"' style='text-decoration:none'>" + name + "</a></td>"
										+ "<td style='padding-left:15px'><b>" + price + "</b> lv</td></tr>" );
							}
							sb.append("</table>");
			}
			catch(Exception e)
			{
				//System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
	 
		
		
		
		
		
		
//		sb.append("<div onmouseover=\"this.style.background='gray';\" onmouseout=\"this.style.background='white';\" style='width:280px; cursor:pointer;'>first value: "+request.getParameter("search")+"</div></a><div onmouseover=\"this.style.background='gray';\" onmouseout=\"this.style.background='white';\" style='width:280px'>second value</div>");
		response.getWriter().println( sb.toString() );
	} 

}
