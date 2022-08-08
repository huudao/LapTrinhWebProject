<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Product" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%--<%--%>
<%--    if(session.getAttribute("auth")==null) {--%>
<%--        session.setAttribute("previousPage",request.getServletPath());--%>

<%--%>--%>
<%--&lt;%&ndash;<c:redirect url = "/dangNhap.jsp"/>&ndash;%&gt;--%>

<%--<%}%>--%>
<%List<Product> productsHot = (List<Product>) request.getAttribute("productsHot");
    List<Product> productsKhuyenMai = (List<Product>) request.getAttribute("productsKhuyenMai");
    String type = request.getAttribute("type").toString();
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Các loại sản phẩm <%=type%></title>
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

            constructor(id,name,type,priceDiscount,percentDiscount,price,shortDescription,imgUrl,numStar,numComment,outOfItem) {
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
                this._outOfItem = outOfItem;
            }

            get outOfItem(){
                return this._outOfItem;
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
        let seed = <%=request.getAttribute("seed")%>;
        let number = <%=request.getAttribute("originNumberProduct")%>;

        <%for (Product p : productsHot ) {
            boolean is = false;
        if(p.getAmount_bought()>=p.getAmount_imported()){
            //out of item
            is = false;
        }else{
            //available
            is = true;
        }
        %>
        //(id,name,type,priceDiscount,percentDiscount,price,shortDescription,description,imgUrl,numStar,numComment) {

        <%--console.log("<%=p.getProduct_name()%>, <%=p.getNumberComment()%>");--%>
        productsJs[productsJs.length] = new Product("<%=p.getId_product()%>","<%=p.getProduct_name()%>","<%=p.getProduct_type()%>"
            ,<%=p.getPriceDiscount()%>,<%=p.getPercent_discount()%>,<%=p.getPrice()%>,"<%=p.getShort_description()%>","<%=p.getImg_url()%>",<%=p.getNumstar()%>,<%=p.getNumberComment()%>,<%=is%>);

        <%}%>
        // console.log(productsJs);
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
    <jsp:include page="header.jsp"/>

    <!--Hero Section-->
    <div class="hero-section hero-background">
        <h1 class="page-title">Các loại sản phẩm loại <%=type%></h1>
    </div>

    <!--Navigation section-->
<!--    <div class="container">-->
<!--        <nav class="biolife-nav">-->
<!--            <ul>-->
<!--                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>-->
<!--                <li class="nav-item"><a href="#" class="permal-link">danh sách sản phẩm</a></li>-->
<!--                <li class="nav-item"><span class="current-page">Trái cây</span></li>-->
<!--            </ul>-->
<!--        </nav>-->
<!--    </div>-->
    <div>
        <br>
    </div>

    <div class="page-contain category-page no-sidebar">
        <div class="container">
            <div class="row">

                <!-- Main content -->
                <div id="main-content" class="main-content col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <div class="biolife-title-box">
                        <span class="subtitle">Sản phẩm tốt dành cho bạn</span>
                        <h3 class="main-title">Những sản phẩm khuyến mãi</h3>
                    </div>
                    <br>

                    <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">

                        <div class="tab-content">
                            <div id="tab01_1st" class="tab-contain active">
                                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":1 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":25 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                    <% for (Product p :productsKhuyenMai
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
                                                    <img src=<%=p.getImg_url()%> alt="Vegetables" width="270" height="270" class="product-thumnail">
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
                                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                        <a href="#" class="btn add-to-cart-btn" onclick="addCart('<%=p.getId_product()%>',1,'<%=p.getProduct_name()%>')"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>Thêm vào giỏ hàng</a>
                                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>

                        </div>
                    </div>

                    <div class="product-category grid-style">

                        <div id="top-functions-area" class="top-functions-area" >
                            <div class="flt-item to-left group-on-mobile">
                                <span class="flt-title">Xắp xếp theo giá: </span>
                                <a href="#" class="icon-for-mobile">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                                <div class="wrap-selectors">
                                    <form action="#" name="frm-refine" method="get">
                                        <span class="title-for-mobile">Xắp xếp theo giá: </span>

                                        <div data-title="Brand:" class="selector-item">
                                            <select name="brad" class="selector" id="option_price" onchange="arrange()">
                                                <option value="normal">mặc định</option>
                                                <option value="increase">từ thấp đến cao</option>
                                                <option value="decrease">từ cao đến thấp</option>

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
        <a type="button" onclick="runme()">click me</a>
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
                productListHtml += "                    <img src=\""+p.imgUrl+"\" alt=\"Vegetables\" style='height:270px;width: 270px;' width=\"270\" height=\"270\" class=\"product-thumnail\">";
                productListHtml += "                <\/a>";
                productListHtml += "                <a class=\"lookup btn_call_quickview\" href=\""+link_p+"\"><i class=\"biolife-icon icon-search\"><\/i><\/a>";
                productListHtml += "            <\/div>";
                productListHtml += "            <div class=\"info\">";
                if(p.outOfItem==false) {
                    productListHtml += "                <h4 class=\"product-title\"><a href=\"" + link_p + "\" class=\"pr-name\">\"" + p.name + "\"<p class='shipping-day' style='color:red;'>hết hàng</p><\/a><\/h4>";
                }else{
                    productListHtml += "                <h4 class=\"product-title\"><a href=\"" + link_p + "\" class=\"pr-name\">\"" + p.name + "\"<p class='shipping-day' style='color:green;'>còn hàng</p><\/a><\/h4>";

                }
                productListHtml += "                <div class=\"price \">";
                productListHtml += "                    <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>\""+p.priceDiscount+"\"đ<\/span><\/ins>";
                productListHtml += "                    <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>\""+p.price+"\"đ<\/span><\/del>";
                productListHtml += "                <\/div>";
                productListHtml += "                <div class=\"slide-down-box\">";
                productListHtml += "                    <p class=\"message\">\""+p.shortDescription+"\"<\/p>";
                productListHtml += "                    <div class=\"buttons\">";
                productListHtml += "                        <a href=\"#\" class=\"btn wishlist-btn\"><i class=\"fa fa-heart\" aria-hidden=\"true\"><\/i><\/a>";
                productListHtml += "                        <a type=\"button\" class=\"btn add-to-cart-btn\" onclick=\"addCart('"+p.id+"',1,'"+p.name+"')\"><i class=\"fa fa-cart-arrow-down\" aria-hidden=\"true\" ><\/i>Thêm vào giỏ hàng<\/a>";
                productListHtml += "                        <a href=\"#\" class=\"btn compare-btn\"><i class=\"fa fa-random\" aria-hidden=\"true\"><\/i><\/a>";
                productListHtml += "                    <\/div>";
                productListHtml += "                <\/div>";
                productListHtml += "            <\/div>";
                productListHtml += "        <\/div>";
                productListHtml += "    <\/li>";
            }
            document.getElementById("product-list").innerHTML = productListHtml;
        }
        //addCart("+p.id+",1,"+p.name+")
        //
        displayProduct(productsJs);

        var loadInterval = null;
        // var flag = true;
        $(window).scroll(function() {

            // console.log('run me: ',rect.top, rect.right, rect.bottom, rect.left);
            var scroll = $(window).scrollTop();
            var x = $(window).height();
            let bound = $(document).height() * 0.95;
            if (loadInterval==null && scroll + x > bound) {
                // flag = false;
                let next_num = number + 10;
                lazyNextLoad(seed, number, next_num);
                number = next_num;
                displayProduct(productsJs);
                loadInterval = setTimeout(function(){
                        //Nullified interval after 5 seconds
                        loadInterval = null;}
                    , 1000);
                // flag = true;
            }
        });
        function lazyNextLoad(seed,origin,next){
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                try {
                    let mydata = JSON.parse(this.responseText);
                    // alert('run');
                    console.log(mydata);
                    for (let i = 0; i < mydata.length; i++) {

                        let v = mydata[i].price * ((100 - mydata[i].percent_discount) / 100.0);
                        let is = false;
                        if (mydata[i].amount_bought >= mydata[i].amount_imported) {
                            //out of item
                            is = false;
                        } else {
                            //available
                            is = true;
                        }
                        console.log('run me please', mydata[i].id_product, mydata[i].product_name);
                        productsJs[productsJs.length] = new Product(mydata[i].id_product, mydata[i].product_name, mydata[i].product_type, v, mydata[i].percent_discount, mydata[i].price, mydata[i].short_description, mydata[i].img_url, mydata[i].numstar, mydata[i].numberComment, is);
                    }
                }catch (e) {
                    console.log('finish upload'+productsJs.length);
                }
            }
            xhttp.open("GET", "GetNextDataJsonProduct?seed="+seed+"&origin="+origin+"&next="+next, true);
            xhttp.send();
        }



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

            displayProduct(arr);
        }

    </script>
        <script>

            <%
                UserAccount ua =null;
        if(session.getAttribute("auth")!=null) {
            ua = (UserAccount) session.getAttribute("auth");
        }
               String id = "";
               if(ua==null){
               %>
            <%}else{
                    id = ua.getId_user();
                }%>
            function addCart(id_product,amount,name_product){
                // alert(id_product+", "+amount+", "+name_product);
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
            // function runme(){
            //     alert("run me finish");
            // }
            // alert("run this method");
        </script>
</body>

</html>