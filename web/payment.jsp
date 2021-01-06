<%-- 
    Document   : payment
    Created on : May 16, 2018, 4:06:44 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- font-awesome icons -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- //font-awesome icons -->
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->

        <script>
             function gotoproducts(categoryname)
             {
                 
                 location.href="products.jsp?categoryname="+categoryname;
                 
             }
             
            

        </script>

    </head>
    <body>

        <%@include file="header.jsp" %>
         <div class="products-breadcrumb">
		<div class="container">
			<ul>
				<li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">Home</a><span>|</span></li>
				<li style="color: white;font-size: large;">Online Payment</li>
			</ul>
		</div>
	</div>
         <br>
        

        <form action="orderplaced.jsp" method="post">

            <!-- receive ur normal text data on next page , like we do regularly -->

            
            <!-- Note that the amount is in paise = 500 INR -->
            <!-- This script will show payment screen and block form submit until, payment is successful -->
            <script
                src="https://checkout.razorpay.com/v1/checkout.js"
                data-key="rzp_test_96HeaVmgRvbrfT"
                data-amount="10000"
                data-buttontext="Pay with Razorpay"
                data-name="Project Name"
                data-description="Purchase Description"
                data-image="images/foodbasket.png"
                data-prefill.name="Project Name"
                data-prefill.email="email@gmail.com"
                data-theme.color="yellowgreen"
            >
            </script>

        
            
        </form>

            <!-- //footer -->	
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- top-header and slider -->
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
                        $(document).ready(function () {
                            /*
                             var defaults = {
                             containerID: 'toTop', // fading element id
                             containerHoverID: 'toTopHover', // fading element hover id
                             scrollSpeed: 1200,
                             easingType: 'linear' 
                             };
                             */

                            $().UItoTop({easingType: 'easeOutQuart'});

                        });
        </script>
        <!-- //here ends scrolling icon -->
        <script src="js/minicart.min.js"></script>
        <script>
                        // Mini Cart
                        paypal.minicart.render({
                            action: '#'
                        });

                        if (~window.location.search.indexOf('reset=true')) {
                            paypal.minicart.reset();
                        }
        </script>
        <!-- main slider-banner -->
        <script src="js/skdslider.min.js"></script>
        <link href="css/skdslider.css" rel="stylesheet">
        <script type="text/javascript">
                        jQuery(document).ready(function () {
                            jQuery('#demo1').skdslider({'delay': 5000, 'animationSpeed': 2000, 'showNextPrev': true, 'showPlayButton': true, 'autoSlide': true, 'animationType': 'fading'});

                            jQuery('#responsive').change(function () {
                                $('#responsive_wrapper').width(jQuery(this).val());
                            });

                        });
        </script>	

    </body>
</html>
