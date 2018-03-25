
<%@ page import="java.sql.*" %>
<%!
	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs;
%>	
<%
 
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
	if(session.getAttribute("email")==null)
				{
					response.sendRedirect("index.jsp");
				}	
				Cookie cookies[]=request.getCookies();
				{
					if(cookies!=null)
					{
						for(Cookie cookie : cookies)
						{
							cookie.setValue("");
							cookie.setPath("/");
							cookie.setMaxAge(0);
							response.addCookie(cookie);
						}
					}
				}
				
%>	

<head>
<script type="text/javascript">
function back_block() {
window.history.foward(-1)
}
</script>
</head>
<body önload="javascript:back_block();">
<%
   request.getSession(false);
	session.invalidate();
	response.sendRedirect("index.jsp");
%>	