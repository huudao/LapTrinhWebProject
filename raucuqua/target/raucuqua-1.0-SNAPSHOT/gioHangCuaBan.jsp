<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
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
    <title>giỏ hàng của bạn</title>
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
        <h1 class="page-title">GIỎ HÀNG CỦA BẠN</h1>
    </div>

    <br>

    <div class="page-contain shopping-cart">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container">

                <!--Cart Table-->
                <div class="shopping-cart-container">
                    <div class="row">
                        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                            <h3 class="box-title">GIỎ HÀNG</h3>
                            <form class="shopping-cart-form" action="#" method="post">
                                <table class="shop_table cart-form">
                                    <thead>
                                    <tr>
                                        <th class="product-name">Tên sản phẩm</th>
                                        <th class="product-price">giá lẻ</th>
                                        <th class="product-quantity">số lượng</th>
                                        <th class="product-subtotal">tổng tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody id="list-cart">
                                    <tr class="cart_item">
                                        <td class="product-thumbnail" data-title="Product Name">
                                            <a class="prd-thumb" href="#">
                                                <figure><img width="113" height="113" src="assets/images/shippingcart/pr-01.jpg" alt="shipping cart"></figure>
                                            </a>
                                            <a class="prd-name" href="#">Trái cây tự nhiên</a>
                                            <div class="action">
                                                <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"> xóa </i></a>
                                            </div>
                                        </td>
                                        <td class="product-price" data-title="Price">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span>30.000</span></ins>
                                                <del><span class="price-amount"><span class="currencySymbol"></span>60.000</span></del>
                                            </div>
                                        </td>
                                        <td class="product-quantity" data-title="Quantity">
                                            <div class="quantity-box type1">
                                                <div class="qty-input">
                                                    <input type="text" name="qty12554" value="1" data-max_value="20" data-min_value="1" data-step="1">
                                                    <a href="#" class="qty-btn btn-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                                                    <a href="#" class="qty-btn btn-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span>30.000</span></ins>
                                                <del><span class="price-amount"><span class="currencySymbol"></span>60.000</span></del>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="cart_item">
                                        <td class="product-thumbnail" data-title="Product Name">
                                            <a class="prd-thumb" href="#">
                                                <figure><img width="113" height="113" src="assets/images/shippingcart/pr-02.jpg" alt="shipping cart"></figure>
                                            </a>
                                            <a class="prd-name" href="#">Trái cây tự nhiên</a>
                                            <div class="action">
                                                <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"> xóa </i></a>
                                            </div>
                                        </td>
                                        <td class="product-price" data-title="Price">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span>90.000</span></ins>
                                                <del><span class="price-amount"><span class="currencySymbol"></span>120.000</span></del>
                                            </div>
                                        </td>
                                        <td class="product-quantity" data-title="Quantity">
                                            <div class="quantity-box type1">
                                                <div class="qty-input">
                                                    <input type="text" name="qty12554" value="1" data-max_value="20" data-min_value="1" data-step="1">
                                                    <a href="#" class="qty-btn btn-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                                                    <a href="#" class="qty-btn btn-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span>90.000</span></ins>
                                                <del><span class="price-amount"><span class="currencySymbol"></span>120.000</span></del>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="cart_item wrap-buttons">
                                        <td class="wrap-btn-control" colspan="4">
                                            <a href="trangchu.jsp" class="btn back-to-shop">quay lại cửa hàng</a>
                                            <button class="btn btn-clear" type="reset">xóa tất cả</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                            <div class="shpcart-subtotal-block">
                                <div class="subtotal-line">
                                    <b class="stt-name">tổng tiền:  <span class="sub"></span></b>
                                    <span class="stt-price" id="money-total-cart1">120.000</span>
                                </div>
                                <div class="subtotal-line">
                                    <b class="stt-name">tiền ship(10%): </b>
                                    <span class="stt-price" id = "fee-ship">12.000</span>
                                </div>
                                <div class="subtotal-line">
                                    <hr>
                                    <b class="stt-name">total: </b>
                                    <span class="stt-price" id ="money-total-cart-plus-feeShip">12.000</span>
                                </div>

                                <div class="btn-checkout">
                                    <a href="ThanhToan" class="btn checkout">Thanh toán</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Related Product-->
<%--                <div class="product-related-box single-layout">--%>
<%--                    <div class="biolife-title-box lg-margin-bottom-26px-im">--%>
<%--                        <span class="biolife-icon icon-organic"></span>--%>
<%--                        <span class="subtitle">tất cả đều dành cho bạn</span>--%>
<%--                        <h3 class="main-title">các sản phẩm liên quan</h3>--%>
<%--                    </div>--%>
<%--                    <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":0,"slidesToShow":5, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}}]}'>--%>
<%--                        <li class="product-item">--%>
<%--                            <div class="contain-product layout-default">--%>
<%--                                <div class="product-thumb">--%>
<%--                                    <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                        <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                    </a>--%>
<%--                                    <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                </div>--%>
<%--                                <div class="info">--%>
<%--                                    <h4 class="product-title"><a href="#" class="pr-name">Bơ</a></h4>--%>
<%--                                    <div class="price ">--%>
<%--                                        <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                        <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                    </div>--%>
<%--                                    <div class="slide-down-box">--%>
<%--                                        <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                        <div class="buttons">--%>
<%--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                            <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="product-item">--%>
<%--                            <div class="contain-product layout-default">--%>
<%--                                <div class="product-thumb">--%>
<%--                                    <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                        <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                    </a>--%>
<%--                                    <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                </div>--%>
<%--                                <div class="info">--%>
<%--                                    <h4 class="product-title"><a href="#" class="pr-name">Chanh vàng</a></h4>--%>
<%--                                    <div class="price ">--%>
<%--                                        <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                        <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                    </div>--%>
<%--                                    <div class="slide-down-box">--%>
<%--                                        <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                        <div class="buttons">--%>
<%--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                            <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="product-item">--%>
<%--                            <div class="contain-product layout-default">--%>
<%--                                <div class="product-thumb">--%>
<%--                                    <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                        <img src="assets/images/products/p-02.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                    </a>--%>
<%--                                    <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                </div>--%>
<%--                                <div class="info">--%>
<%--                                    <h4 class="product-title"><a href="#" class="pr-name">Ớt Đà Lạt</a></h4>--%>
<%--                                    <div class="price ">--%>
<%--                                        <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                        <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                    </div>--%>
<%--                                    <div class="slide-down-box">--%>
<%--                                        <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                        <div class="buttons">--%>
<%--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                            <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="product-item">--%>
<%--                            <div class="contain-product layout-default">--%>
<%--                                <div class="product-thumb">--%>
<%--                                    <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                        <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                    </a>--%>
<%--                                    <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                </div>--%>
<%--                                <div class="info">--%>
<%--                                    <h4 class="product-title"><a href="#" class="pr-name">Súp lơ xanh</a></h4>--%>
<%--                                    <div class="price ">--%>
<%--                                        <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                        <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                    </div>--%>
<%--                                    <div class="slide-down-box">--%>
<%--                                        <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                        <div class="buttons">--%>
<%--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                            <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="product-item">--%>
<%--                            <div class="contain-product layout-default">--%>
<%--                                <div class="product-thumb">--%>
<%--                                    <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                        <img src="assets/images/products/p-06.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                    </a>--%>
<%--                                    <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                </div>--%>
<%--                                <div class="info">--%>
<%--                                    <h4 class="product-title"><a href="#" class="pr-name">Lê</a></h4>--%>
<%--                                    <div class="price ">--%>
<%--                                        <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                        <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                    </div>--%>
<%--                                    <div class="slide-down-box">--%>
<%--                                        <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                        <div class="buttons">--%>
<%--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                            <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="product-item">--%>
<%--                            <div class="contain-product layout-default">--%>
<%--                                <div class="product-thumb">--%>
<%--                                    <a href="chiTietSanPham.jsp" class="link-to-product">--%>
<%--                                        <img src="assets/images/products/p-20.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">--%>
<%--                                    </a>--%>
<%--                                    <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>--%>
<%--                                </div>--%>
<%--                                <div class="info">--%>
<%--                                    <h4 class="product-title"><a href="#" class="pr-name">Khoai lang</a></h4>--%>
<%--                                    <div class="price ">--%>
<%--                                        <ins><span class="price-amount"><span class="currencySymbol"></span>20.000đ</span></ins>--%>
<%--                                        <del><span class="price-amount"><span class="currencySymbol"></span>25.000đ</span></del>--%>
<%--                                    </div>--%>
<%--                                    <div class="slide-down-box">--%>
<%--                                        <p class="message">Tất cả các sản phẩm đều được lựa chọn kỹ lưỡng để đảm bảo an toàn vệ sinh thực phẩm.</p>--%>
<%--                                        <div class="buttons">--%>
<%--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                            <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>--%>
<%--                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <jsp:include page="Footer.jsp"/>


    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

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
    <script>

        function remove(id_product,name_product){
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                let rawResult = xhttp.response;
                let result = rawResult.substring(0,rawResult.length-2);
                if(result === 'true'){
                    executeData1();
                    alert("xóa sản phẩm "+name_product +" THÀNH CÔNG");
                }else{
                    alert("xóa sản phẩm "+name_product +" THẤT BẠI");
                }
            }
            xhttp.open("GET", "RemoveCart?id_user=<%=ua.getId_user()%>&id_product="+id_product);
            xhttp.send();
        }
        function safeRemove(id_product,name_product){
            if (confirm("bạn có chắc muốn xóa sản phẩm: "+name_product)) {
                remove(id_product,name_product);
            } else {
               alert("xóa sản phẩm "+name_product +" THẤT BẠI");
            }
        }
        function removeAll(){
            if (confirm("bạn có chắc muốn xóa TẤT CẢ sản phẩm? ")) {
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function() {
                    executeData1();
                }

                xhttp.open("GET", "RemoveAllCart?id_user=<%=ua.getId_user()%>");
                xhttp.send();
            } else {
                alert("xóa TẤT CẢ sản phẩm  THẤT BẠI");
            }
        }
        function updateCart(id_product,amount,name_product){
            const xhttp = new XMLHttpRequest();
            console.log(id_product+", amount: "+amount+", name_product: "+name_product);
            xhttp.onload = function() {
                let rawResult = xhttp.response;
                let result = rawResult.substring(0,rawResult.length-2);
                executeData1();
                // if(result === 'true'){
                //     alert("thay đổi sản phẩm "+name_product +"<p style='color:green;'>THÀNH CÔNG</p>");
                // }else{
                //     alert("thay đổi sản phẩm "+name_product +" <p style='color:red;'>THẤT BẠI</p>");
                // }
            }
            xhttp.open("GET", "AddCart?id_user=<%=ua.getId_user()%>&id_product="+id_product+"&amount="+amount);
            xhttp.send();
        }
        var formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',

            // These options are needed to round to whole numbers if that's what you want.
            //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
            //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
        });
        function executeData1(){

            <%
            String id1 = ua.getId_user();
            %>

            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                let realData = "";
                let mydata = JSON.parse(this.responseText);
                console.log(mydata);
                let totalmoney = 0.0;
                for(let i =0;i<mydata.length;i++){
                    // console.log("");
                    let line = "ChiTietSanPham?id_product="+mydata[i].product.id_product;
                    realData += "<tr class=\"cart_item\">";
                    realData += "                                        <td class=\"product-thumbnail\" data-title=\"Product Name\">";
                    realData += "                                            <a class=\"prd-thumb\" href=\""+line+"\">";
                    realData += "                                                <figure><img width=\"113\" height=\"113\" src=\""+mydata[i].product.img_url+"\" alt=\"shipping cart\"><\/figure>";
                    realData += "                                            <\/a>";
                    realData += "                                            <a class=\"prd-name\" href=\""+line+"\">"+mydata[i].product.product_name+"<\/a>";
                    realData += "                                            <div class=\"action\" onclick='safeRemove(\""+mydata[i].product.id_product+"\",\""+mydata[i].product.product_name+"\")'>";
                    realData += "                                                <a class=\"remove\"   ><i class=\"fa fa-trash-o\" aria-hidden=\"true\"> xóa <\/i><\/a>";
                    realData += "                                            <\/div>";
                    realData += "                                        <\/td>";
                    realData += "                                        <td class=\"product-price\" data-title=\"Price\">";
                    realData += "                                            <div class=\"price price-contain\">";
                    realData += "                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+formatter.format(parseFloat(mydata[i].product.price_discount))+" <\/span><\/ins>";
                    realData += "                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+formatter.format(parseFloat(mydata[i].product.price))+" <\/span><\/del>";
                    realData += "                                            <\/div>";
                    realData += "                                        <\/td>";
                    realData += "                                        <td class=\"product-quantity\" data-title=\"Quantity\">";
                    realData += "                                            <div class=\"quantity-box type1\">";
                    realData += "                                                <div class=\"qty-input\">";
                    realData += "                                                    <input type=\"text\" name=\"qty12554\" value=\""+mydata[i].amount+"\" data-max_value=\"10000\" data-min_value=\"1\" data-step=\"1\">";
                    realData += "                                                    <a class=\"qty-btn btn-up\" onclick='updateCart(\""+mydata[i].product.id_product+"\",1,\""+mydata[i].product.product_name+"\")'><i class=\"fa fa-caret-up\" aria-hidden=\"true\" ><\/i><\/a>";
                    realData += "                                                    <a class=\"qty-btn btn-down\" onclick='updateCart(\""+mydata[i].product.id_product+"\",-1,\""+mydata[i].product.product_name+"\")'><i class=\"fa fa-caret-down\" aria-hidden=\"true\"><\/i><\/a>";
                    realData += "                                                <\/div>";
                    realData += "                                            <\/div>";
                    realData += "                                        <\/td>";
                    realData += "                                        <td class=\"product-subtotal\" data-title=\"Total\">";
                    realData += "                                            <div class=\"price price-contain\">";
                    let money_discount = parseFloat(mydata[i].amount)*parseFloat(mydata[i].product.price_discount);
                    let money = parseFloat(mydata[i].amount)*parseFloat(mydata[i].product.price);
                    realData += "                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+formatter.format(money_discount)+"<\/span><\/ins>";
                    realData += "                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+formatter.format(money)+"<\/span><\/del>";
                    realData += "                                            <\/div>";
                    realData += "                                        <\/td>";
                    realData += "                                    <\/tr>";
                    totalmoney+=parseFloat(mydata[i].amount)*parseFloat(mydata[i].product.price_discount);
                }
                realData += "                                    <tr class=\"cart_item wrap-buttons\">";
                realData += "                                        <td class=\"wrap-btn-control\" colspan=\"4\">";
                realData += "                                            <a href=\"TrangChu\" class=\"btn back-to-shop\">quay lại cửa hàng<\/a>";
                realData += "                                            <button class=\"btn btn-clear\" type=\"reset\" onclick='removeAll()'>xóa tất cả<\/button>";
                realData += "                                        <\/td>";
                realData += "                                    <\/tr>";
                const fee_ship = 0.1;
                let feeShip = totalmoney*fee_ship;
                let total_money_fee = totalmoney+totalmoney*fee_ship;
                document.getElementById("money-total-cart1").innerHTML = formatter.format(totalmoney);
                document.getElementById("fee-ship").innerHTML = formatter.format(feeShip);
                document.getElementById("money-total-cart-plus-feeShip").innerHTML = formatter.format(total_money_fee);
                document.getElementById("list-cart").innerHTML = realData;
            }
            let va = Math.random();
            xhttp.open("GET", "ShowCart?id_user=<%=id1%>&x="+va);
            xhttp.send();

        }
        executeData1();

    </script>

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