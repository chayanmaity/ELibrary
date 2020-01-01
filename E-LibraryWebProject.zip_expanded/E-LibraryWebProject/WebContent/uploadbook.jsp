<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>E-Library|Upload Book</title>
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
	      <a href="./SearchBookServlet">E-Library</a>
	   </div> 
	   <a class="menu-toggle" href="#"><span>Menu</span></a>
	   </header>
	    <nav id="menu-nav-wrap">

   	<h3>Menu</h3>   	
		<ul class="nav-list">
			<li><a class="" href="./SearchBookServlet" title=""><i class="fa fa-home"></i>&nbsp;Home</a></li> 
			<li><a class="" href="uploadbook.jsp" title=""><i class="fa fa-plus"></i>&nbsp;Upload Book</a></li>
			<li><a class="" href="./SearchBookServlet" title=""><i class="fa fa-angle-right"></i>&nbsp;Any Books</a></li>
			<li><a class="" href="./SearchBookServlet?type=Story" title=""><i class="fa fa-angle-right"></i>&nbsp;Story Books</a></li>
			<li><a class="" href="./SearchBookServlet?type=Article" title=""><i class="fa fa-angle-right"></i>&nbsp;Article</a></li>					
			<li><a class="" href="./SearchBookServlet?type=Java" title=""><i class="fa fa-angle-right"></i>&nbsp;Java</a></li>	
			<li><a class="" href="./SearchBookServlet?type=Journals" title=""><i class="fa fa-angle-right"></i>&nbsp;Journals</a></li>	
			<li><a class="" href="./SearchBookServlet?type=Comics" title=""><i class="fa fa-angle-right"></i>&nbsp;Comics</a></li>
			<li><a class="" href="./SearchBookServlet?type=Novels" title=""><i class="fa fa-angle-right"></i>&nbsp;Novels</a></li>	
			<li><a class="" href="./SearchBookServlet?type=Computer Science" title=""><i class="fa fa-angle-right"></i>&nbsp;Computer Science</a></li>
			<li><a class="" href="about.jsp" title=""><i class="fa fa-stack-exchange"></i>&nbsp;About Us</a></li>
			<li><a class="" href="login.jsp" title=""><i class="fa fa-sign-out"></i>&nbsp;Log Out</a></li>			
		</ul>

		<h3>We Recommend e-library</h3>  
		<p class="sponsor-text">
			Looking for an awesome and trending book ? Try e-library.
			You can submit your feedback and help us improve our service. Thanks for visiting e-library.
			<!-- Simply type	the promocode in the box labeled “Promo Code” when placing your order. -->
		</p>

		<div class="action">
			<a class="button" href="feedback.jsp">Feedback&nbsp;<i class="fa fa-comment-o"></i></a>
		</div>

	</nav>
	   <div id="main-content-wrap">
<section id="intro" style="background-image: url(images/wa8.jpg); background-attachment: fixed; background-repeat: no-repeat; background-position: center top;">

		   <!-- <div class="shadow-overlay"></div> -->
		   
		   <div class="row intro-content">
		   	<div class="col-twelve">

		   		<h3 >Don't worry!!!</h3>
			  		
					<h1 >
						We value your writing skills.
					</h1>	
</div>
   </div>   
   
<form action="./UploadBookServlet" method="post" enctype="multipart/form-data" >
<div class="row intro-content">
		   	<div class="col-twelve">		
		<% 
			String displayMessage1 = (String) request.getAttribute("message5");
			
		if(displayMessage1!=null){
		
		%>
		&nbsp;&nbsp;<b><font color="red"><%=displayMessage1 %></font> </b>

	
		<% } %>	
</div>
		</div>
		<div align="center">
				<!-- <table align="center" border="0" >-->
					
					<!--  <tr>-->
					<!-- <td> --><b>Book Title</b><br><!-- </td> -->
						<!-- <td> --> <input type="text" name="title" required /><br> <!-- </td> -->
					<!--  </tr>-->	
					<!--  <tr>-->
						<!-- <td> --><b>Author</b><br><!-- </td> -->
						<!-- <td> --><input type="text" name="author"  required/><br><!-- </td> -->
					<!--  </tr>-->		
					<!--  <tr>-->
						<!-- <td> --><b>Genre</b><br><!-- </td> -->
						<!-- <td> --> <select name="genre" required>
								<option value="0">Select</option>
								<option value="Story">Story</option>
								<option value="Article">Article </option>
								<option value="Java">Java</option>
								<option value="Journals">Journals</option>
								<option value="Comics">Comics</option> 
						<option value="Novels">Novels</option> 
						<option value="Computer Science">Computer Science</option> 
							</select><br>
						<!-- </td> -->
					<!--  </tr>-->	
					<!--  <tr>-->
						<!-- <td> --><b>Publisher Name</b><br><!-- </td> -->
						<!-- <td> --><input type="text" name="publisher" required/><br><!-- </td> -->
					<!--  </tr>-->					
					<!--  <tr>-->
						<!-- <td> --><b>Brief Description</b><br><!-- </td> -->
						<!-- <td> --><textarea name="description" required></textarea><br><!-- </td> -->
					<!--  </tr>-->	
					<!--  <tr>-->
						<!-- <td> --><b>Photo</b><br><!-- </td> -->
						<!-- <td> --><input type="file" name="file" required></input><br><!-- </td> -->
					<!--  </tr>-->
					<!--  <tr>-->
						<!-- <td> --><b>Upload PDF</b><br><!-- </td> -->
						<!-- <td> --><input type="file" name="bookfile" required></input><br> <br><!-- </td> -->
					<!--  </tr>-->						
					<!--  <tr>-->
						<!-- <td colspan="2" align="center"> -->
						<button class="button stroke" style="height:60px;" type="submit">upload book&nbsp;<i class="fa fa-upload" style="font-size:24px"></i></button><br><br>
						
							
						<!-- </td> -->
					<!--  </tr>-->						
						
				<!-- </table> -->
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