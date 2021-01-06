<%-- 
    Document   : adminhome
    Created on : Dec 21, 2020, 2:00:13 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--pop-up-box-->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!--//pop-up-box-->
        <!-- price range -->
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>

        <script>
            function gotomanagecategories()
            {
                location.href = "managecategories.jsp";
            }
            function gotovieworders()
            {
                location.href = "vieworders.jsp";
            }

            function gotomanagemerchant()
            {
                location.href = "managemerchant.jsp";
            }
            function changepassword()
            {
                location.href = "adminchangepassword.jsp";
            }
        </script>
        <style>

            #mymenu li{
                display:inline;
                margin-right: 10px;
            }
            #mymenu li a:hover{
                color:#FFC107; 
            }
        </style>


    <div class="header-most-top">
        <p>FOOD BASKET</p>


        <ul  id="mymenu" style="text-align: right;margin-right: 20px;margin: 10px;border:1px solid #000;border-radius: 3px;padding:10px;">
                <li class="" >
                    <a class="nav-stylehead" href="vieworders.jsp">View Orders
                    </a>
                </li>
                <li class="" >
                    <a class="nav-stylehead" href="managecategories.jsp">Manage Categories</a>
                </li>


                <li class="">
                    <a class="nav-stylehead" href="managemerchant.jsp">Manage Merchants</a>
                </li>

                <li class="">
                    <a class="nav-stylehead" href="adminchangepassword.jsp">Change Password</a>
                </li>
<li class="">
                    <a class="nav-stylehead" href="adminlogout">Logout</a>
                </li>
            </ul>
        



    </div>
    
    </head>
    <body>
        <br>
        <br>
        <div class="container">

            <h3 class="tittle-w3l">Admin Home
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>


            <div class="text-center">
                <button  class="btn btn-primary"  onclick="gotomanagecategories()">Manage Categories</button><br><br>
                <button class="btn btn-primary" onclick="gotovieworders()">View Orders</button><br><br>
                <button class="btn btn-primary" onclick="gotomanagemerchant()">Manage Merchants</button><br><br>
                <button class="btn btn-primary" onclick="changepassword()">Change Password</button><br><br>

            </div>
        </div>


    </body>
</html>
