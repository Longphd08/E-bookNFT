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
					<h1>Bìa sách</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
						<a href="/category">Tủ sách<span class="lnr lnr-arrow-right"></span></a>
						<a href="/product?id=${book.id}">Bìa sách</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid"
								src="${path}/img/category/${book.picturePath}" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid"
								src="${path}/img/category/${book.picturePath}" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid"
								src="${path}/img/category/${book.picturePath}" alt="">
						</div>					
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${book.title}</h3>
						<h2>
							<fmt:formatNumber value="${book.price}" type="number"
								pattern="#,##0" />
							VND
						</h2>
						<ul class="list">
							<li><span>Phân loại: </span>${book.category.name}</li>
						</ul>
						<ul class="list">
							<li><span>Còn lại: </span>${book.qty}</li>
						</ul>
						<p>${introduction}</p>
						<div class="product_count">
							<label for="qty">Số Lượng:</label> <input type="number"
								name="qty" id="sst" max="${book.qty}" min="1" value="1"
								title="Quantity:" class="input-text qty">
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst < ${book.qty }) result.value++;return false;"
								class="increase items-count" type="button">
								<i class="lnr lnr-chevron-up"></i>
							</button>
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 1 ) result.value--;return false;"
								class="reduced items-count" type="button">
								<i class="lnr lnr-chevron-down"></i>
							</button>
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="primary-btn" href="/cart/add?id=${book.id}&path=product">Thêm vào giỏ hàng</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">Giới thiệu</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">Thông tin</a></li>
				<li class="nav-item"><a class="nav-link" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">Bình luận</a></li>
				<li class="nav-item"><a class="nav-link " id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">Nhận xét</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>${introduction}</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>Nhà xuất bản</h5>
									</td>
									<td>
										<h5>${book.publisher.name}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>Tác gỉả</h5>
									</td>
									<td>
										<h5>${book.author.name}</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-3.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Đăng bình luận</h4>
								<form class="row contact_form" action="" method="post"
									id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name"
												placeholder="Tên của bạn">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email"
												name="email" placeholder="Địa chỉ email">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message"
												rows="1" placeholder="Nhận xét"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn primary-btn">Đăng</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Trung bình</h5>
										<h4>4.0</h4>
										<h6>(03 Nhận xét)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Dựa trên 3 nhận xét</h3>
										<ul class="list">
											<li><a href="#">5 Sao <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">4 Sao <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">3 Sao <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">2 Sao <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">1 Sao <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-3.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Thêm nhận xét</h4>
								<p>Đánh giá của bạn:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<p>Tuyệt với</p>
								<form class="row contact_form" action="" method="post"
									id="contactForm">
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message"
												rows="1" placeholder="Nhận xét"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Nhận xét'"></textarea>
											</textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="primary-btn">Nhận
											Xét Ngay</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!-- Start footer Area -->
	<%@include file="../views/commons/_footer.jsp"%>
	<!-- End footer Area -->
	<%@include file="../views/commons/_jsFiles.jsp"%>
</body>
</html>