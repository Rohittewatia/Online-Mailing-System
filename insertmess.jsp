<%@ page import="java.sql.*,java.util.Date "%>
 

<%!
	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs;
	int cnt=0;
%>	
<%	
   response.setContentType("text/html");
try
	{
	boolean flag=false;
	String from1=(String)session.getAttribute("email");
	String to1=request.getParameter("to1");
	String subject=request.getParameter("subject");
	String message=request.getParameter("message");
	String filename=request.getParameter("filevalue");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///gui","root","root");
			ps=con.prepareStatement("select * from record");
			rs=ps.executeQuery();
			while(rs.next())
			{
				if(to1.equals(rs.getString("email")))
				{
					flag=true;
					break;
				}
			}
	
	Date d = new Date();
	String str="";
	int i = d.getDay();
	switch(i)
	{
		case 1: str="Mon";
		break;
		case 2: str="Tue";
		break;
		case 3: str="Wed";
		break;
		case 4: str="Thu";
		break;
		case 5: str="Fri";
		break;		
		case 6: str="Sat";
		break;
		case 7: str="Sun";
	}
	str=str+", "+d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900)+","+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();	
	
	
		if(flag==true&&subject.length()!=0){
			ps=con.prepareStatement("insert into messdetails(from1,to1,subject,message,date,status,filename) values(?, ?, ?, ?, ?,?,?)");
			ps.setString(1,from1);
			ps.setString(2,to1);
			ps.setString(3,subject);
			ps.setString(4,message);
			ps.setString(5,str);
			ps.setString(6,"false");
			ps.setString(7,filename);
			ps.executeUpdate();
			ps=con.prepareStatement("insert into senddetails(from1,to1,subject,message,date,status,filename) values(?, ?, ?, ?, ?,?,?)");
			ps.setString(1,from1);
			ps.setString(2,to1);
			ps.setString(3,subject);
			ps.setString(4,message);
			ps.setString(5,str);
			ps.setString(6,"false");
			ps.setString(7,filename);
			ps.executeUpdate();
			con.close();
			%>			
			<div style="position:absolute;top:180px;left:650px"><html><font color=blue><b>message successfully sent to <%= to1 %></b></font></html></div>
			<jsp:include page="maininbox.jsp" />
		<%	
			}
			else
			{
				%>
				<table>
				<font color=red>plz fill valid sender </font>
               <tr><td colspan="2"><%@ include file="top.jsp" %></td></tr>
              <tr><td><%@ include file="left.jsp" %></td>
                <td><%@ include file="compose.jsp" %></td>
             </tr>
                 </table>
			
		<%	
			}
		}
		catch(Exception e)
		{
			out.print(e);
		}
	%>	
		