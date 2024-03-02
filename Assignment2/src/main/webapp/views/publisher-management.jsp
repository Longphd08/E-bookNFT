<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/commons/_taglib-admin.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- theme meta -->
    <meta name="theme-name" content="focus" />
    <title>Quản trị</title>
	<%@ include file="../views/commons/_head-admin.jsp" %>
</head>

<body>
	<!-- Header -->
	<%@ include file="../views/commons/_header-admin.jsp" %>
	<!-- End Header -->


    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>Xin chào Admin, <span>chúc bạn một ngày tốt lành!</span></h1>
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
                                    <h4 class="text-center align-content-center">Quản lý nhà xuất bản</h4>
                                </div>
                                <div class="card-body">
                                    <div class="basic-form">
                                        <form>
                                            <div class="form-group">
                                                <label>Tên nhà xuất bản</label>
                                                <input type="text" name="name" class="form-control input-default" placeholder="Tên nhà xuất bản">
                                            </div>
                                            <div class="form-group">
                                                <label>Mô tả</label>
                                                <textarea name="description" class="form-control input-default" rows="10" style="height: 100px"></textarea>
                                                
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="mr-3">Trạng thái: </label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="isActive" id="inlineRadio1" value="option1">
                                                    <label class="form-check-label" for="inlineRadio1">Có hiệu lực</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="isActive" id="inlineRadio2" value="option2">
                                                    <label class="form-check-label" for="inlineRadio2">Vô hiệu hóa</label>
                                                </div>
                                            </div>
                                            <div class="">
                                                <button type="submit" class="btn btn-warning mr-2">Mới</button>
                                            <button type="submit" class="btn btn-warning mr-2">Thêm</button>
                                            <button type="submit" class="btn btn-warning mr-2">Sửa</button>
                                            <button type="submit" class="btn btn-warning mr-2">Xóa</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center ">
                        <div class="col-12 col-sm-11">
                            <form action="">
                                <div class="input-group mb-3">
                                    <input type="text" name="find" class="form-control" placeholder="Tìm kiếm theo tên" aria-label="Find fullname" aria-describedby="button-addon2">
                                    <button class="btn btn-outline-warning" type="button" id="button-addon2"><i class="ti-search"></i></button>
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
                                                    <th>Tên nhà xuất bản</th>
                                                    <th>Mô tả</th>
                                                    <th>Trạng thái</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>Tiểu thuyết</td>
                                                    <td>Tiểu thuyết là tiểu thuyết chứ còn là cái gì</td>
                                                    <td><span class="badge badge-success">Đang hiệu lực</span></td>
                                                    <td><a href="">Chỉnh sửa</a></td>
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

   <%@ include file="../views/commons/_jsFiles-admin.jsp" %>
</body>

</html>
