<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../views/commons/_taglib.jsp"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="../views/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Book Shop</title>
<%@include file="../views/commons/_head.jsp"%>
</head>

<body>
	<!-- Start Header Area -->
	<%@include file="../views/commons/_header.jsp"%>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Thanh toán</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a> <a href="/cart">Giỏ hàng<span
							class="lnr lnr-arrow-right"></span></a> <a href="/cart/checkout">Thanh toán</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Checkout Area =================-->
	<section class="checkout_area section_gap">
		<div class="container">
			<div class="cupon_area">
				<div class="check_title">
					<h2>Có mã khuyễn mãi?</h2>
				</div>
				<input type="text" placeholder="Nhập mã khuyến mãi"> <a class="tp_btn" href="#">Áp dụng</a>
			</div>
			<div class="billing_details">
				<div class="row">
					<form class="row contact_form" action="/cart/checkout" method="post" id="checkoutForm">
						<div class="col-lg-8">
							<h3>Chi tiết hóa đơn</h3>

							<div class="col-12 form-group p_star">
								<span>${message}</span>
							</div>
							<div class="col-12 form-group p_star">
								<label>Họ và tên</label> <input type="text" class="form-control" id="fullname" name="fullname"
									value="${sessionScope.account.fullname }" placeholder="Họ và tên">
							</div>
							<div class="col-12 form-group p_star">
								<label>Số điện thoại</label> <input type="text" class="form-control" id="number" name="phone"
									placeholder="Số điện thoại">
							</div>
							<div class="col-12 form-group p_star">
								<label>Email</label> <input type="text" class="form-control" id="email" name="email"
									value="${sessionScope.account.email}" placeholder="email">
							</div>

						</div>
						<div class="col-lg-4">
							<div class="order_box">
								<h2>Đơn hàng</h2>
								<ul class="list">
									<li><a href="#">Sản phẩm <span>Tổng</span></a></li>
									<c:forEach items="${cart}" var="item">
										<li><a href="#">${item.value.title} <span class="middle">${item.value.qty} </span> <span class="last"><fmt:formatNumber
														pattern="#,##0" value="${item.value.price * item.value.qty}" type="number" /> VND</span></a></li>
									</c:forEach>
								</ul>
								<ul class="list list_2">
									<li><a href="#">Tổng tiền <span>${amount}</span></a></li>
									<li><a href="#">Giảm giá <span> 0 VND</span></a></li>
									<li><a href="#">Thanh toán <span>${amount}</span></a></li>
								</ul>
								<div class="payment_item">
									<div class="radion_btn">
										<input type="radio" id="f-option5" name="selector"> <label for="f-option5">Momo</label> <img
											src="${path}/img/product/card.jpg" alt="">
										<div class="check"></div>
									</div>
									<p>Thanh toán bằng Momo</p>
								</div>
								<div class="payment_item active">
									<div class="radion_btn">
										<input type="radio" id="f-option6" name="selector"> <label for="f-option6">Tiền Mặt</label> <img
											src="${path}/img/product/card.jpg" alt="">
										<div class="check"></div>
									</div>
									<p>Thanh toán bằng tiền mặt</p>
								</div>
								<div class="creat_account">
									<input type="checkbox" id="f-option4" name="checked" value="true"> <label for="f-option4">Tôi đã học và
										đồng ý với </label> <a href="#">điều khoản và điều kiện*</a>
								</div>
								<a class="primary-btn" onclick="document.getElementById('checkoutForm').submit()">Tiến hành thanh toán</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp"%>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp"%>
</body>
</html>