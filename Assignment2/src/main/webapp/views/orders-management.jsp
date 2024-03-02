<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../views/commons/_taglib-admin.jsp"%>
<%@ page import="com.poly.dao.OrdersDAO"%>
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
									Xin chào Admin, <span>chúc bạn một ngày tốt lành!</span>
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
					<div class="row d-flex justify-content-center">
						<div class="col-12 col-sm-8">
							<div class="card rounded-5">
								<div class="card-title mb-3">
									<h4 class="text-center align-content-center">Quản lý đơn hàng</h4>
								</div>
								<div class="card-body">
									<div class="basic-form">
										<form:form id="form" action="/admin/orders-management" method="post" modelAttribute="order">
											<div class="form-group">
												<label>Mã đơn</label> <input readonly="readonly" value="${order.id}" type="text" name="id" class="form-control input-default"
													placeholder="Mã đơn hàng" />
											</div>
											<div class="form-group">
												<label>Mã người mua</label>
												<form:input readonly="readonly" type="text" path="account.id" class="form-control input-default"
													placeholder="Mã người mua" />
											</div>
											<div class="form-group">
												<label>Số điện thoại</label>
												<form:input type="text" path="phone" class="form-control input-default" placeholder="Số điện thoại" />
											</div>
											<div class="form-group">
												<label>Ngày thanh toán</label>
												<form:input type="date" path="orderDate" class="form-control input-default" />
											</div>
											<div class="form-group">
												<label for="" class="mr-3">Trạng thái: </label>
												<div class="form-check form-check-inline">
													<form:radiobutton path="isActive" class="form-check-input" id="inlineRadio1" value="true" checked="checked" />
													<label class="form-check-label" for="inlineRadio1">Có hiệu lực</label>
												</div>
												<div class="form-check form-check-inline">
													<form:radiobutton path="isActive" class="form-check-input" id="inlineRadio2" value="false" />
													<label class="form-check-label" for="inlineRadio2">Vô hiệu hóa</label>
												</div>
											</div>
											<div class="">
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/orders-management">Mới</button>
												<button type="button" class="btn btn-warning mr-2" formaction="/admin/orders-management/create">Thêm</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/orders-management/update"
													onclick="return confirmSubmit()">Sửa</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/orders-management/delete"
													onclick="return confirmSubmit()">Xóa</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row d-flex justify-content-center ">
						<div class="col-12 col-sm-11">
							<form action="">
								<div class="input-group mb-3">
									<input type="text" name="find" class="form-control" placeholder="Tìm kiếm theo tên" aria-label="Find fullname"
										aria-describedby="button-addon2">
									<button class="btn btn-outline-warning" type="button" id="button-addon2">
										<i class="ti-search"></i>
									</button>
								</div>
							</form>
							<div class="card">
								<div class="card-title">
									<h4>Danh sách</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover ">
											<thead>
												<tr>
													<th>Mã đơn hàng</th>
													<th>Họ và tên người mua</th>
													<th>Số điện thoại</th>
													<th>Ngày thanh toán</th>
													<th>Tổng tiền</th>
													<th>Trạng thái</th>
													<th></th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${page.content}" var="order">
													<tr>
														<th scope="row">${order.id}</th>
														<td>${order.account.fullname}</td>
														<td>${order.phone}</td>
														<td>${order.orderDate}</td>
														<td><fmt:formatNumber value="${order.getTotal()}" type="number" pattern="#,##0" /> VND</td>
														<c:if test="${order.isActive}">
															<td><span class="badge badge-success">Đang hiệu lực</span></td>
														</c:if>
														<c:if test="${!order.isActive}">
															<td><span class="badge badge-danger">Vô hiệu hóa</span></td>
														</c:if>
														<td><a href="/admin/orders-management/edit?id=${order.id}"><i class="ti ti-pencil"></i></a></td>
														<td><a href="/admin/orders-management/details?id=${order.id}">Chi tiết</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<c:if test="${page.number == 0}">
													<li class="page-item disabled"><a href="/admin/orders-management/page?p=0" class="page-link"><i
															class="ti ti-angle-double-left"></i></a></li>
													<li class="page-item disabled"><a href="/admin/orders-management/page?p=0" class="page-link"><i
															class="ti ti-angle-left"></i></a></li>
												</c:if>
												<c:if test="${page.number != 0}">
													<li class="page-item"><a href="/admin/orders-management/page?p=0" class="page-link"><i
															class="ti ti-angle-double-left"></i></a></li>

													<li class="page-item"><a href="/admin/orders-management/page?p=${page.number-1}" class="page-link" href="#"><i
															class="ti ti-angle-left"></i></a></li>
												</c:if>
												<c:if test="${page.number == page.totalPages-1}">
													<li class="page-item disabled"><a href="/admin/orders-management/page?p=${page.totalPages-1}"
														class="page-link" href="#"><i class="ti ti-angle-right"></i></a></li>
													<li class="page-item disabled"><a href="/admin/orders-management/page?p=${page.totalPages-1}"
														class="page-link" href="#"><i class="ti ti-angle-double-right"></i></a></li>
												</c:if>
												<c:if test="${page.number != page.totalPages-1}">
													<li class="page-item"><a href="/admin/orders-management/page?p=${page.number+1}" class="page-link" href="#"><i
															class="ti ti-angle-right"></i></a></li>
													<li class="page-item"><a href="/admin/orders-management/page?p=${page.totalPages-1}" class="page-link"
														href="#"><i class="ti ti-angle-double-right"></i></a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${not empty details}">
						<div class="row d-flex justify-content-center ">
							<div class="col-12 col-sm-11">
								<div class="card">
									<div class="card-title">
										<h4>Chi tiết đơn hàng</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-hover ">
												<thead>
													<tr>
														<th>Mã</th>
														<th>Mã đơn hàng</th>
														<th>Tên sách</th>
														<th>Số lượng</th>
														<th>Giá tiền</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${details }" var="item">
														<tr>
															<th scope="row">${item.id}</th>
															<td>${item.order.id}</td>
															<td>${item.book.title}</td>
															<td>${item.qty}</td>
															<td><fmt:formatNumber value="${item.price}" type="number" pattern="#,##0" /> VND</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
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
	<script type="text/javascript">
		function confirmSubmit() {
			var agree = confirm("Bạn có chắc chắn muốn thực hiện không? Hành động của bạn sẽ không thể làm lại.");
			if (agree)
				return true;
			else
				return false;
		}
	</script>
</body>

</html>
