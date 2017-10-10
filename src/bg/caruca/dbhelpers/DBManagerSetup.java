package bg.caruca.dbhelpers;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import bg.caruca.dbmodels.DBManager;
import bg.caruca.dbmodels.MySQLServerConnectionBehavior;
import bg.caruca.dbmodels.ServerConnectionBehavior;

public class DBManagerSetup implements ServletContextListener
{
	private DBManager dbm = null;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if (dbm != null) {
			if (dbm.isConnected()) {
				dbm.closeConnection(false);
			}
		}
		dbm = null;
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		String uid = sc.getInitParameter("dbuserid");
		String pwd = sc.getInitParameter("dbuserpwd");
		String cat = sc.getInitParameter("dbinitcat");
		
		ServerConnectionBehavior scb = new MySQLServerConnectionBehavior(uid, pwd, cat);
		
		dbm = new DBManager(scb); 
		sc.setAttribute("CarucaDBManager", dbm);
	}
}
