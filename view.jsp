
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
<html>
<body link="red">
<table border="2" width="441" cellpadding="2" bgcolor="#C0C0C0">

<%
try
{
	int id=Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
	ps=con.prepareStatement("select * from messdetails where mesid=? ");
	ps.setInt(1,id);
	rs=ps.executeQuery();
	while(rs.next())
	{
		if(rs.getString("filename").equals("null"))
		{
		%>
		<tr><td width="141">
		<tr><td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("from1")%></h3></p></td></tr>
		<tr><td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=request.getParameter("dat")%></h3></p></td></tr>
		<tr><td width="141"><h3>&nbsp;&nbsp;&nbsp; Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("subject")%><p>&nbsp;</td></h3></tr>
		<tr><td width="141"><p>&nbsp;&nbsp;&nbsp;&nbsp; <b>Message:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("message")%></h3></p></td></tr>
		<tr><td width="141"><p>&nbsp;&nbsp;&nbsp;&nbsp; <b>Attachment:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%="No Attachment"%></h3></p></td>
		</tr>
		
		<%
		}
		else
		{
           String hre="../newjsp/upload/"+rs.getString("filename");
		  
			%>
			<tr><td width="141">
		<tr><td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("from1")%></h3></p></td></tr>
		<tr><td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=request.getParameter("dat")%></h3></p></td></tr>
		<tr><td width="141"><h3>&nbsp;&nbsp;&nbsp; Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("subject")%><p>&nbsp;</td></h3></tr>
		<tr><td width="141"><p>&nbsp;&nbsp;&nbsp;&nbsp; <b>Message:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("message")%></h3></p></td></tr>
		<tr><td width="141"><p>&nbsp;&nbsp;&nbsp;&nbsp; <b>Attachment:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><a href="<%=hre%>" target="_blank"><%=rs.getString("filename")%></h3></p></a></td>
		</tr>
		<%
		}
	}
	ps1=con.prepareStatement("update messdetails set status=? where mesid=?");
	ps1.setString(1,"true");
	ps1.setInt(2,id);
	ps1.executeUpdate();
	con.close();
}catch(Exception e)
{
	out.print(e);
}
%>
</table>
</body>
</html>