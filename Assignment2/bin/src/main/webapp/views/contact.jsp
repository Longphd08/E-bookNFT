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
					<h1>Liên hệ với chúng tôi</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
						<a href="/contact">Liên hệ</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Contact Area =================-->
	<section class="contact_area section_gap_bottom">
		<div class="container">
			<div id="mapBox" class="mapBox" data-lat="40.701083" data-lon="-74.1522848" data-zoom="13" data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia."
			 data-mlat="40.701083" data-mlon="-74.1522848">
			</div>
			<div class="row">
				<div class="col-lg-3">
					<div class="contact_info">
						<div class="info_item">
							<i class="lnr lnr-home"></i>
							<h6>Hồ Chí Minh, Việt Nam</h6>
							
						</div>
						<div class="info_item">
							<i class="lnr lnr-phone-handset"></i>
							<h6><a href="#">00 (440) 9865 562</a></h6>
							<p>Mon to Fri 9am to 6 pm</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-envelope"></i>
							<h6><a href="#">bokonl@google.com</a></h6>
							<p>Gửi những thắc mắc của bạn bất cứ lúc nào!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<form class="row contact_form" action="" method="post" id="contactForm">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Nhập tên của bạn" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nhập tên của bạn'">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" id="email" name="email" placeholder="Nhập email của bạn" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nhập email của bạn'">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="subject" name="subject" placeholder="Nhập chủ đề" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nhập chủ đề'">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<textarea class="form-control" name="message" id="message" rows="1" placeholder="Nhập lời nhắn" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nhập lời nhắn'"></textarea>
							</div>
						</div>
						<div class="col-md-12 text-right">
							<button type="submit" value="submit" class="primary-btn">Gửi</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================Contact Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp" %>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp" %>
</body>
</html>