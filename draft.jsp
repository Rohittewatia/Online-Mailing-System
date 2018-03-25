
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
<table border="2" width="441" cellpadding="2" bgcolor="#C0C0C0">
<!-- MSTableType="nolayout" -->
<tr><td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subject</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td width="141"><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Message</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
	ps=con.prepareStatement("select * from mydraft ");
	rs=ps.executeQuery();
	while(rs.next())
	{
		%>
		<tr onclick="window.location.href='viewdraft.jsp?id=<%=rs.getInt("mesid")%>'">
		<td><%=rs.getString("to1")%></td>
		<td><%=rs.getString("subject")%></td>
		<td><%=rs.getString("message")%></td>
		</tr>
		<%
	}
	con.close();
}catch(Exception e)
{
	out.print(e);
}
%>
</table>
