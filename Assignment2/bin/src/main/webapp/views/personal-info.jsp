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
				<form class="row login_form" action="" id="contactForm">
					<table class="table">
						<tbody>
							<tr>
								<td colspan="2"><img
									src="${path}/img/category/nhagiakim_3.jpg"
									class="rounded-circle" style="width: 150px; height: 140px;" alt="Avatar" /></td>
							</tr>
							<tr>
								<td>
									<h5 style="font-family: 'Roboto', sans-serif;">Họ và tên</h5>
								</td>
								<td>
									<h5 style="font-family: 'Roboto', sans-serif;">Nhóm 7</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5 style="font-family: 'Roboto', sans-serif;">Email</h5>
								</td>
								<td>
									<h5 style="font-family: 'Roboto', sans-serif;">nhom7@gmail.com</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5 style="font-family: 'Roboto', sans-serif;">Mật khẩu</h5>
								</td>
								<td>
									<h5 style="font-family: 'Roboto', sans-serif;">**********</h5>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="col-md-12 form-group mb-3">
						<button type="submit" class="primary-btn mb-2"
							formaction="/user/updateprofile">Cập nhật tài khoản</button>
						<button type="submit" class="primary-btn"
							formaction="/user/changepassword">Đổi mật khẩu</button>
					</div>
					<div class="col-md-12 form-group">
						Trong trường hợp muốn đổi email, vui lòng liên hệ với chúng tôi qua email bokonldnl@gmail.com
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