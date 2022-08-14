<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    if(session.getAttribute("auth")==null) {
        session.setAttribute("previousPage",request.getServletPath());

%>
<c:redirect url = "/dangNhap.jsp"/>

<%}%>
<%
    UserAccount ua = (UserAccount) session.getAttribute("auth");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đổi mật khẩu</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.png" />
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/animate.min.css">
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/nice-select.css">
    <link rel="stylesheet" href="../assets/css/slick.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/main-color.css">
    <link rel="stylesheet" href="asset/account.css">


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
<jsp:include page="header.jsp"/>

<!--Hero Section-->
<div class="hero-section hero-background">
    <h1 class="page-title">Đổi mật khẩu</h1>
</div>

<!--Navigation section-->
<div class="container">
    <nav class="biolife-nav">
        <ul>
            <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
            <li class="nav-item"><span class="current-page">Trang khách hàng</span></li>
            <li class="nav-item"><span class="current-page">Đổi mật khẩu</span></li>
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
                                <a class="title-info" href="./thongTinTaiKhoan.jsp">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a class="title-info" href="../ListBill">Đơn hàng của bạn</a>
                            </li>
                            <li>
                                <a disabled="disabled" style="color: red; font-weight: 600;">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a class="title-info" href="../ShowDiaChi">Sổ địa chỉ (0)</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="block-right">
                    <h1 class="title-head">Đổi mật khẩu</h1>
                    <div class="page-login">
                        <form action="ChangePasswordController"  id="change_customer_password" method="post" onsubmit ="return verifyPassword()">
                            <p>
                                Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 8 kí tự
                            </p>
                            <div class="">
                                <fieldset class="oldPassword">
                                    <label for="oldPass">Mật khẩu cũ <span class="error">*</span></label>
                                    <input type="password" name="OldPassword" id="OldPass" required class="changePass-input">
                                </fieldset>
                                <fieldset class="newPassword">
                                    <label for="changePass">Mật khẩu mới <span class="error">*</span></label>
                                    <input type="password" name="password" id="changePass" required class="changePass-input">
                                </fieldset>
                                <fieldset class="confirmPassword">
                                    <label for="confirmPass">Xác nhận lại mật khẩu <span class="error">*</span></label>
                                    <input type="password" name="ConfirmPassword" id="confirmPass" required class="changePass-input">
                                </fieldset>

<%--                                onclick="my_function()"--%>
                                <button type="submit" class="changePass-btn" id = "setButton"  >Đặt lại mật khẩu</button>
                                <p id="notice" style="color: red">
                                    <%
                                        String resNotify = (String) request.getAttribute("resNotify");
                                        if(resNotify != null && !resNotify.equals("")) {%>
                                        ${resNotify}
                                    <%}%>
                                </p>

                                <script>
                                    function verifyPassword(){
                                        let pw = document.getElementById("changePass").value;
                                        if(pw.length < 8) {
                                            document.getElementById("notice").innerHTML = "** Độ dài mật khẩu bắt buộc lớn hơn bằng 8 ký tự";
                                            return false;
                                        }
                                        let rpw = document.getElementById("confirmPass").value;
                                        if(!(pw===rpw)){
                                            document.getElementById("notice").innerHTML = "** Nhập lại mật khẩu không giống với mật khẩu";
                                            return false;
                                        }
                                        return true;
                                    }
                                </script>
                            </div>
                        </form>
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
<script src="../assets/js/jquery-3.4.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/jquery.countdown.min.js"></script>
<script src="../assets/js/jquery.nice-select.min.js"></script>
<script src="../assets/js/jquery.nicescroll.min.js"></script>
<script src="../assets/js/slick.min.js"></script>
<script src="../assets/js/biolife.framework.js"></script>
<script src="../assets/js/functions.js"></script>
<script>

</script>
<script>
    $("#setButton").click(function(){
        var c = document.getElementById("changePass").value;
        $.post("<%=request.getContextPath()%>"+"/ChangePassword",
            {
                password: c,
                my:"java"
            },
            function(data, status){
                alert("Data: " + data + "\nStatus: " + status);
            });
    });

</script>
</body>

</html>