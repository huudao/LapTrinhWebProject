<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 04/07/2022
  Time: 4:43 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAddress" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    List<UserAddress> addresses = (List<UserAddress>) request.getAttribute("addresses");
    UserAccount ua = (UserAccount) session.getAttribute("auth");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sổ địa chỉ</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    <h1 class="page-title">Sổ địa chỉ</h1>
</div>

<!--Navigation section-->
<div class="container">
    <nav class="biolife-nav">
        <ul>
            <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
            <li class="nav-item"><span class="current-page">Trang khách hàng</span></li>
            <li class="nav-item"><span class="current-page">Sổ địa chỉ</span></li>
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
                        <h5 class="title-head">Trang tài khoản</h5>
                        <p>Xin chào,  <%=ua.getUser_name()%><span style="color:#38b653;"></span>&nbsp;!</p>
                        <ul>
                            <li>
                                <a class="title-info" href="thongTinTaiKhoan/thongTinTaiKhoan.jsp">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a class="title-info" href="ListBill">Đơn hàng của bạn</a>
                            </li>
                            <li>
                                <a class="title-info" href="thongTinTaiKhoan/doiMatKhau.jsp">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a disabled="disabled" style="color: red; font-weight: 600;">Sổ địa chỉ (0)</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="block-right">
                    <h1 class="title-head">Địa chỉ của bạn</h1>
                    <table class="" id="abc">
                        <thead class="">
                        <tr>
                            <th>stt</th>
                            <th>tỉnh-thành phố</th>
                            <th>quận-huyện</th>
                            <th>xã</th>
                            <th>địa chỉ </th>
                            <th>tên</th>
                            <th>số điện thoại</th>
                            <th>xóa địa chỉ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int stt = 0;
                            for(UserAddress b:addresses){%>
                        <tr>
                            <td>
                                <%=++stt%>
                            </td>
                            <td>
                                <%=b.getCity_province()%>
                            </td><td>
                            <%=b.getDistrict()%>
                        </td><td>
                            <%=b.getWard()%>
                        </td><td>
                            <%=b.getHouse_address()%>
                        </td><td>
                            <%=b.getUser_name()%>
                        </td>
                            <td>
                                <%=b.getPhone_number()%>
                            </td>
                            <td href="">
                                <form method="post" action="DeleteAddress">
                                    <input type="hidden" name="id_address" value="<%=b.getId_address()%>">
                                    <button type="submit" onClick='return confirmDelete()'>delete</button>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <button class="address-btn" id="js-address-btn" type="button">Thêm địa chỉ</button>
                    <div class="account-modal" id="js-account-modal">
                        <div class="account-modal-container">
                            <div class="account-modal-close js-account-modal-close">
                                <i class="fa fa-times"></i>
                            </div>

                            <h2 class="account-modal-header">THÊM ĐỊA CHỈ MỚI</h2>
                            <div class="account-modal-body">
                                <form action="AddAddress" method="post" >
                                    <input class="account-modal-input" placeholder="Họ tên" type="text" name="username">
                                    <input class="account-modal-input" placeholder="Số điện thoại" type="text" id="Phone" name="Phone" value="">
                                    <input class="account-modal-input" placeholder="Tỉnh/thành phố" type="text" name="city-province">
                                    <input type="text" list="Country" placeholder="Quận/huyện" class="account-modal-input" name="district">
                                    <input class="account-modal-input" type="text" placeholder="Phường/xã" id="" name="ward">
                                    <input class="account-modal-input" placeholder="Địa chỉ nhận hàng" type="text" name="house-address">
                                    <datalist id="Country">

                                    </datalist>
                                    <div class="account-modal-button">
                                        <button class="js-account-modal-close">Hủy</button>
                                        <button type="submit"  >Thêm địa chỉ</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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
<script>
    function confirmDelete()
    {
        var agree=confirm("bạn có chắc muốn xóa địa chỉ ?");
        if (agree)
            return true ;
        else
            return false ;
    }

    const addressBtn = document.getElementById('js-address-btn')
    const modal = document.getElementById('js-account-modal')
    const modalClose = document.getElementsByClassName('js-account-modal-close')

    function hideModal() {
        modal.classList.remove('modal-open')
    }

    function showModal(){
        modal.classList.add('modal-open')
    }

    addressBtn.addEventListener('click', showModal)

    for (const closeBtn of modalClose) {
        closeBtn.addEventListener('click', hideModal)
    }

</script>

</body>

</html>
