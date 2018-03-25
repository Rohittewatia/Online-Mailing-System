<form method="POST" action="--WEBBOT-SELF--">
	<!--webbot bot="SaveResults" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
<select name ="drpcategory">

<%@page import="java.sql.*"%>
<%

             response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  			  if(session.getAttribute("email")==null)
				{
					response.sendRedirect("index.jsp");
				}	
				
			 %>
 <%!

	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs;
%>
<%
Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
	ps=con.prepareStatement("select distinct to1 from messdetails ");
	rs=ps.executeQuery();
	String s="";
	int i=1;
	while(rs.next())
	{
		
		s=rs.getString("to1");
		%>
		<option value=""><%=s%></option>
		<%
		
	}
	
%>
</select>
</form>