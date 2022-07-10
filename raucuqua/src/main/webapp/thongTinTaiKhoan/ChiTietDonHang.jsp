<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Bill" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.BoughtProduct" %>

<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BoughtProduct> boughtProducts = (List<BoughtProduct>) request.getAttribute("boughtProducts");
    UserAccount ua = (UserAccount) session.getAttribute("auth");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lịch sử đơn hàng</title>
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

                    <%
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
                            <li class="menu-item"><a href="TrangChu" style="color:red;">Trang chủ</a></li>
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
    <h1 class="page-title">Trang khách hàng</h1>
</div>

<!--Navigation section-->
<div class="container">
    <nav class="biolife-nav">
        <ul>
            <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
            <li class="nav-item"><span class="current-page">Trang khách hàng</span></li>
            <li class="nav-item"><span class="current-page">Đơn hàng của bạn</span></li>
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
                        <h5 class="title-head">Đơn hàng của <%=ua.getUser_name()%></h5>
                        <p>Xin chào,  <%=ua.getUser_name()%><span style="color:#38b653;"></span>&nbsp;!</p>
                        <ul>
                            <li>
                                <a class="title-info" href="thongTinTaiKhoan/thongTinTaiKhoan.jsp">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a disabled="disabled" href="ListBill">Đơn hàng của bạn</a>
                            </li>
                            <li>
                                <a class="title-info" href="thongTinTaiKhoan/doiMatKhau.jsp">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a class="title-info" href="ShowDiaChi">Sổ địa chỉ (0)</a>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="block-right">
                    <h1 class="title-head">Chi Tiết đơn hàng <%=bill.getId_bill()%></h1>
                    <p>id đơn hàng: <%=bill.getId_bill()%></p>
                    <p>ngày mua hàng: <%=bill.getDate_time().toString()%></p>
                    <p> địa chỉ: <%=bill.getAddress()%></p>
                    <p> giá trị đơn hàng(tổng tiền): <%=bill.getTotal_money()%></p>
                    <% if(bill.getState().equals("chưa thanh toán")){%>
                    <p>trạng thái: <div style="color: yellow;"><%=bill.getState()%></div></p>
                    <%}%>
                    <% if(bill.getState().equals("đã thanh toán")){%>
                    <p>trạng thái: <div style="color: green;"><%=bill.getState()%></div></p>
                    <%}%>
                    <p>số điện thoại: <%=bill.getPhone_number()%></p>

                    <table class="" id="product">
                        <thead class="">
                        <tr>
                            <th>hình ảnh</th>
                            <th>tên sản phẩm</th>
                            <th>giá hiện tại</th>
                            <th>giá khi mua</th>
                            <th>số lượng</th>
                            <th>xem chi tiết</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% for(BoughtProduct b:boughtProducts){
                        String link_p = "ChiTietSanPham?id_product="+b.getId_product();
                        %>

                        <tr>
                            <td>
                                <img src=<%=b.getImg_url()%> alt="dd" width="150" height="150" class="product-thumnail">
                            </td>
                            <td>
                                <%=b.getProduct_name()%>
                            </td><td>
                            <%=b.getPrice()%>
                        </td><td>
                            <%=b.getBoughtPrice()%>
                        </td><td>
                            <%=b.getAmount()%>
                        </td><td>
                            <a href="<%=link_p%>">link</a>
                        </td>
<%--                            <td href="">--%>
<%--                                <form method="post" action="DetailBill">--%>
<%--                                    <input type="hidden" name="id_bill" value="<%=b.getId_bill()%>">--%>
<%--                                    <button type="submit" >detail bill</button>--%>
<%--                                </form>--%>
<%--                            </td>--%>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
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
<script src="assets/js/jquery-3.6.0.min.js"></script>

<%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">--%>

<%--<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>--%>
<link rel="stylesheet" type="text/css" href="assets/js/dataTable/datatables.css"/>

<script type="text/javascript" src="assets/js/dataTable/datatables.js"></script>
<script>
    $(document).ready(function() {
        $('#product').DataTable();
    });
</script>
</body>

</html>