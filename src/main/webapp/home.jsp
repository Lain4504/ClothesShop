<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page contentType="text/html" pageEncoding="UTF-8" %>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Man Fashion Store</title>
			<link rel="icon" href="images/logo1.png" />
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
			<link rel="stylesheet" href="css/style.css">
			<link rel="stylesheet" href="https://cdn.tailwindcss.com/3.3.2" />
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" />
			<style>
				.responsiveFacets_sectionItemLabel:hover {
					cursor: pointer;
					background-color: rgba(28, 29, 24, 0.2);
				}

				.responsiveFacets_sectionItem:hover {
					cursor: pointer;
				}
			</style>
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
				<div class="main_header header_transparent header-mobile-m">
					<div class="header_container sticky-header">
						<div class="container-fluid">
							<div class="row align-items-center">
								<div class="col-lg-2">
									<div class="logo">
										<a href="home"><img src="images/icons/logo-01.png"  alt=""></a>
									</div>
								</div>

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
								<div class="col-lg-4">
									<%@ include file="header_right.jsp" %>
								</div>
							</div>

						</div>
					</div>
				</div>
			</header>


			<!-- slider section starts  -->
			<jsp:include page="/components/slider.jsp" />

			<!-- product area starts -->

			<div class="product_area product_area_two mb-65">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="section_title">
								<h2 class=text-shadow " style=" font-size: 20px;">
									<span class="ani-fire">New Products 2023</span>
								</h2>
								<div class="product_tab_btn">
									<ul class="nav" role="tablist">
										<li><a href="home1?cid=${0}" class=${chid[0]==true?"active":""}>
												ALL </a></li>
										<c:forEach items="${requestScope.category}" var="c">
											<li value="${c.id}"><a href="home1?cidYear=${c.id}" class="${c.id==cidYear?"
													active":""}"> ${c.name} </a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="Men" role="tabpanel">
							<div class="row">
								<div class="product_carousel product_column4 owl-carousel">
									<c:forEach items="${requestScope.productsYear}" var="p">
										<div class="col-lg-3">
											<article class="single_product">
												<figure>
													<div class="product_thumb">
														<a href="#" class="primary_img"> <img src="${p.image[0]}"
																alt="" style="height: 330px;">
														</a> <a href="#" class="secondary_img"> <img
																src="${p.image[1]}" alt="" style="height:330px">
														</a>
														<div class="action_links">
															<ul>
																<li class="add_to_cart" onclick="openModal('modal_box',${p.id}, '${p.image[0]}', '${p.image[1]}',
                                                                                '${p.name}',${p.salePrice},${p.price}, '${p.describe}', '${p.classifyStr}',
                                                                                '${p.supplier.getCompanyName()}')"">
															<a href=" #" data-toggle="modal" data-target="#modal_box" title="Add to Cart"> <i
																		class="fa fa-shopping-cart"></i>
																	</a>
																</li>
																<li class="wishlist"><a href="#"
																		onclick="toggleWishlist(${p.id})"
																		title="Add to Wishlist">
																		<i style="color: #f6692a"
																			class="fa-solid fa-heart"></i>
																	</a></li>
																<li class="quick_button" onclick="openModal('modal_box',${p.id}, '${p.image[0]}', '${p.image[1]}',
                                                                                '${p.name}',${p.salePrice},${p.price}, '${p.describe}', '${p.classifyStr}',
                                                                                '${p.supplier.getCompanyName()}')">
																	<a href="#" data-toggle="modal"
																		data-target="#modal_box" title="Quick View"> <i
																			class="fa fa-eye"></i>
																	</a>
																</li>
															</ul>
														</div>
													</div>
													<figcaption class="product_content">
														<h4 class="product_name ani-fire" style="">
															<a href="#">${p.name}</a>
														</h4>

														<div class="price_box">
															<c:if test="${p.price != p.salePrice}">
																<span class="old_price" id="oldprice">Rs.
																	${p.price}</span>
															</c:if>
															<span class="current_price ani-fire">Rs.
																${p.salePrice} </span>
														</div>
														
													</figcaption>
												</figure>
											</article>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- product area ends -->


			<!-- banner area starts -->
			<jsp:include page="/components/banner.jsp" />
			<!-- banner area ends -->

			<!-- home section area starts  -->

			<div class="home_section_two color_two mb-70">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-12">
							<div class="home_section_left">
								<!-- deals product area starts -->

								<div class="deals_product_area mb-68">
									<div class="section_title section_title_style2">
										<h2>
											<span class="ani-fire">Hot Deals</span>
										</h2>
										<i style="color: orangered; font-size: 22px; margin-left: 5px"
											class="fa-solid fa-fire"></i>
									</div>
									<div class="row">
										<div class="deals_carousel product_column1 owl-carousel">
											<c:set var="hotDeal" value="${requestScope.hotDeal}" />
											<div class="col-lg-3">
												<article class="single_product">
													<figure>
														<div class="product_thumb">
															<a href="#" class="primary_img"> <img
																	src="${hotDeal.image[0]}" alt="">
															</a> <a href="#" class="secondary_img"> <img
																	src="${hotDeal.image[1]}" alt="">
															</a>
															<div class="action_links">
																<ul>
																	<li class="add_to_cart"
																		onclick="openModal('modal_box', ${hotDeal.id}, '${hotDeal.image[0]}', '${hotDeal.image[1]}',
                                                                                    '${hotDeal.name}',${hotDeal.salePrice},${hotDeal.price}, '${hotDeal.describe}', '${hotDeal.classifyStr}',
                                                                                    '${hotDeal.supplier.getCompanyName()}')">
																		<a href="#" data-toggle="modal"
																			data-target="#modal_box"
																			title="Add to Cart"> <i
																				class="fa fa-shopping-cart"></i>
																		</a>
																	</li>
																	<li class="wishlist"><a href="#"
																			onclick="toggleWishlist(${hotDeal.id})"
																			title="Add to Wishlist"> <i
																				style="color: #f6692a"
																				class="fa-solid fa-heart"></i>
																		</a></li>
																	<li class="quick_button"><a href="#"
																			data-toggle="modal" data-target="#modal_box"
																			onclick="openModal('modal_box', ${hotDeal.id}, '${hotDeal.image[0]}', '${hotDeal.image[1]}',
                                                                                       '${hotDeal.name}',${hotDeal.salePrice},${hotDeal.price}, '${hotDeal.describe}', '${hotDeal.classifyStr}',
                                                                                       '${hotDeal.supplier.getCompanyName()}')"
																			title="Quick view"> <i
																				class="fa fa-eye"></i>
																		</a></li>
																</ul>
															</div>
														</div>
														<figcaption class="product_content">
															<!-- for deals timing -->
															<div class="product_timing">
																<div id="" data-countdown="2021/1/15">
																	<div class="countdown_area">
																		<div class="single_countdown ani-fire">
																			<div id="day" class="countdown_number">
																			</div>
																			<div class="countdown_title">days</div>
																		</div>
																		<div class="single_countdown ani-fire">
																			<div id="hour" class="countdown_number">
																			</div>
																			<div class="countdown_title">Hours</div>
																		</div>
																		<div class="single_countdown ani-fire">
																			<div id="minutes" class="countdown_number">
																			</div>
																			<div class="countdown_title">mins</div>
																		</div>
																		<div class="single_countdown ani-fire">
																			<div id="sec" class="countdown_number">
																			</div>
																			<div class="countdown_title">secs</div>
																		</div>
																	</div>
																</div>
															</div>
															<h4 class="product_name ani-fire">
																<a href="#">${hotDeal.name}</a>
															</h4>

															<div class="price_box">
																<span class="old_price">Rs.${hotDeal.price} </span>
																<span
																	class="current_price ani-fire">Rs.${hotDeal.salePrice}</span>
															</div>

														</figcaption>
													</figure>
												</article>
											</div>
										</div>
									</div>
								</div>

								<!-- deals product area ends -->

								<!-- small product area starts -->

								

								<!-- small product area ends -->

								<c:set var="cat" value="${requestScope.category}" />
								<div class="testimonial_style_two mb-60 rightleft">
									<div class="testimonial_container">
										<div class="section_title section_title_style2">
											<h2 style="font-size: 20px">Brand</h2>
										</div>
										<form id="f3" action="refine" method="get">
											<div class="" style="margin: 0">
												<h2 style="font-size: 16px;"></h2>
												<fieldset class="responsiveFacets_sectionContent " aria-hidden="false">
													<div href="#" class="responsiveFacets_sectionItemLabel"
														onclick="pageRefine(0)">
														<label class="responsiveFacets_sectionItem" for="brand">
															ALL (${listAll.size()}) </label>
													</div>
													<c:forEach begin="0" end="${cat.size()-1}" var="i">
														<div class="responsiveFacets_sectionItemLabel"
															onclick="pageRefine(${i + 1})">
															<label href="#" class="responsiveFacets_sectionItem"
																for="brand"> ${cat.get(i).name}
																(${cat.get(i).getTotalProduct()}) </label>
														</div>
													</c:forEach>
												</fieldset>
											</div>
											<input type="hidden" value="" name="cid_refine" id="submitt">
										</form>
									</div>
								</div>
								<!-- testimonial section ends -->

								<!-- Newsletter section starts -->


								<!-- Newsletter section ends -->

							</div>
						</div>

						<div class="col-lg-9 col-md-12">
							<div class="home_section_right">
								<!-- product area starts  -->

								<div class="product_area mb-65">
									<div class="section_title section_title_style2">
										<h2>TOP 5 BEST SELLERS</h2>
									</div>
									<div class="row">
										<div class="product_carousel product_column3 owl-carousel">
											<c:forEach items="${requestScope.productsTopSellers}" var="t">
												<div class="col-lg-3">
													<article class="single_product">
														<figure>
															<div class="product_thumb">
																<a href="#" class="primary_img"> <img
																		src="${t.image[0]}" alt="" style="height:330px">
																</a> <a href="#" class="secondary_img"> <img
																		src="${t.image[1]}" alt="" style="height:330px">
																</a>

																<div class="action_links">
																	<ul>
																		<li class="add_to_cart"
																			onclick="openModal('modal_box',${t.id}, '${t.image[0]}', '${t.image[1]}',
                                                                                        '${t.name}',${t.salePrice},${t.price}, '${t.describe}', '${t.classifyStr}',
                                                                                        '${t.supplier.getCompanyName()}')">
																			<a href="#" data-toggle="modal"
																				data-target="#modal_box"
																				title="Add to Cart"> <i
																					class="fa fa-shopping-cart"></i>
																			</a>
																		</li>
																		<li class="wishlist"><a href="#"
																				onclick="toggleWishlist(${t.id})"
																				title="Add to Wishlist"> <i
																					style="color: #f6692a"
																					class="fa-solid fa-heart"></i>
																			</a></li>
																		<li class="quick_button"
																			onclick="openModal('modal_box',${t.id}, '${t.image[0]}', '${t.image[1]}',
                                                                                        '${t.name}',${t.salePrice},${t.price}, '${t.describe}', '${t.classifyStr}',
                                                                                        '${t.supplier.getCompanyName()}')">
																			<a href="#" data-toggle="modal"
																				data-target="#modal_box"
																				title="Quick View"> <i
																					class="fa fa-eye"></i>
																			</a>
																		</li>
																	</ul>
																</div>
															</div>
															<figcaption class="product_content">
																<h4 class="product_name">
																	<a href="#">${t.name} </a>
																</h4>
																
																<div class="price_box">
																	<span class="old_price">Rs. ${t.price}</span> <span
																		class="current_price">Rs.${t.salePrice}</span>
																</div>
															</figcaption>
														</figure>
													</article>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>

								<!-- product area ends -->

								<!-- Long banner area starts  -->

								<!-- Long Banner area ends -->

								<!-- product section starts  -->
								<div class="product_area">
									<div class="section_title section_title_style2">
										<h2>On Sale</h2>
									</div>

									<c:set var="page" value="${requestScope.page}" />
									<div class="pagination">
										<c:forEach begin="${1}" end="${requestScope.numberpage}" var="i">
											<a class="linkLoad ${i==1?" active":""}" id="numberPage"
												onclick="loadMore(this)">${i}</a>
										</c:forEach>
									</div>

									<div id="contentt" class="row">
										<c:set var="proA" value="" />
										<c:forEach items="${requestScope.productPage}" var="i">
											<div class="product_items col-lg-4" style="margin: 30px 0">
												<article class="single_product">
													<figure>
														<div class="product_thumb">
															<a href="#" class="primary_img"> <img src="${i.image[0]}"
																	alt="">
															</a> <a href="#" class="secondary_img"> <img
																	src="${i.image[1]}" alt="">
															</a>

															<div class="action_links">
																<ul>
																	<li class="add_to_cart" onclick="openModal('modal_box',${i.id}, '${i.image[0]}', '${i.image[1]}',
                                                                                    '${i.name}',${i.salePrice},${i.price}, '${i.describe}', '${i.classifyStr}',
                                                                                    '${i.supplier.getCompanyName()}')">
																		<a href="#" data-toggle="modal"
																			data-target="#modal_box"
																			title="Add to Cart"> <i
																				class="fa fa-shopping-cart"></i>
																		</a>
																	</li>
																	<li class="wishlist"><a href="#"
																			onclick="toggleWishlist(${i.id})"
																			title="Add to Wishlist"> <i
																				style="color: #f6692a"
																				class="fa-solid fa-heart"></i>
																		</a></li>
																	<li class="quick_button" onclick="openModal('modal_box', ${i.id}, '${i.image[0]}', '${i.image[1]}',
                                                                                    '${i.name}', ${i.salePrice}, ${i.price}, '${i.describe}', '${i.classifyStr}',
                                                                                    '${i.supplier.getCompanyName()}')">
																		<a href="#" data-toggle="modal"
																			data-target="#modal_box" title="Quick View">
																			<i class="fa fa-eye"></i>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														<figcaption class="product_content">
															<h4 class="product_name">
																<a href="#">${i.name}</a>
															</h4>
															
															<div class="price_box">
																<c:if test="${i.price != i.salePrice}">
																	<span class="old_price">Rs. ${i.price}</span>
																</c:if>
																<span class="current_price">Rs. ${i.salePrice}</span>
															</div>
														</figcaption>
													</figure>
												</article>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- product section ends -->
				</div>
			</div>


			<!-- home section area ends -->

			<!-- blog section ends -->

			<footer class="footer_widgets color_two">

				<jsp:include page="/components/footer.jsp" />
			</footer>
			<!-- Back To Top -->
			<jsp:include page="components/backtotop.jsp" />


			<div class="modal fade" id="modal_box" role="dialog"></div>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
			<script src="js/countdown.js"></script>
			<script src="js/clickevents.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
			<script src="js/main.js"></script>
			<script type="text/javascript">
				function submitEmail() {
					var text = document.querySelector("#emailDiscount").value;
					$.ajax({
						url: "/ClothesShop/email",
						type: "get",
						data: {
							txt: text
						},
						success: function (data) {
							var row = document.getElementById("newsletter");
							row.innerHTML = data;
						},
						error: function (xhr) {
						}
					});
				}
			</script>

			<!--===============================================================================================-->
			<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
			<!--===============================================================================================-->
			<script src="vendor/animsition/js/animsition.min.js"></script>
			<!--===============================================================================================-->
			<script src="vendor/bootstrap/js/popper.js"></script>
			<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
			<!--===============================================================================================-->
			<script src="vendor/select2/select2.min.js"></script>
			<script>
				$(".js-select2").each(function () {
					$(this).select2({
						minimumResultsForSearch: 20,
						dropdownParent: $(this).next('.dropDownSelect2')
					});
				})
			</script>
			<!--===============================================================================================-->
			<script src="vendor/daterangepicker/moment.min.js"></script>
			<script src="vendor/daterangepicker/daterangepicker.js"></script>
			<!--===============================================================================================-->
			<script src="vendor/slick/slick.min.js"></script>
			<script src="components/slick-custom.js"></script>
			<!--===============================================================================================-->
			<script src="vendor/parallax100/parallax100.js"></script>
			<script>
				$('.parallax100').parallax100();
			</script>
			<!--===============================================================================================-->
			<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
			<script>
				$('.gallery-lb').each(function () { // the containers for all your galleries
					$(this).magnificPopup({
						delegate: 'a', // the selector for gallery item
						type: 'image',
						gallery: {
							enabled: true
						},
						mainClass: 'mfp-fade'
					});
				});
			</script>
			<!--===============================================================================================-->
			<script src="vendor/isotope/isotope.pkgd.min.js"></script>
			<!--===============================================================================================-->
			<script src="vendor/sweetalert/sweetalert.min.js"></script>
			<script>
				$('.js-addwish-b2').on('click', function (e) {
					e.preventDefault();
				});

				$('.js-addwish-b2').each(function () {
					var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
					$(this).on('click', function () {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

				$('.js-addwish-detail').each(function () {
					var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

					$(this).on('click', function () {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

				/*---------------------------------------------*/

				$('.js-addcart-detail').each(function () {
					var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
					$(this).on('click', function () {
						swal(nameProduct, "is added to cart !", "success");
					});
				});

			</script>
			<!--===============================================================================================-->
			<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
			<script>
				$('.js-pscroll').each(function () {
					$(this).css('position', 'relative');
					$(this).css('overflow', 'hidden');
					var ps = new PerfectScrollbar(this, {
						wheelSpeed: 1,
						scrollingThreshold: 1000,
						wheelPropagation: false,
					});

					$(window).on('resize', function () {
						ps.update();
					})
				});
			</script>
			<!--===============================================================================================-->
			<script src="components/main.js"></script>

		</body>

		</html>