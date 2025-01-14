<!-- 작성자 : 김태훈 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <title>Direct Trade Details</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/heartStyle.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- Humberger End -->
	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Direct Trade Details</h2>
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <a href="${pageContext.request.contextPath}/users/getDirectTradeList">Direct Trade List</a>
                            <span>Cabbage Market</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="/cabbageMarketFile/directImg/${imgNameList[0]}" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                        	<c:forEach var="img" items="${imgNameList}">
                        		<img data-imgbigurl="/cabbageMarketFile/directImg/${img}"
                                src="/cabbageMarketFile/directImg/${img}" alt="">
                        	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${productDetail.productName}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <div class="product__details__price"><fmt:formatNumber value="${productDetail.productPrice}" pattern="#,###" /></div>
                        	<c:if test="${productDetail.userId == usersSession.userId}">
                        		<input class="primary-btn" style="margin-top: 3px; border: 0px;" type="button" value="회원님 상품"/>
                        	</c:if>
                        	<c:if test="${productDetail.userId != usersSession.userId}">
                        		<input class="primary-btn" style="margin-top: 3px; border: 0px;" type="button" value="판매자와 채팅" onclick="showPopup();" />
                        	</c:if>
                        <div class="heart-btn">
					      <div class="content">
					        <span class="heart"></span>
					        <span class="text">Like</span>
					      </div>
					    </div>
                        <ul>
                            <li><b>판매자</b> <span>${sellerNickname}</span></li>
                            <li><b>상품 카테고리</b> <span>${productDetail.categorySubName}</span></li>
                            <li><b>직거래 지역</b> <span>${productDetail.location}</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Description</h6>
                                    <pre>${productDetail.productDesc}</pre>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <ul style="list-style:none;">
			                            <li><b>판매자:</b> <span>${sellerNickname}</span></li>
			                            <li><b>상품 카테고리:</b> <span>${productDetail.categorySubName}</span></li>
			                            <li><b>직거래 지역:</b> <span>${productDetail.location}</span></li>
			                        </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
	            <c:forEach var="rdpl" items="${relatedDirectProductList}">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="/cabbageMarketFile/directImg/${rdpl.imgName}">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="${pageContext.request.contextPath}/users/getDirectTradeOne?directTradeProductRegistrationId=${rdpl.directTradeProductRegistrationId}">${rdpl.productName}</a></h6>
	                            <h5>${rdpl.productPrice}</h5>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>    
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

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
    <script>
      $(document).ready(function(){
        $('.content').click(function(){
          $('.content').toggleClass("heart-active")
          $('.text').toggleClass("heart-active")
          $('.heart').toggleClass("heart-active")
        });
      });
      
      // 채팅방 팝업창
      function showPopup() { 
    	  window.open("${pageContext.request.contextPath}/users/getChattingRoomOne?directTradeProductRegistrationId=${productDetail.directTradeProductRegistrationId}&userId=${usersSession.userId}", "a", "width=400, height=600, left=200, top=200"); 
      }
      
    </script>
</body>

</html>