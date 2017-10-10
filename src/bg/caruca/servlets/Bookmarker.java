package bg.caruca.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import bg.caruca.dbmodels.DBManager;
 
@WebServlet("/Bookmarker")
public class Bookmarker extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public Bookmarker() {
        super(); 
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager"); 
		String redirectTo = "/Caruca.bg/";
		
		if(request.getParameter("carId")!=null && request.getParameter("userId")!=null) {
			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 
				Connection c = (Connection) dbm.getConnection();
				c.createStatement()
				 .executeUpdate("INSERT INTO bookmarks(car_id, user_id) "
				 		+ "VALUES('"+request.getParameter("carId")+"', '"+request.getParameter("userId")+"')" ); 
			}
			catch(Exception e)
			{
				System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			redirectTo = "/Caruca.bg/showCar.jsp?carId="+request.getParameter("carId");
		} 
		
		response.sendRedirect(redirectTo);
	} 

}
