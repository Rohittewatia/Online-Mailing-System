

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
	int id=Integer.parseInt(request.getParameter("id"));
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
	ps=con.prepareStatement("select * from mydraft where mesid=? ");
	ps.setInt(1,id);
	rs=ps.executeQuery();
	while(rs.next())
	{
		%>
		<html>
		<body>
		<form method="POST" name="fm" id="dr" action="insertmess.jsp">


			<table border="0" width="543" height="264" bgcolor="#C0C0C0">
	
	<tr>
		<td height="18" width="533">To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="to1" value="<%=rs.getString("to1")%>" size="33"></td>
	</tr>
	<tr>
		<td height="14" width="533">Subject&nbsp;
		<input type="text" name="subject" value="<%=rs.getString("subject")%>" size="33"></td>
	</tr>
	<tr>
		<td height="153" width="533">
		<textarea rows="8" name="message"  cols="63"><%=rs.getString("message")%></textarea></td>
	</tr>
	<tr>
		<td height="26" width="533">
		
			<input type="submit" value="send" name="B4">
		<input type="submit"  value="draft" onClick='this.form.action="saveindraft.jsp";' name="B5">

		<input type="reset" value="discard" name="B6"></td>
	</tr>
</table>
		</form>
</body>

</html>
		
		<%
		
	}
	con.close();
}catch(Exception e)
{
	out.print(e);
}
%>
