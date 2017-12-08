<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
<title>Home</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Deliccio Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
 
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link href='https://fonts.googleapis.com/css?family=UnifrakturMaguntia' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:600,600italic,700,400' rel='stylesheet' type='text/css'>
<!-- FlexSlider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
						$(window).load(function(){
						  $('.flexslider').flexslider({
							animation: "slide",
							start: function(slider){
							  $('body').removeClass('loading');
							}
						  });
						});
					  </script>
<!-- //FlexSlider -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
	
<body>
<!-- banner -->
	<div class="banner">
		<div class="container">
			<div class="header-nav">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
						<div class="logo">
							<a class="navbar-brand" href="index.jsp">Macrosoft <span>Creative and Useful</span></a>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					 <ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="services.html">Services</a></li>
						
						<li><a href="contact.html">Contact Us</a></li>
					  </ul>
					</div><!-- /.navbar-collapse -->
				</nav>
			</div>
			<div class="banner-info">
				<div class="col-md-6 banner-info-left">
					<h1>A creative Literature-reading-notes-manager-master produced by Macrosoft, ready to boost your business with some beautifull templates.</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
						quis nostrud exercitation ullamco.</p>
					<ul>
						<li><a href="https://www.baidu.com/" class="twitter"></a></li>
						<li><a href="https://www.baidu.com/" class="g"></a></li>
						<li><a href="https://www.baidu.com/" class="v"></a></li>
						<li><a href="https://www.baidu.com/" class="dribble"></a></li>
					</ul>
					<div class="more">
						<a href="services.html">Learn More</a>
					</div>
				</div>
				<div class="col-md-6 banner-info-right">
					<div class="sap_tabs">	
						<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
							<ul class="resp-tabs-list">
							  <li class="resp-tab-item grid1" aria-controls="tab_item-0" role="tab"><span>Sign In</span></li>
							  <li class="resp-tab-item grid2" aria-controls="tab_item-1" role="tab"><span>Sign Up</span></li>
							  <div class="clear"></div>
							</ul>				  	 
							<div class="resp-tabs-container">
								<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class="facts">
										<div class="sign-in-form">
											<div class="in-form">
												<form method="post" action="login.action">
													<s:textfield name="username"  placeholder="Username"/>
													<s:password name="password" placeholder="Password"/>
												
												<div class="ckeck-bg">
													<div class="checkbox-form">
														<div class="check-left">
															
															<div class="check">
																<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Remember my Password</label>
															</div>
														</div>
														<div class="check-right">
															<form>
																<input type="submit" name="commit" value="Login">
																	</form>
															</form>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
															<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class="facts">
										<div class="sign-in-form">
											<div class="in-form">
												<form method="post" action="regist.action">
													<s:textfield name="username"  placeholder="Username"/>
													<s:password name="password" placeholder="Password"/>
												
												<div class="ckeck-bg">
													<div class="checkbox-form">
												
														<div class="check-right">
															<form>
																<input type="submit" name="commit" value="regist">
																	</form>
															</form>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
							</div>
						</div>
					</div>
						<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
							<script type="text/javascript">
								$(document).ready(function () {
									$('#horizontalTab').easyResponsiveTabs({
										type: 'default', //Types: default, vertical, accordion           
										width: 'auto', //auto or any width like 600px
										fit: true   // 100% fit in a container
									});
								});
							</script>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //banner -->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >2075</a></div>
<!-- welcome -->
	<div class="welcome">
		<div class="container">
			<h3>Welcome !</h3>
			<div class="line">
			</div>
			<p class="proident">A creative Literature-reading-notes-manager-master produced by Macrosoft, ready to boost your business with some beautifull templates. Literature-reading-notes-manager-master is one of the best in town see more you will be amazed.</p>
			<div class="welcome-info">
		
		
				<div class="clearfix"> </div>
			</div>
			<h2><i>For More suppose</i>Contact Us : <span>+86 15504661150</span></h2>
		
		</div>
	</div>
<!-- //welcome -->
<!-- about -->
	<div class="welcome-bottom">
		<div class="container">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="welcome-bottom-info">
								<h3>Produced by HXX</h3>
							</div>
						</li>
						<li>
							<div class="welcome-bottom-info">
								<h3>Produced by SZC</h3>
							</div>
						</li>
						<li>
							<div class="welcome-bottom-info">
								<h3>Produced by GKG</h3>
							</div>
						</li>
					</ul>
				</div>
			</section>
		</div>
	</div>
<!-- //about -->
<!--footer-->
<div class="footer">
		<div class="container">
			<div class="footer-row">
				<div class="col-md-3 footer-grids">
					<h4><a href="index.jsp">Macrosoft</a></h4>
					<p><a href="mailto:info@example.com">545071061@qq.com</a></p>
					<p>+86 15504661150</p>
				</div>
				<div class="col-md-3 footer-grids">
					<h3>Navigation</h3>					
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="#">Services</a></li>
		
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				
				<div class="col-md-3 footer-grids">	
					<h3>Version</h3>
					<p>Version2017. <p>
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">		
			<p>Copyright &copy; 2017.Company name All rights reserved.More Templates <a href="http://www.2075.com/" target="_blank" title="macrosoft">macrosoft</a> - Collect from <a href="http://www.2075.com/" title="网页模板" target="_blank">macrosoft</a></p>					
		</div>
	</div>
<!--//footer-->	
<!-- for bootstrap working -->
		<script src="js/bootstrap.js"> </script>
<!-- //for bootstrap working -->
</body>
</html>