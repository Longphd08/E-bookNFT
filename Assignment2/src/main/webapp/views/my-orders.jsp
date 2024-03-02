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
					<h1>Đơn hàng của tôi</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a> <a href="/user/orders">Đơn hàng của tôi</a>
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
								<th scope="col">Mã đơn hàng</th>
								<th scope="col">Ngày mua</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orders}" var="order">
								<tr>
									<td>
										<h5>${order.id}</h5>
									</td>
									<td>
										<h5>
											<fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy" />
										</h5>
									</td>
									<td>
										<h5>
											<fmt:formatNumber pattern="#,##0" value="${order.getTotal()}" type="number" />
										</h5>
									</td>
									<td><a href="/user/orders/order-detail?id=${order.id}" class="text-danger">Chi tiết</a></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!--================End Cart Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp"%>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp"%>
</body>
</html>