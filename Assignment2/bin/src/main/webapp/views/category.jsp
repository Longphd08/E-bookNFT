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
					<h1>Tủ sách</h1>
					<nav class="d-flex align-items-center">
						<a href="/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
						<a href="/category">Tủ sách</span></a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Phân loại</div>
					<ul class="main-categories">
						<li class="main-nav-list"><a data-toggle="collapse" href="#novel" aria-expanded="false" aria-controls="novel"><span
								 class="lnr lnr-arrow-right"></span>Tiểu thuyết<span class="number">(53)</span></a>
							<ul class="collapse" id="novel" data-toggle="collapse" aria-expanded="false" aria-controls="novel">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
							</ul>
						</li>

						<li class="main-nav-list"><a data-toggle="collapse" href="#religious" aria-expanded="false" aria-controls="religious"><span
								 class="lnr lnr-arrow-right"></span>Tâm lý, tâm linh, tôn giáo<span class="number">(53)</span></a>
							<ul class="collapse" id="religious" data-toggle="collapse" aria-expanded="false" aria-controls="religious">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
							</ul>
						</li>
						<li class="main-nav-list"><a data-toggle="collapse" href="#artLiterature" aria-expanded="false" aria-controls="artLiterature"><span
								 class="lnr lnr-arrow-right"></span>Văn học nghệ thuật<span class="number">(53)</span></a>
							<ul class="collapse" id="artLiterature" data-toggle="collapse" aria-expanded="false" aria-controls="artLiterature">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
							</ul>
						</li>
						<li class="main-nav-list"><a data-toggle="collapse" href="#culture" aria-expanded="false" aria-controls="culture"><span
								 class="lnr lnr-arrow-right"></span>Văn hóa xã hội - lịch sử<span class="number">(53)</span></a>
							<ul class="collapse" id="culture" data-toggle="collapse" aria-expanded="false" aria-controls="culture">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">Bộ lọc tủ sách</div>
					<div class="common-filter">
						<div class="head">Nhà xuất bản</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">Nhà Xuất Bản Giáo Dục<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">Nhà Xuất Bản Kim Đồng<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">Nhà Xuất Bản Trẻ<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">Nhà Xuất Bản Tp HCM<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Nhà Xuất Bản Hội Nhà Văn<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Nhà Xuất Bản Tư Pháp<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Nhà Xuất Bản Lao Động<span>(19)</span></label></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">Mặc định</option>
							<option value="1">Bán chạy</option>
							<option value="1">Mới</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">Mặc định</option>
							<option value="1">Giá tăng dần</option>
							<option value="1">Giá giảm dần</option>
						</select>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid1" src="${path}/img/category/hoang-tu-be.jpg" alt="">
								<div class="product-details">
									<h6>HOÀNG TỬ BÉ</h6>
									<div class="price">
										<h6>139.000 vnd</h6>
										<h6 class="l-through">150.000 vnd</h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info">
											<span class="ti-bag"></span>
											<p class="hover-text">Thêm vào giỏ</p>
										</a>
										<a href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p class="hover-text">Xem chi tiết</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid1" src="${path}/img/category/hoa-troi-tren-song-nuoc.jpg" alt="">
								<div class="product-details">
									<h6>HOA TRÔI TRÊN SÔNG NƯỚC</h6>
									<div class="price">
										<h6>59.000 vnd</h6>
										<h6 class="l-through">70.000 vnd</h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info">
											<span class="ti-bag"></span>
											<p class="hover-text">Thêm vào giỏ</p>
										</a>
										<a href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p class="hover-text">Xem chi tiết</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid1" src="${path}/img/category/khong-gia-dinh.jpg" alt="">
								<div class="product-details">
									<h6>KHÔNG GIA ĐÌNH</h6>
									<div class="price">
										<h6>145.000 vnd</h6>
										<h6 class="l-through">180.000 vnd</h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info">
											<span class="ti-bag"></span>
											<p class="hover-text">Thêm vào giỏ</p>
										</a>
										<a href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p class="hover-text">Xem chi tiết</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid1" src="${path}/img/category/huyen-thuat-va-cac-dao-si-Tay_tang.jpg" alt="">
								<div class="product-details">
									<h6>HUYỄN THUẬT VÀ CÁC ĐẠO SĨ TÂY TẠNG</h6>
									<div class="price">
										<h6>95.000 vnd</h6>
										<h6 class="l-through">110.000 vnd</h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info">
											<span class="ti-bag"></span>
											<p class="hover-text">Thêm vào giỏ</p>
										</a>
										<a href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p class="hover-text">Xem chi tiết</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid1" src="${path}/img/category/luoc-su-ve-loai-nguoi.jpg" alt="">
								<div class="product-details">
									<h6>LƯỢC SỬ LOÀI NGƯỜI</h6>
									<div class="price">
										<h6>55.000 vnd</h6>
										<h6 class="l-through">75.000 vnd</h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info">
											<span class="ti-bag"></span>
											<p class="hover-text">Thêm vào giỏ</p>
										</a>
										<a href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p class="hover-text">Xem chi tiết</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid1" src="${path}/img/category/nhung-nguoi-khon-kho.jpg" alt="">
								<div class="product-details">
									<h6>NHŨNG NGƯỜI KHỐN KHÓ</h6>
									<div class="price">
										<h6>310.000 vnd</h6>
										<h6 class="l-through">400.000 vnd</h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info">
											<span class="ti-bag"></span>
											<p class="hover-text">Thêm vào giỏ</p>
										</a>
										<a href="" class="social-info">
											<span class="lnr lnr-move"></span>
											<p class="hover-text">Xem chi tiết</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="pagination">
						<a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
						<a href="#" class="active">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
						<a href="#">6</a>
						<a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
					</div>
				</div>
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