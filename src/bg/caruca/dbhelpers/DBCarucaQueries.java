package bg.caruca.dbhelpers;

public class DBCarucaQueries {
	public static String getAllCars()
	{
		return "select * from cars " ;
	}
	
	public static String getCountriesByName()
	{
		return "select Code, Name, Population "
				+ "from country " 
			    + "order by Name";
	}

	public static String checkIfUserExists(String user, String pwd) {
		return "select role, id "
				+ "from users where name='"+user+"' and password=MD5('"+pwd+"')" ;
	}
}
