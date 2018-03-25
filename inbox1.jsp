<%@ page import="java.sql.*,java.util.Date"%>
<%!

	Connection con,con1;
	PreparedStatement ps,ps1;
	ResultSet rs;
%>
<script>
function electAll(source){
				var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = source.checked;
	
    }
}
</script>

<form>
<input type="checkbox" name="c2" onclick="electAll(this);"><b>Select All</b>
<table border="1" width="771" height="111" bgcolor="#800000" bordercolorlight="#808080" style="border-collapse: collapse">
	<tr style='background-color:red'>
		<td height="51" width="97" bgcolor="#6699FF"><font color="#008080">&nbsp;&nbsp;&nbsp; </font>
		<font color="#FF0000">Sender</font></td>
		<td height="51" width="129" bgcolor="#6699FF"><font color="#0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<font color="#FF0000">Subject</font></td>
		<td height="51" width="357" bgcolor="#6699FF"><font color="#0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<font color="#FF0000">message</font></td>
		<td height="51" width="160" bgcolor="#6699FF"><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date</font><font color="#0000FF"> </font></td>
		<td height="51" width="160" bgcolor="#6699FF"><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attachment</font><font color="#0000FF"> </font></td>

	</tr>
	
<%
try
	{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
			ps=con.prepareStatement("select * from messdetails order by mesid DESC");
			rs=ps.executeQuery();
			Date d = new Date();
			String str=d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900);	
			int cyr=d.getYear()+1900;
			int cmnth=d.getMonth()+1;
			int cday=d.getDate();
			String dt="";
			while(rs.next())
			{
			    
				String m=rs.getString("message");
				String de=rs.getString("date").substring(5,14);
				int yr=Integer.parseInt(de.substring(5,9));
				int dday=Integer.parseInt(de.substring(0,2));
					if(cmnth>=(Integer.parseInt(de.substring(3,4))))
					{
						
						if(cday>=dday)
						{
							switch(cday-dday)
							{
								case 0:dt="today";break;
								case 1:dt="yesterday";break;
								case 2:dt="2 says ago";break;
								case 3:dt="three days ago";break;
								case 4:dt="four days ago";break;
								case 5:dt="5 days ago";break;
								default:dt="weeks ago";break;
							}
						}
					
					}
					else
					{
						dt="a time ago";
					}
		
				String s=m.substring(0,4);
				if(m.length()<=4)
				{
					s=m;
				}
				else
				{
					s=s+".....";
				}
				String att=rs.getString("filename");
				String srce;
				if((att).equals("null")){
				   srce="../newjsp/noattach.png";
				}
				else
				{
					srce="../newjsp/picattach.png";
				}
				if(rs.getString("status").equals("false"))
				{
			%>
				<tr bgcolor="yellow" onclick="window.location.href='view1.jsp?id=<%=rs.getInt("mesid")%>&dat=<%=dt%>'" >
				
		   <td height="52" width="97" ><font color="#800000">&nbsp;&nbsp;</font>
			<p><input type="checkbox" value='<%=rs.getInt("mesid")%>' name="C1" ></p>
			<p><font color="#800000">&nbsp; <%=rs.getString("from1")%></font></td>
		<td height="52" width="129"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs.getString("subject")%></font></td>
		<td height="52" width="357"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s%></pre></font></td>
		<td height="52" width="160"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<%=dt%></font></td>
		<td height="52" width="160"><img border="0" src="<%=srce%>" width="200" height="60">
</td>
	</tr>
	
	<%		
				}
				else
				{
					%>
					<tr bgcolor="wheat" onclick="window.location.href='view1.jsp?id=<%=rs.getInt("mesid")%>&dat=<%=dt%>'" >
				
		   <td  height="52" width="97" ><input type="checkbox" name="C1" value='<%=rs.getInt("mesid")%>' ><font color="#800000">&nbsp;&nbsp;&nbsp; <%=rs.getString("from1")%></font></td>
		<td height="52" width="129"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=rs.getString("subject")%></font></td>
		<td height="52" width="357"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s%></pre></font></td>
		<td height="52" width="160"><font color="#800000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<%=dt%></font></td><td height="52" width="160"><img border="0" src="<%=srce%>"  width="200" height="60">
		</tr>
					<%
				}
				
			}
	}
		catch(Exception e)
		{
			out.print(e);
		}
	%>
	</table><br>
	<input type="submit" value ="delete" onClick='this.form.action="delete.jsp";' name="b1" />
	</form>
