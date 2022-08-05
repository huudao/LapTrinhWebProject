<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Blog" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>chính sách giao hàng</title>
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
    <div class="hero-section hero-background style-02">
        <h1 class="page-title">CHÍNH SÁCH GIAO HÀNG</h1>
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
                <li class="nav-item"><span class="current-page">Các Blog</span></li>
            </ul>
        </nav>
    </div>

    <!-- Page Contain -->
    <div class="page-contain blog-page left-sidebar">
        <div class="container">
            <div class="row">

                <!-- Main content -->
                <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                    <!--Single Post Contain-->
                    <div class="single-post-contain">

                        <div class="post-head">
                            <div class="thumbnail">
                                <figure><img src="assets/images/blogpost/chinhSachGiaoHang.jpg" width="470" height="335" alt=""></figure>
                            </div>
                            <h2 class="post-name"></h2>
                        </div>

                        <div class="post-content">
                            <h1 style="font-size: 30px ;color: black">GIAO HÀNG TẠI RAU SẠCH THỰC PHẨM MIỀN TÂY</h1>
                            <p>Nhằm đáp ứng nhu cầu rất cao về sử dụng rau củ quả an toàn, tập trung các loại rau củ quả tốt cho sức khỏe cho người tiêu dùng.</p>
                            <p>CÔNG TY TNHH MTV THỰC PHẨM MIỀN TÂY kinh doanh theo tiêu chí “ tất cả vì lợi ích của khách hàng”. Chúng tôi chuyên cung cấp rau củ quả sạch cho các nhà hàng, khách sạn, bếp ăn công ty, trường học ... trên địa bàn thành phố Hồ Chí Minh và các tỉnh lân cận do vậy quý doanh nghiệp nào có nhu cầu hợp tác vui lòng liên hệ với chúng tối theo số: 0935 976 226 - 0906 305 212</p>
                            <h1  style="font-size: 24px ;color: black">HÌNH THỨC GIAO HÀNG LINH HOẠT, NHANH CHÓNG:</h1>
                            <p>- Chốt đơn hàng trước chiều hôm nay, giao hàng trong sáng hôm sau theo giờ quy định của khách hàng.</p>
                            <p >- Miễn phí giao hàng cho tổng đơn hàng trị giá trên 500,000 đồng.</p>
                            <p >- Nhận đổi trả hàng nếu hàng không đạt yêu cầu.</p>
                            <p >Cam kết luôn duy trì giá với mức theo sát giá thị trường, giá ngang bằng với các điểm chợ sỉ.</p>
                            <p >RAU CỦ QUẢ luôn được đóng gói sạch sẽ trước khi giao hàng.</p>
                            <p ><em><strong>Mọi chi tiết xin liên hệ:</strong></em></p>
                            <p>Địa chỉ: 861/72/11 Trần Xuân Soạn, P. Tân Hưng, Quận 7, TP. HCM</p>
                            <p>Điện thoại:&nbsp;0909 632 112 - 0906 305 212</p>
                            <p>Email:&nbsp;mekongfreshfood@gmail.com</p>
                            <p>Website: rausachgiasi.com</p>

                        </div>

                    </div>

                </div>

                <!-- Sidebar -->
                <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">

                    <div class="biolife-mobile-panels">
                        <span class="biolife-current-panel-title">Sidebar</span>
                        <a class="biolife-close-btn" href="#" data-object="open-mobile-filter">&times;</a>
                    </div>

                    <div class="sidebar-contain">



                        <!--Categories Widget-->
                        <div class="widget biolife-filter">
                            <h4 class="wgt-title">Các loại chính</h4>
                            <div class="wgt-content">
                                <ul class="cat-list">
                                    <li class="cat-list-item"><a href="#" class="cat-link">Các sản phẩm khuyễn mãi</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">các sản phẩm bán chạy</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">Trái cây</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">rau,củ,quả</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--Posts Widget-->
                        <div class="widget posts-widget">
                            <h4 class="wgt-title">Bài viết gần đây</h4>
                            <div class="wgt-content">
                                <ul class="posts">
                                    <%
                                        for (Blog b:(List<Blog>)request.getAttribute("relateBlogs")
                                             ) {
                                            String link = "ChiTietBlog?id_blog="+b.getId_blog();

                                    %>
                                    <li>
                                        <div class="wgt-post-item">
                                            <div class="thumb">
                                                <a href=<%=link%>>><img src=<%=b.getImg_url()%>> width="80" height="58" alt=""></a>
                                            </div>
                                            <div class="detail">
                                                <h4 class="post-name"><a style="font-size: 13px" href=<%=link%>><%=b.getName()%>></a></h4>
                                                <p class="post-archive"><%=b.getDate_post().toString()%>><span class="comment"><%=b.getNumberComment()%>> Bình luận</span></p>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href=""><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <jsp:include page="Footer.jsp"/>


    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

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