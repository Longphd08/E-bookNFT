<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <!-- sidebar -->
    <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <div class="logo"><a href="/admin">
                   	<!-- <img src="images/logo.png" alt="" /> --><span>Công cụ</span></a></div>
                    <li class="label">Chính</li>
                    <li><a href="/admin"><i class="ti-home"></i>Trang chủ</a></li>
                    <li class="label">Ứng dụng</li>
                    <li class="label">Quản lý</li>
                    <li><a class="sidebar-sub-toggle"><i class="ti-view-list-alt"></i> Dữ liệu <span
                        class="sidebar-collapse-icon ti-angle-down"></span></a>
                <ul>
                    <li><a href="/admin/admin-management">Quản trị viên</a></li>
                    <li><a href="/admin/account-management">Người dùng</a></li>                    
                    <li><a href="/admin/book-management">Sách</a></li>
                    <li><a href="/admin/orders-management">Đơn hàng</a></li>
                </ul>
            </li>
                    <li class="label">Extra</li>
                    <li><a href="/admin/loggout"><i class="ti-power-off"></i>Đăng xuất</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /# sidebar -->

    <div class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="float-left">
                        <div class="hamburger sidebar-toggle">
                            <span class="line"></span>
                            <span class="line"></span>
                            <span class="line"></span>
                        </div>
                    </div>
                    <div class="float-right">
                        <div class="dropdown dib">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>