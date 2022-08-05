<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng kí</title>
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
    <h1 class="page-title">ĐĂNG KÝ</h1>
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
                        <form action="Register" name="frm-login" method="post" onsubmit ="return verifyPassword()">
                            <p class="form-row">
                                <label for="fid-user-name">Tên đăng nhập:<span class="requite">*</span></label>
                                <input type="text" required id="fid-user-name" name="name" value="" class="txt-input">
                            </p>
                            <p class="form-row">
                                <label for="fid-name">Địa chỉ email (khôi phục tài khoản):<span class="requite">*</span></label>
                                <input type="email" required id="fid-name" name="email" value="" class="txt-input"/>
                            </p>

                            <p class="form-row">
                                <label for="fid-pass">Mật khẩu:<span class="requite">*</span></label>
                                <input type="password" required id="fid-pass" name="pass" value="" class="txt-input"/>
                            </p>
                            <p class="form-row">
                                <label for="fid-pass">Nhập lại mật khẩu:<span class="requite">*</span></label>
                                <input type="password" required  id="fid-re-pass" name="re-pass" value="" class="txt-input"/>
                            </p>
                            <p class="form-row wrap-btn" style="text-align: center">
                                <p id="message"></p>
                                <button class="btn btn-submit btn-bold" type="submit">Đăng ký</button>
                            </p>
                            <%if(request.getAttribute("notify") != null) {%>
                            <p style="color: red"><%= request.getAttribute("notify")%></p>
                            <%}%>
                            <script>
                                function verifyPassword(){
                                    let pw = document.getElementById("fid-pass").value;
                                    if(pw.length < 8) {
                                        document.getElementById("message").innerHTML = "** Độ dài mật khẩu bắt buộc lớn hơn bằng 8 ký tự";
                                        return false;
                                    }
                                    let rpw = document.getElementById("fid-re-pass").value;
                                    if(!(pw===rpw)){
                                        document.getElementById("message").innerHTML = "** Nhập lại mật khẩu không giống với mật khẩu";
                                        return false;
                                    }
                                    return true;
                                }
                            </script>
<!--                            <p class="social-text">Hoặc đăng nhập bằng</p>-->
<!--                            <div class="social-media">-->
<!--                                <a href="#" class="social-icon">-->
<!--                                    <i class="fab fa-facebook-f"></i>-->
<!--                                </a>-->
<!--                                <a href="#" class="social-icon">-->
<!--                                    <i class="fab fa-google"></i>-->
<!--                                </a>-->
<!--                            </div>-->
                        </form>
                    </div>
                </div>

                <!--Go to Register form-->
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="register-in-container">
                        <div class="intro">
                            <h4 class="box-title">Bạn đã có tài khoản?</h4>
                            <p class="sub-title">Quyền lợi khi có tài khoản:</p>
                            <ul class="lis">
                                <li>Thanh toán nhanh chóng</li>
                                <li>Có thể lưu nhiều địa chỉ giao hàng của mình</li>
                                <li>Xem lại lịch sử mua hàng của mình</li>
                                <li>sử dụng <Strong> Email</Strong> để khôi phục tài khoản</li>
                                <li>Lưu các sản phẩm mà bạn thích</li>
                            </ul>
                            <a href="dangNhap.jsp" class="btn btn-bold">Đăng nhập</a>
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
<script>
    var formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',

        // These options are needed to round to whole numbers if that's what you want.
        //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
        //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
    });
    function executeData(){
        <%

        UserAccount ua =null;
        if(session.getAttribute("auth")!=null) {
            ua = (UserAccount) session.getAttribute("auth");
        }
        String id = "";
        if(ua==null){
        %>
        let strVar = "";
        strVar += "<li>";
        strVar += "                                                    <div href=\"dangNhap.jsp\" class=\"minicart-item\">";
        strVar += "                                                        <div class=\"left-info\">";
        strVar += "                                                            <div class=\"product-title\"><a  class=\"product-name\">vui lòng đăng nhập để mở chức năng giỏ hàng<\/a><\/div>";
        strVar += "                                                        <\/div>";
        strVar += "                                                    <\/div>";
        strVar += "                                                <\/li>";
        document.getElementById("products-cart").innerHTML=strVar;
        return ;
        <%}else{
            id = ua.getId_user();
        }%>

        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
            let realData = "";
            let mydata = JSON.parse(this.responseText);
            console.log(mydata);
            let totalmoney = 0.0;
            for(let i =0;i<mydata.length;i++){
                // console.log("");
                let line = "ChiTietSanPham?id_product="+mydata[i].product.id_product;
                realData += "<li>";
                realData += "                                                    <div class=\"minicart-item\">";
                realData += "                                                        <div class=\"thumb\">";
                realData += "                                                            <a href=\""+line+"\"><img src=\""+mydata[i].product.img_url+"\" width=\"90\" height=\"90\" alt=\"National Fresh\"><\/a>";
                realData += "                                                        <\/div>";
                realData += "                                                        <div class=\"left-info\">";
                realData += "                                                            <div class=\"product-title\"><a href=\""+line+"\" class=\"product-name\">"+mydata[i].product.product_name+"<\/a><\/div>";
                realData += "                                                            <div class=\"price\">";
                realData += "                                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price_discount+" đ<\/span><\/ins>";
                realData += "                                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price+" đ<\/span><\/del>";
                realData += "                                                            <\/div>";
                realData += "                                                            <div class=\"qty\">";
                realData += "                                                                <label for=\"cart[id123][qty]\">Qty:<\/label>";
                realData += "                                                                <input type=\"number\" class=\"input-qty\" name=\"cart[id123][qty]\" id=\"cart[id123][qty]\" value=\""+mydata[i].amount+"\" disabled>";
                realData += "                                                            <\/div>";
                realData += "                                                        <\/div>";
                realData += "                                                    <\/div>";
                realData += "                                                <\/li>";
                totalmoney+=parseFloat(mydata[i].amount)*parseFloat(mydata[i].product.price_discount);
            }


            document.getElementById("money-total-cart").innerHTML = formatter.format(totalmoney);
            document.getElementById("products-cart").innerHTML = realData;
        }
        let va = Math.random();
        xhttp.open("GET", "ShowCart?id_user=<%=id%>&x="+va);
        xhttp.send();

    }
</script>
<script>
    function showResult(str) {
        if (str.length==0) {
            document.getElementById("livesearch").innerHTML="";
            return;
        }
        var xmlhttp=new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            try {
                let va = JSON.parse(this.responseText);
                let searchResult = "";
                console.log(va);
                if (this.readyState==4 && this.status==200) {
                    for(let i =0;i<va.length;i++) {
                        // searchResult += "<option type='submit'  value=\"\">";
                        searchResult += "  <li ><a href='ChiTietSanPham?id_product="+va[i].id_product+"'>"+va[i].product_name+"<\/a><\/li>";

                        // document.getElementById("livesearch").style.border="1px solid #A5ACB2";
                    }
                    console.log(searchResult)
                    document.getElementById("livesearch").innerHTML = searchResult;

                }
            }
                //catch json error
            catch(err) {
            }

        }
        xmlhttp.open("GET","LiveSearch?q="+str,true);
        xmlhttp.send();
    }
</script>

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