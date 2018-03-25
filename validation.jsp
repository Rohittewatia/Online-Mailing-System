<%
   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
%>
<%@ page import="java.sql.*" %>
<%	response.setContentType("text/html");
	String email=request.getParameter("email");
	String pass=request.getParameter("pass"); 
       Cookie cookie =new Cookie("emr",email);
		cookie.setMaxAge(365*60);
		response.addCookie(cookie);
		Cookie cookie1 =new Cookie("pas",pass);
		cookie.setMaxAge(365*60);
		response.addCookie(cookie1);		
    String em="";	
	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs;
	boolean valid=false;
	try
	{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
			ps=con.prepareStatement("select email,pass from record");
			rs=ps.executeQuery();
			while(rs.next())
			{ 
		     String me=""+rs.getString("email");
				if(email.equals(rs.getString("email")) && pass.equals(rs.getString("pass")))
				{
					
					em=email;
					valid=true;
					break;
				}
			}
			if(valid)
			{
				ps1=con.prepareStatement("update record set flag=? where email=?");
	            ps1.setString(1,"true");
				ps1.setString(2,em);
				ps1.executeUpdate();
				session.setAttribute("email",email);
				response.sendRedirect("maininbox.jsp");
				
			%>
			
		<%	
			}
			else
			{
		%>		
		 	<jsp:include page="index1.jsp" />
			<div style="position:absolute;top:120px;left:400px"><html><font color=red><b>email or password entered wrong</b></font></html></div>
		
		<%	
		
			}
		}
		catch(Exception e)
		{
			out.print(e);
		}
	%>	
		