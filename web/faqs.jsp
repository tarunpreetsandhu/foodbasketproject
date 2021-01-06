<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="vmm.DBLoader" %>


<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>
        <!--/tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>

        <style>
            .rowdesign{
                background-color: aliceblue;
                margin: 20px;
            }

        </style>
        <!--//tags -->
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


    </head>

    <body>
        <%@include file ="header.jsp" %>

        <br>
        <div class="container">
            <div class="row">
                <h3 class="tittle-w3l">Frequently Asked Questions
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
            </div>
            <div class="row rowdesign">

                <p style="color: #000"><b>   What can I return?</b></p>

                <p style="color: #000">    You may return most new, unopened items sold and fulfilled by Food Basket within 30 days of delivery
                    for a full refund. </p>

                <br>


            </div>

            <div  class="row rowdesign">
                <p style="color: #000"><b>  When will I get my refund?</b></p>

                <p style="color: #000">        Usually in about 2-3 weeks. Most refunds are fully refunded within 7 days after we receive and 
                    process your return.                </p>


                <br>
            </div>
            <div  class="row rowdesign">
                <p style="color: #000"><b>Does Food Basket offer replacements and exchanges?</b></p>

                <p style="color: #000">
                    Yes, you can create replacement and exchange orders from this page by clicking Return Items and 
                    following the instructions. If you received a damaged or defective item, we will ship you a replacement
                    of the exact item. If you would like to exchange an item for another, you can exchange for a different
                    size or color or for an item in your Cart.
                </p>

                <br>
            </div>
            <div  class="row rowdesign">
                <p style="color: #000"><b>Why do I see different prices for the same product?</b></p>

                <p style="color: #000">You could see different prices for the same product, as it could be listed by many Sellers.</p>


                <br>

            </div>
            <div  class="row rowdesign">
                <p style="color: #000"><b>Is it necessary to have an account to shop on Food Basket?</b></p>

                <p style="color: #000">Yes, it's necessary to log into your Food Basket account to shop. Shopping as a logged-in user is fast & convenient and also provides extra security.

                    You will have access to a personalised shopping experience including recommendations and quicker check-out.</p>


            </div>
        </div>


        <%@include file ="footer.jsp" %>
    </body>

</html>
