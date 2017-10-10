package bg.caruca.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import bg.caruca.dbmodels.DBManager;
 
@WebServlet("/AddNewUser")
public class AddNewUser extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
    public AddNewUser() {
        super(); 
    } 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager"); 
		String redirectTo = "/Caruca.bg/addNewUser.jsp";
		
		if(request.getParameter("userName")!=null) {
			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 
				Connection c = (Connection) dbm.getConnection();
				c.createStatement()
				 .executeUpdate("INSERT INTO users(name, password, phone, role) "
				 		+ "VALUES('"+request.getParameter("userName")+"', MD5('"+request.getParameter("userPassword")+"'),"
				 		+ " '"+request.getParameter("userPhone")+"', 'default')" ); 
			}
			catch(Exception e)
			{
				System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			redirectTo = "/Caruca.bg/addNewUser.jsp?status=ok";
		} 
		
		response.sendRedirect(redirectTo);
	}

}
