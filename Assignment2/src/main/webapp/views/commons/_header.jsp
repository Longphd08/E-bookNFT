<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="/home"><img src="${path}/img/banner/logo.jpg" alt="" style="width: 150px;"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="/home">Trang chủ</a></li>
							<li class="nav-item submenu dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Nhà sách</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="/category">Tủ sách</a></li>
								</ul></li>
							<c:if test="${not empty sessionScope.account}">
								<li class="nav-item submenu dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">Tủ sách của bạn</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="/user/my-bookshelf">Tủ sách của bạn</a></li>
										<li class="nav-item"><a class="nav-link" href="/user/orders">Danh sách đơn hàng</a></li>
									</ul></li>
							</c:if>
							<li class="nav-item"><a class="nav-link" href="/contact">Liên hệ</a></li>
							<c:if test="${not empty sessionScope.account}">
								<li class="nav-item submenu dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false">Thông tin tài khoản</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="/user">Thông tin</a></li>
										<li class="nav-item"><a class="nav-link" href="/user/change-password">Đổi mật khẩu</a></li>
									</ul></li>
								<li class="nav-item"><a class="nav-link" href="/user/logout">Đăng xuất</a></li>
							</c:if>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><c:if test="${empty sessionScope.account}">
									<a href="/user/login" class="cart"><span class="ti-user"></span></a>
								</c:if><c:if test="${not empty sessionScope.account}">
									<a href="/user" class="cart"><span class="ti-user"></span></a>
								</c:if></li>
							<li class="nav-item"><a href="/cart" class="cart"><span class="ti-bag"></span></a></li>
							<li class="nav-item">
								<button class="search">
									<span class="lnr lnr-magnifier" id="search"></span>
								</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input" placeholder="Tìm Kiếm...">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
</body>
</html>