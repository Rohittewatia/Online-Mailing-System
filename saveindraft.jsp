
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
try
{
	String to1=request.getParameter("to1");
	String subject=request.getParameter("subject");
	String message=request.getParameter("message");
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
	ps=con.prepareStatement("insert into mydraft(to1,subject,message) values( ?, ?,?)");
			ps.setString(1,to1);
			ps.setString(2,subject);
			ps.setString(3,message);
			ps.executeUpdate();
			%>
<table>
<font color="red" >save in draft successfully</font>
<tr><td colspan="2"><%@ include file="top.jsp" %></td></tr>
<tr><td><%@ include file="left.jsp" %></td>
<td><%@ include file="compose.jsp" %></td>
</tr>
</table>
<%
}
catch(Exception e)
{
	out.print(e);
}
%>