package bg.caruca.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bg.caruca.dbhelpers.DBCarucaQueries;
import bg.caruca.dbmodels.DBManager;

/**
 * Servlet implementation class userLogin
 */
@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirectTo = "";
		
		//////////////////////////////////// LOGOUT ACTION
		if(request.getParameter("logoutbutton") != null) {
			
			if(request.getParameter("forgetme") != null) {
				Cookie[] MyCookies = request.getCookies();
				
				if (MyCookies != null && MyCookies.length > 0)
					for (Cookie c : MyCookies)
						if (c.getName().toLowerCase().contains("username") || 
								  c.getName().toLowerCase().contains("pwd")) { 
							c.setMaxAge(0);
							response.addCookie(c);
						}
			}
			
			request.getSession().invalidate();
			redirectTo = "/Caruca.bg";
		}
		
		///////////////////////////////////  LOGIN ACTION
		if(request.getParameter("userName")!=null && request.getParameter("pwd")!=null) {
			String userName = request.getParameter("userName");
			String pwd = request.getParameter("pwd");
			String role = "";
			int userId = 0;
			


			DBManager dbm = (DBManager)getServletContext().getAttribute("CarucaDBManager");

			try
			{
				if (!dbm.isConnected()) {
					if (!dbm.openConnection())  {
						System.out.println("Could not connect to the database...");
					}
				} 

				ResultSet rs = dbm.ExecuteResultSet( DBCarucaQueries.checkIfUserExists(userName, pwd) );
				
				if(rs.isBeforeFirst()) {
					rs.next();
					role = rs.getString("role");
					userId = rs.getInt("id");
				}
			}
			catch(Exception e)
			{
				System.out.println("<h1>ERROR: " + e.getMessage() + "</h1>");
			}
			
			
			
			
			if(role.length()>0) {
				boolean remember = false;
				if (request.getParameter("remember") != null) {
					String rememberMe = request.getParameter("remember");

					if (rememberMe.equalsIgnoreCase("true")) {
						remember = true;

						int cookieLife = 3600*24*7; 

						Cookie uidCook = new Cookie("userName",userName);
						uidCook.setMaxAge(cookieLife);  
						response.addCookie(uidCook);

						Cookie pwdCook = new Cookie("pwd",pwd);
						uidCook.setMaxAge(cookieLife);  
						response.addCookie(pwdCook);
					}
				} 

				HttpSession s = request.getSession();
				s.setAttribute("userName", userName);
				s.setAttribute("userRole", role); 
				s.setAttribute("userId", userId); 
			}
			redirectTo = "/Caruca.bg";
		}
		
		response.sendRedirect(redirectTo);
	}

}
