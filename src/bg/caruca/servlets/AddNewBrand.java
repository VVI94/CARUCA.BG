package bg.caruca.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import bg.caruca.dbmodels.DBManager;
 
@WebServlet("/AddNewBrand")
public class AddNewBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public AddNewBrand() {
        super();
    }  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager"); 
		String redirectTo = "/Caruca.bg/";
		
		if(request.getParameter("brandName")!=null) {
			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 
				Connection c = (Connection) dbm.getConnection();
				c.createStatement().executeUpdate("INSERT INTO brands(name) VALUES('"+request.getParameter("brandName")+"')" ); 
			}
			catch(Exception e)
			{
				System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			redirectTo = "/Caruca.bg/addBrand.jsp";
		} 
		else if(request.getParameter("catName")!=null){
			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 
				Connection c = (Connection) dbm.getConnection();
				c.createStatement().executeUpdate("INSERT INTO categories(name) VALUES('"+request.getParameter("catName")+"')" ); 
			}
			catch(Exception e)
			{
				System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			redirectTo = "/Caruca.bg/addCategory.jsp";
		}
 
		response.sendRedirect(redirectTo);
	}

}
