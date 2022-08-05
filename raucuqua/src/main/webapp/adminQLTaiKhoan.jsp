<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
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
    <link rel="stylesheet" href="./assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
</head>
<body>
    <jsp:include page="header.jsp"/>

    <div class="main">
        <div class="menu-side-bar">
            <p class="menu-side-bar-title">Main Navigation</p>
            <a href="" class="active">
                <i class="fa-solid fa-user"></i>
                Quản lý tài khoản
            </a>
            <a href="">
                <i class="fa-brands fa-blogger"></i>
                Quản lý Blog
            </a>
            <a href="">
                <i class="fa-brands fa-product-hunt"></i>
                Quản lý sản phẩm
            </a>
            <a href="">
                <i class="fa-solid fa-comment"></i>
                Email FeedBack
            </a>
        </div>
        <div class="main-frame">
            <h2>Quản lý tài khoản</h2>
            <div class="menu">
                <a href="#" class="menu-item-1">
                    <i class="fa-solid fa-user"></i>
                    Quản lý tài khoản
                </a>
                <a href="#" class="menu-item-2">
                    <i class="fa-brands fa-blogger"></i>
                    Quản lý Blog
                </a>
                <a href="#" class="menu-item-3">
                    <i class="fa-brands fa-product-hunt"></i>
                    Quản lý sản phẩm
                </a>
                <a href="#" class="menu-item-4">
                    <i class="fa-solid fa-comment"></i>
                    Email FeedBack
                </a>
            </div>
            <div class="table-frame">
                <ul class="responsive-table">
                    <li class="table-header">
                        <div class="col col-1">User ID</div>
                        <div class="col col-2">User name</div>
                        <div class="col col-3">Email</div>
                        <div class="col col-4">Password</div>
                    </li>
                    <li class="table-row">
                        <div class="col col-1">1</div>
                        <div class="col col-2">huudao</div>
                        <div class="col col-3">abc</div>
                        <div class="col col-4">jfsdkljflsdjfsldfjk</div>
                    </li>
                    <li class="table-row">
                        <div class="col col-1">1</div>
                        <div class="col col-2">huudao</div>
                        <div class="col col-3">abc</div>
                        <div class="col col-4">jfsdkfsdkljflsdjfsldfjkfsdkljflsdjfsldfjkfsdkljflsdjfsldfjkfsdkljflsdjfsldfjkljflsdjfsldfjk</div>
                    </li>
                    <li class="table-row">
                        <div class="col col-1">1</div>
                        <div class="col col-2">huudao</div>
                        <div class="col col-3">abc</div>
                        <div class="col col-4">jfsdkljflsdjfsldfjk</div>
                    </li>
                    <li class="table-row">
                        <div class="col col-1">1</div>
                        <div class="col col-2">huudao</div>
                        <div class="col col-3">abc</div>
                        <div class="col col-4">jfsdkljflsdjfsldfjk</div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <jsp:include page="Footer.jsp"/>
</body>
</html>
