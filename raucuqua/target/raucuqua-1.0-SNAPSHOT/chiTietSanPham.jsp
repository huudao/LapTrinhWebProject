
<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Product" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.IComment" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.CommentProduct" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<%UserAccount ua = (UserAccount) session.getAttribute("auth");%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>chi tiết sản phẩm</title>
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
    <h1 class="page-title">Chi tiết sản phẩm</h1>
</div>

<br>
<div class="page-contain single-product">

    <div class="container">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <% Product p = (Product) request.getAttribute("product");
                String notice = "";
                String color_notice ="color:black;";
                if(p.getAmount_bought()>=p.getAmount_imported()){
                    notice = "hết hàng";
                    color_notice = "color:red;";
                }else{
                    notice = "còn hàng";
                    color_notice = "color:green;";
                }
                double feephip = p.getPriceDiscount()*((100-98)/100.0);
            %>
            <!-- summary info -->
            <div class="sumary-product single-layout">
                <div class="media">
                    <ul class="biolife-carousel slider-for" data-slick='{"arrows":false,"dots":false,"slidesMargin":30,"slidesToShow":1,"slidesToScroll":1,"fade":true,"asNavFor":".slider-nav"}'>
                        <li><img src=<%=p.getImg_url()%> alt="" width="500" height="500"></li>
<%--                        <li><img src="assets/images/details-product/p08.jpg" alt="" width="500" height="500"></li>--%>
<%--                        <li><img src="assets/images/details-product/p05.jpg" alt="" width="500" height="500"></li>--%>
<%--                        <li><img src="assets/images/details-product/p06.jpg" alt="" width="500" height="500"></li>--%>
<%--                        <li><img src="assets/images/details-product/p07.jpg" alt="" width="500" height="500"></li>--%>
                    </ul>
<%--                    <ul class="biolife-carousel slider-nav" data-slick='{"arrows":false,"dots":false,"centerMode":false,"focusOnSelect":true,"slidesMargin":10,"slidesToShow":4,"slidesToScroll":1,"asNavFor":".slider-for"}'>--%>
<%--                        <li><img src="assets/images/details-product/thumb_p09.jpg" alt="" width="88" height="88"></li>--%>
<%--                        <li><img src="assets/images/details-product/thumb_p08.jpg" alt="" width="88" height="88"></li>--%>
<%--                        <li><img src="assets/images/details-product/thumb_p05.jpg" alt="" width="88" height="88"></li>--%>
<%--                        <li><img src="assets/images/details-product/thumb_p06.jpg" alt="" width="88" height="88"></li>--%>
<%--                        <li><img src="assets/images/details-product/thumb_p07.jpg" alt="" width="88" height="88"></li>--%>
<%--                    </ul>--%>
                </div>
                <div class="product-attribute">

                    <h3 class="title"><%=p.getProduct_name()%>></h3>
                    <div class="rating">
                        <p class="star-rating"><span class="width-80percent"></span></p>
                        <span class="review-count"><%=p.getNumberComment()%> đánh giá</span>
                    </div>
                    <span class="sku">Mã sản phẩm: <%=p.getId_product()%>></span>
                    <p class="excerpt"><%=p.getShort_description()%></p>
                    <div class="price">
                        <ins><span class="price-amount"><span class="currencySymbol"></span><%=p.getPriceDiscount()%>đ</span></ins>
                        <del><span class="price-amount"><span class="currencySymbol"></span><%=p.getPrice()%>đ</span></del>
                    </div>
                    <div class="shipping-info">

                        <p class="shipping-day" style=<%=color_notice%>><%=notice%></p>

                    </div>
                </div>
                <div class="action-form">
                    <div class="quantity-box">
                        <span class="title">Số lượng:</span>
                        <div class="qty-input">
                            <input type="text" name="qty12554" id ="my-amount" value="1" data-max_value="1000" data-min_value="1" data-step="1">
                            <a href="#" class="qty-btn btn-up" onclick="updateCartFake()"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                            <a href="#" class="qty-btn btn-down"onclick="updateCartFake()"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <div class="total-price-contain">
                        <span class="title">Tổng:</span>
                        <p class="price" id="total"><%=p.getPriceDiscount()%></p>
                        <br>
                        <span class="title">phí vận chuyển(2%):</span>
                        <p class="price" id="fee"><%=feephip%>></p>

                        <hr>
                        <span class="title"  style="color:green;">tổng giá thành:</span>
                        <p class="price" id="totalMoney"><%=(p.getPriceDiscount()+feephip)%>></p>
                    </div>
                    <div class="buttons external-btn">
                        <br>
                        <% if(ua==null){
                            String line = "/ChiTietSanPham?id_product="+p.getId_product();
                            session.setAttribute("previousPage",line);
                        %>
                        <a href="dangNhap.jsp" class="btn add-to-cart-btn" style="background-color:green">thêm vào giỏ hàng</a>

                        <%}else{%>
                        <a type="button" class="btn add-to-cart-btn" style="background-color:green" onclick="addCart('<%=p.getId_product()%>','<%=p.getProduct_name()%>')">thêm vào giỏ hàng</a>

                        <%}%>
                        <p class="pull-row"></p>
                    </div>
                </div>
            </div>
            <script>
                function addCart(id_product,name_product){
                    let amount = parseInt(document.getElementById("my-amount").value);
                    const xhttp = new XMLHttpRequest();
                    xhttp.onload = function() {
                        let rawResult = xhttp.response;
                        let result = rawResult.substring(0,rawResult.length-2);
                        if(result === 'true'){
                            alert("thêm sản phẩm "+name_product +"<p style='color:green;'>THÀNH CÔNG</p>");
                        }else{
                            alert("thêm sản phẩm "+name_product +" <p style='color:red;'>THẤT BẠI</p>");
                        }
                    }
                    xhttp.open("GET", "AddCart?id_user=<%=(ua==null)?null:ua.getId_user()%>&id_product="+id_product+"&amount="+amount);
                    xhttp.send();
                }
                var formatter = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND',

                    // These options are needed to round to whole numbers if that's what you want.
                    //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
                    //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
                });
                function updateCartFake(){
                    let amount = parseInt(document.getElementById("my-amount").value);
                    let price_discount = parseInt("<%=p.getPriceDiscount()%>");
                    let feeShip = (price_discount*amount)*0.1;
                    let totalMoney = price_discount*amount +feeShip;
                    document.getElementById("total").innerHTML = formatter.format(price_discount*amount);
                    document.getElementById("fee").innerHTML = formatter.format(feeShip);
                    document.getElementById("totalMoney").innerHTML = formatter.format(totalMoney);
                }
            </script>
            <!-- Tab info -->
            <div class="product-tabs single-layout biolife-tab-contain">
                <div class="tab-head">
                    <ul class="tabs">
                        <li class="tab-element active"><a href="#tab_1st" class="tab-link">Mô tả sản phẩm</a></li>
                        <li class="tab-element" ><a href="#tab_3rd" class="tab-link">Giao hàng</a></li>
                        <li class="tab-element" ><a href="#tab_4th" class="tab-link">Phản hồi<sup><%=p.getNumberComment()%></sup></a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div id="tab_1st" class="tab-contain desc-tab active">
                        <p class="desc"><%=p.getDescription()%></p>
<%--                        <div class="desc-expand">--%>
<%--                            <span class="title">Organic Fresh Fruit</span>--%>
<%--                            <ul class="list">--%>
<%--                                <li>100% thành phần trái cây thật</li>--%>
<%--                                <li>100 túi trái cây tươi được gói riêng</li>--%>
<%--                                <li>Tự nhiên pha trộn giữa truyền thống phương Đông và phương Tây</li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
                    </div>
                    <div id="tab_3rd" class="tab-contain shipping-delivery-tab">
                        <div class="accodition-tab biolife-accodition">
                            <ul class="tabs">
                                <li class="tab-item">
                                    <span class="title btn-expand">Mất bao nhiêu thời gian thì tôi sẽ nhận được đơn hàng?</span>
                                    <div class="content">
                                        <p> Các đơn đặt hàng trước 3 giờ chiều theo giờ miền Đông thường sẽ được xử lý và giao hàng vào ngày làm việc tiếp theo. Đối với các đơn đặt hàng nhận được sau 3 giờ chiều, thông thường chúng sẽ được xử lý và giao hàng vào ngày làm việc thứ hai. Ví dụ: nếu bạn đặt hàng sau 3 giờ chiều Thứ Hai, đơn hàng sẽ được giao vào Thứ Tư. Ngày làm việc không bao gồm Thứ Bảy và Chủ Nhật và tất cả các ngày Lễ. Vui lòng cho phép thêm thời gian xử lý nếu bạn đặt hàng vào cuối tuần hoặc ngày lễ. Khi đơn đặt hàng được xử lý, tốc độ giao hàng sẽ được xác định như sau dựa trên phương thức vận chuyển đã chọn:</p>
                                        <div class="desc-expand">
                                            <span class="title">Phương thức giao hàng</span>
                                            <ul class="list">
                                                <li>Tiêu chuẩn (3-5 ngày)</li>
                                                <li>Ưu tiên (2-3 ngày)</li>
                                                <li>Tốc hành (1-2 ngày)</li>
                                                <li>Đơn đặt hàng Thẻ quà tặng được gửi qua Email. Thư Hạng Nhất sẽ được gửi trong vòng 8 ngày làm việc</li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="tab-item">
                                    <span class="title btn-expand">Chi phí vận chuyển được tính như thế nào?</span>
                                </li>
                                <li class="tab-item">
                                    <span class="title btn-expand">Tại sao đơn hàng của tôi không đủ điều kiện để được giao hàng MIỄN PHÍ?</span>

                                </li>
                                <li class="tab-item">
                                    <span class="title btn-expand">Hạn chế vận chuyển?</span>

                                </li>
                                <li class="tab-item">
                                    <span class="title btn-expand">Các gói không gửi được?</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="tab_4th" class="tab-contain review-tab">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                                    <div class="rating-info">
                                        <p class="index"><strong class="rating"><%=p.getNumstar()%></strong>out of 5</p>
                                        <%
                                            int[] arr = (int[]) request.getAttribute("numberstarsArray");
                                            double total = 0;
                                            for(int i =0;i<arr.length;i++){
                                                total+=arr[i];
                                            }
                                            System.out.println(((int)(p.getNumstar()*2*10)));
                                        %>
                                        <div class="rating"><p class="star-rating"><span class="width-<%=(int)(p.getNumstar()*2*10)%>percent"></span></p></div>
<%--                                        <p class="see-all">Xem tất cả 68 view</p>--%>
                                        <ul class="options">
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">5stars</span>
                                                    <span class="progres">
                                                        <%int result = (int) ((arr[2]/total)*100);%>
                                                        <%System.out.println("4star line process eror: "+result);%>
                                                            <span class="line-100percent"><span class="percent width-<%=(int) ((arr[4]/total)*100)%>percent"></span></span>
                                                        </span>
                                                    <span class="number"><%=arr[4]%></span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">4stars</span>
                                                    <span class="progres">

                                                            <span class="line-100percent"><span class="percent width-<%=result%>percent"></span></span>
                                                        </span>
                                                    <span class="number"><%=arr[3]%></span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">3stars</span>
                                                    <span class="progres">
                                                            <span class="line-100percent"><span class="percent width-<%=(int) ((arr[2]/total)*100)%>percent"></span></span>
                                                        </span>
                                                    <span class="number"><%=arr[2]%></span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">2stars</span>
                                                    <span class="progres">
                                                            <span class="line-100percent"><span class="percent width-<%=(int) ((arr[1]/total)*100)%>percent"></span></span>
                                                        </span>
                                                    <span class="number"><%=arr[1]%></span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">1star</span>
                                                    <span class="progres">
                                                            <span class="line-100percent"><span class="percent width-<%=(int) ((arr[0]/total)*100)%>percent"></span></span>
                                                        </span>
                                                    <span class="number"><%=arr[0]%></span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
                                    <div class="review-form-wrapper">
                                        <span class="title">GỬI BÀI ĐÁNH GIÁ CỦA BẠN</span>
                                        <form action="AddCommentProduct" name="frm-review" method="post">
                                            <div class="comment-form-rating">
                                                <label>1. Đánh giá của bạn về sản phẩm này:</label>
                                                <p class="stars">
                                                        <span>
                                                            <a class="btn-rating" data-value="star-1" id="1" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                            <a class="btn-rating" data-value="star-2"  id="2" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                            <a class="btn-rating" data-value="star-3" id="3" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                            <a class="btn-rating" data-value="star-4" id="4" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                            <a class="btn-rating" data-value="star-5" id="5" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                        </span>

                                                </p>
                                            </div>
                                            <p class="form-row">
                                                <textarea name="comment" id="txt-comment" cols="30" rows="10" placeholder="Viết đánh giá của bạn..."></textarea>
                                            </p>
                                            <input type="hidden" id="num-star" name="numStar" value=""/>
                                            <input type="hidden" id="id" name="id_product" value="<%=p.getId_product()%>"/>

                                            <p class="form-row">
                                                <button type="submit" name="submit">Đánh giá</button>
                                            </p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="comments">

                                <ol class="commentlist">
                                    <%
//                                        System.out.println("rumme!");
                                        for (IComment x: p.getRawCommentProducts().values()
                                             ) {
                                            CommentProduct comment = (CommentProduct) x;
//                                            System.out.println("run me "+comment.getId_comment_product());
                                        %>
                                    <li class="review">
                                        <div class="comment-container">
                                            <div class="row">
                                                <div class="comment-content col-lg-8 col-md-9 col-sm-8 col-xs-12">
                                                    <p class="comment-in"><span class="post-name"><%=comment.getId_user()%></span><span class="post-date"><%=comment.getDate_post().toString()%></span></p>
<%--                                                    <%System.out.println("comment 3 -> 5 stars: "+(comment.getNum_star()*100)/5);%>--%>
                                                    <div class="rating"><p class="star-rating"><span class="width-<%=(comment.getNum_star()*100)/5%>percent"></span><%=comment.getNum_star()%></p></div>
                                                    <p><%=comment.getComment_content()%></p>
                                                </div>
<!--                                                <div class="comment-review-form col-lg-3 col-lg-offset-1 col-md-3 col-sm-4 col-xs-12">-->
<!--                                                    <span class="title">bình luận này có hữu dụng không?</span>-->
<!--                                                    <ul class="actions">-->
<!--                                                        <li><a href="#" class="btn-act like" data-type="like"><i class="fa fa-thumbs-up" aria-hidden="true"></i>có (100)</a></li>-->
<!--                                                        <li><a href="#" class="btn-act report" data-type="dislike"><i class="fa fa-flag" aria-hidden="true"></i>báo cáo</a></li>-->
<!--                                                    </ul>-->
<!--                                                </div>-->
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li class="review">--%>
<%--                                        <div class="comment-container">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="comment-content col-lg-8 col-md-9 col-sm-8 col-xs-12">--%>
<%--                                                    <p class="comment-in"><span class="post-name">Nguyễn Bá Cường--%>
<%--</span><span class="post-date">01/04/2021</span></p>--%>
<%--                                                    <div class="rating"><p class="star-rating"><span class="width-80percent"></span></p></div>--%>
<%--                                                    <p class="comment-text">Vì sao mua online lại rẻ hơn vậy? Khi mua hàng online khác thế nào với khi mua ở cửa hàng?</p>--%>
<%--                                                </div>--%>
<%--<!--                                                <div class="comment-review-form col-lg-3 col-lg-offset-1 col-md-3 col-sm-4 col-xs-12">-->--%>
<%--<!--                                                    <span class="title">bình luận này có hữu dụng không?</span>-->--%>
<%--<!--                                                    <ul class="actions">-->--%>
<%--<!--                                                        <li><a href="#" class="btn-act like" data-type="like"><i class="fa fa-thumbs-up" aria-hidden="true"></i>có (100)</a></li>-->--%>
<%--<!--                                                        <li><a href="#" class="btn-act hate" data-type="dislike"><i class="fa fa-thumbs-down" aria-hidden="true"></i>không (20)</a></li>-->--%>
<%--<!--                                                        <li><a href="#" class="btn-act report" data-type="dislike"><i class="fa fa-flag" aria-hidden="true"></i>báo cáo</a></li>-->--%>
<%--<!--                                                    </ul>-->--%>
<%--<!--                                                </div>-->--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li class="review">--%>
<%--                                        <div class="comment-container">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="comment-content col-lg-8 col-md-9 col-sm-8 col-xs-12">--%>
<%--                                                    <p class="comment-in"><span class="post-name">Thuận</span><span class="post-date">03/04/2021</span></p>--%>
<%--                                                    <div class="rating"><p class="star-rating"><span class="width-80percent"></span></p></div>--%>
<%--                                                    <p class="comment-text">--%>
<%--                                                       nhà em mới trồng rau, shop có mua lại không ạ?.</p>--%>
<%--                                                </div>--%>
<%--<!--                                                <div class="comment-review-form col-lg-3 col-lg-offset-1 col-md-3 col-sm-4 col-xs-12">-->--%>
<%--<!--                                                    <span class="title">bình luận này có hữu dụng không?</span>-->--%>
<%--<!--                                                    <ul class="actions">-->--%>
<%--<!--                                                        <li><a href="#" class="btn-act like" data-type="like"><i class="fa fa-thumbs-up" aria-hidden="true"></i>có (100)</a></li>-->--%>
<%--<!--                                                        <li><a href="#" class="btn-act hate" data-type="dislike"><i class="fa fa-thumbs-down" aria-hidden="true"></i>không (20)</a></li>-->--%>
<%--<!--                                                        <li><a href="#" class="btn-act report" data-type="dislike"><i class="fa fa-flag" aria-hidden="true"></i>báo cáo</a></li>-->--%>
<%--<!--                                                    </ul>-->--%>
<%--<!--                                                </div>-->--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ol>
                                <div class="biolife-panigations-block version-2">
                                    <ul class="panigation-contain">
                                        <li><span class="current-page">1</span></li>
                                        <li><a href="#" class="link-page">2</a></li>
                                        <li><a href="#" class="link-page">3</a></li>
                                        <li><span class="sep">....</span></li>
                                        <li><a href="#" class="link-page">20</a></li>
                                        <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <div class="result-count">
                                        <p class="txt-count"><b>1-5</b> of <b>126</b> reviews</p>
                                        <a href="#" class="link-to">See all<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- related products -->
            <div class="product-related-box single-layout">
                <div class="biolife-title-box lg-margin-bottom-26px-im">
                    <span class="biolife-icon icon-organic"></span>
                    <h3 class="main-title">các sản phẩm liên quan</h3>
                </div>
                <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":0,"slidesToShow":5, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}}]}'>
                    <%
                        for (Product x :(List<Product>)request.getAttribute("relateProducts")
                             ) {
                            String xnotice = "";
                            String xcolor_notice ="color:black;";
                            if(x.getAmount_bought()>=x.getAmount_imported()){
                                xnotice = "hết hàng";
                                xcolor_notice = "color:red;";
                            }else{
                                xnotice = "còn hàng";
                                xcolor_notice = "color:green;";
                            }
                            String link_p = "ChiTietSanPham?id_product="+x.getId_product();

                    %>
                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
                        <div class="contain-product layout-default">
                            <div class="product-thumb">
                                <a href=<%=link_p%> class="link-to-product">
                                    <img src=<%=x.getImg_url()%> alt="dd" width="270" height="270" class="product-thumnail">
                                </a>
                            </div>
                            <div class="info">
                                <b class="categories"><%=x.getProduct_type()%>></b>
                                <h4 class="product-title"><a href=<%=link_p%> class="pr-name"><%=x.getProduct_name()%></a></h4>
                                <div class="price">
                                    <ins><span class="price-amount"><span class="currencySymbol"></span><%=x.getPriceDiscount()%>đ</span></ins>
                                    <del><span class="price-amount"><span class="currencySymbol"></span><%=x.getPrice()%>>đ</span></del>
                                </div>
                                <div class="shipping-info">
                                    <p class="shipping-day" style=<%=xcolor_notice%>><%=xnotice%>></p>
                                </div>
                                <div class="slide-down-box">
                                    <p class="message"><%=x.getShort_description()%></p>
                                    <div class="buttons">
                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>
                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%}%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Fresh Fruit</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>


<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories"> Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Fresh Fruit</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories"> Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Fresh Fruit</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories"> Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">combo bơ+lựu đầy dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>300.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">combo giúp bạn thư giãn và bổ sung dinh dưỡng rất tốt cho sức khỏe của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng.</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-13.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name"> hồng đào gói bịch </a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>15.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>40.000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">Fresh Fruit</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Táo tàu khô loại tốt</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>250.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span></span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day" style="color:red;">hết hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">giá trị hồng đào liên quan tới vitamin C sẽ giúp ích cho hệ tiêu hóa của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">--%>
<%--                        <div class="contain-product layout-default">--%>
<%--                            <div class="product-thumb">--%>
<%--                                <a href="#" class="link-to-product">--%>
<%--                                    <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="info">--%>
<%--                                <b class="categories">trái cây</b>--%>
<%--                                <h4 class="product-title"><a href="#" class="pr-name">Ngũ cốc dinh dưỡng</a></h4>--%>
<%--                                <div class="price">--%>
<%--                                    <ins><span class="price-amount"><span class="currencySymbol"></span>80.000đ</span></ins>--%>
<%--                                    <del><span class="price-amount"><span class="currencySymbol"></span>240000đ</span></del>--%>
<%--                                </div>--%>
<%--                                <div class="shipping-info">--%>
<%--                                    <p class="shipping-day">còn hàng</p>--%>
<%--                                </div>--%>
<%--                                <div class="slide-down-box">--%>
<%--                                    <p class="message">ngũ cốc giúp bạn bổ sung các chất dinh dưỡng cần thiết cho cơ thể của bạn</p>--%>
<%--                                    <div class="buttons">--%>
<%--                                        <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>--%>
<%--                                        <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>thêm vào giỏ hàng</a>--%>
<%--                                        <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
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

        // These options are needed to round to whole numbers if that's what you want.
        //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
        //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
    });
    function executeData(){
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
<script>
    var myDocument = 0;
    $(document).ready(function(){
        $(".btn-rating").click(function(event) {
            myDocument = this.id;
            document.getElementById("num-star").value = myDocument;
            console.log((myDocument));
            run()
        });
    });
</script>
<script>
    function run(){
        console.log((myDocument));
    }
</script>
</body>

</html>