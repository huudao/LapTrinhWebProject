<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Bill" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>

<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    UserAccount ua = (UserAccount) session.getAttribute("auth");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lịch sử đơn hàng</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/slick.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/main-color.css">
    <link rel="stylesheet" href="thongTinTaiKhoan/asset/account.css">

</head>
<body class="biolife-body">

<!-- Preloader -->
<div id="biof-loading">
    <div class="biof-loading-center">
        <div class="biof-loading-center-absolute">
            <div class="dot dot-one"></div>
            <div class="dot dot-two"></div>
            <div class="dot dot-three"></div>
        </div>
    </div>
</div>

<!-- HEADER -->
<jsp:include page="../header.jsp"/>

<!--Hero Section-->
<div class="hero-section hero-background">
    <h1 class="page-title">Trang khách hàng</h1>
</div>

<!--Navigation section-->
<div class="container">
    <nav class="biolife-nav">
        <ul>
            <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
            <li class="nav-item"><span class="current-page">Trang khách hàng</span></li>
            <li class="nav-item"><span class="current-page">Đơn hàng của bạn</span></li>
        </ul>
    </nav>
</div>

<div class="page-contain">

    <!-- Main content -->
    <section class="">
        <div class="container account-contain">
            <div class="block-all">
                <div class="block-left">
                    <div class="block-account">
                        <h5 class="title-head">Đơn hàng của <%=ua.getUser_name()%></h5>
                        <p>Xin chào,  <%=ua.getUser_name()%><span style="color:#38b653;"></span>&nbsp;!</p>
                        <ul>
                            <li>
                                <a class="title-info" href="thongTinTaiKhoan/thongTinTaiKhoan.jsp">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a disabled="disabled" style="color: red; font-weight: 600;">Đơn hàng của bạn</a>
                            </li>
                            <li>
                                <a class="title-info" href="thongTinTaiKhoan/doiMatKhau.jsp">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a class="title-info" href="ShowDiaChi">Sổ địa chỉ (0)</a>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="block-right">
                    <h1 class="title-head">Đơn hàng của bạn</h1>

                    <table class="" id="">
                        <thead class="">
                        <tr>
                            <th>Đơn hàng</th>
                            <th>Ngày</th>
                            <th>Địa chỉ</th>
                            <th>Giá trị đơn hàng</th>
                            <th>trạng thái</th>
                            <th>số điện thoại</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for(Bill b:bills){%>
                            <tr>
                                <td>
                                    <%=b.getId_bill()%>
                                </td>
                                <td>
                                    <%=b.getDate_time().toString()%>
                                </td><td>
                                <%=b.getAddress()%>
                            </td><td>
                                <%=b.getTotal_money()%>
                            </td><td>
                                <%=b.getState()%>
                            </td><td>
                                <%=b.getPhone_number()%>
                            </td>
                                <td href="">
                                    <form method="post" action="DetailBill">
                                        <input type="hidden" name="id_bill" value="<%=b.getId_bill()%>">
                                        <button type="submit" >detail bill</button>
                                    </form>
                                </td>
                            </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

</div>

<!-- FOOTER -->
<jsp:include page="Footer.jsp"/>



<!-- Scroll Top Button -->
<a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.countdown.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/jquery.nicescroll.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/biolife.framework.js"></script>
<script src="assets/js/functions.js"></script>
</body>

</html>