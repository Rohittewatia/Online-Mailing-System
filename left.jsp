<html>
<%@ page import="java.sql.*"%>
<%
	
  Connection con;
	PreparedStatement ps;
	ResultSet rs;
		String status1="false";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Compose</title>
</head>
<body>
<%		
  response.setContentType("text/html");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
			ps=con.prepareStatement("select * from messdetails where status=?");
			ps.setString(1,status1);
			rs=ps.executeQuery(); 
			int count = 0;
      while (rs.next()) {
        count++;
      }  
%>

<table border="0" width="115" height="325">
	<tr>
		<td height="10" width="115"><a href="compose1.jsp" style="text-decoration:none">Compose</a></td>
	</tr>
	<tr>
		<td height="19" width="115"><a href="inbox.jsp" style="text-decoration:none">Inbox(<%=count%>)
</a></td>
	</tr>
	<tr>
		<td height="19" width="115"><a href="sent1.jsp?pageid=1" style="text-decoration:none">Sent</a></td>
	</tr>
	<tr>
		<td height="19" width="115"><a href="draft1.jsp" style="text-decoration:none">Draft</a></td>
	</tr>
	<tr>
		<td height="19" width="115"><a href="contact1.jsp" style="text-decoration:none">Contact</a></td>
	</tr>
	
</table>

</body>

</html>