<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Library|Book Cover Image Page</title>
</head>
<body>
<form>
	<div align="center" style="height: 300px;width: 500px;">

				<%							
							byte[] imgDat=(byte[])request.getAttribute("photo");

							//This method is returning the byte[] for an image..
					
							
/* 							response.setContentType("application/pdf");

							response.setHeader("Content-Type", "application/pdf");
						    response.setHeader("Content-Disposition",
						            "inline;filename=test.pdf");
						    
 */							
 							/* response.setContentType("image/jpeg");
 							OutputStream o = response.getOutputStream();
							o.write(imgDat); */
							 
							 
							 response.setContentType("application/pdf");
							 response.setHeader("Content-Disposition", "inline; filename=\"Test.pdf\"");
							// response.setHeader("Content-Disposition", "saveas; filename=\"Test.pdf\"");
							 response.getOutputStream().write(imgDat);
							 //response.getOutputStream().flush();
							
							%>
		
		</div>
</form>		

</body>
</html>