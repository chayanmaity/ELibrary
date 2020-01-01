<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/menu.css"  />

</head>
<body>

<div style="background-color: black;vertical-align: middle; " align="center" >
			<div style="width: 70%">
			<h1 ><img src=S2.png width="40" height="40"/>&nbsp;&nbsp;<font color="white"> E-Library&copy;-<i>Read Books from your Home</i></font></h1>
			</div>
	
	</div>
 <div class="dropdown">
  <button class="dropbtn">Browse</button>
  <div class="dropdown-content">
    <a href="./SearchBookServlet">Any Books</a>
    <a href="./SearchBookServlet?type=Story" >Story Books</a>
    <a href="./SearchBookServlet?type=Article">Articles</a>
    <a href="./SearchBookServlet?type=Java">Java Books</a>
    <a href="./SearchBookServlet?type=Journals">Journals</a>
    <a href="./SearchBookServlet?type=Comics">Comics</a>
    <a href="./SearchBookServlet?type=Novels">Novels</a>
    <a href="./SearchBookServlet?type=Computer Science">Computer Science</a>
  </div>
</div>
<div class="dropdown">
  <button class="dropbtn">Add Book</button>
  <div class="dropdown-content">
    <a href="./uploadbook.jsp">Upload Book</a>
   
  </div>
</div>
<div class="dropdown">
<button class="dropbtn">Contact US</button>
<div class="dropdown-content">
<a href="./contact.jsp">Contact Us</a>
</div>
</div>
<div class="dropdown">
<button class="dropbtn">About US</button>
<div class="dropdown-content">
<a href="./about.jsp">About Us</a>
</div>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="L1.gif" height="70" width="70"/>&nbsp;&nbsp;&nbsp;&nbsp;
<div class="dropdown">
<button class="dropbtn">Log Out</button>
<div class="dropdown-content">
<a href="./login.jsp">Log Out</a>
</div>
</div>
<br>


<br>
</body>
</html>