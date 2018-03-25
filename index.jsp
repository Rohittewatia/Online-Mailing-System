<%@ page import="java.sql.*" %>
<%!
	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs;
    String email1=null,emailname,passname;
	String pass1=null;
%>	
<%   

    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
try{  
	  Cookie cookie[] =request.getCookies();
		if(cookie!=null)
		{
			for(int i=0;i<cookie.length;i++)
			{
				String name=cookie[i].getName()+"";
				if(name=="emr")
				{
                  email1=cookie[i].getValue()+"";
				out.println(name+" "+email1);
				}
				if(name=="pas")
				{
                 pass1=cookie[i].getValue()+"";
				out.println(name+" "+pass1);
				}
			}
		}
		if((email1!=null)&&pass1!=null)
		{
		 response.sendRedirect("validation.jsp?email="+email1+"&pass="+pass1);	
		}
		else{

		%>
				
<html>	
<head>

<link href="newcss.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<table border="0" width="948" height="452">
	<tr>
		<td height="50" width="938" colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td height="40" width="938" colspan="3">
		<p align="center"><b><font size="6">
		<span style="background-color: #0000FF">ONLINE MAILINNG SYSTEM</span></font></b><p align="center">&nbsp;</td>
	</tr>
	<tr>
		<td height="279" width="344">
		<img border="0" src="../projectjsp/download.jpg" width="201" height="251" align="right"></td>
		<td height="279" width="275" bgcolor="#00FFFF">
		<form method="POST" name="f1" action="validation.jsp">
			
			<p>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="email" size="20" value=" ">
            Password&nbsp;&nbsp; <input type="password" name="pass" size="20"> </p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			<input type="submit" value="Login" name="B1"></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="newuser.html"><span style="text-decoration: none">Signup</span></a></p>
		</form>
		<p>&nbsp;</td>
		<td height="279" width="313">&nbsp;</td>
	</tr>
	<tr>
		<td height="68" width="938" colspan="3">&nbsp;</td>
	</tr>
</table>     
</body>
</html>
<%
		}
}catch(Exception e)
{
	out.println(e);
}
		%>
