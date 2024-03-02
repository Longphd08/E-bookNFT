<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../views/commons/_taglib.jsp" %>
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
<%@include file="../views/commons/_head.jsp" %>
</head>

<body>
	<!-- Start Header Area -->
	<%@include file="../views/commons/_header.jsp" %>
	<!-- End Header Area -->
	
	<!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Thanh toán</h1>
                    <nav class="d-flex align-items-center">
                        <a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
                        <a href="/cart">Giỏ hàng<span class="lnr lnr-arrow-right"></span></a>
                        <a href="/cart/checkout">Thanh toán</a>
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
                    <h2>Có mã khuyễn mãi? </h2>
                </div>
                <input type="text" placeholder="Nhập mã khuyến mãi">
                <a class="tp_btn" href="#">Áp dụng</a>
            </div>
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>Chi tiết hóa đơn</h3>
                        <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                            <div class="col-12 form-group p_star">
                                <input type="text" class="form-control" id="fullname" name="fullname">
                                <span class="placeholder" data-placeholder="Họ và tên"></span>
                            </div>
                            <div class="col-12 form-group p_star">
                                <input type="text" class="form-control" id="number" name="phone">
                                <span class="placeholder" data-placeholder="Số điện thoại"></span>
                            </div>
                            <div class="col-12 form-group p_star">
                                <input type="text" class="form-control" id="email" name="email">
                                <span class="placeholder" data-placeholder="Địa chỉ email"></span>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>Đơn hàng</h2>
                            <ul class="list">
                                <li><a href="#">Sản phẩm <span>Tổng</span></a></li>
                                <li><a href="#">Fresh Blackberry <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                                <li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                                <li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                            </ul>
                            <ul class="list list_2">
                                <li><a href="#">Tổng tiền <span>$2160.00</span></a></li>
                                <li><a href="#">Giảm giá <span> $50.00</span></a></li>
                                <li><a href="#">Thanh toán <span>$2210.00</span></a></li>
                            </ul>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="selector">
                                    <label for="f-option5">Momo</label>
                                    <img src="${path}/img/product/card.jpg" alt="">
                                    <div class="check"></div>
                                </div>
                                <p>Thanh toán bằng Momo</p>
                            </div>
                            <div class="payment_item active">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option6" name="selector">
                                    <label for="f-option6">Paypal </label>
                                    <img src="${path}/img/product/card.jpg" alt="">
                                    <div class="check"></div>
                                </div>
                                <p>Thanh toán bằng Paypal; bạn có thể thanh toán bằng thẻ thanh toán quốc tế nếu không có tài khoản Paypal</p>
                            </div>
                            <div class="creat_account">
                                <input type="checkbox" id="f-option4" name="selector">
                                <label for="f-option4">Tôi đã học và đồng ý với </label>
                                <a href="#">điều khoản và điều kiện*</a>
                            </div>
                            <a class="primary-btn" href="/cart/confirmation">Tiến hành thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp" %>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp" %>
</body>
</html>