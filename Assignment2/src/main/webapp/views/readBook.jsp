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
	<%@include file="../views/commons/_header2.jsp"%>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Tủ sách của tôi</h1>
					<nav class="d-flex align-items-center">
						<a href="/user/my-bookshelf">Tủ Sách của tôi<span
							class="lnr lnr-arrow-right"></span></a> <a>Dọc Sách</span></a>
					</nav>
				</div>
			</div>
		</div>
	</section>

	<div>
		<embed src="${path}/pdf/${pdfPath}" width="100%" height="600px" type="application/pdf" />
	</div>
</body>