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
                    <h1>Giỏ hàng</h1>
                    <nav class="d-flex align-items-center">
                        <a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
                        <a href="/cart">Giỏ hàng</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="${path}/img/category/tram-nam-nhin-lai.jpg" alt="" style="height: 150px; width: auto">
                                        </div>
                                        <div class="media-body">
                                            <p>TRĂM NĂM NHÌN LẠI</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>150.000 VND</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Số lượng:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <h5>150.000 VND</h5>
                                </td>
                            </tr>
                            <tr class="bottom_button">
                                <td>
                                    <a class="gray_btn" href="#">Cập nhật</a>
                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td colspan="1">
                                    <div class="cupon_text d-flex align-items-center">
                                        <input type="text" placeholder="Mã giảm giá">
                                        <a class="primary-btn" href="#">Áp dụng</a>
                                        <a class="gray_btn" href="#">Xóa mã</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Tổng tiền</h5>
                                </td>
                                <td>
                                    <h5>150.000 VND</h5>
                                </td>
                            </tr>
                            <tr class="out_button_area">
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="/category">Tiếp tục mua hàng</a>
                                        <a class="primary-btn" href="/cart/checkout">Thanh toán</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp" %>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp" %>
	
</body>
</html>