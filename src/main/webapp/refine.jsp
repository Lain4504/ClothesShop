<%-- 
    Document   : refine
    Created on : Dec 20, 2023, 7:55:37 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Man Fashion Store</title>
        <link rel="icon" href="images/logo1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="css/style.css">
             <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
        <style>
            li a:hover {
                color: #f6692a;
            }
            ul li a.active {
                color: #f6692a;
            }

            .li_header {
                color: white;
                margin-left: 50px;
                font-size: 18px;
            }

            .submit-price {
                font-size: 16px;
                background-color: black;
                color: white;
                font-weight: 600;
                padding: 5px 40px;
                border-radius: 20px;
                margin: 10px 0 20px
            }

            .submit-price:hover {
                background-color: rgba(0,0,0,0.3);
                color: black;
                font-weight: 600;
            }
            
            @media (max-width: 991px) {
  				.js-show-modal-search{
  					
  					
  				}
			}
            
        </style>
    </head>
    <body>
        <header>
            <div class="main_header header_transparent header-mobile-m">
                <div class="header_container sticky-header" style="padding: 0">
                    <div class="container-fluid" style="background-color: #808080">
                        <div class="row align-items-center" style="padding: 8px 0">
                        	<!-- Logo header -->
                            <div class="col-lg-3">
                                <div class="logo" style="margin-left: 30px;"> 
                                    <a href="home"><img src="images/icons/logo-01.png" alt=""></a>
                                </div>
                            </div>
                            <!-- Search input -->
                            <div class="col-lg-6">
                                <form action="" style="display: flex; justify-content: center">
                                    <input value="${requestScope.searchAtHome != null ? requestScope.searchAtHome : ""}" id="searchId" type="text" oninput="searchByName()" placeholder="Search your perfume" style="width: 60%; padding: 4px 10px; border-radius: 15px">
                                    <button type="submit" style="border-radius: 50%; width: 40px; font-size: 18px;"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                            <!-- Header right -->
                            <div class="col-lg-3">
                                <%@ include file="header_right.jsp" %> 
                            </div>
                        </div>
                        <!-- Header bar -->
                        <div class="row" style="justify-content: center; padding: 10px 0"">
                            <ul style="display: flex">
                                <li class="li_header"  >
                                    <a class="${cid_refine==0?"active":""}" href="refine?cid=${0}">ALL
                                    </a>
                                </li>
                                <c:forEach items="${requestScope.category}" var="c">
                                    <li class="li_header">
                                        <a class="${c.id==cid_refine?"active":""}" href="refine?cid_refine=${c.id}">
                                            ${c.name}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Header Mobile -->
				<div class="wrap-header-mobile">
					<!-- Logo moblie -->		
					<div class="logo-mobile">
						<a href="home"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m m-r-15">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 search">
							<form action="" style="display: flex; justify-content: center">
                                    <input value="${requestScope.searchAtHome != null ? requestScope.searchAtHome : ""}" id="searchId" type="text" oninput="searchByName()" placeholder="Search your perfume">
                                    <button type="submit" style="border-radius: 50%; width: 20%; font-size: 18px;"><i class="fa fa-search"></i></button>
                            </form>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>

					<!-- Button show menu -->
					<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</div>
				</div>


				<!-- Menu Mobile -->
				<div class="menu-mobile">
				
					<ul class="main-menu-m">
						
						<li class="mega_items">
							<a id="" href="#">
								Collections 
								<i class="fa fa-angle-down"></i></a>
									<div class="mega_menu">
										<ul class="mega_menu_inner_m">
											<li><a href="refine?cid_refine=${0}">ALL</a></li>
											<c:forEach items="${requestScope.category}" var="c">
												<li> 
													<a href="refine?cid_refine=${c.id}">${c.name}</a>
												</li>
											</c:forEach>
										</ul>
									</div>
						</li>
												
						<li>
							<a href="aboutus">About</a>
						</li>

						<li>
							<a href="contact">Contact</a>
						</li>
					</ul>
				</div>
        </header>
        
        <div class="home_section_two color_two mb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12">
                        <div class="home_section_left">
                            <!-- testimonial section starts  -->
                            <c:set var="cat" value="${requestScope.category}"/>
                            <div class="testimonial_style_two mb-60 rightleft">
                                <div class="testimonial_container">
                                    <div class="section_title section_title_style2">
                                        <h2 style="font-size: 20px" onclick="showFilter()">Filter</h2>
                                        <i style="font-size: 18px; margin-left: 5px" class="fa fa-filter"></i>
                                    </div>
                                    <form id="f1" action="refine" method="get" class="filter-form">
                                        <div class="section_title section_title_style2">
                                            <h2 style="font-size: 16px;">Brand</h2>
                                            <fieldset class="responsiveFacets_sectionContent " aria-hidden="false">
                                                <div class="responsiveFacets_sectionItemLabel">
                                                    <input type="checkbox" class="responsiveFacets_sectionItemCheckbox" 
                                                           ${chid[0]?"checked":""} 
                                                           id="c0" 
                                                           name="cid_refinee"
                                                           value="${0}" onclick="setCheck(this)">
                                                    <label class="responsiveFacets_sectionItem" for="brand">
                                                        ALL (${allproduct.size()})
                                                    </label>
                                                </div>
                                                <c:if test="${cat!=null}">
                                                    <c:forEach begin="0" end="${cat.size()-1}" var="i">
                                                        <div class="responsiveFacets_sectionItemLabel">
                                                            <input
                                                                type="checkbox"
                                                                ${cat.get(i).getId()==cid_refine?"checked":""}
                                                                class="responsiveFacets_sectionItemCheckbox"
                                                                id="cm" 
                                                                name="cid_refinee"
                                                                value="${cat.get(i).getId()}"
                                                                ${chid[i+1]?"checked":""}
                                                                onclick="setCheck(this)"/>
                                                            <label class="responsiveFacets_sectionItem" for="brand" >
                                                                ${cat.get(i).name} (${cat.get(i).getTotalProduct()})
                                                            </label>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </fieldset>
                                        </div>
                                       
                                        <div class="section_title section_title_style2">
                                            <h2 style="font-size: 16px">Price</h2>
                                            <fieldset class="responsiveFacets_sectionContent " aria-hidden="false">
                                                <div class="shopee-filter-group__body shopee-price-range-filter__edit">
                                                    <div class="shopee-price-range-filter__inputs">
                                                        <input type="number" style="width: 90px" name="pricefrom" class="shopee-price-range-filter__input" placeholder="$ FROM" value="${price1 == 0 ? "$ FROM" : price1}" step="0.5" min=1>
                                                        <div class="shopee-price-range-filter__range-line" style="
                                                             flex: 1;
                                                             height: 1px;
                                                             background: #bdbdbd;
                                                             margin: 0 10px;">
                                                        </div>
                                                        <input type="number" style="width: 90px" name="priceto" class="shopee-price-range-filter__input" placeholder="$ TO" value="${price2 == 0 ? "" : price2}" step="0.5" min=1">
                                                    </div>
                                                    <button class="submit-price" style="">Apply</button>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="section_title section_title_style2">
                                            <h2 style="font-size: 16px">Discount</h2>
                                            <fieldset class="responsiveFacets_sectionContent " aria-hidden="false">
                                                <div>
                                                    <label class="responsiveFacets_sectionItemLabel">
                                                        <input ${discount==0.25?"checked":""} name="discount" value="0.25" onclick="setCheckk(this)" type="checkbox" class="responsiveFacets_sectionItemCheckbox" name="en_brand_content" data-facet-value="Abercrombie+%26+Fitch" aria-label="Abercrombie &amp; Fitch (6 available products)" tabindex="0">
                                                        <span class="responsiveFacets_sectionItem " data-facet-key="en_brand_content" data-facet-value="Abercrombie+%26+Fitch">
                                                            <span class="responsiveFacets_sectionItemValue " aria-hidden="true">
                                                                Up to 25% (${dis25})
                                                            </span>
                                                        </span>
                                                    </label>
                                                </div>
                                                <div>
                                                    <label class="responsiveFacets_sectionItemLabel">
                                                        <input ${discount==0.5?"checked":""} name="discount" value="0.5" onclick="setCheckk(this)" type="checkbox" class="responsiveFacets_sectionItemCheckbox" name="en_brand_content" data-facet-value="Allsaints" aria-label="Allsaints (2 available products)" tabindex="0">
                                                        <span class="responsiveFacets_sectionItem " data-facet-key="en_brand_content" data-facet-value="Allsaints">
                                                            <span class="responsiveFacets_sectionItemValue " aria-hidden="true">
                                                                Up to 50% (${dis50})
                                                            </span>
                                                        </span>
                                                    </label> 
                                                </div>
                                                <div>
                                                    <label class="responsiveFacets_sectionItemLabel">
                                                        <input ${discount==0.75?"checked":""} name="discount" value="0.75" onclick="setCheckk(this)" type="checkbox" class="responsiveFacets_sectionItemCheckbox" name="en_brand_content" data-facet-value="Allsaints" aria-label="Allsaints (2 available products)" tabindex="0">
                                                        <span class="responsiveFacets_sectionItem " data-facet-key="en_brand_content" data-facet-value="Allsaints">
                                                            <span class="responsiveFacets_sectionItemValue " aria-hidden="true">
                                                                Up to 75% (${dis75})
                                                            </span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- testimonial section ends -->
                        </div>
                    </div>

                    <div class="col-lg-9 col-md-12">
                        <div class="home_section_right">
                            <div class="product_area" >
                                <div class="section_title_style2" style="margin-top: 50px">
                                    <c:if test="${requestScope.cat.name == null}">
                                        <div style="text-align: start; font-size: 25px; font-weight: 600;">
                                            Sản phẩm hiện có
                                        </div>
                                    </c:if>
                                    <h3 style="font-weight: 600;">${requestScope.cat.name}</h3>
                                    <div style="text-align: center; font-size: 15px">
                                        ${requestScope.cat.describe}
                                    </div>
                                </div>
                                <c:set var="page" value="${requestScope.page}"/>

                                <div id ="contentt" class="row">
                                    <c:set var="proA" value=""/>
                                    <c:forEach items="${requestScope.productPage}" var="i">
                                        <div class="product_items col-lg-3 col-md-4 col-sm-6" style="margin: 30px 0">
                                            <article class="single_product">
                                                <figure>
                                                    <div class="product_thumb">
                                                        <a href="#" class="primary_img">
                                                            <img src="${i.image[0]}" alt="">
                                                        </a>
                                                        <a href="#" class="secondary_img">
                                                            <img src="${i.image[1]}" alt="">
                                                        </a>
                                                        <div class="action_links">
                                                            <ul>
                                                                <li class="add_to_cart" 
                                                                    onclick="openModal('modal_box',${i.id}, '${i.image[0]}', '${i.image[1]}',
                                                                                    '${i.name}',${i.salePrice},${i.price}, '${i.describe}', '${i.classifyStr}',
                                                                                    '${i.supplier.getCompanyName()}')" >
                                                                    <a href="#" data-toggle="modal" data-target="#modal_box" title="Add to Cart">
                                                                        <i class="fa fa-shopping-cart"></i>
                                                                    </a>
                                                                </li>
                                                                <li class="wishlist">
                                                                    <a href="#" onclick="toggleWishlist(${i.id})" title="Add to Wishlist">
                                                                        <i style="color: #f6692a" class="fa-solid fa-heart"></i>
                                                                    </a>
                                                                </li>
                                                                <li style="border-color: orange" class="quick_button"
                                                                    onclick="openModal('modal_box',${i.id}, '${i.image[0]}', '${i.image[1]}',
                                                                                    '${i.name}',${i.salePrice},${i.price}, '${i.describe}', '${i.classifyStr}',
                                                                                    '${i.supplier.getCompanyName()}')" 
                                                                    >
                                                                    <a  href="#" data-toggle="modal"
                                                                        data-target="#modal_box" title="Quick View">
                                                                        <i style="" class="fa fa-eye"></i>
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
								
								<!-- Pagination -->
                                <div class="pagination col-md-12" style="margin-top: 20px; display: flex; justify-content: center">
                                    <c:if test="${requestScope.cid_refinee == null}">
                                        <c:forEach begin="${1}" end="${requestScope.numberpage}" var="i">
                                            <a href="refine?page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.cid_refinee != null}">
                                        <c:forEach begin="${1}" end="${requestScope.numberpage}" var="i"> 
                                            <a href="refine?${stringForLink}&numberStar=${numberStar}&pricefrom=${price1}&priceto=${price2}&discount=${discount}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- product section ends -->
            </div>
        </div>

        <jsp:include page="/components/footer.jsp"/>
        
        <div class="modal fade" id="modal_box" role="dialog"></div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script src="js/clickevents.js"></script>
        <!--<script src="js/main.js"></script>-->
        <script type="text/javascript">
                                                                        function setCheckk(obj) {
                                                                            var fries = document.getElementsByName('discount');
                                                                            var checked = obj.value;
                                                                            console.log(obj.checked)
                                                                            for (var i = 0; i < fries.length; i++) {
                                                                                if (checked == fries[i].value) {
                                                                                    fries[i].checked = obj.checked;
                                                                                } else {
                                                                                    fries[i].checked = false;
                                                                                }
                                                                            }

                                                                            document.getElementById('f1').submit();
                                                                        }


                                                                        function setCheck(obj) {
                                                                            var fries = document.getElementsByName('cid_refinee');
                                                                            if ((obj.id == 'c0') && (fries[0].checked) == true) {
                                                                                for (var i = 1; i < fries.length; i++) {
                                                                                    fries[i].checked = false;
                                                                                }
                                                                            } else {
                                                                                for (var i = 1; i < fries.length; i++) {
                                                                                    if (fries[i].checked == true) {
                                                                                        fries[0].checked = false;
                                                                                        break;
                                                                                    }
                                                                                }
                                                                            }
                                                                            document.getElementById('f1').submit();
                                                                        }


                                                                        function setCheckStar(obj) {
                                                                            var fries = document.getElementsByName('cid_refinee');
                                                                            if ((obj.id == 'c0') && (fries[0].checked) == true) {
                                                                                for (var i = 1; i < fries.length; i++) {
                                                                                    fries[i].checked = false;
                                                                                }
                                                                            } else {
                                                                                for (var i = 1; i < fries.length; i++) {
                                                                                    if (fries[i].checked == true) {
                                                                                        fries[0].checked = false;
                                                                                        break;
                                                                                    }
                                                                                }
                                                                            }
                                                                            document.getElementById('f1').submit();
                                                                        }

                                                                        function getNumberStar(obj) {
                                                                            var inputStar = document.querySelector('#chosseStar');
                                                                            var a = obj.id;
                                                                            var star;
                                                                            switch (a) {
                                                                                case 'option1':
                                                                                    star = 5;
                                                                                    break;
                                                                                case 'option2':
                                                                                    star = 4;
                                                                                    break;
                                                                                case 'option3':
                                                                                    star = 3;
                                                                                    break;
                                                                                case 'option4':
                                                                                    star = 2;
                                                                                    break;
                                                                                case 'option5':
                                                                                    star = 1;
                                                                                    break;
                                                                                default:
                                                                                    break;
                                                                            }
                                                                            inputStar.value = star;
                                                                            document.getElementById('f1').submit();
                                                                        }

                                                                        function searchByName() {
                                                                            var text = document.querySelector("#searchId").value;
                                                                            // Send ajax to servlet
                                                                            $.ajax({
                                                                                url: "/ClothesShop/search",
                                                                                type: "get",
                                                                                data: {
                                                                                    txt: text
                                                                                },
                                                                                success: function (data) {
                                                                                    var row = document.getElementById("contentt");
                                                                                    row.innerHTML = data;
                                                                                },
                                                                                error: function (xhr) {
                                                                                }
                                                                            });
                                                                        }
                                                                        
                                                                        function showFilter(){
                                                                        	var row = document.getElementById("f1");
                                                                        	var flag = 1;
                                                                        	if(row.style.display === "none"){
                                                                        		flag = 0;
                                                                        	}
                                                                        	if (window.innerWidth <= 991){
                                                                        		if(flag === 0){
                                                                            		row.style.display = "flex";                                                                           		
                                                                            		row.classList.add("show");
                                                                            	}
                                                                            	else {
                                                                            		
                                                                            		row.style.display = "none";
                                                                            		
                                                                            		
                                                                            	  }
                                                                        	}
                                                                        	
                                                                        }
                                                                        
                                                                        


        </script>
                  		
	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>


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
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	
<!--===============================================================================================-->
	<script src="components/main.js"></script>
    </body>
</html>
