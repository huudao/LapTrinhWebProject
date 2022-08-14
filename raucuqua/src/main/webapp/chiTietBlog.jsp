<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Blog" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.CommentBlog" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.IComment" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>chi tiết Blog</title>
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
    <h1 class="page-title">Blog Biolife Shop</h1>
    <nav class="biolife-nav">
        <ul>
            <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
            <li class="nav-item"><span class="current-page">Blog</span></li>
        </ul>
    </nav>
</div>

<!-- Page Contain -->
<div class="page-contain blog-page left-sidebar">
    <div class="container">
        <div class="row">
            <% Blog blog = (Blog) request.getAttribute("blog");

            %>
            <!-- Main content -->
            <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                <!--Single Post Contain-->
                <div class="single-post-contain">

                    <div class="post-head">
                        <div class="thumbnail">
                            <figure><img src=<%=blog.getImg_url()%> width="870" height="635" alt=""></figure>
                        </div>
                        <h2 class="post-name"><%=blog.getName()%>
                        </h2>
                        <p class="post-archive"><b class="post-cat"></b><span
                                class="post-date"> <%=blog.getDate_post().toString()%></span><span
                                class="author"><%=blog.getAuthor()%></span></p>
                    </div>

                    <div class="post-content">
                        <p><%=blog.getContent()%>
                        </p>Không nên cho chuối vào tủ lạnh.Thay vào đó, các bạn hãy để ở nhiệt độ phòng và bọc phần cuống lại bằng màng bọc thực phẩm.</p>--%>
                        <blockquote>
                            <address>
                            </address>
                        </blockquote>
                    </div>

                    <div class="post-foot">


                        <div class="auth-info">
                            <div class="ath">
                                <a href="#" class="avata"><img src="assets/images/blogpost/author-02.png" width="29"
                                                               height="28" alt="Christian Doe">Christian Doe</a>
                                <span class="count-item commented"><i class="fa fa-commenting"
                                                                      aria-hidden="true"></i><%=blog.getNumberComment()%></span>
                            </div>
                            <div class="socials-connection">
                                <span class="title">Chia sẻ:</span>
                                <ul class="social-list">
                                    <li><a href="#" class="socail-link"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                    </li>
                                    <li><a href="#" class="socail-link"><i class="fa fa-facebook"
                                                                           aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="socail-link"><i class="fa fa-pinterest"
                                                                           aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="socail-link"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                                    </li>
                                    <li><a href="#" class="socail-link"><i class="fa fa-instagram"
                                                                           aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                </div>

                <!--Comment Block-->
                <div class="post-comments">
                    <h3 class="cmt-title">Bình luân<sup>(<%=blog.getNumberComment()%>>)</sup></h3>
                    <div class="comment-form">
                        <form action="AddCommentBlog" method="post" name="frm-post-comment">
                            <p class="form-row">
                                <textarea name="message" id="txt-comment-ath-3364" cols="30" rows="10"
                                          placeholder="Viết bình luận của bạn"></textarea>
                                <a href="#" class="current-author"><img src="assets/images/blogpost/viewer-avt.png"
                                                                        width="41" height="41" alt=""></a>
                            </p>
                            <input type="hidden" name="id_blog" value="<%=blog.getId_blog()%>">
                            <input type="hidden" name="father_id_blog" value="">
                            <p class="form-row last-btns">
                                <button type="submit" class="btn btn-sumit">Đăng bình luận</button>
                            </p>
                        </form>
                    </div>

                    <div class="comment-list">

                        <ol class="post-comments lever-0">

                            <%
                                int count = 0;
                                for (CommentBlog commentBlog : blog.getCommentRootBlogs()
                                ) {
                                    count++;
                            %>
                            <li class="comment-elem">
                                <div class="wrap-post-comment">

                                    <div class="cmt-inner">

                                        <div class="auth-info">
                                            <a href="#" class="author-contact"><img
                                                    src="assets/images/blogpost/author-02.png" alt="" width="29"
                                                    height="28"><%=commentBlog.getId_user()%>
                                            </a>
                                            <span class="cmt-time"><%=commentBlog.getDate_post().toString()%></span>
                                        </div>
                                        <div class="cmt-content">
                                            <p><%=commentBlog.getComment_content()%>
                                            </p>
                                        </div>
                                        <!--cmt-fooot-->
                                        <div class="cmt-fooot">
                                            <a type="button" onclick="runme(<%=count%>)" class="btn btn-response"><i
                                                    class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>
                                        </div>
                                        <form action="AddCommentBlog" method="post" id="<%=count%>" hidden>
                                            <textarea type="text" name="message" rows="4" cols="50"></textarea>
                                            <input type="hidden" name="father_id_blog"
                                                   value="<%=commentBlog.getId_comment_blog()%>">
                                            <input type="hidden" name="id_blog" value="<%=commentBlog.getId_blog()%>">
                                            <button type="submit" value="send response"> gửi phản hồi</button>
                                        </form>
                                    </div>

                                    <% for (IComment x : commentBlog.getChildren()
                                    ) {
                                        CommentBlog child = (CommentBlog) x;
                                        count++;
                                    %>

                                    <div class="comment-resposes">
                                        <ol class="post-comments lever-1">
                                            <li class="comment-elem">
                                                <div class="wrap-post-comment">
                                                    <div class="cmt-inner">
                                                        <div class="auth-info">
                                                            <a href="#" class="author-contact"><img
                                                                    src="assets/images/blogpost/author-03.png" alt=""
                                                                    width="29" height="28">@<b
                                                                    style="color:green;"><%=child.getParent() + " "%>
                                                            </b><%=child.getId_user()%>
                                                            </a>
                                                            <span class="cmt-time"><%=child.getDate_post().toString()%></span>
                                                        </div>
                                                        <div class="cmt-content">
                                                            <p><%=child.getComment_content()%>
                                                            </p>
                                                        </div>
                                                        <div class="cmt-fooot">
                                                            <a type="button" onclick="runme(<%=count%>)"
                                                               class="btn btn-response"><i class="fa fa-commenting"
                                                                                           aria-hidden="true"></i>Phản
                                                                hồi</a>
                                                        </div>
                                                        <form action="AddCommentBlog" method="post" id="<%=count%>"
                                                              hidden>
                                                            <textarea type="text" name="message" rows="4"
                                                                      cols="50"></textarea>
                                                            <input type="hidden" name="father_id_blog"
                                                                   value="<%=child.getId_comment_blog()%>">
                                                            <input type="hidden" name="id_blog"
                                                                   value="<%=child.getId_blog()%>">
                                                            <button type="submit" value="send response"> gửi phản hồi
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                    <%}%>

                                </div>
                            </li>
                            <%}%>
                        </ol>
                    </div>

                </div>

            </div>

            <!-- Sidebar -->
            <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">
                <div class="sidebar-contain">

                    <!--Posts Widget-->
                    <div class="widget posts-widget">
                        <h4 class="wgt-title">Bài viết gần đây</h4>
                        <div class="wgt-content">
                            <ul class="posts">
                                <%
                                    List<Integer> numbersComment = (List<Integer>) request.getAttribute("numberCommentsWithRelateBlogs");
                                    Iterator<Integer> itor = numbersComment.iterator();
                                    for (Blog b : (List<Blog>) request.getAttribute("relateBlogs")
                                    ) {
                                        int numberComment = itor.next();
                                        String link = "ChiTietBlog?id_blog=" + b.getId_blog();
                                %>
                                <li>
                                    <div class="wgt-post-item">
                                        <div class="thumb">
                                            <a href=<%=link%>><img src=<%=b.getImg_url()%> width="80" height="58"
                                                                   alt=""></a>
                                        </div>
                                        <div class="detail">
                                            <h4 class="post-name"><a style="font-size: 13px;"
                                                                     href=<%=link%>><%=b.getName()%>
                                            </a></h4>
                                            <p class="post-archive"><%=b.getDate_post().toString()%>><span
                                                    class="comment"><%=numberComment%>> Bình luận</span></p>
                                        </div>
                                    </div>
                                </li>
                                <%}%>
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
<script>
    var textarea = $('#w3review');
    $("#popup").click(function () {

        // To show it
        textarea.show("fast");

    });
    // To get the value
    var value = textarea.val();
</script>
<script>
    function runme(count) {
        $("#" + count).toggle();
    }
</script>

</body>

</html>