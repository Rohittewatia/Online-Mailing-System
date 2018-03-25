<%@ page import="java.sql.*" %>
<%
	String uname;
	uname = request.getParameter("email");
	try
	{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql:///gui","root","root");
		Statement stmt = con.createStatement();
		String sqlquery = "select email from record where email like'%"+uname+"%'";
		ResultSet rs = stmt.executeQuery(sqlquery);
		boolean valid=false;
		String str="";
		while(rs.next())
		{
				str=str+""+rs.getString(1)+"<br>";
				
	 	}
			out.println("<br>"+str+"<br>") ;
	}
	catch(Exception e)
	{
		out.println("Error : " + e);
	}
%>