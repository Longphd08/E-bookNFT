<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
									<h4 class="text-center align-content-center">Quản lý admin</h4>
								</div>
								<div class="card-body">
									<div class="basic-form">
										<form:form id="form" action="/admin/admin-management" method="post" enctype="multipart/form-data"
											modelAttribute="admin">
											<label class="mb-3">${message}</label>
											<div class="form-group">
												<label>ID</label> <input type="text" value="${admin.id}" name="id" class="form-control input-default"
													placeholder="ID" readonly="readonly" />
											</div>
											<div class="form-group">
												<label>Tên tài khoản</label>
												<form:input type="text" path="username" class="form-control input-default" placeholder="Tên tài khoản" />
												<form:errors path="username" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Mật khẩu</label>
												<form:password class="form-control input-default" placeholder="Mật khẩu" path="password" showPassword="true" />
												<form:errors path="password" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Họ và tên</label>
												<form:input path="fullname" class="form-control input-default" placeholder="Họ và tên" />
												<form:errors path="fullname" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Email</label>
												<form:input path="email" class="form-control input-default" placeholder="Email" />
												<form:errors path="email" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Số điện thoại</label>
												<form:input path="phone" class="form-control input-default" placeholder="Số điện thoại" />
												<form:errors path="phone" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Ngày sinh</label>
												<form:input type="date" path="birthday" class="form-control input-default" placeholder="Ngày sinh" />
												<form:errors path="birthday" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Căn cước công dân</label>
												<form:input type="text" path="identityNumber" class="form-control input-default" placeholder="Căn cước công dân" />
												<form:errors path="identityNumber" cssClass="form-text text-danger" />
											</div>
											<div class="form-group mb-3">
												<label class="">Ảnh đại diện</label> <input name="file" type="file" class="form-control input-group-default"
													accept="image/*"> <label class="">${admin.avatar}</label>
												<form:hidden path="avatar" />
												<form:errors path="avatar" class="form-text text-danger" />

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
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/admin-management">Mới</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/admin-management/create">Thêm</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/admin-management/update"
													onclick="return confirmSubmit()">Sửa</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/admin-management/delete"
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
													<th>Mã</th>
													<th>Tên tài khoản</th>
													<th>Mật khẩu</th>
													<th>Họ và tên</th>
													<th>Email</th>
													<th>Số điện thoại</th>
													<th>Ngày sinh</th>
													<th>Căn cước</th>
													<th>Ảnh đại diện</th>
													<th>Trạng thái</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${page.content}" var="admin">
													<tr>
														<th scope="row">${admin.id}</th>
														<td>${admin.username }</td>
														<td><span class="badge badge-danger">*****</span></td>
														<td>${admin.fullname}</td>
														<td>${admin.email}</td>
														<td>${admin.phone}</td>
														<td>${admin.birthday }</td>
														<td>${admin.identityNumber }</td>
														<td><img class="img img-fluid" id="" alt="${admin.avatar}" src="${path}/images/avatar/${admin.avatar}"
															height="50px" width="50px" /></td>
														<c:if test="${admin.isActive}">
															<td><span class="badge badge-success">Đang hiệu lực</span></td>
														</c:if>
														<c:if test="${!admin.isActive}">
															<td><span class="badge badge-danger">Vô hiệu hóa</span></td>
														</c:if>
														<td><a href="/admin/admin-management/edit?id=${admin.id}"><i class="ti ti-pencil"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<c:if test="${page.number == 0}">
													<li class="page-item disabled"><a href="/admin/admin-management/page?p=0" class="page-link"><i
															class="ti ti-angle-double-left"></i></a></li>
													<li class="page-item disabled"><a href="/admin/admin-management/page?p=0" class="page-link"><i
															class="ti ti-angle-left"></i></a></li>
												</c:if>
												<c:if test="${page.number != 0}">
													<li class="page-item"><a href="/admin/admin-management/page?p=0" class="page-link"><i
															class="ti ti-angle-double-left"></i></a></li>

													<li class="page-item"><a href="/admin/admin-management/page?p=${page.number-1}" class="page-link" href="#"><i
															class="ti ti-angle-left"></i></a></li>
												</c:if>
												<c:if test="${page.number == page.totalPages-1}">
													<li class="page-item disabled"><a href="/admin/admin-management/page?p=${page.totalPages-1}" class="page-link"
														href="#"><i class="ti ti-angle-right"></i></a></li>
													<li class="page-item disabled"><a href="/admin/admin-management/page?p=${page.totalPages-1}" class="page-link"
														href="#"><i class="ti ti-angle-double-right"></i></a></li>
												</c:if>
												<c:if test="${page.number != page.totalPages-1}">
													<li class="page-item"><a href="/admin/admin-management/page?p=${page.number+1}" class="page-link" href="#"><i
															class="ti ti-angle-right"></i></a></li>
													<li class="page-item"><a href="/admin/admin-management/page?p=${page.totalPages-1}" class="page-link" href="#"><i
															class="ti ti-angle-double-right"></i></a></li>
												</c:if>
											</ul>
										</nav>
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
