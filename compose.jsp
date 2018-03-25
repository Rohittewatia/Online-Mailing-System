<html>

<head>
<script language="javascript">

</script>
</head>

<body>
<FORM ENCTYPE="multipart/form-data" ACTION="upload.jsp" METHOD=POST>
<br><br><br>
<table border="0" bgcolor=#ccFDDEE>
<tr><center><td colspan="2" align="center"><B>UPLOAD THE FILE first Then Compose</B><center></td></tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td><td><INPUT NAME="file" TYPE="file"></td></tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
<table>
</center> 
</FORM>
<br>
<form method="POST" name="fm" id="dr" action="insertmess.jsp" ">


			<table border="0" width="543" height="264" bgcolor="#C0C0C0">
	
	<tr>
		<td height="18" width="533">To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="to1" size="33"></td>
	</tr>
	<tr>
		<td height="14" width="533">Subject&nbsp;
		<input type="text" name="subject" size="33"></td>
	</tr>
	<tr>
		<td height="153" width="533">
		<textarea rows="8" name="message" cols="63"></textarea></td>
	</tr>
	<tr>
		<td height="26" width="533">
		
			<input type="submit" value="send" name="B4">
		<input type="submit"  value="draft" onClick='this.form.action="saveindraft.jsp";' name="B5">

		<input type="reset" value="discard" name="B6">&nbsp;&nbsp;
		<input type="text" name="filevalue" value='<%=request.getAttribute("saveFile")%>' size="20">
			
	</tr>
</table>
		</form>
</body>

</html>