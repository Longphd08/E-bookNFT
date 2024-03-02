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
					<h1>Đăng nhập</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
						<a href="/user/login">Đăng nhập</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="${path}/img/login.jpg" alt="">
						<div class="hover">
							<h4>Thành viên mới?</h4>
							<p>Hãy nhanh chóng trở thành thành viên để được thưởng thức những đầu sách ấn tượng</p>
							<a class="primary-btn" href="/user/registration">Tạo tài khoản</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Đăng nhập</h3>
						<form class="row login_form" action="/user/login" method="post" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="username" name="username" placeholder="Tên đăng nhập" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tên đăng nhập'">
								<p class="text-danger mt-1">${usernameError}</p>
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mật khẩu'">
								<p class="text-dange mt-1r">${passwordError}</p>
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="remember">
									<label for="f-option2">Lưu mật khẩu</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<!-- Nhớ chỉnh lại chỗ này khi code -->
								<button type="submit" class="primary-btn">Đăng nhập</button>
								<a href="/user/forgot-password">Quên mật khẩu?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp" %>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp" %>
</body>
</html>