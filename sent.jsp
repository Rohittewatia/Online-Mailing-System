
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
<script>
function find(a){
var e=document.getElementById("se");
var text=e.options[e.selectedIndex].text;
window.location.href='viewmsg1.jsp?val='+text;
}
var counter=1;

</script>

<body">

<form method="POST" ">
	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select onclick="find(this.value)"id="se" size="5" name="D1">
  <option value="3">3</option>
  <option value="6">6</option>
  <option value="8">8</option>
  <option value="10">10</option>
  </select> </p>

<table border="2" width="441" cellpadding="2" bgcolor="#C0C0C0">
<tr >
        
		<td height="51" width="97" bgcolor="#6699FF"><font color="#008080">&nbsp;&nbsp;&nbsp; </font>
		<font color="#FF0000">To</font></td>
		<td height="51" width="140" bgcolor="#6699FF"><font color="#0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<font color="#FF0000">&nbsp;&nbsp;Subject</font></td>
		<td height="51" width="357" bgcolor="#6699FF"><font color="#0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<font color="#FF0000">message</font></td>
		<td height="51" width="160" bgcolor="#6699FF"><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date</font><font color="#0000FF"> </font></td>   
	</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
	String cn=request.getParameter("pageid"); 
	int pageid=Integer.parseInt(cn);
		if(pageid==1)	  
		{
			
			ps=con.prepareStatement("select * from senddetails limit "+2);  
			rs=ps.executeQuery();
		}
		else {
			   int total=2;   
			  pageid=pageid-1;  
		     pageid=pageid*total+1; 
			ps=con.prepareStatement("select * from senddetails   limit "+pageid+","+2);
			rs=ps.executeQuery();			 
			}
	while(rs.next())
	{
		%>
		<tr bgcolor="blue" >
		
		<td height="52" width="129"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs.getString("to1")%></font></td>
		<td height="52" width="129"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs.getString("subject")%></font></td>
		<td height="52" width="357"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <pre><%=rs.getString("message")%></pre></font></td>
		<td height="52" width="160"><font color="#800000"><%=rs.getString("date")%></font></td>
	</tr>
	<%
	}
		}
	catch(Exception e)
	{
		out.print(e);
	}
%>
</table>
<input type ="button" name="previous" disabled="on" id="pre" value="previous" onclick="funcprevious(this.value)"/>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="next" id="nex" onclick="funcnext(this.value)" value="next"/>
<a href="sent1.jsp?pageid=1">1</a>&nbsp;&nbsp;<a href="sent1.jsp?pageid=2">2</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="sent1.jsp?pageid=3">3</a>
</form>
