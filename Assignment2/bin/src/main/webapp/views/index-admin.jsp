<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/commons/_taglib-admin.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- theme meta -->
<meta name="theme-name" content="focus" />
<title>Quản trị</title>
<%@ include file="../views/commons/_head-admin.jsp"%>
</head>

<body>
	<!-- Header -->
	<%@ include file="../views/commons/_header-admin.jsp"%>
	<!-- End Header -->

	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
								<h1>
									Xin chào Nhóm 7, <span>chúc bạn một ngày tốt lành!</span>
								</h1>
							</div>
						</div>
					</div>
					<!-- /# column -->
					<div class="col-lg-4 p-l-0 title-margin-left">
						<div class="page-header">
							<div class="page-title">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active">Trang chủ</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /# row -->
				<section id="main-content">
					<div class="row">
						<div class="col-lg-3">
							<div class="card">
								<div class="stat-widget-one">
									<div class="stat-icon dib">
										<i class="ti-money color-success border-success"></i>
									</div>
									<div class="stat-content dib">
										<div class="stat-text">Total Profit</div>
										<div class="stat-digit">1,012</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-title">
									<h4>Doanh thu theo loại</h4>
								</div>
								<div class="card-body">
									<form action="">
										<div class="input-group mb-3">
											<input type="text" name="find" class="form-control"
												placeholder="Tìm kiếm theo tên" aria-label="Find fullname"
												aria-describedby="button-addon2">
											<button class="btn btn-outline-warning" type="button"
												id="button-addon2">
												<i class="ti-search"></i>
											</button>
										</div>
									</form>
									<div class="table-responsive">
										<table class="table table-hover ">
											<thead>
												<tr>
													<th>#</th>
													<th>Loại sách</th>
													<th>Số lượng đơn</th>
													<th>Tổng doanh thu</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">1</th>
													<td>Tiểu thuyết</td>
													<td>100</td>
													<td><span class="badge badge-success">10.000.000
															VNĐ</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="card">
								<div class="card-title">
									<h4>Doanh thu sách</h4>
								</div>
								<div class="card-body">
									<form action="">
										<div class="input-group mb-3">
											<input type="text" name="find" class="form-control"
												placeholder="Tìm kiếm theo tên" aria-label="Find fullname"
												aria-describedby="button-addon2">
											<button class="btn btn-outline-warning" type="button"
												id="button-addon2">
												<i class="ti-search"></i>
											</button>
										</div>
									</form>
									<div class="table-responsive">
										<table class="table table-hover ">
											<thead>
												<tr>
													<th>#</th>
													<th>Mã sách</th>
													<th>Tên sách</th>
													<th>Số lượng đơn</th>
													<th>Tổng doanh thu</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">1</th>
													<th >1</th>
													<td>Người bất tử</td>
													<td>100</td>
													<td><span class="badge badge-success">10.000.000
															VNĐ</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<div class="footer">
								<p>2023 © Admin Board.</p>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<%@ include file="../views/commons/_jsFiles-admin.jsp"%>
</body>

</html>
