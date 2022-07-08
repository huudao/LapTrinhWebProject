<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Product" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%List<Product> products = (List<Product>) request.getAttribute("productHot");
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sản phẩm HOT</title>
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
    <script>
        class Product{

            constructor(id,name,type,priceDiscount,percentDiscount,price,shortDescription,imgUrl,numStar,numComment) {
                this._id = id;
                this._name = name;
                this._type = type;
                this._priceDiscount = priceDiscount;
                this._percentDiscount = percentDiscount;
                this._price = price;
                this._shortDescription = shortDescription;
                // this._description = description;
                this._imgUrl = imgUrl;
                this._numStar = numStar;
                this._numComment = numComment;
            }


            get id() {
                return this._id;
            }

            get name() {
                return this._name;
            }

            get type() {
                return this._type;
            }

            get priceDiscount() {
                return this._priceDiscount;
            }

            get percentDiscount() {
                return this._percentDiscount;
            }

            get price() {
                return this._price;
            }

            get shortDescription() {
                return this._shortDescription;
            }

            get imgUrl() {
                return this._imgUrl;
            }

            get numStar() {
                return this._numStar;
            }

            get numComment() {
                return this._numComment;
            }
            toString(){
                return "id: "+this._id+", name: "+this._name
                    ;
            }
        }
        var productsJs = [];
        <%for (Product p : products ) {
        %>
        //(id,name,type,priceDiscount,percentDiscount,price,shortDescription,description,imgUrl,numStar,numComment) {

        <%--console.log("<%=p.getProduct_name()%>, <%=p.getNumberComment()%>");--%>
        productsJs[productsJs.length] = new Product("<%=p.getId_product()%>","<%=p.getProduct_name()%>","<%=p.getProduct_type()%>"
            ,<%=p.getPriceDiscount()%>,<%=p.getPercent_discount()%>,<%=p.getPrice()%>,"<%=p.getShort_description()%>","<%=p.getImg_url()%>",<%=p.getNumstar()%>,<%=p.getNumberComment()%>);

        <%}%>
        console.log("run me")
        console.log(productsJs);
    </script>
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
<header id="header" class="header-area style-01 layout-03">
    <div class="header-top bg-main hidden-xs">
        <div class="container">
            <div class="top-bar left">
                <ul class="horizontal-menu">
                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>Organic@company.com</a></li>
                    <li><a href="#">Giao hàng miễn phí cho tất cả đơn hàng từ 200K</a></li>
                </ul>
            </div>
            <div class="top-bar right">
                <ul class="social-list">
                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                </ul>
                <ul class="horizontal-menu">
                    <!--                        <li class="horz-menu-item currency">-->
                    <!--                            <select name="currency">-->
                    <!--                                <option value="eur">€ EUR (Euro)</option>-->
                    <!--                                <option value="usd" selected>$ USD (Dollar)</option>-->
                    <!--                                <option value="usd">£ GBP (Pound)</option>-->
                    <!--                                <option value="usd">¥ JPY (Yen)</option>-->
                    <!--                                <option value="usd">đ VND (VND)</option>-->
                    <!--                            </select>-->
                    <!--                        </li>-->
                    <!--                        <li class="horz-menu-item lang">-->
                    <!--                            <select name="language">-->
                    <!--                                <option value="fr">French (EUR)</option>-->
                    <!--                                <option value="en" selected>English (USD)</option>-->
                    <!--                                <option value="ger">Germany (GBP)</option>-->
                    <!--                                <option value="jp">Japan (JPY)</option>-->
                    <!--                                <option value="jp">Việt Nam (VND)</option>-->
                    <!--                            </select>-->
                    <!--                        </li>-->
                    <%
                        UserAccount ua = (UserAccount) session.getAttribute("auth");
                        if(ua==null){%>
                    <li><a href="dangNhap.jsp" class="login-link"><i class="biolife-icon icon-login"></i>Đăng nhập/</a> <a href="dangKy.jsp"> Đăng ký</a></li>
                    <%}else {%>
                    <li><a href="thongTinTaiKhoan/thongTinTaiKhoan.jsp" class="login-link"><i class="biolife-icon icon-login"></i>xin chào <%=ua.getUser_name()%> <a href="LogOut">/ Thoát</a></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
    <div class="header-middle biolife-sticky-object ">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-md-6 col-xs-6">
                    <a href="TrangChu" class="biolife-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                </div>
                <div class="col-lg-7 col-md-7 hidden-sm hidden-xs">
                    <div class="primary-menu">
                        <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                            <li class="menu-item"><a href="TrangChu" >Trang chủ</a></li>
                            <li class="menu-item"><a href="KhuyenMai"> khuyễn mãi</a></li>
                            <li class="menu-item"><a href="BanChay">Sản phẩm HOT</a></li>
                            <li class="menu-item"><a href="ChinhSachGiaoHang">Chính sách </a></li>
                            <li class="menu-item"><a href="DanhSachBlog">Blog</a></li>
                            <li class="menu-item"><a href="lienHe.jsp">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-md-6 col-xs-8">
                    <div class="biolife-cart-info">
                        <div class="mobile-search">
                            <a href="javascript:void(0)" class="open-searchbox"><i class="biolife-icon icon-search"></i></a>
                            <div class="mobile-search-content">
                                <form action="#" class="form-search" name="mobile-seacrh" method="get">
                                    <a href="#" class="btn-close"><span class="biolife-icon icon-close-menu"></span></a>
                                    <input type="text" name="s" class="input-text" value="" placeholder="Search here...">
                                    <button type="submit" class="btn-submit">go</button>
                                </form>
                            </div>
                        </div>
                        <div class="wishlist-block hidden-sm hidden-xs">
                            <a href="#" class="link-to">
                                <!--                                    <span class="icon-qty-combine">-->
                                <!--                                        <i class="icon-heart-bold biolife-icon"></i>-->
                                <!--                                        &lt;!&ndash;                                    <span class="qty">4</span>&ndash;&gt;-->
                                <!--                                    </span>-->
                            </a>
                        </div>
                        <div class="minicart-block" onmouseover="executeData()">
                            <div class="minicart-contain">
                                <!--                                    <a href="javascript:void(0)" class="link-to">-->
                                <a href="gioHangCuaBan.jsp" class="link-to">
                                            <span class="icon-qty-combine">
                                                <i class="icon-cart-mini biolife-icon"><i style="color:#b9b6b6;"></i></i>
                                                <!--                                            <span class="qty">8</span>-->
                                            </span>
                                    <span class="title">Giỏ hàng của bạn </span>
                                    <span class="sub-total" id="money-total-cart">0.00</span>

                                </a>

                                <div class="cart-content" >
                                    <div class="cart-inner">



                                        <ul class="products" id="products-cart">

                                        </ul>






                                        <p class="btn-control">
                                            <a href="gioHangCuaBan.jsp" class="btn view-cart">Xem giỏ hàng </a>
                                            <a href="ThanhToan" class="btn">Thanh toán</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mobile-menu-toggle">
                            <a class="btn-toggle" data-object="open-mobile-menu" href="javascript:void(0)">
                                <span></span>
                                <span></span>
                                <span></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom hidden-sm hidden-xs">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="vertical-menu vertical-category-block">
                        <div class="block-title">
                                <span class="menu-icon">
                                    <span class="line-1"></span>
                                    <span class="line-2"></span>
                                    <span class="line-3"></span>
                                </span>
                            <span class="menu-title">Danh sách sản phẩm</span>
                            <span class="angle" data-tgleclass="fa fa-caret-down"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                        </div>
                        <div class="wrap-menu">
                            <ul class="menu clone-main-menu">
                                <li class="menu-item menu-item-has-children has-megamenu">
                                    <a href="KhuyenMai" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top sản phẩm khuyến mãi</a>
                                </li>
                                <li class="menu-item menu-item-has-children has-megamenu">
                                    <a href="BanChay" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top sản phẩm bán chạy</a>
                                </li>
                                <li class="menu-item menu-item-has-children has-megamenu">
                                    <a href="CacLoaiSanPham?type=traicay" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Trái cây</a>
                                </li>
                                <li class="menu-item menu-item-has-children has-megamenu">
                                    <a href="CacLoaiSanPham?type=raucu" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau củ</a>
                                </li>
                                <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fresh Berries"><i class="biolife-icon icon-grape"></i>Qủa mọng</a>-->
                                <!--                                    </li>-->
                                <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau củ quả gia vị</a>-->
                                <!--                                    </li>-->
                                <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Các loại quả nhập khẩu</a>-->
                                <!--                                    </li>-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 padding-top-2px">
                    <div class="header-search-bar layout-01">
                        <form action="#" class="form-search" name="desktop-seacrh" method="get">
                            <input list="livesearch" type="text" name="s" class="input-text" value="" onkeyup="showResult(this.value)" placeholder="Tìm kiếm sản phẩm...">
                            <%--                                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>--%>
                            <ul id="livesearch">

                            </ul>
                        </form>

                    </div>
                    <div class="live-info">
                        <p class="telephone"><i class="fa fa-phone" aria-hidden="true"></i><b class="phone-number">(+900) 123 456 7891</b></p>
                        <p class="working-time">Thứ 2-6: 8:30am-7:30pm; Thứ 7-CN: 9:30am-4:30pm</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!--Hero Section-->
<div class="hero-section hero-background">
    <h1 class="page-title">Những sản phẩm bán chạy</h1>
</div>


<div>
    <br>
</div>

<div class="page-contain category-page no-sidebar">
    <div class="container">
        <div class="row">

            <!-- Main content -->
            <div id="main-content" class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="product-category grid-style">

                    <div id="top-functions-area" class="top-functions-area" >
                        <div class="flt-item to-left group-on-mobile">
                            <span class="flt-title">Sắp xếp giá:</span>
                            <a href="#" class="icon-for-mobile">
                                <span></span>
                                <span></span>
                                <span></span>
                            </a>
                            <div class="wrap-selectors">
                                <form action="#" name="frm-refine" method="get">
                                    <div data-title="Price:" class="selector-item">
                                        <select name="price" class="selector" id ="option_price" onchange="arrange()">
                                            <option value="normal">Mặc định </option>
                                            <option value="increase">Tăng dần</option>
                                            <option value="decrease">Giảm dần</option>
                                        </select>
                                    </div>
                                    <span class="flt-title" style="margin-left:15px ;">Phân loại:</span>
                                    <div data-title="Brand:" class="selector-item">
                                        <select name="brad" class="selector" id = "option_classification" onchange="arrange()">
                                            <option value="normal">Mặc định</option>
                                            <option value="traicay">Trái cây</option>
                                            <option value="raucu">Rau củ</option>

                                        </select>
                                    </div>

                                    <p class="btn-for-mobile"><button type="submit" class="btn-submit">Go</button></p>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <ul class="products-list" id="product-list">

                        </ul>
                    </div>

                    <div class="biolife-panigations-block">
                        <ul class="panigation-contain">
                            <li><span class="current-page">1</span></li>
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
    </div>
</div>

<!-- FOOTER -->
<jsp:include page="Footer.jsp"/>
<script src="assets/js/jquery-3.4.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.countdown.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/jquery.nicescroll.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/biolife.framework.js"></script>
<script src="assets/js/functions.js"></script>
<script>
    function priceArrangeIncrease(a, b) {
        if (a.priceDiscount > b.priceDiscount) {
            return 1;
        }
        if (a.priceDiscount < b.priceDiscount) {
            return -1;
        }
        return 0;
    }

    function priceArrangeDecrease(a, b) {
        if (a.priceDiscount > b.priceDiscount) {
            return -1;
        }
        if (a.priceDiscount < b.priceDiscount) {
            return 1;
        }
        return 0;
    }
    function displayProduct(arr){
        let productListHtml = "";
        for(let i=0;i<arr.length;i++){
            let p = arr[i];
            let link_p = "ChiTietSanPham?id_product="+p.id;
            productListHtml += "<li class=\"product-item col-lg-3 col-md-3 col-sm-4 col-xs-6\">";
            productListHtml += "        <div class=\"contain-product layout-default\">";
            productListHtml += "            <div class=\"product-thumb\">";
            productListHtml += "                <a href=\""+link_p+"\" class=\"link-to-product\">";
            productListHtml += "                    <img src=\""+p.imgUrl+"\" alt=\"Vegetables\" width=\"270\" height=\"270\" class=\"product-thumnail\">";
            productListHtml += "                <\/a>";
            productListHtml += "                <a class=\"lookup btn_call_quickview\" href=\""+link_p+"\"><i class=\"biolife-icon icon-search\"><\/i><\/a>";
            productListHtml += "            <\/div>";
            productListHtml += "            <div class=\"info\">";
            productListHtml += "                <h4 class=\"product-title\"><a href=\""+link_p+"\" class=\"pr-name\">\""+p.name+"\"<\/a><\/h4>";
            productListHtml += "                <div class=\"price \">";
            productListHtml += "                    <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>\""+p.priceDiscount+"\"đ<\/span><\/ins>";
            productListHtml += "                    <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>\""+p.price+"\"đ<\/span><\/del>";
            productListHtml += "                <\/div>";
            productListHtml += "                <div class=\"slide-down-box\">";
            productListHtml += "                    <p class=\"message\">\""+p.shortDescription+"\"<\/p>";
            productListHtml += "                    <div class=\"buttons\">";
            productListHtml += "                        <a href=\"#\" class=\"btn wishlist-btn\"><i class=\"fa fa-heart\" aria-hidden=\"true\"><\/i><\/a>";
            productListHtml += "                        <a href=\"#\" class=\"btn add-to-cart-btn\"><i class=\"fa fa-cart-arrow-down\" aria-hidden=\"true\"><\/i>Thêm vào giỏ hàng<\/a>";
            productListHtml += "                        <a href=\"#\" class=\"btn compare-btn\"><i class=\"fa fa-random\" aria-hidden=\"true\"><\/i><\/a>";
            productListHtml += "                    <\/div>";
            productListHtml += "                <\/div>";
            productListHtml += "            <\/div>";
            productListHtml += "        <\/div>";
            productListHtml += "    <\/li>";
        }
        document.getElementById("product-list").innerHTML = productListHtml;
    }

    displayProduct(productsJs);

    function arrange() {
        //shallow copy
        let arr = productsJs.slice();
        //arrange

        let option = document.getElementById('option_price').value;
        if((option==="normal")==false) {

            if (option === "increase") {
                arr.sort(priceArrangeIncrease);
            }
            if (option === "decrease") {
                arr.sort(priceArrangeDecrease);
            }
        }
        //classify
        var classify = document.getElementById('option_classification').value;

        if((classify==="normal")==false){
            let indexRemove = [];

            let value ="";
            if (classify === "traicay") {
                value = "rau củ"
            }
            if (classify === "raucu") {
                value = "trái cây"
            }
            //remove different element type
            for (let i=0;i<arr.length;i++){
                if(arr[i].type===value) {
                    arr.splice(i,1);
                    i--;
                }
            }
        }
        displayProduct(arr);
    }
</script>

</body>

</html>