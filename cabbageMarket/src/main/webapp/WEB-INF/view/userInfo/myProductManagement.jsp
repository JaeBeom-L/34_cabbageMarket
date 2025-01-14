<!-- 작성자 : 이재범 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link data-n-head="ssr" rel="icon" data-hid="favicon-32" type="image/png" size="32" href="https://img.icons8.com/officel/480/cabbage.png">
	<title>내 상품 관리</title>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<!-- Humberger End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${pageContext.request.contextPath}/template/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원정보</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/index">Home</a> <span>Cabbage Market</span>
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
				<div class="col-lg-2 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Department</h4>
							<ul style="font-weight: bolder;">
								<li><a href="${pageContext.request.contextPath}/users/userInfo">회원정보</a></li>
								<li><a href="${pageContext.request.contextPath}/users/registedProduct">등록상품</a></li>
								<li><a href="${pageContext.request.contextPath}/users/userPointHistory">포인트 사용 조회</a></li>
								<li><a href="${pageContext.request.contextPath}/users/buyingList">구매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/sellList">판매 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/biddingList">입찰 내역</a></li>
								<li><a href="${pageContext.request.contextPath}/users/myProductManagement">내 상품 관리</a></li>
								<li><a href="${pageContext.request.contextPath}/users/shippingAddress">배송지 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-10 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>내 상품 관리</h2>
						</div>
						<div>
							<div class="col-md-12">
								<a href="${pageContext.request.contextPath}/users/addApplyProductSalesDelivery" class="primary-btn cart-btn">안전거래 신청</a>
								<div class="card">
									<div class="card-body">
										<table class="table table-hover" style="text-align: center">
				                            <thead>
				                                <tr>
				                                	<th>
				                                		순번
				                                	</th>
				                                	<th>
				                                		이미지
				                                	</th>
				                                    <th>
				                                    	카테고리
				                                    </th>
				                                    <th>
				                                    	제품명
				                                    </th>
				                                    <th>
				                                    	등록
				                                    </th>
				                                    <th>
				                                    	반송
				                                    </th>
				                                </tr>
				                            </thead>
					                            
				                            <tbody>
				                            	<c:set var="index" value = "0"/>
				                            	<c:forEach var="apsdl" items="${applyProductSalesDeliveryList}">
					                                <tr>
					                                	<td>
					                                		${index = index+1}
					                                	</td>
					                                    <td>
					                                        <img src="/cabbageMarketFile/deliveryImg/${apsdl.imgName}" width="70px" height="50px">
					                                    </td>
					                                    <td>
					                                    	<h5>${apsdl.categorySubName}</h5>
					                                    </td>
					                                    <td width="300px">
					                                    	<h5>${apsdl.productName}</h5>
					                                    </td>
					                                    <td>
					                                    	<c:if test="${apsdl.registrationState == '9등록가능'}">
						                                        <a href="${pageContext.request.contextPath}/users/addAuction?applyId=${apsdl.applyProductSalesDeliveryId}" class="btn btn-outline-success">경매등록</a>
						                                        <a href="${pageContext.request.contextPath}/users/addUsedProduct?applyId=${apsdl.applyProductSalesDeliveryId}" class="btn btn-outline-success">중고등록</a>
					                                        </c:if>
					                                        <c:if test="${apsdl.registrationState != '9등록가능'}">
						                                        심사중&nbsp;<div class="spinner-border text-muted"></div>
					                                        </c:if>
					                                    </td>
					                                    <td>
					                                    	<c:if test="${apsdl.registrationState == '9등록가능'}">
					                                    		<a href="${pageContext.request.contextPath}/users/modifyApplyProductSalesDeliveryReturn?applyId=${apsdl.applyProductSalesDeliveryId}"><span class="icon_refresh"></span></a>
					                                    	</c:if>
					                                    </td>
					                                </tr>
				                                </c:forEach>
				                            </tbody>
				                        </table>
			                        </div>
			                 	</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/footer.jsp" />
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