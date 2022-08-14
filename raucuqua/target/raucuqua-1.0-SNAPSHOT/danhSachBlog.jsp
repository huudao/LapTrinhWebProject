<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Blog" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<% UserAccount ua = (UserAccount) request.getAttribute("auth"); %>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Blog </title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png"/>
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
<div class="hero-section hero-background style-02">
    <h1 class="page-title">Organic Fruits</h1>
    <nav class="biolife-nav">
        <ul>
            <li class="nav-item"><a href="TrangChu" class="permal-link">Trang chủ</a></li>
            <li class="nav-item"><span class="current-page">Our Blog</span></li>
        </ul>
    </nav>
</div>

<!-- Page Contain -->
<div class="page-contain blog-page">
    <div class="container">
        <!-- Main content -->
        <div id="main-content" class="main-content">

            <div class="row">

                <!--articles block-->
                <ul class="posts-list main-post-list">
                    <%
                        for (Blog b : (List<Blog>) request.getAttribute("blogs")
                        ) {
                            String link = "ChiTietBlog?id_blog=" + b.getId_blog();

                    %>
                    <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="post-item effect-04 style-bottom-info">
                            <div class="thumbnail">
                                <a href=<%=link%> class="link-to-post"><img style="width:370px; height:270px;"
                                                                            src=<%=b.getImg_url()%>></a>--%>
                            </div>
                            <div class="post-content">
                                <h4 class="post-name"><a href=<%=link%> class="linktopost"><%=b.getName()%>
                                </a></h4>
                                <p class="post-archive"><b class="post-cat"></b><span
                                        class="post-date"><%=b.getDate_post().toString()%></span><span
                                        class="author"><%=b.getAuthor()%></span></p>
                                <p class="excerpt"><%=b.getShort_discription()%>
                                </p>
                                <div class="group-buttons">
                                    <a class="btn readmore" href=<%=link%>>Tìm hiểu thêm</a>
                                    <a href="#" class="btn count-number commented"><i
                                            class="biolife-icon icon-conversation"></i><span
                                            class="number"><%=b.getNumberComment()%></span></a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%}%>
                </ul>

            </div>

            <!--Panigation Block-->
            <div class="biolife-panigations-block ">
                <ul class="panigation-contain">
                    <li><a href="#" class="link-page">1</a></li>
                    <li><a href="#" class="link-page">2</a></li>
                    <li><a href="#" class="link-page">3</a></li>
                    <li><span class="sep">....</span></li>
                    <li><a href="#" class="link-page">20</a></li>
                    <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                </ul>
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

    });

    function executeData() {
        <%
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
        document.getElementById("products-cart").innerHTML = strVar;
        return;
        <%}else{
            id = ua.getId_user();
        }%>

        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let realData = "";
            let mydata = JSON.parse(this.responseText);
            let totalmoney = 0.0;
            for (let i = 0; i < mydata.length; i++) {
                let line = "ChiTietSanPham?id_product=" + mydata[i].product.id_product;
                realData += "<li>";
                realData += "                                                    <div class=\"minicart-item\">";
                realData += "                                                        <div class=\"thumb\">";
                realData += "                                                            <a href=\"" + line + "\"><img src=\"" + mydata[i].product.img_url + "\" width=\"90\" height=\"90\" alt=\"National Fresh\"><\/a>";
                realData += "                                                        <\/div>";
                realData += "                                                        <div class=\"left-info\">";
                realData += "                                                            <div class=\"product-title\"><a href=\"" + line + "\" class=\"product-name\">" + mydata[i].product.product_name + "<\/a><\/div>";
                realData += "                                                            <div class=\"price\">";
                realData += "                                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>" + mydata[i].product.price_discount + " đ<\/span><\/ins>";
                realData += "                                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>" + mydata[i].product.price + " đ<\/span><\/del>";
                realData += "                                                            <\/div>";
                realData += "                                                            <div class=\"qty\">";
                realData += "                                                                <label for=\"cart[id123][qty]\">Qty:<\/label>";
                realData += "                                                                <input type=\"number\" class=\"input-qty\" name=\"cart[id123][qty]\" id=\"cart[id123][qty]\" value=\"" + mydata[i].amount + "\" disabled>";
                realData += "                                                            <\/div>";
                realData += "                                                        <\/div>";
                realData += "                                                    <\/div>";
                realData += "                                                <\/li>";
                totalmoney += parseFloat(mydata[i].amount) * parseFloat(mydata[i].product.price_discount);
            }


            document.getElementById("money-total-cart").innerHTML = formatter.format(totalmoney);
            document.getElementById("products-cart").innerHTML = realData;
        }
        let va = Math.random();
        xhttp.open("GET", "ShowCart?id_user=<%=id%>&x=" + va);
        xhttp.send();

    }
</script>
<script>
    function showResult(str) {
        if (str.length == 0) {
            document.getElementById("livesearch").innerHTML = "";
            return;
        }
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            try {
                let va = JSON.parse(this.responseText);
                let searchResult = "";
                if (this.readyState == 4 && this.status == 200) {
                    for (let i = 0; i < va.length; i++) {
                        // searchResult += "<option type='submit'  value=\"\">";
                        searchResult += "  <li ><a href='ChiTietSanPham?id_product=" + va[i].id_product + "'>" + va[i].product_name + "<\/a><\/li>";

                        // document.getElementById("livesearch").style.border="1px solid #A5ACB2";
                    }
                    document.getElementById("livesearch").innerHTML = searchResult;

                }
            }
                //catch json error
            catch (err) {
            }

        }
        xmlhttp.open("GET", "LiveSearch?q=" + str, true);
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