<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html class="no-js" lang="en">
<%@ page import="java.util.List" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.Cart" %>
<%@ page import="com.laptrinhweb.raucuqua.beans.UserAddress" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
    if(session.getAttribute("auth")==null) {
        session.setAttribute("previousPage",request.getServletPath());

%>
<c:redirect url = "/dangNhap.jsp"/>

<%}%>
<%
    UserAccount ua = (UserAccount) session.getAttribute("auth");
    List<Cart> carts = (List<Cart>) request.getAttribute("carts");
    int cart_size = carts.size();
    double totalMoney = (double) request.getAttribute("totalMoney");
    double feeShip = (double)request.getAttribute("feeShip");
    double total = (double)request.getAttribute("total");
    System.out.println("CART"+carts);
    List<UserAddress> addresses = (List<UserAddress>)request.getAttribute("addresses");
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang thanh toán</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/slick.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/main-color.css">
    <link rel="stylesheet" href="assets/css/checkout-style.css">
    <script>
        class UserAddress{
            constructor(id_address,city_province,district,ward,house_address,phone_number,user_name,is_choose) {
                this._city_province = city_province;
                this._district = district;
                this._ward = ward;
                this._id_address = id_address;
                this._house_address = house_address;
                this._phone_number = phone_number;
                this._user_name = user_name;
                this._is_choose = is_choose;
            }

            get user_name() {
                return this._user_name;
            }

            get is_choose() {
                return this._is_choose;
            }

            get id_address() {
                return this._id_address;
            }

            get city_province() {
                return this._city_province;
            }

            get district() {
                return this._district;
            }

            get ward() {
                return this._ward;
            }

            get house_address() {
                return this._house_address;
            }

            get phone_number() {
                return this._phone_number;
            }
        }
        var addresses = [];
        var chooseAddress = -1;
        <%for (UserAddress a : addresses ) {%>

        //id_address,city_province,district,ward,house_address,phone_number

        addresses[addresses.length] = new UserAddress("<%=a.getId_user()%>","<%=a.getCity_province()%>","<%=a.getDistrict()%>","<%=a.getWard()%>","<%=a.getHouse_address()%>","<%=a.getPhone_number()%>","<%=a.getUser_name()%>",<%=a.isChoose()%>);

        <%if(a.isChoose()==true){%>
            chooseAddress = addresses.length-1;
        <%}%>
        <%}%>
        if(chooseAddress==-1 && addresses.length!=0){
            chooseAddress =0;
        }
        console.log(addresses)
        console.log(chooseAddress)
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
        <h1 class="page-title">THANH TOÁN</h1>
    </div>

    <!--Navigation section-->
    <br>


    <div class="page-contain checkout">

        <!-- Main content -->
        <div id="main-content" class="main-content">
            <div class="container sm-margin-top-37px">
                <div class="row">

                    <!--checkout progress box-->
                    <div class="content-checkout-left col-lg-7 col-md-7 col-sm-6 col-xs-12">
                        <hr>
                        <h2 class="title-bill">THANH TOÁN VÀ GIAO HÀNG, xin chào <%=ua.getUser_name()%></h2>
<!--                        <h2  style="color:red">THIẾU SỐ LƯỢNG,cho phép khách hàng chọn địa chỉ.họ tên tự điền sẵn,email tự điền sẵn,sau khi thanh toán thành công sẽ nhận được biên lại,thiếu thanh toán bằng kiểu gì,.</h2>-->
                        <style>
                            .field__input-wrapper {
                                position: relative;
                            }
                        </style>
                        <div style="outline: #4CAF50 solid 10px;background-color: #4CAF50;">
<!--                            <button style="margin-left: 10px;">áp dụng địa chỉ</button>-->
<!--                            <br>-->
<!--                        <select style="color: black;background-color: black;margin-left: 20px;" name="cars" id="cars">-->
<!--                            <option style="color:black;" value="volvo">địa chỉ 1</option>-->
<!--                            <option style="color:black;" value="saab">địa chỉ 2</option>-->
<!--                            <option style="color:black;" value="opel">địa chỉ 3</option>-->
<!--                            <option style="color:black;" value="audi" >địa chỉ 4</option>-->
<!--                        </select>-->
                            <label class="form-label" style="color: white;">Sổ địa chỉ</label>

                            <input type="text" id = "address-input" list="addresses" placeholder="chọn địa chỉ" class="form-control">
                            <datalist id="addresses"  >
                            </datalist >
<!--                            <div class="field__input-wrapper">-->
<!--                                <label for="customer-address" class="field__label">Sổ địa chỉ</label>-->
<!--                                <select size="1" type="text" class="field__input field__input&#45;&#45;select" id="customer-address" data-bind="customerAddress">-->
<!--                                    <option value="0">Địa chỉ khác...</option>-->
<!--                                </select>-->
<!--                                <div class="field__caret">-->
<!--                                    <i class="fa fa-caret-down"></i>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                            <br>-->
                        </div>
                        <br>
                        <div class="content-checkout">
                            <form role='form' id ="content-form" action="DatHang" method="post">
                                <div style="padding: 0 15px" class="row">
                                    <div class="pdtop name-email">
                                        <div class="col-6">
                                            <label class="form-label" for="firstname">Họ tên</label>
                                            <input type="text" placeholder="Họ tên của bạn" name="firstname" value=""  id="firstname" class="form-control">
                                        </div>

                                        <div class="col-6">
                                            <label class="form-label" for="email">Email
                                                <span class="text-muted"> (Optional)</span>
                                            </label>
                                            <input type="text" id="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="pdtop col-5">
                                        <label class="form-label" >số điện thoại </label>

                                        <input type="text" list="phone_number" id="my_phone_number"name="my_phone_number" placeholder="vui lòng nhập số điện thoại" class="form-control">
                                       <datalist id="phone_number">

                                       </datalist>
                                    </div>
                                    <div class="pdtop col-5">
                                        <label class="form-label" >Tỉnh/Thành phố </label>

                                        <input type="text" list="browsers" id="city-province"name="city_province" placeholder="Vui lòng nhập tỉnh/thành phố" class="form-control">
                                        <datalist id="browsers">
                                            <option value="Thành phố Hồ Chí Minh">
                                            <option value="Đắc Lắc">
                                            <option value="Đồng Nai">
                                        </datalist>
                                    </div>
                                    <div class="pdtop col-5">
                                        <label class="form-label" >Quận/ Huyện </label>

                                        <input type="text" list="quan-huyen" id="district"name="district" placeholder="Vui lòng nhập quận/huyện" class="form-control">
                                        <datalist id="quan-huyen">
                                            <option value="Thủ Đức">
                                            <option value="Krong Pac">
                                            <option value="Đồng Nai">
                                        </datalist>
                                    </div>
                                    <div class="pdtop col-5">
                                        <label class="form-label" >Phường/ Xã </label>

                                        <input type="text" list="phuong-xa" id = "ward" name="ward" placeholder="Vui lòng nhập phường/xã" class="form-control">
                                        <datalist id="phuong-xa">
                                            <option value="Thành phố Hồ Chí Minh">
                                            <option value="Đắc Lắc">
                                            <option value="Đồng Nai">
                                        </datalist>
                                    </div>
                                    <input type = "hidden" name = "totalMoneyWithFee" value = "<%=request.getAttribute("total")%>" />
                                    <div class="pdtop col-12">
                                        <label class="form-label" for="house-address">Địa chỉ nhận hàng </label>
                                        <input type="text" id="house-address" name="house_address" placeholder="Vui lòng nhập địa chỉ nhận hàng" class="form-control">
                                    </div>
                                </div>
                                <hr>
                                <div class="plus-information">
                                    <h2 class="title-bill">THÔNG TIN BỔ SUNG</h2>
                                    <lable>Ghi chú đơn hàng (tuỳ chọn)</lable>
                                    <textarea name="order-comment" name="extra-infor" placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn." id="input-text" cols="2" rows="5"></textarea>
                                </div>

                            </form>
                        </div>
                    </div>

                    <!--Order Summary-->
                    <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12 sm-padding-top-48px sm-margin-bottom-0 xs-margin-bottom-15px">
                        <div class="order-summary sm-margin-bottom-80px">
                            <div class="title-block">
                                <h3 class="title">ĐƠN HÀNG CỦA BẠN</h3>
                                <a href="gioHangCuaBan.jsp" class="link-forward">Chỉnh sửa</a>
                            </div>
                            <div class="cart-list-box short-type">
                                <span class="number"><%=cart_size%> sản phẩm</span>
                                <ul class="cart-list">
                                    <%
                                        for(Cart cart:carts){
                                    %>
                                    <li class="cart-elem">
                                        <div class="cart-item">
                                            <div class="product-thumb">
                                                <a class="prd-thumb" href="#">
                                                    <figure><img src="<%=cart.getProduct().getImg_url()%>" width="113" height="113" alt="shop-cart" ></figure>
                                                </a>
                                            </div>
                                            <div class="info">
                                                <span class="txt-quantity"><%=cart.getAmount()%>X</span>
                                                <a href="chiTietSanPham.jsp" class="pr-name"><%=cart.getProduct().getProduct_name()%></a>
                                            </div>
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span><%=cart.getProduct().getPriceDiscount()%>></span></ins>
                                                <del><span class="price-amount"><span class="currencySymbol"></span><%=cart.getProduct().getPrice()%>></span></del>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li class="cart-elem">--%>
<%--                                        <div class="cart-item">--%>
<%--                                            <div class="product-thumb">--%>
<%--                                                <a class="prd-thumb" href="#">--%>
<%--                                                    <figure><img src="assets/images/shippingcart/pr-02.jpg" width="113" height="113" alt="shop-cart" ></figure>--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                            <div class="info">--%>
<%--                                                <span class="txt-quantity">1X</span>--%>
<%--                                                <a href="chiTietSanPham.jsp" class="pr-name">National Fresh Fruit</a>--%>
<%--                                            </div>--%>
<%--                                            <div class="price price-contain">--%>
<%--                                                <ins><span class="price-amount"><span class="currencySymbol"></span>90000đ</span></ins>--%>
<%--                                                <del><span class="price-amount"><span class="currencySymbol"></span>100000đ</span></del>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                                <ul class="subtotal">
                                    <li>
                                        <div class="subtotal-line">
                                            <b class="stt-name">Tạm tính</b>
                                            <span class="stt-price" id="totalMoney">£170.00</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="subtotal-line">
                                            <b class="stt-name">Phí ship</b>
                                            <span class="stt-price" id="feeShip">£20.00</span>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="subtotal-line">
                                            <b class="stt-name">Tổng:</b>
                                            <span class="stt-price" id="total">£190.00</span>
                                        </div>
                                    </li>
                                    <hr>
                                    <li style="color: black;border-style: solid;">
                                        <h3 style="margin:10px 5px" class="stt-name">PHƯƠNG THỨC THANH TOÁN</h3>
                                        <input onclick="notice()" style="margin:10px 5px" name="paymentMethod" id="paymentMethod-514019" type="radio" checked="checked" class="input-radio" data-bind="paymentMethod" value="514019"> thanh toán khi giao hàng(COD) <i class="fa fa-credit-card" style="color:green"></i></input>
                                        <p id="notice1"></p>
                                        <script>
                                            function notice(){
                                                document.getElementById("notice1").innerHTML = "Bạn chỉ phải thanh toán khi nhận được hàng";
                                            }
                                        </script>
                                    </li>
                                    <li>
                                        <button class="accept-payment" type="submit" form="content-form" onClick='return confirmSubmit()'>ĐẶT HÀNG</button>
                                    </li>
                                </ul>
                            </div>
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
        var formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',

            // These options are needed to round to whole numbers if that's what you want.
            //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
            //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
        });

        document.getElementById("totalMoney").innerHTML=formatter.format(<%=totalMoney%>)
        document.getElementById("feeShip").innerHTML=formatter.format(<%=feeShip%>)
        document.getElementById("total").innerHTML=formatter.format(<%=total%>)

        function confirmSubmit()
        {
            var agree=confirm("chúng tôi sẽ gửi mail hóa đơn cho bạn, bạn có muốn đặt hàng chứ?");
            if (agree)
                return true ;
            else
                return false ;
        }


        function getAddresses(){
            let optionAddress = "";
            for(let i =0;i<addresses.length;i++){
                optionAddress += " <option  id=\""+i+"\" value=\""+addresses[i].city_province+", "+addresses[i].district+", "+addresses[i].house_address+"\">";
            }
            document.getElementById("addresses").innerHTML =optionAddress;
        }
        getAddresses();
        function chooseAddress1(id){
            // console.log("run me "+id)
            let i =-1
            try{          i  = parseInt(id);
                if(i <0) return;
                let choose = addresses[i];
                console.log(i)
                console.log(i)
                console.log(typeof i)
                console.log(choose)
                document.getElementById("firstname").value = choose.user_name;
                document.getElementById("my_phone_number").value = choose.phone_number;
                document.getElementById("city-province").value = choose.city_province;
                document.getElementById("district").value = choose.district;
                document.getElementById("ward").value= choose.ward;
                document.getElementById("house-address").value  = choose.house_address;
                document.getElementById("address-input").value = "";
            }catch (e) {
                return;
            }

        }
        chooseAddress1(chooseAddress);
        // $(document).on('change', 'input', function() {
        //     // Does some stuff and logs the event to the consol
        //     // e
        //     let g = $('#address-input').val();
        //     let id = $('#addresses option[value=' + g +']').attr('data-id');
        //     chooseAddress1(id);
        // });
        $(function() {
            $('#address-input').on('input',function() {
                let opt = $('option[value="'+$(this).val()+'"]');
                chooseAddress1(opt.attr('id'));
                // alert(opt.length ? opt.attr('id') : 'NO OPTION');
            });
        });

    </script>

</body>

</html>