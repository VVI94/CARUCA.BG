package bg.caruca.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import bg.caruca.dbmodels.DBManager;
 
@WebServlet("/AddNewCar")
public class AddNewCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public AddNewCar() {
        super();
    } 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager"); 
		String redirectTo = "/Caruca.bg/";
		
		if(request.getParameter("carName")!=null) {
			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 
				Connection c = (Connection) dbm.getConnection();
				c.createStatement()
				 .executeUpdate("INSERT INTO cars(name, price, category_id, brand_id, description, user_id) "
				 		+ "VALUES('"+request.getParameter("carName")+"', '"+request.getParameter("carPrice")+"',"
				 		+ " '"+request.getParameter("catId")+"', '"+request.getParameter("brandId")+"',"
				 		+ " '"+request.getParameter("carDescription")+"', '"+request.getSession().getAttribute("userId")
				 		+ "')" ); 
			}
			catch(Exception e)
			{
				System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			redirectTo = "/Caruca.bg/addNewCar.jsp";
		} 
		
		response.sendRedirect(redirectTo);
	}

}
