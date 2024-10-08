
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	  <!-- Google Font: Source Sans Pro -->
 <!--===============================================================================================-->
			<link rel="icon" type="image/png" href="images/icons/favicon.png" />
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
			<!--===============================================================================================-->
    </head>
    <body>
    <header>
		
		<!-- Header desktop -->
			<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25">
							Help & FAQs
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							My Account
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							EN
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							USD
						</a>
						  <div class="header_account">
						 <ul>
						 
						 <c:if test="${sessionScope.account==null}">
													
															<li><a href="login">Login In</a></li>
															  
															<li><a href="register">Sign Up</a></li>
														</ul>
													</li>
												</c:if>
												<c:if test="${sessionScope.account!=null}">
													
												</c:if></div>
					</div>
				</div>
			</div>
			

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="#" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
				<!-- 	<div class="menu-desktop">
						<ul class="main-menu ">
							<li class="active-menu">
								<a href="index.html">Home<i
															class="fa fa-angle-down"></i></a>
								<ul class="sub-menu">
									<li><a href="index.html">Homepage 1</a></li>
									<li><a href="home-02.html">Homepage 2</a></li>
									<li><a href="home-03.html">Homepage 3</a></li>
								</ul>
							</li>

							<li>
								<a href="product.html">Shop</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="shoping-cart.html">Features</a>
							</li>

							<li>
								<a href="blog.html">Blog</a>
							</li>

							<li>
								<a href="about.html">About</a>
							</li>

							<li>
								<a href="contact.html">Contact</a>
							</li>
						</ul>
					</div>	 -->
<div class="main_header header_transparent header-mobile-m">
					<div class="header_container sticky-header">
						<div class="container-fluid">
							<div class="row align-items-center">
								

								<div class="col-lg-6">
									<!-- main-menu starts -->
									<div class="main_menu menu_two menu_position">
										<nav>
											<ul>
												<li class="mega_items"><a href="#">Collections <i
															class="fa fa-angle-down"></i></a>
													<div class="mega_menu">
														<ul class="mega_menu_inner">
															<li style="color: black; font-size: 16px"><a
																	href="refine?cid_refine=${0}">ALL</a></li>
															<c:forEach items="${requestScope.category}" var="c">
																<li style="color: black; font-size: 16px"><a
																		href="refine?cid_refine=${c.id}">${c.name}</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</li>
												<li><a href="aboutus">About Us</a></li>
												<li><a href="contact">Contact Us</a></li>
												
											</ul>
										</nav>
									</div>
									<!-- main menu ends -->
								</div>
								
							</div>

						</div>
					</div>
				</div>
					</div>	
					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>
		</header>
    </body>
</html>
