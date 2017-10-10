<% 
	if(session.getAttribute("userName")==null){
		
		String userName = "";  
		String pwd = "";
		Cookie[] MyCookies = request.getCookies();
		if (MyCookies != null)
		{
			for (Cookie c : MyCookies)
			{
				if (c.getName().equalsIgnoreCase("userName"))
				{
					userName = c.getValue();
				}
				else if (c.getName().equalsIgnoreCase("pwd"))
				{
					pwd = c.getValue();
				}
			}
		}
		
%>

<form id="form1" name="frmLogin"
		action="/Caruca.bg/userLogin" method="post">
		<table>
			<tr>
				<td>
					<span>Username:</span>
				</td>
				<td> <%
				out.println("<input type='text' name='userName' size='13' value='"+userName+"' />");
					%>
				</td>
			</tr>
			<tr>
				<td>
					<span>Password:</span>
				</td>
				<td><% 
					out.println("<input type='password' name='pwd' size = '14' value='"+pwd+"'/>");
				%>
				</td>
			</tr>
			<tr>
				<td><a style='text-decoration:none' href="/Caruca.bg/addNewUser.jsp" >New User</a></td>
				<td><input type="checkbox" name="remember" value="true" > 
				Remember me 
				<td colspan="2" align="right">
					<input name="loginbutton" 
						type="submit" value="Log In" />
				</td>
			</tr>
		</table>
	</form>

<% } 
   else{ 
	      out.println("Welcome back "+session.getAttribute("userName").toString().toUpperCase()+" / <b><i>"+ 
	                   session.getAttribute("userRole") + "</i></b>"); 
	      %>
	      <br /><b>Create: </b> 
	      <%
if(request.getSession().getAttribute("userRole").toString().contains("admin")){
	out.println("<a style='text-decoration:none' href='/Caruca.bg/addCategory.jsp' >Category</a> /");
	out.println("<a style='text-decoration:none' href='/Caruca.bg/addBrand.jsp' >Brand</a> /");
}
%>
 
<a style='text-decoration:none' href="/Caruca.bg/addNewCar.jsp" >Car Offer</a>
<%
if(!request.getSession().getAttribute("userRole").toString().contains("admin")) 
	out.println("/<a style='text-decoration:none' href='/Caruca.bg/userBookmarks.jsp' > My Bookmarks</a>");

if(request.getSession().getAttribute("userRole").toString().contains("admin"))
	out.println("/<a style='text-decoration:none' href='/Caruca.bg/addNewUser.jsp?listall=true' > Users</a>");
%>
<form action="/Caruca.bg/userLogin" method="post">
	<table>
		<td><input type="checkbox" name="forgetme" value="true">
			Forget me
		<td colspan="2" align="right"><input name="logoutbutton"
			type="submit" value="Log Out" /></td>
		</tr>
	</table>
</form>


<%
	}
%>