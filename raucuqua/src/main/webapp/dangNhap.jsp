<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/slick.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/main-color.css">
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
        <h1 class="page-title">ĐĂNG NHẬP</h1>
    </div>

    <!--Navigation section-->
    <br>

    <div class="page-contain login-page">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container">

                <div class="row">

                    <!--Form Sign In-->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="signin-container">
                            <form action="DangNhap" name="frm-login" method="post">
                                <p class="form-row">
                                    <label for="fid-name">Tên đăng nhập<span class="requite">*</span></label>
                                    <input type="text" id="fid-name" name="username" value="" class="txt-input">
                                </p>
                                <p class="form-row">
                                    <label for="fid-pass">Mật khẩu:<span class="requite">*</span></label>
                                    <input type="password" id="fid-pass" name="password" value="" class="txt-input">
                                </p>
                                <p class="form-row wrap-btn">
                                    <button class="btn btn-submit btn-bold" type="submit">Đăng nhập</button>
                                    <a href="quenMatKhau.jsp" class="link-to-help">Quên mật khẩu</a>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/raucuqua_war/LoginGoogleHandler&response_type=code
		   &client_id=963289098717-7ln66opmhck9imhje6dnq901taqi5v8n.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                                </p>
                                <%if(request.getAttribute("error")!=null){%>
                                <p style="color:red"><%=request.getAttribute("error")%></p>
                                <%}%>
                            </form>
<!--                            <p class="social-text">Hoặc đăng nhập bằng</p>-->
<!--                            <div class="social-media">-->
<!--                                <a href="#" class="social-icon">-->
<!--                                    <i class="fab fa-facebook-f"></i>-->
<!--                                </a>-->
<!--                                <a href="#" class="social-icon">-->
<!--                                    <i class="fab fa-google"></i>-->
<!--                                </a>-->
<!--                            </div>-->
                        </div>
                    </div>

                    <!--Go to Register form-->
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="register-in-container">
                            <div class="intro">
                                <h4 class="box-title">Bạn chưa có tài khoản?</h4>
                                <p class="sub-title">Quyền lợi khi có tài khoản:</p>
                                <ul class="lis">
                                    <li>Thanh toán nhanh chóng</li>
                                    <li>Có thể lưu nhiều địa chỉ giao hàng của mình</li>
                                    <li>Xem lại lịch sử mua hàng của mình</li>
                                    <li>Theo dõi các đơn đặt hàng mới</li>
                                    <li>Lưu các sản phẩm mà bạn thích</li>
                                </ul>
                                <a href="dangKy.jsp" class="btn btn-bold">Tạo tài khoản</a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

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