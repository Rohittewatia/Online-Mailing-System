<%

             response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  			  if(session.getAttribute("email")==null)
				{
					response.sendRedirect("index.jsp");
				}	
				
			 %>
<table>
<tr><td colspan="2"><%@ include file="top.jsp" %></td></tr>
<tr><td><%@ include file="left.jsp" %></td>
<td><%@ include file="inbox1.jsp" %></td>
</tr>
</table>