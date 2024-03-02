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
					<h1>Tủ sách của tôi</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
						<a href="/user/my-bookshelf">Tủ sách của tôi</span></a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12">
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
						<c:forEach items="${page.content}" var="b">
							<div class="col-lg-4 col-md-6">
								<div class="single-product">
									<img class="img-fluid" src="${path}/img/category/${b.book.picturePath}" alt="" style="height: 511.44px;">
									<div class="product-details">
										<h6>${b.book.title}</h6>
										<div class="prd-bottom">
											</a> <a href="/user/my-bookshelf/ReadBook?id=${b.book.id}" class="social-info"> <span class="lnr lnr-move"></span>
												<p class="hover-text">Đọc sách</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</section>
				<!-- Start Filter Bar -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${page.number == 0}">
							<li class="page-item disabled"><a href="/user/my-bookshelf?p=0}" class="page-link"><i class="ti ti-angle-double-left"></i></a></li>
							<li class="page-item disabled"><a href="/user/my-bookshelf?p=0" class="page-link"><i class="ti ti-angle-left"></i></a></li>
						</c:if>
						<c:if test="${page.number != 0}">
							<li class="page-item"><a href="/user/my-bookshelf?p=0" class="page-link"><i class="ti ti-angle-double-left"></i></a></li>
							<li class="page-item"><a href="/user/my-bookshelf?p=${page.number-1}" class="page-link" href="#"><i
									class="ti ti-angle-left"></i></a></li>
						</c:if>
						<c:if test="${page.number == page.totalPages-1}">
							<li class="page-item disabled"><a href="/user/my-bookshelf?p=${page.totalPages-1}" class="page-link" href="#"><i
									class="ti ti-angle-right"></i></a></li>
							<li class="page-item disabled"><a href="/user/my-bookshelf?p=${page.totalPages-1}" class="page-link" href="#"><i
									class="ti ti-angle-double-right"></i></a></li>
						</c:if>
						<c:if test="${page.number != page.totalPages-1}">
							<li class="page-item"><a href="/user/my-bookshelf?p=${page.number+1}" class="page-link" href="#"><i
									class="ti ti-angle-right"></i></a></li>
							<li class="page-item"><a href="/user/my-bookshelf?p=${page.totalPages-1}" class="page-link" href="#"><i
									class="ti ti-angle-double-right"></i></a></li>
						</c:if>
					</ul>
				</nav>
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp" %>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp" %>
</body>
</html>