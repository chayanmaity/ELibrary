<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>E-Library|New Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/base.css"> 
   <link rel="stylesheet" href="css/vendor.css"> 
   <link rel="stylesheet" href="css/main.css">    
   <script src="js/modernizr.js"></script>
	<script src="js/pace.min.js"></script>
<link rel="icon" type="image/png" href="book-xxl.png">
</head>
<body id="top">
 <header class="main-header">
   	
   	<div class="logo">
	      <a href="login.jsp">E-Library</a>
	   </div> 
	   </header>
	  
	   <div id="main-content-wrap">
<section id="intro" style="background-image: url(images/wa13.jpg); background-attachment: fixed; background-repeat: no-repeat; background-position: center top;">

		   <!-- <div class="shadow-overlay"></div> -->
		   
		   <div class="row intro-content">
		   	<div class="col-twelve">

		   		<h3 ><font color="#4e5b5b">Hurray !!!</font></h3>
			  		
					<h1 >
						Set up your password.
					</h1>	
   </div>
   </div>
<form action=NewPasswordServlet  method="post">
<div class="row intro-content">
		   	<div class="col-twelve">
<% 
			String Message = (String) request.getAttribute("error9");
			
		if(Message!=null){
		
		%>
		&nbsp;&nbsp;<b><font color="red"><%=Message %></font> </b>

	
		<% } %>	
		<% 
			String Message2 = (String) request.getAttribute("error10");
			
		if(Message2!=null){
		
		%>
		&nbsp;&nbsp;<b><font color="red"><%=Message2 %></font> </b>

	
		<% } %>	
		</div>
		</div>	

<div align="center">
&nbsp;&nbsp;&nbsp;&nbsp;<b>Your Email-ID is </b>&nbsp;
<input type="text" name="e" value= ${email} required/><br>
<b>Enter new password</b> &nbsp;
<input type="password" name="nPassword" required/><br>
<b>Re-enter new password</b> &nbsp;
<input type="password" name="rPassword"/ required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
<div class="buttons">
&nbsp;&nbsp;
<button style="height:60px;" class="button stroke" type="submit" >confirm&nbsp;<i class="fa fa-save" style="font-size:24px"></i></button>
<br><br>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;
Remmebered your password ?&nbsp;<a href="./login.jsp">Go back to login Page</a>
</div>
</form>
</section>
</div>

<footer id="main-footer">

   	<div class="footer-social-wrap">  
   		<div class="row">
					
	         <ul class="footer-social-list">
	            <li><a href="https://www.facebook.com/">
	             	<i class="fa fa-facebook-square"></i>
	            </a></li>
	            <li><a href="https://www.twitter.com/">
	              	<i class="fa fa-twitter"></i>
	            </a></li>
              <li><a href="https://www.plus.google.com/">
	              	<i class="fa fa-google-plus"></i>
	            </a></li>
	            
	            <li><a href="https://www.instagram.com/">
	              	<i class="fa fa-instagram"></i>
	            </a></li>
	            <li><a href="https://www.youtube.com/">
	              	<i class="fa fa-youtube-play"></i>
	            </a></li>
	         </ul>
		         
			</div> 
   	</div> <!-- /footer-social-wrap -->

	   <div class="footer-info-wrap">

	   	<div class="row footer-info">

		  		<div class="col-four tab-full">
		  			<h4><i class="icon-location-map-1"></i> Where to Find Us</h4>

		  			<p>
		         Canal South Road<br>
		          Beliaghata, Kolkata<br>
		           West Bengal 700015
		         </p>
		  		</div>
		  		<div class="col-four tab-full">
	   			<h4></h4>

				   <ul class="footer-link-list">
				   	<li></li>
				   	<li></li>
				   	<li></li>
				   </ul>
	   		</div>

		   	<div class="col-four tab-full collapse">
	   			<h4><i class="icon-phone-incoming"></i> Get In Touch</h4>

	   			<p>project@e-librarywebsite.com<br>
				   projectinfo@e-librarywebsite.com <br>
				   Phone: (+91) 8902711301			     
				   </p>
	   		</div>

	   		
		   		
		  	</div>
	   </div> <!-- /footer-info-wrap -->
	   	
	   <div class="footer-bottom"> 

	   	<div class="copyright">
		     	<span>© Copyright e-library 2017.</span> 
		     	<span>Design by Subhadeep Bhowmick,Arijit Bagchi,Chayan Maity,Rounak Kar,Saikat Debnath.</span>	         	
		   </div>  		
   	</div>
	   	
   </footer>   

   <div id="go-top">
		<a class="smoothscroll" title="Back to Top" href="#top"><i class="fa fa-long-arrow-up"></i></a>
	</div>

   <!-- preloader
   ================================================== -->
   <div id="preloader"> 
    	<div id="loader"></div>
   </div> 

   <!-- Java Script
   ================================================== --> 
   <script src="js/jquery-2.1.3.min.js"></script>
   <script src="js/plugins.js"></script>
   <script src="js/main.js"></script>
</body>

</html>