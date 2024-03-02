<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../views/commons/_taglib.jsp"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Thông tin cá nhân</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
						<a href="/user">Thông tin cá nhân</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Personal Info Box Area =================-->
	<section class="login_box_area section_gap">
		<div class="container">
			<div class="login_form_inner">
				<h2>Thông tin cá nhân</h2>
				<form class="row login_form" action="" id="contactForm" enctype="multipart/form-data">

					<div class="col-md-12 form-group">
						<input type="text" class="form-control" id="fullname"
							name="fullname" placeholder="Họ và tên"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Họ và tên'">
					</div>
					<div class="col-md-12 form-group">
						<div class="form-group">
						Thêm Ảnh <input name="picture" type="file" class="form-control" id="picture"/>							
						</div>
					</div>
					<div class="col-md-12 form-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Mật khẩu xác nhận"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Mật khẩu xác nhận'">
					</div>
					</tbody>
					<div class="col-md-12 form-group">
						<button type="submit" class="primary-btn"
							>Cập nhật</button>
					</div>
				</form>
			</div>
		</div>

	</section>
	<!--================Personal Info Box Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp"%>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp"%>
</body>
</html>