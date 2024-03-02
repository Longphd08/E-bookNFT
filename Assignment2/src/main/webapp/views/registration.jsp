<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../views/commons/_taglib.jsp"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
					<h1>Đăng ký</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a> <a href="/user/registration">Đăng ký</a>
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
							<h4>Đã có tài khoản?</h4>
							<p>Hãy nhanh chóng đăng nhập để có thể hưởng thụ những đầu sách mới!</p>
							<a class="primary-btn" href="/user/login">Đăng nhập</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Đăng ký</h3>
						<form:form class="row login_form" action="/user/registration" method="post" id="contactForm" modelAttribute="account">
							<div>${messge}</div>
							<div class="col-md-12 form-group">
								<form:input type="text" class="form-control" id="email" path="email" placeholder="Email" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Email'" />
								<form:errors path="email" cssClass="form-text text-danger" />
							</div>
							<div class="col-md-12 form-group">
								<form:input type="text" class="form-control" id="fullname" path="fullname" placeholder="Họ và tên"
									onfocus="this.placeholder = ''" onblur="this.placeholder = 'Họ và tên'" />
								<form:errors path="fullname" cssClass="form-text text-danger" />
							</div>
							<div class="col-md-12 form-group">
								<form:input type="password" class="form-control" id="password" path="password" placeholder="Mật khẩu"
									onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mật khẩu'" />
								<form:errors path="password" cssClass="form-text text-danger" />
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="passwordConfirmation" name="passwordConfirmation"
									placeholder="Xác nhận mật khẩu" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Xác nhận mật khẩu'" />
								<span cssClass="form-text text-danger">${passwordConfirmationMessage}</span>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">Đăng ký</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp"%>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp"%>
</body>
</html>