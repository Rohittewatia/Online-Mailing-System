<%@ page import="java.sql.*,java.util.Date"%>
<%!

	Connection con1;
	PreparedStatement ps1;
%>
<%
try
	{
		
            String[] ids=request.getParameterValues("C1");
		 	Class.forName("com.mysql.jdbc.Driver");
			con1=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
			 for(int i=0;i<ids.length;i++){
			 ps1=con1.prepareStatement("delete from messdetails where mesid=?");
			 ps1.setInt(1,Integer.parseInt(ids[i]));
			 ps1.executeUpdate();
			response.sendRedirect("inbox.jsp");
			 }
			%>
			
<%
	}
	catch(Exception e)
	{
		response.sendRedirect("inbox.jsp");
			
	}
	%>
	