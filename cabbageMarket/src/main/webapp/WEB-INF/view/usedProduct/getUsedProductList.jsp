<!-- 작성자: 김희진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Direct Trade Shop">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <title>배추마켓 중고거래 상품</title>
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/style.css" type="text/css">
	
	<style>
	.form-control:focus {
	  box-shadow: none;
	}
	.form-control-underlined {
	  border-width: 0;
	  border-bottom-width: 1px;
	  border-radius: 0;
	  padding-left: 0;
	}
	
	.box{
	  width:35%;
	  position: absolute;
  	  right: 15px;
	}
	.scrolltop {
      display: none;
      position: fixed;
      right: 30px;
      bottom: 50px;
      z-index: 1030;
      font-size: 1.875rem;
      color: #868e96;
      transition: all 0.5s ease-in-out;
      opacity: 0.8;
   }
    .scrolltop:hover,
    .scrolltop:focus {
     color: #dc3545;
     transition: all 0.5s ease-in-out;
   }	
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	   
		$('#sortBy').change(function(){
			console.log($('#sortBy').val());
			$('#sortByForm').submit();
		});
		
		$(window).scroll(function (){
			if($(this).scrollTop() > 100) {
				$('#scrollTop').fadeIn(500);
			} else {
				$('#scrollTop').fadeOut('slow');
			}
	    });
		
        $('#scrollTop').click(function (e) {
			e.preventDefault();
			$('html, body').animate({scrollTop: 0}, 200);
	    });
	});	
	
	$.ajax({
	   type:'get',
	   url:'${pageContext.request.contextPath}/getCategoryMain',
	   
	   success: function(jsonData) {
	      $(jsonData).each(function(index, item) {
	     	 console.log(item.categoryMainName);
	         $('#categoryMain').append(
	        		'<li><a href="${pageContext.request.contextPath}/users/getUsedProductList?categoryMainId='+item.categoryMainId+'">'+item.categoryMainName+'</a></li>'
	         );
	      });
	   }
	});

	</script>
</head>
<body>
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- header Section Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- header Section End -->

	
    <!-- Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>중고 상품</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <span>Cabbage Market</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>CATEGORY</h4>
                            <ul id="categoryMain"></ul>
                        </div>
                        
                        <br><br><br>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="i" begin="0" end="2">
	                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${usedProductList[i].applyId}">
	                                            <div class="latest-product__item__pic">
	                                                <img src="/cabbageMarketFile/deliveryImg/${usedProductList[i].imgName}" alt="" style="width: 110px; height: 110px;">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                            	<c:if test="${usedProductList[i].productName.length() > 9}">
	                                            		<h6>${usedProductList[i].productName.substring(0,8)}..</h6>
	                                            	</c:if>
	                                            	<c:if test="${usedProductList[i].productName.length() <= 9}">
	                                            		<h6>${usedProductList[i].productName}</h6>
	                                            	</c:if>
	                                                <span><fmt:formatNumber value="${usedProductList[i].productPrice}" pattern="#,###" /></span>
	                                            </div>
	                                        </a>
										</c:forEach>
                                    </div>
                                    
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="i" begin="3" end="5">
	                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${usedProductList[i].applyId}">
	                                            <div class="latest-product__item__pic">
	                                                <img src="/cabbageMarketFile/deliveryImg/${usedProductList[i].imgName}" alt="" style="width: 110px; height: 110px;">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                                <c:if test="${usedProductList[i].productName.length() > 9}">
	                                            		<h6>${usedProductList[i].productName.substring(0,8)}..</h6>
	                                            	</c:if>
	                                            	<c:if test="${usedProductList[i].productName.length() <= 9}">
	                                            		<h6>${usedProductList[i].productName}</h6>
	                                            	</c:if>
	                                                <span><fmt:formatNumber value="${usedProductList[i].productPrice}" pattern="#,###" /></span>
	                                            </div>
	                                        </a>
										</c:forEach>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-7">
                	<div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>마감 임박 상품</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
	                            <c:forEach var="dip" items="${deadlineImminentProduct}">
	                                <div class="col-lg-4">
	                                    <div class="product__discount__item">
	                                        <div class="product__discount__item__pic set-bg"
	                                            data-setbg="/cabbageMarketFile/deliveryImg/${dip.imgName}">
	                                            <ul class="product__item__pic__hover">
	                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                            </ul>
	                                        </div>
	                                        <div class="product__discount__item__text">
	                                            <h5><a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${dip.applyId}">${dip.productName}</a></h5>
	                                            <div class="product__item__price"><fmt:formatNumber value="${dip.productPrice}" pattern="#,###" />원</div>
	                                        </div>
	                                    </div>
	                                </div>
	                           </c:forEach>
                            </div>
                        </div>
                    </div>
                	<div class="filter__item">
                		<div class="row">
			                <div class="product__discount">
			                	<!-- search 검색 -->
								<div class="box">
									<form id="searchForm" action="${pageContext.request.contextPath}/users/getUsedProductList" method="get" >
										<div class="input-group mb-4 border rounded-pill p-1" id="form">
											<input id="search" type="search" name="searchWord" aria-describedby="button-addon1" class="form-control bg-none border-0" placeholder="중고상품 검색">
								    		<div class="input-group-append border-0">
								     			<button id="btn" type="submit" class="btn btn-link text-success"><i class="fa fa-search"></i></button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
	                   		<div class="col-lg-4 col-md-5">
	                        	<div class="filter__sort">
	                            	<form id="sortByForm" action="${pageContext.request.contextPath}/users/getUsedProductList" method="get" style="display:inline;">
	                             		<input type="hidden" name="searchWord" value="${searchWord}">
		                                <input type="hidden" name="categoryMainId" value="${categoryMainId}">
	                              		<select id="sortBy" name="sortBy" >
			                              	<c:if test="${sortBy == 0}">
			                              		<option value="0" selected="selected">최근등록순</option>
			                              	</c:if>
			                              	<c:if test="${sortBy != 0}">
			                              		<option value="0">최근 등록순</option>
			                              	</c:if>
			                              	
			                              	<c:if test="${sortBy == 1}">
			                              		<option value="1" selected="selected">낮은가격순</option>
			                              	</c:if>
			                              	<c:if test="${sortBy != 1}">
			                              		<option value="1">낮은 가격순</option>
			                              	</c:if>
			                              	
			                              	<c:if test="${sortBy == 2}">
			                              		<option value="2" selected="selected">높은가격순</option>
			                              	</c:if>
			                              	<c:if test="${sortBy != 2}">
			                              		<option value="2">높은 가격순</option>
			                              	</c:if>
										</select>
	                            	</form>
	                       	 	</div>
							</div>
		                    <div class="col-lg-4 col-md-4">
		                        <div class="filter__found">
		                            <h6>Total Products<span>&nbsp;${usedProductTotal}</span></h6>
		                        </div>
		                    </div>
		        			<div class="col-lg-4 col-md-3">
	                            <div class="filter__option">
	                                <span class="icon_grid-2x2"></span>
	                                <span class="icon_ul"></span>
	                            </div>
	                        </div>
	                    </div> 
	                    <br>
	                    <div class="row">
	                    	<c:forEach var="upl" items="${usedProductList}">
		                    	<div class="col-lg-4 col-md-6 col-sm-6">
		                            <div class="product__item">
		                                <div class="product__item__pic set-bg" data-setbg="/cabbageMarketFile/deliveryImg/${upl.imgName}">
		                                    <ul class="product__item__pic__hover">
		                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
		                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
		                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
		                                    </ul>
		                                </div>
		                                <div class="product__item__text">
		                                	<span style="font-size: 14px; color: #b2b2b2; display: block; margin-bottom: 4px;">${upl.categorySubName}</span>
		                                    <h6><a href="${pageContext.request.contextPath}/users/getUsedProductOne?applyId=${upl.applyId}">${upl.productName}</a></h6>
		                                    <h5><span><fmt:formatNumber value="${upl.productPrice}" pattern="#,###" />원</span></h5>
		                                </div>
		                            </div>
		                        </div>
	                    	</c:forEach>
	                    </div>
	                    
	                    <!-- 페이징 -->
	                    <div class="product__pagination" style="text-align: center;">
	                    	<c:if test="${currentPage > 1}">
					            <a href="${pageContext.request.contextPath}/users/getUsedProductList?currentPage=${currentPage-1}&searchWord=${searchWord}&categoryMainId=${categoryMainId}&sortBy=${sortBy}">
					            	<i class="fa fa-long-arrow-left"></i>
					            </a>
					        </c:if>
	 						<c:forEach var="i" begin="1" end="10">
								<c:if test="${(pageSet*10)+i < lastPage+1}">
						            <a href="${pageContext.request.contextPath}/users/getUsedProductList?currentPage=${(pageSet*10)+i}&searchWord=${searchWord}&categoryMainId=${categoryMainId}&sortBy=${sortBy}">
										${(pageSet*10)+i}
									</a>
								</c:if>
							</c:forEach>
					        <c:if test="${currentPage < lastPage}">
					            <a href="${pageContext.request.contextPath}/users/getUsedProductList?currentPage=${currentPage+1}&searchWord=${searchWord}&categoryMainId=${categoryMainId}&sortBy=${sortBy}">
					            	<i class="fa fa-long-arrow-right"></i>
								</a>
					        </c:if>
	                    </div>
                    
                	</div>
           		</div>
        	</div>
		</div>
    </section>
    <!-- Product Section End -->
    
    <!-- ScrollTop Section Begin -->
	<a id="scrollTop" class="scrolltop" href="#">
		<i class="fa fa-chevron-up" aria-hidden="true"></i>
    </a>
	<!-- ScrollTop Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/footer.jsp"/>
    <!-- Footer Section End -->
    
	 <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/template/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/template/js/main.js"></script>
</body>
</html>