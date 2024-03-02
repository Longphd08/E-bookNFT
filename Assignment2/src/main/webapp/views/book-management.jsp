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
									Xin chào ${sessionScope.account.fullname}, <span>chúc bạn một ngày tốt lành!</span>
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
									<h4 class="text-center align-content-center">Quản lý Sách</h4>
								</div>
								<div class="card-body">
									<div class="basic-form">
										<form:form id="form" action="/admin/book-management" method="post" enctype="multipart/form-data" modelAttribute="book">
											<label class="mb-3">${message}</label>
											<div class="form-group">
												<label>ID</label> <input type="text" value="${book.id}" name="id" class="form-control input-default"
													placeholder="ID" readonly="readonly" />
											</div>
											<div class="form-group">
												<label>Tên sách</label>
												<form:input path="title" class="form-control input-default" placeholder="Tên sách" />
												<form:errors path="title" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Giá</label>
												<form:input type="number" path="price" class="form-control input-default" placeholder="Giá" />
												<form:errors path="price" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Số lượng</label>
												<form:input type="number" path="qty" class="form-control input-default" placeholder="Số lượng" />
												<form:errors path="qty" cssClass="form-text text-danger" />
											</div>
											<div class="form-group">
												<label>Giới thiệu</label> 
												<input type="file" name="introductionFile" class="form-control input-group-default" accept="file_extension"/>
												<label class="">${book.introduction}</label>
											</div>

											<div class="form-group">
												<label>Ảnh bìa</label> <input type="file" name="pictureFile" class="form-control input-group-default" />
												<label class="">${book.picturePath}</label>
											</div>
											<div class="form-group">
												<label>Nội dung</label> <input type="file" name="contentFile" class="form-control input-group-default" />
												<label class="">${book.contentPath}</label>
											</div>
											<div class="form-group">
												<label>Tác giả</label>
												<form:select path="author.id" cssClass="form-control">
													<c:forEach items="${sessionScope.authors}" var="author">
														<form:option value="${author.id}">${author.name}</form:option>
													</c:forEach>
												</form:select>
											</div>
											<div class="form-group">
												<label>Loại</label>
												<form:select path="category.id" cssClass="form-control">
													<c:forEach items="${sessionScope.categories}" var="category">
														<form:option value="${category.id}">${category.name}</form:option>
													</c:forEach>
												</form:select>
											</div>
											<div class="form-group">
												<label>Nhà xuất bản</label>
												<form:select path="publisher.id" cssClass="form-control">
													<c:forEach items="${sessionScope.publishers}" var="publisher">
														<form:option value="${publisher.id}">${publisher.name}</form:option>
													</c:forEach>
												</form:select>
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
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/book-management">Mới</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/book-management/create">Thêm</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/book-management/update"
													onclick="return confirmSubmit()">Sửa</button>
												<button type="submit" class="btn btn-warning mr-2" formaction="/admin/book-management/delete"
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
							<form action="/admin/book-management/search?p=${page.number}" method="get">
								<div class="input-group mb-3">
									<input type="text" name="q" value="${q}" class="form-control" placeholder="Tìm kiếm theo tên sách"
										aria-label="Find title" aria-describedby="button-addon2">
									<button class="btn btn-outline-warning" type="submit" id="button-addon2">
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
													<th>Mã sách</th>
													<th>Tên sách</th>
													<th>Giá</th>
													<th>Số lượng</th>
													<th>Giới thiệu</th>
													<th>Ảnh bìa</th>
													<th>Nội dung</th>
													<th>Tác giả</th>
													<th>Loại sách</th>
													<th>Nhà xuất bản</th>
													<th>Trạng thái</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${page.content}" var="book">
													<tr>
														<th scope="row">${book.id}</th>
														<td>${book.title }</td>
														<td><fmt:formatNumber value="${book.price}" type="number" pattern="#,##0" /> VND</td>
														<td>${book.qty}</td>
														<td>${book.introduction}</td>
														<td><img class="img img-fluid" id="" alt="${book.picturePath}"
															src="${path}/img/category/${book.picturePath}" height="80px" width="50px" /></td>
														<td>${book.contentPath}</td>
														<td>${book.author.name}</td>
														<td>${book.category.name}</td>
														<td>${book.publisher.name}</td>
														<c:if test="${book.isActive}">
															<td><span class="badge badge-success">Đang hiệu lực</span></td>
														</c:if>
														<c:if test="${!book.isActive}">
															<td><span class="badge badge-danger">Vô hiệu hóa</span></td>
														</c:if>
														<td><a href="/admin/book-management/edit?id=${book.id}"><i class="ti ti-pencil"></i></a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<c:if test="${page.number == 0}">
													<li class="page-item disabled"><a href="/admin/book-management/search?p=0&q=${q}" class="page-link"><i
															class="ti ti-angle-double-left"></i></a></li>
													<li class="page-item disabled"><a href="/admin/book-management/search?p=0&q=${q}" class="page-link"><i
															class="ti ti-angle-left"></i></a></li>
												</c:if>
												<c:if test="${page.number != 0}">
													<li class="page-item"><a href="/admin/book-management/search?p=0&q=${q}" class="page-link"><i
															class="ti ti-angle-double-left"></i></a></li>

													<li class="page-item"><a href="/admin/book-management/search?p=${page.number-1}&q=${q}" class="page-link" href="#"><i
															class="ti ti-angle-left"></i></a></li>
												</c:if>
												<c:if test="${page.number == page.totalPages-1}">
													<li class="page-item disabled"><a href="/admin/book-management/search?p=${page.totalPages-1}&q=${q}" class="page-link"
														href="#"><i class="ti ti-angle-right"></i></a></li>
													<li class="page-item disabled"><a href="/admin/book-management/search?p=${page.totalPages-1}&q=${q}" class="page-link"
														href="#"><i class="ti ti-angle-double-right"></i></a></li>
												</c:if>
												<c:if test="${page.number != page.totalPages-1}">
													<li class="page-item"><a href="/admin/book-management/search?p=${page.number+1}&q=${q}" class="page-link" href="#"><i
															class="ti ti-angle-right"></i></a></li>
													<li class="page-item"><a href="/admin/book-management/search?p=${page.totalPages-1}&q=${q}" class="page-link" href="#"><i
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
</body>

</html>
