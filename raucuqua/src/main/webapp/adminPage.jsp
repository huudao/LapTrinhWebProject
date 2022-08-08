<%@ page import="com.laptrinhweb.raucuqua.beans.UserAccount" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    UserAccount ua = (UserAccount) session.getAttribute("auth");
    String pageTo = (String) request.getAttribute("page");

    LocalDate currentDate = LocalDate.now();
%>


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
    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="main">
    <div class="menu-side-bar">
        <p class="menu-side-bar-title">Main Navigation</p>
        <a href="javascript:void(0)" class="menu-side-bar-item m1" onclick="loadDataAccount()">
            <i class="fa-solid fa-user"></i>
            Quản lý tài khoản
        </a>
        <a href="javascript:void(0)" class="menu-side-bar-item m2" onclick="loadDataProduct()">
            <i class="fa-brands fa-product-hunt"></i>
            Quản lý sản phẩm
        </a>
        <a href="javascript:void(0)" class="m3" onclick="loadDataFeedBack()">
            <i class="fa-solid fa-comment"></i>
            Email FeedBack
        </a>
        <a href="javascript:void(0)" class="m4" onclick="loadDataBill() ; computeIncome()">
            <i class="fa-solid fa-money-bill"></i>
            Quản lý hóa đơn
        </a>
        <a href="javascript:void(0)" class="m5" onclick="loadDataUnDeliveryBill()">
            <i class="fa-solid fa-money-bill-1"></i>
            Quản lý hóa đơn chưa giao
        </a>
    </div>
    <div class="main-frame">
        <h2 id="title-page">Quản lý tài khoản</h2>
        <%--            <div class="table-frame">--%>
        <%--                <ul class="responsive-table">--%>
        <%--                    <li class="table-header">--%>
        <%--                        <div class="col col-1">User ID</div>--%>
        <%--                        <div class="col col-2">User name</div>--%>
        <%--                        <div class="col col-3">Email</div>--%>
        <%--                        <div class="col col-4">Password</div>--%>
        <%--                    </li>--%>
        <%--                    <li class="table-row">--%>
        <%--                        <div class="col col-1">1</div>--%>
        <%--                        <div class="col col-2">huudao</div>--%>
        <%--                        <div class="col col-3">abc</div>--%>
        <%--                        <div class="col col-4">jfsdkljflsdjfsldfjk</div>--%>
        <%--                    </li>--%>
        <%--                    <li class="table-row">--%>
        <%--                        <div class="col col-1">1</div>--%>
        <%--                        <div class="col col-2">huudao</div>--%>
        <%--                        <div class="col col-3">abc</div>--%>
        <%--                        <div class="col col-4">jfsdkfsdkljflsdjfsldfjkfsdkljflsdjfsldfjkfsdkljflsdjfsldfjkfsdkljflsdjfsldfjkljflsdjfsldfjk</div>--%>
        <%--                    </li>--%>
        <%--                    <li class="table-row">--%>
        <%--                        <div class="col col-1">1</div>--%>
        <%--                        <div class="col col-2">huudao</div>--%>
        <%--                        <div class="col col-3">abc</div>--%>
        <%--                        <div class="col col-4">jfsdkljflsdjfsldfjk</div>--%>
        <%--                    </li>--%>
        <%--                    <li class="table-row">--%>
        <%--                        <div class="col col-1">1</div>--%>
        <%--                        <div class="col col-2">huudao</div>--%>
        <%--                        <div class="col col-3">abc</div>--%>
        <%--                        <div class="col col-4">jfsdkljflsdjfsldfjk</div>--%>
        <%--                    </li>--%>
        <%--                </ul>--%>
        <%--            </div>--%>
        <div id="total-income"></div>
        <div id="div-datatable">

        </div>

        <div id="add-product" style="display: none">
            <h3>Thêm sản phẩm</h3>

            <form action="ThemSanPham">
                <div>
                    <label for="pname">Tên sản phẩm:</label><br>
                    <input type="text" id="pname" name="pname" size="50"><br>
                </div>
                <div>
                    <label for="ptype">Loại:</label><br>
                    <input type="text" id="ptype" name="ptype">
                </div>
                <div>
                    <label for="pnumbuy">Số lượng mua:</label><br>
                    <input type="number" id="pnumbuy" name="pnumbuy">
                </div>
                <div>
                    <label for="padd">Số lượng thêm vào:</label><br>
                    <input type="number" id="padd" name="padd">
                </div>
                <div>
                    <label for="pdiscount">Phần trăm giảm giá:</label><br>
                    <input type="number" id="pdiscount" name="pdiscount">
                </div>
                <div>
                    <label for="pprice">Giá:</label><br>
                    <input type="number" id="pprice" name="pprice">
                </div>
                <div>
                    <label for="psdes">Mô tả tóm tắt:</label><br>
                    <textarea type="text" id="psdes" name="psdes" rows="4"></textarea>
                </div>
                <div>
                    <label for="pdes">Mô tả:</label><br>
                    <textarea type="text" id="pdes" name="pdes" rows="6"></textarea>
                </div>
                <div>
                    <label for="pimg">Image URL:</label><br>
                    <input type="text" id="pimg" name="pimg">
                </div>

                <input type="submit" value="Thêm" onclick="return confirm('Thêm sản phẩm ?') ">
            </form>
        </div>
    </div>
    <div id="feedback-to-user">

    </div>

</div>

<jsp:include page="Footer.jsp"/>

<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<%--<script type="text/javascript" src="assets/js/dataTable/datatables.js"></script>--%>

<script>

    var title = document.getElementById("title-page");
    var qlTaiKhoan = document.querySelector(".m1");
    var qlProduct = document.querySelector(".m2");
    var qlFeedBack = document.querySelector(".m3");
    var qlBill = document.querySelector(".m4");
    var qlUnDeliveryBill = document.querySelector(".m5");

    function closePop() {
        $("#pop-up").css("display", "none");
    }

    // function makeChangeButton() {
    //     var siblings = ($(this).siblings());
    //     siblings.each(function (sibling) {
    //         $(sibling).removeClass('active');
    //     })
    //     $(this).addClass('active');
    // }

    function loadDataAccount() {
        title.innerHTML = "Quản lý tài khoản";
        qlTaiKhoan.classList.add("active");
        qlProduct.classList.remove("active");
        qlFeedBack.classList.remove("active");
        qlBill.classList.remove("active");
        qlUnDeliveryBill.classList.remove("active");


        $("#userDataTable").remove();
        $("#div-datatable").html("<table id=\"userDataTable\" style=\"width:100%\"> </table>")

        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = JSON.parse(this.responseText);
            console.log(data);
            $('#userDataTable').dataTable({
                "data": data,
                "bDestroy": true,
                "columns": [
                    {
                        "title": "Id user",
                        "data": "id_user"
                    },
                    {
                        "title": "User name",
                        "data": "user_name",
                    },
                    {
                        "title": "Email",
                        "data": "email"
                    },
                    {
                        "title": "Image Url",
                        "data": "img_url"
                    },
                    {
                        "title": "Role",
                        "data": "role"
                    }
                ],
            });
        }
        xhttp.open("GET", "QuanLyTaiKhoan");
        xhttp.send();

        $("#add-product").css("display", "none");
        $('.total-income-p').css("display", "none");
    }

    loadDataAccount();

    function loadDataProduct() {
        title.innerHTML = "Quản lý sản phẩm"
        qlTaiKhoan.classList.remove("active");
        qlProduct.classList.add("active");
        qlFeedBack.classList.remove("active");
        qlBill.classList.remove("active");
        qlUnDeliveryBill.classList.remove("active");

        $("#userDataTable").remove();
        $("#div-datatable").html("<table id=\"userDataTable\"> </table>")
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = JSON.parse(this.responseText);
            console.log(data);

            $('#userDataTable').dataTable({
                "data": data,
                "columns": [
                    {
                        "title": "Id product",
                        "data": "id_product"
                    },
                    {
                        "title": "Name",
                        "data": "product_name"
                    },
                    {
                        "title": "Type",
                        "data": "product_type"
                    },
                    {
                        "title": "Amount Bought",
                        "data": "amount_bought"
                    },
                    {
                        "title": "Amount imported",
                        "data": "amount_imported"
                    },
                    {
                        "title": "Percent discount",
                        "data": "percent_discount"
                    },
                    {
                        "title": "Price",
                        "data": "price"
                    },
                    {
                        "title": "Short description",
                        "data": "short_description"
                    },
                    {
                        "title": "Description",
                        "mRender": function (data, type, row) {
                            return '<a href=\"ChiTietSanPham?id_product=' + row.id_product + '\" style="color:red"> Link tới sản phẩm</a>';
                        }
                    },
                    {

                        "mRender": function (data, type, row) {
                            return '<a id="table-delete" href="XoaSanPham?id_product=' + row.id_product + '" onClick="return confirmSubmit()">DELETE</a>'
                        }
                    }
                ], "bDestroy": true
            });


        }
        xhttp.open("GET", "QuanLySanPham");
        xhttp.send();

        $("#add-product").css("display", "block");
        $('.total-income-p').css("display", "none");
    }


    function confirmSubmit() {
        var agree = confirm("Bạn chắc chắn chứ?");
        if (agree)
            return true;
        else
            return false;
    }

    function loadDataFeedBack() {
        title.innerHTML = "Email FeedBack"

        qlTaiKhoan.classList.remove("active");
        qlProduct.classList.remove("active");
        qlFeedBack.classList.add("active");
        qlBill.classList.remove("active");
        qlUnDeliveryBill.classList.remove("active");

        $("#userDataTable").remove();
        $("#div-datatable").html("<table id=\"userDataTable\" style=\"width:100%\"> </table>")

        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = JSON.parse(this.responseText);
            console.log(data);
            var table = $('#userDataTable').DataTable({
                "data": data,
                "bDestroy": true,
                "columns": [
                    {
                        "title": "Id Contact",
                        "data": "id_contact"
                    },
                    {
                        "title": "Email",
                        "data": "email",
                    },
                    {
                        "title": "Name",
                        "data": "name"
                    },
                    {
                        "title": "Phone",
                        "data": 'phone_name'
                    },
                    {
                        "title": "Content",
                        "data": "content"
                    },
                    {
                        "title": "Date upload",
                        "data": "date_up_contact"
                    },
                    {
                        "title": "Checked",
                        "data": "ischeck"
                    },
                    {
                        "title": "Phản Hồi",
                        "mRender": function (data, type, row) {
                            return '<a class="abc" href="javascript:void(0)" style="color:red"> Phản hồi</a>';
                        }
                    }
                ], "bDestroy": true
            });

            $("#userDataTable tbody").on('click', '.abc', function () {
                var data = table.row($(this).parents('tr')).data();
                $("#feedback-to-user").html('<div id="pop-up"> <form action="GuiMailPhanHoi"> <h3>Email tới người phản hổi</h3> <i class="fa-solid fa-xmark" onclick="closePop()"></i> <div> <div> <label for="emailTo">Email To:</label><br> <input type="text" id="emailTo" name="emailTo" value="' + data.email + '"> </div> <div> <label>Nội dung phản hồi của người dùng :</label><br> <textarea disabled="true" rows="4">' + data.content + '</textarea> </div><div><label for="title-email">Title email:</label><br> <input type="text" id="title-email" name="title-email" value=""></div><div><label for="content">Nội dung email phản hồi:</label><br> <textarea id="content" name="content" rows="4"></textarea> </div></div> <button type="submit" onclick="confirmSubmit()">Gửi phản hồi</button><input type="hidden" name="id-contact" value="' + data.id_contact + '"></form> </div>')
            });
        }
        xhttp.open("GET", "QuanLyFeedBack");
        xhttp.send();


        $("#add-product").css("display", "none");
        $('.total-income-p').css("display", "none");
    }

    function loadDataBill() {
        title.innerHTML = "Quản lý hóa đơn"

        qlTaiKhoan.classList.remove("active");
        qlProduct.classList.remove("active");
        qlFeedBack.classList.remove("active");
        qlBill.classList.add("active");
        qlUnDeliveryBill.classList.remove("active");

        $("#userDataTable").remove();
        $("#div-datatable").html("<table id=\"userDataTable\"> </table>")
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = JSON.parse(this.responseText);
            console.log(data);

            $('#userDataTable').dataTable({
                "data": data,
                "columns": [
                    {
                        "title": "Id bill",
                        "data": "id_bill"
                    },
                    {
                        "title": "Id user",
                        "data": "id_user"
                    },
                    {
                        "title": "Address",
                        "data": "address"
                    },
                    {
                        "title": "State",
                        "data": "state"
                    },
                    {
                        "title": "Total money",
                        "data": "total_money"
                    },
                    {
                        "title": "Date",
                        "data": "date_time"
                    },
                    {
                        "title": "Phone number",
                        "data": "phone_number"
                    },
                    {
                        "title": "Ship fee",
                        "data": "ship_fee"
                    },
                    {
                        "title": "Ship status",
                        "data": "ship_state"
                    },
                    {
                        "title": "Payment",
                        "data": "payment"
                    }
                ], "bDestroy": true
            });


        }
        xhttp.open("GET", "QuanLyHoaDon");
        xhttp.send();

        $("#add-product").css("display", "none");
    }

    function computeIncome() {
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = JSON.parse(this.responseText);
            console.log(data);
            $('#total-income').html('<p class="total-income-p"> Tổng doanh thu tháng '+ <%=currentDate.getMonthValue()%> + ', năm '+ <%=currentDate.getYear()%> +' là: <span style="color: #E73918">'+data+'</span></p>');
        }
        xhttp.open("GET", "TinhDoanhThu");
        xhttp.send();
    }

    function loadDataUnDeliveryBill() {
        title.innerHTML = "Quản lý hóa đơn chưa giao hàng"
        qlTaiKhoan.classList.remove("active");
        qlProduct.classList.remove("active");
        qlFeedBack.classList.remove("active");
        qlBill.classList.remove("active");
        qlUnDeliveryBill.classList.add("active");

        $('#total-income').html('<p class="total-income-p"> Danh sách hóa đơn chưa được giao tháng '+ <%=currentDate.getMonthValue()%> + ', năm '+ <%=currentDate.getYear()%> +' là:');

        $("#userDataTable").remove();
        $("#div-datatable").html("<table id=\"userDataTable\"> </table>")
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = JSON.parse(this.responseText);
            console.log(data);

            $('#userDataTable').dataTable({
                "data": data,
                "columns": [
                    {
                        "title": "Id bill",
                        "data": "id_bill"
                    },
                    {
                        "title": "Id user",
                        "data": "id_user"
                    },
                    {
                        "title": "Address",
                        "data": "address"
                    },
                    {
                        "title": "State",
                        "data": "state"
                    },
                    {
                        "title": "Total money",
                        "data": "total_money"
                    },
                    {
                        "title": "Date",
                        "data": "date_time"
                    },
                    {
                        "title": "Phone number",
                        "data": "phone_number"
                    },
                    {
                        "title": "Ship fee",
                        "data": "ship_fee"
                    },
                    {
                        "title": "Ship status",
                        "data": "ship_state"
                    },
                    {
                        "title": "Payment",
                        "data": "payment"
                    }
                ], "bDestroy": true
            });


        }
        xhttp.open("GET", "QuanLyHoaDonChuaGiao");
        xhttp.send();

        $("#add-product").css("display", "none");
    }

</script>
<script>
    <% if(pageTo!=null){
   switch (pageTo) {
            case "QuanLyTaiKhoan": %>
    loadDataAccount();
    <%
            break;
            case "QuanLySanPham": %>
    loadDataProduct();
    <%
            break;
            case "QuanLyFeedBack": %>
    loadDataFeedBack();
    <%
            break;
            case "QuanLyHoaDon": %>
    loadDataBill();
    <%
            break;
            case "QuanLyHoaDonChuaGiao": %>
    loadDataUnDeliveryBill();
    <% break;
    }}%>
</script>
</body>
</html>
