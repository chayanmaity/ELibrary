<%@page import="java.util.Iterator"%>
<%@page import="com.elibrary.project.books.Books"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>E-Library|Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/base.css"> 
   <link rel="stylesheet" href="css/vendor.css"> 
   <link rel="stylesheet" href="css/main.css">    
   <script src="js/modernizr.js"></script>
	<script src="js/pace.min.js"></script>
	
<link rel="icon" type="image/png" href="book-xxl.png">
<script type="text/javascript">
function openImage(id){
	
	 
	var url = "./ImageServlet?&showimage=true&id="+id;
	
	window.open(url,200,200,false);
	
	
}
</script>
	
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
<section id="intro" style="background-image: url(images/wa5.jpg); background-attachment: fixed; background-repeat: no-repeat; background-position: center top;">

		   <!-- <div class="shadow-overlay"></div> -->
		   
		   <div class="row intro-content">
		   	<div class="col-twelve">

		   		<h3 >Find your favourite books over here.</h3>
			  		
					
   </div>
  </div>
     
	<%
			
				ArrayList<Books> booksList; 
			booksList= (ArrayList<Books>)request.getAttribute("BOOKS_LIST");
	
				Iterator<Books> iter = booksList.iterator();
				Iterator<Books> iter1 = booksList.iterator();
			
			%>
<form action=SearchBookServlet method="post">
<div style="display:inline-flex;">		    
		<input style="height:60px;"  type="text" name="search" placeholder="What are you looking for?" class="button stroke" size="45"/>
		<!--  <input type="search" placeholder="What are you looking for?">		    	
		<input  style="height:60px;"type="submit" name="search" value="Search" class="button stroke" />-->
		<button  style="height:60px;" type="submit">search&nbsp;<i class="fa fa-search" style="font-size:24px"></i></button>
	</div><br>
				
	</form>
<form action="">
<div align="right">
<marquee><font color="blue">${w1}</font></marquee>
</div>
<div align="center">
			 <table width="100%"> 
			<caption ><b><h1>Books Available</h1></b></caption>
			<thead> 
				<tr style="background-color:white;">
							<th  width="25%" > Title</th> 
							<th width="25%" align="center">Author</th>
							 <th width="25%" align="center">Category</th>
							<th width="25%" align="center">Publisher</th>
					</tr>
					<%
					int i=0;
					if(booksList.size()>0){
						while(iter.hasNext()){
							
								Books books = iter.next();
					if(i%2==0){
					%>		
						<tr  >
						
						<%} else { %>
						 <tr>
						<%} %>

						
						
								
							<td width="25%"><a href="./SearchBookServlet?id=<%=books.getId() %>"> 
									<%=books.getName() %></a></td> 
							 <td width="25%" align="center"><%=books.getAuthor() %></td>
							 <td width="25%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=books.getCategory() %></td>
							<td width="25%" align="center"><%=books.getPublisher() %></td>
							
						</tr>
						
					
				<%	i++;
						
						
						}
					}else{	
					
					%>
					
						<tr align="center"> <td align="center"><font style="font-size: large;a"> <b> No books found</b></font></td> </tr>
				
					<%
					}
					%>
				</thead>
			
			</table>

	</div><br>
	<div align="center">
 <table width="100%">
			<caption ><b><h1>Books On Demand</h1></b></caption>
				<thead>
					
<tr height="300"><%
					
					if(booksList.size()>0){
						while(iter1.hasNext()){
							
								Books book1 = iter1.next();
					%>
					
	<td><marquee><a href="javascipt:openImage(<%=book1.getId()%>);" onclick="openImage(<%=book1.getId() %>);" > 	
							<a href="./SearchBookServlet?id=<%=book1.getId() %>">
							 <img   src="./ImageServlet?showOnlyImage=true&id=<%=book1.getId() %>"
							 	 height="200" width="200" /> </marquee>
							 </a> </a></td>	<%}%></tr><%}else{%> <td align="center"><font style="font-size: large;a"> <b> No books found</b></font></td> </tr><%} %>		
</thead>
</table>
</div>
</form>
	</section>
	</div>
	<div>
</a></a></marquee>
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