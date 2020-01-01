<!DOCTYPE html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>E-Library|Feedback</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/base.css"> 
   <link rel="stylesheet" href="css/vendor.css"> 
   <link rel="stylesheet" href="css/main.css">    
   <script src="js/modernizr.js"></script>
	<script src="js/pace.min.js"></script>
  	<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css"> 

<style>

@import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);

div.stars {
  width: 270px;
  display: inline-block;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
#dialogoverlay{
	display: none;
	opacity: .8;
	position: fixed;
	top: 0px;
	left: 0px;
	background: #FFF;
	width: 100%;
	z-index: 10;
}
#dialogbox{
	display: none;
	position: fixed;
	background: #000;
	border-radius:7px; 
	width:550px;
	z-index: 10;
}
#dialogbox > div{ background:#FFF; margin:8px; }
#dialogbox > div > #dialogboxhead{ background: #001835; font-size:19px; padding:10px; color:#CCC; }
#dialogbox > div > #dialogboxbody{ background:#0e0e0e; padding:20px; color:#FFF; }
#dialogbox > div > #dialogboxfoot{ background: #001835; padding:5px; text-align:right; }
</style>
<script type="text/javascript">
function CustomAlert(){
    this.render = function(){
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var dialogoverlay = document.getElementById('dialogoverlay');
        var dialogbox = document.getElementById('dialogbox');
        dialogoverlay.style.display = "block";
        dialogoverlay.style.height = winH+"px";
        dialogbox.style.left = (winW/2) - (550 * .5)+"px";
        dialogbox.style.top = "100px";
        dialogbox.style.display = "block";
        document.getElementById('dialogboxhead').innerHTML = "Are you sure you want to submit this feedback ?";
        document.getElementById('dialogboxbody').innerHTML = '"'+document.getElementById('ad').value+'"';
        document.getElementById('dialogboxfoot').innerHTML = '<div style="display:inline-flex;"><form action="SearchBookServlet" method="post"><button type="submit" style="width:200px;">OK</button></form><button onclick="Alert.ok()" style="width:200px;">Cancel</button></div>';
    }
	this.ok = function(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
	}
}
var Alert = new CustomAlert();
function validation(){
	swal({
		  title: "Are you sure you want to submit this feedback ?",
		  text: '"'+document.getElementById('ad').value+'"',
		  type: "info",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  showLoaderOnConfirm: true,
		},
		function(){
		  setTimeout(function(){
		    swal("You have successfully submitted your feedback.");
		  }, 2000);
		});
}
</script>
<link href="http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="book-xxl.png">
</head>

<body id="top">
 <header class="main-header">
   	
   	<div class="logo">
	      <a href="./SearchBookServlet">E-Library</a>
	   </div> 
	   </header>
	   	   <div id="main-content-wrap">
<section id="intro" style="background-image: url(images/wa7.jpg); background-attachment: fixed; background-repeat: no-repeat; background-position: center top;">

		   <!-- <div class="shadow-overlay"></div> -->
		   
		   <div class="row intro-content">
		   	<div class="col-twelve">

		   		<h3 ><font color="#1cddd7">Tell us</font></h3>
			  		
					<h1 >
						How can we improve
					</h1>	
   
   <!-- <form action=./SearchBookServlet  method="post" onsubmit="validate();">-->
  
		   	<h3 ><font color="#1cddd7">Express your views about our website below.</font></h3>
		   	</div>
   </div> 
		   		<div align="center" >
		   	<input type="text" id="ad" name="view" style="width:600px; height:100px;"/>
		   

  
  <div class="stars">
    <form>
      <input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
      <label class="star star-5" for="star-5"></label>
      <input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
      <label class="star star-4" for="star-4"></label>
      <input class="star star-3" id="star-3" type="radio" name="star" value="3"/>
      <label class="star star-3" for="star-3"></label>
      <input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
      <label class="star star-2" for="star-2"></label>
      <input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
      <label class="star star-1" for="star-1"></label>
    </form>
  </div>
  <p><h3>Rate us on a scale of 5.</h3></p>

<!--<input type="submit" class="button stroke" name="feedback" value="submit your feedback" style="width:300px;"/>--> 

	<div id="dialogoverlay"></div>
<div id="dialogbox">
  <div>
    <div id="dialogboxhead"></div>
    <div id="dialogboxbody"></div>
    <div id="dialogboxfoot"></div>
  </div>
</div>
<h1></h1>
<button onclick="validation()" class="button stroke" style="width:300px;">submit your feedback&nbsp;<i class="fa fa-pencil-square-o" style="font-size:24px;"></i></button>
<form action="SearchBookServlet" method="post">
<button type="submit" class="button stroke" style="width:300px;">skip&nbsp;<i class="fa fa-forward" style="font-size:18px;"></i></button>
</form>
</div>

<!-- </form>-->
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