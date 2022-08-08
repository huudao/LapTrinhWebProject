<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Product" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Blog" %>

<%@ page contentType="text/html; charset=UTF-8" %>

<%
    UserAccount ua =null;
    if(session.getAttribute("auth")!=null) {
        ua = (UserAccount) session.getAttribute("auth");
    }
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/css/main-color.css">

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


    <!-- Page Contain -->
    <div class="page-contain">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <!--Block 04: Banner Promotion 01 -->
            <div class="banner-promotion-01 xs-margin-top-50px sm-margin-top-11px">
                <div class="biolife-banner promotion biolife-banner__promotion">
                    <div class="banner-contain">
                        <div class="media background-biolife-banner__promotion">
                            <div class="img-moving position-2">
                                <img src="assets/images/home-03/img-moving-pst-2.png" width="185" height="265" alt="img msv">
                            </div>
                            <div class="img-moving position-3">
                                <img src="assets/images/home-03/img-moving-pst-3-cut.png" width="384" height="151" alt="img msv">
                            </div>
                            <div class="img-moving position-4">
                                <img src="assets/images/home-03/img-moving-pst-4.png" width="198" height="269" alt="img msv">
                            </div>
                        </div>
                        <div class="text-content">
                            <div class="container text-wrap" style="margin-top: 55px">
                                <i class="first-line">Trái cây tốt cho sức khỏe</i>
                                <span class="second-line">Rau củ quả tươi sạch</span>
<%--                                <p class="third-line">Rau, quả còn chứa nhiều chất xơ và các chất chống oxy hóa nên có tác dụng nâng cao sức khỏe, phòng chống các bệnh mạn tính không lây như tim mạch, huyết áp cao, ung thư... Ăn rau còn làm giảm mức cholesterol và tăng axit folic trong máu</p>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Block 05: Banner Promotion 02-->
            <!--Block 06: Products-->
            <div class="Product-box sm-margin-top-96px xs-margin-top-0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-5 col-sm-6">
                            <div class="advance-product-box">
                                <div class="biolife-title-box bold-style biolife-title-box__bold-style">
                                    <h3 class="title">Ưu đãi LỚN</h3>
                                </div>
                                <ul class="products biolife-carousel nav-top-right nav-none-on-mobile" data-slick='{"arrows":true, "dots":false, "infinite":false, "speed":400, "slidesMargin":30, "slidesToShow":1}'>
                                    <% Product firstDiscountProduct = (Product)request.getAttribute("firstProduct");
                                        String firstnotice = "";
                                        String firstcolor_notice ="color:black;";
                                        if(firstDiscountProduct.getAmount_bought()>=firstDiscountProduct.getAmount_imported()){
                                            firstnotice = "hết hàng";
                                            firstcolor_notice = "color:red;";
                                        }else{
                                            firstnotice = "còn hàng";
                                            firstcolor_notice = "color:green;";
                                        }
                                        if(firstDiscountProduct ==null)
                                            firstDiscountProduct = new Product();
                                        String firstLink = "dangNhap.jsp";
                                        if(ua!=null){
                                            firstLink = "AddCart";
                                        }
                                    %>

                                    <li class="product-item">
                                        <div class="contain-product deal-layout contain-product__deal-layout">
                                            <div class="product-thumb">
                                                <%String linkProductDetail = "ChiTietSanPham?id_product="+firstDiscountProduct.getId_product();%>
                                                <a href=<%=linkProductDetail%> class="link-to-product">
                                                    <img src=<%=firstDiscountProduct.getImg_url()%> alt="dd" width="330" height="330" class="product-thumnail">
                                                </a>
                                                <div class="labels">
                                                    <span class="sale-label">-<%=firstDiscountProduct.getPercent_discount()%>%</span>
                                                </div>
                                            </div>
                                            <div class="info">

                                                <b class="categories"></b>
                                                <h4 class="product-title"><a href=<%=linkProductDetail%> class="pr-name"><%=firstDiscountProduct.getProduct_name()%> <p class="shipping-day" style=<%=firstcolor_notice%><%=firstnotice%>></p></a></h4>
                                                <div class="price ">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span> <%=firstDiscountProduct.getPriceDiscount()%>đ</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=firstDiscountProduct.getPrice()%>đ</span></del>
                                                    <p class="shipping-day" style=<%=firstcolor_notice%>><%=firstnotice%>></p>
                                                </div>
                                                <div class="slide-down-box">
                                                    <p class="message"><%=firstDiscountProduct.getShort_description()%></p>
                                                    <div class="buttons">
<%--                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
                                                        <a class="btn add-to-cart-btn" type="button"onclick="addCart('<%=firstDiscountProduct.getId_product()%>',1,'<%=firstDiscountProduct.getProduct_name()%>')">Thêm vào giỏ hàng</a>

<%--                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-sm-6">
                            <div class="advance-product-box">
                                <div class="biolife-title-box bold-style biolife-title-box__bold-style">
                                    <h3 class="title">Sản phẩm được xếp hạng cao nhất (HOT)</h3>
                                </div>
                                <ul class="products biolife-carousel eq-height-contain nav-center-03 nav-none-on-mobile row-space-29px" data-slick='{"rows":2,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":2,"responsive":[{"breakpoint":1200,"settings":{ "rows":2, "slidesToShow": 2}},{"breakpoint":992, "settings":{ "rows":2, "slidesToShow": 1}},{"breakpoint":768, "settings":{ "rows":2, "slidesToShow": 2}},{"breakpoint":500, "settings":{ "rows":2, "slidesToShow": 1}}]}'>
                                    <%=((List<Product>)request.getAttribute("hotProducts")).size()%>
                                    <% for (Product p :(List<Product>)request.getAttribute("hotProducts")
                                            ) {
                                        String pnotice = "";
                                        String pcolor_notice ="color:black;";
                                        if(p.getAmount_bought()>=p.getAmount_imported()){
                                            pnotice = "hết hàng";
                                            pcolor_notice = "color:red;";
                                        }else{
                                            pnotice = "còn hàng";
                                            pcolor_notice = "color:green;";
                                        }

                                    %>
                                    <li class="product-item">
                                        <div class="contain-product right-info-layout contain-product__right-info-layout">
                                            <div class="product-thumb">
                                                <%String link_p = "ChiTietSanPham?id_product="+p.getId_product();%><%=link_p%>

                                                <a href=<%=link_p%> class="link-to-product">
                                                    <img src=<%=p.getImg_url()%> alt="dd" width="270" height="270" class="product-thumnail">
                                                </a>
                                            </div>
                                            <div class="info">
                                                <h4 class="product-title"><a href=<%=link_p%> class="pr-name"><%=p.getProduct_name()%> <p class="shipping-day" style=<%=pcolor_notice%>><%=pnotice%></p></a></h4>
                                                <div class="price ">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span><%=p.getPrice()%>đ</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=p.getPriceDiscount()%>đ</span></del>
                                                </div>
                                                <div class="rating">
                                                    <% String percent = "width-"+p.getNumstar()*10+"percent";%>
                                                    <p class="star-rating"><span class=<%=percent%>></span></p>
                                                    <span class="review-count"> (<%=p.getNumberComment()%> Đánh giá)</span>
                                                </div>

                                            </div>
                                        </div>

                                    </li>
                                    <%}%>
                                </ul>
                                <div class="biolife-banner style-01 biolife-banner__style-01 xs-margin-top-80px-im sm-margin-top-30px-im">
                                    <div class="banner-contain">
                                        <a href="banChay.jsp" class="bn-link"></a>
                                        <div class="text-content" style="margin-top: -17px">
                                            <span class="first-line">Tươi ngon</span>
                                            <b class="second-line">Tự nhiên</b>
                                            <i class="third-line">Thực phẩm sạch </i>
                                            <span class="fourth-line">Chất lượng tốt</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Block 03: Product Tab-->
            <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
                <div class="container">
                    <div class="biolife-title-box" style="background-color: #fafafa">
                        <span class="subtitle">Sản phẩm tốt dành cho bạn</span>
                        <h3 class="main-title">Những sản phẩm khuyến mãi</h3>
                    </div>
                    <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                        <div class="tab-content">
                            <div id="tab01_1st" class="tab-contain active">
                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                    <% for (Product p :(List<Product>)request.getAttribute("discountProducts")
                                    ) {
                                        String pnotice = "";
                                        String pcolor_notice ="color:black;";
                                        if(p.getAmount_bought()>=p.getAmount_imported()){
                                            pnotice = "hết hàng";
                                            pcolor_notice = "color:red;";
                                        }else{
                                            pnotice = "còn hàng";
                                            pcolor_notice = "color:green;";
                                        }
                                    %>
                                    <%String link_p = "ChiTietSanPham?id_product="+p.getId_product();%>

                                    <li class="product-item">
                                        <div class="contain-product layout-default">
                                            <div class="product-thumb">
                                                <a href=<%=link_p%> class="link-to-product">
                                                    <img src=<%=p.getImg_url()%> alt="Vegetables" style='height:270px;width: 270px;' width="270" height="270" class="product-thumnail">
                                                </a>
                                                <a class="lookup btn_call_quickview" href=<%=link_p%>><i class="biolife-icon icon-search"></i></a>
                                            </div>
                                            <div class="info">
                                                <h4 class="product-title"><a href=<%=link_p%> class="pr-name"><%=p.getProduct_name()%> <p class="shipping-day" style=<%=pcolor_notice%>><%=pnotice%></p></a></h4>
                                                <div class="price ">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span><%=p.getPriceDiscount()%>đ</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=p.getPrice()%>đ</span></del>
                                                </div>
                                                <div class="slide-down-box">
                                                    <p class="message"><%=p.getShort_description()%></p>
                                                    <div class="buttons">
                                                        <a type="button" class="btn add-to-cart-btn" onclick="addCart('<%=p.getId_product()%>',1,'<%=p.getProduct_name()%>')" ><i class="fa fa-cart-arrow-down" aria-hidden="true" ></i>Thêm vào giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!--Block 07: Brands-->
            <div class="brand-slide sm-margin-top-100px background-fafafa xs-margin-top-80px xs-margin-bottom-80px">
                <div class="container">
                    <ul class="biolife-carousel nav-center-bold nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}},{"breakpoint":450, "settings":{ "slidesToShow": 1, "slidesMargin":10}}]}'>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://www.organicgarage.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-01.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://www.explorganics.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-02.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://organiccertifiers.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-03.jpg" width="153" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="https://yerbamate.com/" class="link">
                                    <figure><img src="assets/images/home-03/brd-04.jpg" width="224" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-01.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-02.jpg" width="214" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-03.jpg" width="153" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="biolife-brd-container">
                                <a href="#" class="link">
                                    <figure><img src="assets/images/home-03/brd-04.jpg" width="224" height="163" alt=""></figure>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!--Block 08: Blog Posts-->
            <div class="blog-posts sm-margin-top-93px sm-padding-top-72px xs-padding-bottom-50px">
                <div class="container">
                    <div class="biolife-title-box">
                        <h3 class="main-title">Các blog mới và thú vị </h3>
                    </div>
                    <ul class="biolife-carousel nav-center nav-none-on-mobile xs-margin-top-36px" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":3, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 3}},{"breakpoint":992, "settings":{ "slidesToShow": 2}},{"breakpoint":768, "settings":{ "slidesToShow": 2}},{"breakpoint":600, "settings":{ "slidesToShow": 1}}]}'>
                            <!--Blog place li foreach-->
                        <%
                            List<Blog> blogs4 = (List<Blog>) request.getAttribute("blogs4");
                            for (Blog blog:blogs4
                            ) {
//                                    UserAccount ua = Search.searchUserById(blog.getName());
//                                    System.out.println("runme!"+ua.getUser_name());
                                String link_p = "ChiTietBlog?id_blog="+blog.getId_blog();

                        %>
                        <li>
                            <div class="post-item effect-01 style-bottom-info layout-02 ">
                                <div class="thumbnail">
                                    <a href=<%=link_p%> class="link-to-post"><img style='height:270px;width: 270px;' src=<%=blog.getImg_url()%> > width="370" height="270" alt=""></a>
                                    <div class="post-date">
                                        <span class="date"><%=blog.getDate_post().toString()%></span>
                                    </div>
                                </div>
                                <div class="post-content">
                                    <h4 class="post-name"><a href=<%=link_p%> class="linktopost"><%=blog.getName()%></a></h4>
                                    <div class="post-meta">
                                        <%--                                        <a href="#" class="post-meta__item author"><img src="" width="28" height="28" alt=""><span><%=ua.getUser_name()%></span></a>--%>
                                        <a  class="post-meta__item btn liked-count" href=<%=link_p%>><%=blog.getNumberComment()%><span class="biolife-icon icon-comment"></span></a>
                                        <%--                                        <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>--%>
                                        <%--                                        <div class="post-meta__item post-meta__item-social-box">--%>
                                        <%--                                            <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>--%>
                                        <%--                                            <div class="inner-content">--%>
                                        <%--                                                <ul class="socials">--%>
                                        <%--                                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>--%>
                                        <%--                                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>--%>
                                        <%--                                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>--%>
                                        <%--                                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>--%>
                                        <%--                                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>--%>
                                        <%--                                                </ul>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </div>
                                    <p class="excerpt"><%=blog.getShort_discription()%></p>
                                    <div class="group-buttons">
                                        <a  class="btn readmore" href=<%=link_p%>>Tìm hiểu thêm</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%}%>
                    </ul>
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
        <%
           String id = "";
           if(ua==null){
           %>
        <%}else{
                id = ua.getId_user();
            }%>
        function addCart(id_product,amount,name_product){
            const xhttp = new XMLHttpRequest();
            console.log(id_product+", amount: "+amount+", name_product: "+name_product);
            xhttp.onload = function() {
                let rawResult = xhttp.response;
                let result = rawResult.substring(0,rawResult.length-2);
                if(result === 'true'){
                    alert("thêm sản phẩm "+name_product +"<p style='color:green;'>THÀNH CÔNG</p>");
                }else{
                    alert("thêm sản phẩm "+name_product +" <p style='color:red;'>THẤT BẠI</p>");
                }
            }
            xhttp.open("GET", "AddCart?id_user=<%=id%>&id_product="+id_product+"&amount="+amount);
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
</body>

</html>