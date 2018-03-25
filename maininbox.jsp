<%

             response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  			  if(session.getAttribute("email")==null)
				{
					response.sendRedirect("index.jsp");
				}	
				
			 %>
<table>
<tr><td valign ="top" colspan="2"><%@ include file="top.jsp" %></td></tr>
<tr><td><%@ include file="left.jsp" %></td>
<td valign="top"><%@ include file="compose.jsp" %></td>
</tr>
</table>