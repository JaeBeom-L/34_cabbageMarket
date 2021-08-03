<!-- 작성자 : 강혜란 -->
<!-- 수정사 : 강혜란 210707 http://localhost/cabbageMarket/users/getAuctionList-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="template/cabbage.ico"> 
	<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
    <title>배추마켓</title>

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

    <!-- ajax 사용 -->   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript"> <!-- 유효성 검사 -->
    $(document).ready(function() {
    	var currentPosition = parseInt($(".scroll").css("top"));
    	
    	console.log($('#deadlineProductNum').val()); //productNum의 갯수를 받는다.
		var size = ( ( ($('#ProductNum').val())/3) * 400 ); // 1개당 사이즈는 정확이 458px 근데 값커지면 안됨

		try{
			 const a = $('#deadlineProductNum').val();
			 if(Object.is(a, null)) throw new Error("null");
			 if(Object.is(a, undefined)) throw new Error("undefined");
			 if(Object.is(a, NaN)) throw new Error("NaN");
			 size += 200;
			 console.log("+200");
			}catch(error){
				size -= 200;
				console.log("-200");
			}finally{
			 console.log(size);
			}
		
		$(window).scroll(function() { 
			var position = $(window).scrollTop();
			if(position < 300)
				position = 300;
			
			if(position > size)
				position = size;
			
			$(".scroll").stop().animate({"top":position+currentPosition-300+"px"},800); //-300은 헤더크기
		}); 
    	
		$('#sortValue').change(function(){
			console.log($('#sortValue').val());
			$('#sortValueForm').submit();
		});
		
		$.ajax({
			   type:'get',
			   url:'${pageContext.request.contextPath}/getCategoryMain',
			   
			   success: function(jsonData) {
			      $(jsonData).each(function(index, item) {
			     	 console.log(item.categoryMainName);
			         $('#categoryMain').append(
			            '<li><a href="${pageContext.request.contextPath}/users/getAuctionList?categoryMainId='+item.categoryMainId+'">'+item.categoryMainName+'</a></li>'
			         );
			      });
			   }
			});
		
    	console.log('이름이동 가능');
    	$(document).on('click', '#nameBtn', function(){
    		console.log('이동 클릭');
    		$('#getAuctionOneForm').submit();
    	})
    });
    </script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <jsp:include page="/WEB-INF/view/header.jsp"/>
	<!-- Humberger End -->

	<!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row" >
                <div class="col-lg-3">
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="${pageContext.request.contextPath}/users/getAuctionList" method="get">
                                <input type="text" placeholder="경매 상품을 검색하세요" name="searchWord">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
        <div class="container">
            <div class="row" >
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>경매</h2>
                        <div class="breadcrumb__option">
                            <span>경매</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5 scroll" style="height: 0px;">
					<div class="sidebar">
                        <div class="sidebar__item">
                            <h4>CATEGORY</h4>
                            <ul id="categoryMain">
                            </ul>
                        </div>

                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>fastest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                
                                    <div class="latest-prdouct__slider__item">
                                        <c:forEach var="i" begin="0" end="2">
                                        	<c:if test="${deadlineAuctionList.size() > i}">
	                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${deadlineAuctionList[i].applyId}">
	                                            <div class="latest-product__item__pic">
	                                                <img src="/cabbageMarketFile/deliveryImg/${deadlineAuctionList[i].imgName}" alt="" style="width: 110px; height: 110px;">
	                                            </div>
	                                            <div class="latest-product__item__text">
	                                            	<c:if test="${deadlineAuctionList[i].productName.length() > 9}">
	                                                	<h6>${deadlineAuctionList[i].productName.substring(0,8)}..</h6>
	                                                </c:if>
	                                                <c:if test="${deadlineAuctionList[i].productName.length() <= 9}">
	                                                	<h6>${deadlineAuctionList[i].productName}</h6>
	                                                </c:if>
	                                                <small style="color: black;">현재 입찰가</small>
	                                                <span><fmt:formatNumber value="${deadlineAuctionList[i].newPrice}" pattern="#,###" /></span>
	                                            </div>
	                                        </a>
	                                        </c:if>
										</c:forEach>
                                    </div>
                                    
                                    <c:if test="${deadlineAuctionList.size() > 2}">
	                                    <div class="latest-prdouct__slider__item">
	                                        <c:forEach var="i" begin="3" end="5">
	                                        	<c:if test="${deadlineAuctionList.size() > i}">
		                                        <a class="latest-product__item" href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${deadlineAuctionList[i].applyId}">
		                                            <div class="latest-product__item__pic">
		                                                <img src="/cabbageMarketFile/deliveryImg/${deadlineAuctionList[i].imgName}" alt="" style="width: 110px; height: 110px;">
		                                            </div>
		                                            <div class="latest-product__item__text">
		                                                <c:if test="${deadlineAuctionList[i].productName.length() > 9}">
		                                                	<h6>${deadlineAuctionList[i].productName.substring(0,8)}..</h6>
		                                                </c:if>
		                                                <c:if test="${deadlineAuctionList[i].productName.length() <= 9}">
		                                                	<h6>${deadlineAuctionList[i].productName}</h6>
		                                                </c:if>
		                                                <small style="color: black;">현재 입찰가</small>
		                                                <span><fmt:formatNumber value="${deadlineAuctionList[i].newPrice}" pattern="#,###" /></span>
		                                            </div>
		                                        </a>
		                                        </c:if>
											</c:forEach>
	                                    </div>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>



<!-- 입찰마감상품--></div>
<!-- 입찰마감상품-->   <div class="col-lg-9 col-md-7">
<!-- 입찰마감상품-->    <div class="product__discount">
<!-- 입찰마감상품-->        <div class="section-title product__discount__title">
<!-- 입찰마감상품-->            <h2>오늘 입찰마감 상품</h2>
<!-- 입찰마감상품-->        </div>
<!-- 입찰마감상품-->        <div class="row">
<!-- 입찰마감상품-->            <div class="product__discount__slider owl-carousel">
<!-- 입찰마감상품-->            	
<!-- 입찰마감상품-->            	<c:forEach var="al" items="${deadlineAuctionList}">
<!-- 입찰마감상품-->            	<c:if test="${al.datediff == 0}">
								<input name="deadlineProductNum" id="deadlineProductNum" type="hidden" value="${ deadlineAuctionList.size() }">
<!-- 입찰마감상품-->                <div class="col-lg-4">
<!-- 입찰마감상품-->                     <div class="product__discount__item">
<!-- 입찰마감상품-->                         <div class="product__discount__item__pic set-bg"
				                           data-setbg="/cabbageMarketFile/deliveryImg/${al.imgName}">
<!-- 입찰마감상품-->                             <div class="product__discount__percent">D-${al.datediff}</div>
<!-- 입찰마감상품-->                             <ul class="product__item__pic__hover">
<!-- 입찰마감상품-->                                 <li><a href="#"><i class="fa fa-heart"></i></a></li>
<!-- 입찰마감상품-->                                 <li><a href="#"><i class="fa fa-retweet"></i></a></li>
<!-- 입찰마감상품-->                                 <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
<!-- 입찰마감상품-->                             </ul>
<!-- 입찰마감상품-->                         </div>
<!-- 입찰마감상품-->                         <div class="product__discount__item__text">
<!-- 입찰마감상품-->                             <h5><a id="nameBtn">${al.productName}</a></h5>
<!-- 입찰마감상품-->                             <form id="getAuctionOneForm" action="${pageContext.request.contextPath}/users/getAuctionOne" method="post" enctype="multipart/form-data">
<!-- 입찰마감상품-->                             	<input type="hidden" id="applyId" name="applyId" value="${al.applyId }"/>
<!-- 입찰마감상품-->                             </form>
<!-- 입찰마감상품-->                             <div class="product__item__price"><fmt:formatNumber value="${al.newPrice}" pattern="#,###" /></div>
<!-- 입찰마감상품-->                             
<!-- 입찰마감상품-->                         </div>
<!-- 입찰마감상품-->                     </div>
<!-- 입찰마감상품-->                </div>
<!-- 입찰마감상품-->                </c:if>
<!-- 입찰마감상품-->                </c:forEach>
<!-- 입찰마감상품-->            </div>
<!-- 입찰마감상품-->        </div>
<!-- 입찰마감상품-->    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <form id="sortValueForm" action="${pageContext.request.contextPath}/users/getAuctionList" method="get" style="display:inline;">
	                                    <input type="hidden" name="searchWord" value="${searchWord}">
	                                    <input type="hidden" name="categoryMainId" value="${categoryMainId}">
	                                    <select id="sortValue" name="sortValue">
	                                    	<c:if test="${sortValue eq 0}">
	                                    		<option value="0" selected="selected">최근 등록순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 0}">
	                                    		<option value="0">최근 등록순</option>
	                                    	</c:if>
	                                    	
	                                    	<c:if test="${sortValue eq 1}">
	                                    		<option value="1" selected="selected">입찰가격 높은순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 1}">
	                                    		<option value="1">입찰가격 높은순</option>
	                                    	</c:if>
	                                    	
	                                    	<c:if test="${sortValue eq 2}">
	                                    		<option value="2" selected="selected">입찰가격 낮은순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 2}">
	                                    		<option value="2">입찰가격 낮은순</option>
	                                    	</c:if>
	                                    	
	                                    	<c:if test="${sortValue eq 3}">
	                                    		<option value="3" selected="selected">입찰마감 임박순</option>
	                                    	</c:if>
	                                    	<c:if test="${sortValue ne 3}">
	                                    		<option value="3">입찰마감 임박순</option>
	                                    	</c:if>
	                                    </select>
	                                </form>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6>상품 총<span>${total}</span>개</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<input name="ProductNum" id="ProductNum" type="hidden" value="${ auctionList.size() }">
                    	<c:forEach var="al" items="${auctionList}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="/cabbageMarketFile/deliveryImg/${al.imgName}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
								<div class="product__item__text">
                                   <h5><a href="${pageContext.request.contextPath}/users/getAuctionOne?applyId=${al.applyId}">${al.productName}</a></h5>
                                   <div class="product__item__text"> 현재 입찰가 : <fmt:formatNumber value="${al.price}" pattern="#,###" /> </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    
                    <!-- 페이징 -->
                    <div class="product__pagination">
                    	
                    	<c:if test="${currentPage > 1}">
				            <a href="${pageContext.request.contextPath}/users/getAuctionList?currentPage=${currentPage-1}&searchWord=${searchWord}">
				            	<i class="fa fa-long-arrow-left"></i>
				            </a>
				        </c:if>
				        
				        <c:forEach var="i" begin="1" end="10">
							<c:if test="${(pageSet*10)+i < lastPage+1}">
					            <a href="${pageContext.request.contextPath}/users/getAuctionList?currentPage=${(pageSet*10)+i}&searchWord=${searchWord}">
									${(pageSet*10)+i}
								</a>
							</c:if>
						</c:forEach>
		
				        <c:if test="${currentPage < lastPage}">
				            <a href="${pageContext.request.contextPath}/users/getAuctionList?currentPage=${currentPage+1}&searchWord=${searchWord}">
				            	<i class="fa fa-long-arrow-right"></i>
				            </a>
				        </c:if>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
    

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