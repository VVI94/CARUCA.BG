package bg.caruca.dbmodels;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLServerConnectionBehavior extends DBUserInfo implements ServerConnectionBehavior
{
	public MySQLServerConnectionBehavior()
	{
		super();
	}
	
	public MySQLServerConnectionBehavior(String uid, String pwd
			, String cat)
	{
		super(uid, pwd, cat);
	}

	@Override
	public Connection getConnection() {
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver").newInstance();
//			Connection cn = DriverManager.getConnection(getConnectionURL());
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/caruca?user=root&password=root&useSSL=false");
			
			return cn;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String getConnectionURL() {
//		return String.format("jdbc:mysql://localhost/%s"
//				+ "?user=%s&password=%s&useSSL=false"
//				, getCatalog()
//				, getUserID()
//				, getPassword());
		return String.format("jdbc:mysql://localhost/caruca?user=root&password=root&useSSL=false"
				, getCatalog()
				, getUserID()
				, getPassword());
	}

	@Override
	public String getConnectionDetails() {
		return "MySQL Database Connection to " 
					+ getCatalog();
	}

	@Override
	public String getTablesSchemaQuery() {
		return "select table_name from information_schema.tables "
					+ "where table_schema = " + getCatalog();
	}
}
