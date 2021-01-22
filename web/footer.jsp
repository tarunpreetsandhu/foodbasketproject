<%@page import="vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
<!-- newsletter -->
<div class="footer-top">
    <div class="container-fluid">
        <div class="col-xs-8 agile-leftmk">
            <h2>Get your Groceries delivered from local stores</h2>
            <p>Free Delivery on your first order!</p>
            <div class="newsform-w3l">
                <span class="fa fa-envelope-o" aria-hidden="true"></span>
            </div>
        </div>
        <div class="col-xs-4 w3l-rightmk">
            <img src="images/tab3.png" alt=" ">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //newsletter -->
<!-- footer -->
<footer>
    <div class="container">
        <!-- footer first section -->
        <p class="footer-main">
            <span>"Food Basket"</span> Food Basket is an online grocery channel store which is made for remote shopping through Internet.
            As the technology being advanced the way of life is changing accordance.Now a days we can place order from our home.
            There is no need to go to store of the things we want. The order can be placed online through Internet. 
            The Payment, confirmation of purchasing, we can do everything. People has to suffer to rush of the market when they went 
            for shopping. They has to think about to buy anything having sufficient amount of money. The problem was rush, the quarrel
            at the time for buying. But advancement of Technology brought new way of shopping. Some of the key features of Food Basket
            are free home delivery, no minimum order value, express delivery, no questions asked return policy and more. It follows an
            on-demand model.The result of online ordering will give easy to make ordering and hopefully smoothen up the job. This will give
            the computerized system in defining the best solution in each ordering. It helps in changing the system from manual to 
            computerized system</p>
        <!-- //footer first section -->
        <!-- footer second section -->
        <div class="w3l-grids-footer">
            <div class="col-xs-4 offer-footer">
                <div class="col-xs-4 icon-fot">
                    <span class="fa fa-map-marker" aria-hidden="true"></span>
                </div>
                <div class="col-xs-8 text-form-footer">
                    <h3>Track Your Order</h3>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-4 offer-footer">
                <div class="col-xs-4 icon-fot">
                    <span class="fa fa-refresh" aria-hidden="true"></span>
                </div>
                <div class="col-xs-8 text-form-footer">
                    <h3>Free & Easy Returns</h3>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-4 offer-footer">
                <div class="col-xs-4 icon-fot">
                    <span class="fa fa-times" aria-hidden="true"></span>
                </div>
                <div class="col-xs-8 text-form-footer">
                    <h3>Online cancellation </h3>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- //footer second section -->
        <!-- footer third section -->
        <div class="footer-info w3-agileits-info">
            <!-- footer categories -->
            <div class="col-sm-3 address-right">
                <div class="col-xs-12 footer-grids">
                    <h3>Categories</h3>
                    <ul>
                        <%
                            ResultSet rs_category_footer = DBLoader.executequery("select * from categories");
                            while (rs_category_footer.next()) {
                                String categoryname_footer = rs_category_footer.getString("categoryname");
                        %>
                        <li>
                            <a href="products.jsp?categoryname=<%=categoryname_footer%>"><%=categoryname_footer%></a>
                        </li>

                        <%
                            }
                        %>

                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- //footer categories -->
            <!-- quick links -->
            <div class="col-sm-7 address-right">
                <div class="col-xs-6 footer-grids">
                    <h3>Quick Links</h3>
                    <ul>
                        <li>
                            <a href="about.jsp">About Us</a>
                        </li>
                        <li>
                            <a href="contact.jsp">Contact Us</a>
                        </li>
                        <li>
                            <a href="help.jsp">Help</a>
                        </li>
                        <li>
                            <a href="faqs.jsp">Faqs</a>
                        </li>
                        <li>
                            <a href="terms.jsp">Terms of use</a>
                        </li>
                        <li>
                            <a href="privacy.jsp">Privacy Policy</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-6 footer-grids">
                    <h3>Get in Touch</h3>
                    <ul>
                        <li>
                            <i class="fa fa-map-marker"></i> A-1,Sector-32,Noida </li>
                        <li>
                            <i class="fa fa-mobile"></i> +91-9984455671 </li>
                        <li>
                            <i class="fa fa-phone"></i> +91-9876718954 </li>
                        <li>
                            <i class="fa fa-envelope-o"></i>
                            <a href="https://accounts.google.com/ServiceLogin/signinchooser?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"> foodbasket@gmail.com</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- //quick links -->
            <!-- social icons -->
            <div class="col-sm-2 footer-grids  w3l-socialmk">
                <h3>Follow Us on</h3>
                <div class="social">
                    <ul>
                        <li>
                            <a class="icon fb" href="https://www.facebook.com/">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a class="icon tw" href="https://twitter.com/login/">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a class="icon gp" href="https://accounts.google.com/signup/v2/webcreateaccount?hl=en&flowName=GlifWebSignIn&flowEntry=SignUp">
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="agileits_app-devices">
                    <h5>Download the App</h5>
                    <a href="https://play.google.com/store">
                        <img src="images/1.png" alt="">
                    </a>
                    <a href="https://www.apple.com/app-store/">
                        <img src="images/2.png" alt="">
                    </a>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- //social icons -->
            <div class="clearfix"></div>
        </div>
        <!-- //footer third section -->
        <!-- footer fourth section (text) -->
        <div class="agile-sometext">
            <div class="sub-some">
                <h5 style="color: black;"><b>Food Basket</b></h5>
                <p style="color: black;">Order online. All your favourite products from the low price online supermarket for grocery home delivery in Delhi,
                    Gurgaon, Bengaluru, Mumbai and other cities in India. Lowest prices guaranteed on Patanjali, Aashirvaad, Maggi,
                    Saffola, Nestle, Amul, Haldiram's and others.</p>
            </div>
     <div class="sub-some">
                <h5 style="color: black;"><b>Shop online with the best deals & offers</b></h5>
                <p style="color: black;">Now Get Upto 40% Off On Everyday Essential Products Shown On The Offer Page. The range includes Grocery,Daily Need Products. Discount May Vary From Product To Product.</p>
            </div>
            <!-- brands -->
            <div class="sub-some">
                <h5 style="color: black;"><b>Popular Brands</b></h5>
                <p style="color: black;"> Aashirvaad, Amul, Bingo, Boost, Maggi, Dabur, Coca-Cola, Bru, Bournvita, Tang, Oreo,
                 Taj Mahal, Sprite, Patanjali, Sunfeast, Tata, Kissan, Veeba, Catch, AgroPure.
                </p>
                
            </div>
            <!-- //brands -->
            <!-- payment -->
            <div class="sub-some child-momu">
                <h5 style="color: black;"><b>Payment Method</b></h5>
                <ul>
                    <li>
                        <img src="images/pay2.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay5.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay1.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay4.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay6.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay3.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay7.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay8.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay9.png" alt="">
                    </li>
                </ul>
            </div>
            <!-- //payment -->
        </div>
        <!-- //footer fourth section (text) -->
    </div>
</footer>
<!-- //footer -->
<!-- copyright -->
<div class="copy-right">
    <div class="container">
        <p>© 2020 Food Basket. All rights reserved | Design by
            <a> Tarunpreet and Gagandeep</a>
        </p>
    </div>
</div>
<!-- //copyright -->

<!-- js-files -->
<!-- jquery -->
<script src="js/jquery-2.1.4.min.js"></script>
<!-- //jquery -->

<!-- popup modal (for signin & signup)-->
<script src="js/jquery.magnific-popup.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
<!-- Large modal -->
<!-- <script>
        $('#').modal('show');
</script> -->
<!-- //popup modal (for signin & signup)-->

<!-- cart-js -->
<script src="js/minicart.js"></script>
<script>
    paypalm.minicartk.render(); //use only unique class names other than paypalm.minicartk.Also Replace same class name in css and minicart.min.js

    paypalm.minicartk.cart.on('checkout', function (evt) {
        var items = this.items(),
                len = items.length,
                total = 0,
                i;

        // Count the number of each item in the cart
        for (i = 0; i < len; i++) {
            total += items[i].get('quantity');
        }

        if (total < 3) {
            alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
            evt.preventDefault();
        }
    });
</script>
<!-- //cart-js -->

<!-- price range (top products) -->
<script src="js/jquery-ui.js"></script>
<script>
    //<![CDATA[ 
    $(window).load(function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 9000,
            values: [50, 6000],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

    }); //]]>
</script>
<!-- //price range (top products) -->

<!-- flexisel (for special offers) -->
<script src="js/jquery.flexisel.js"></script>
<script>
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
            visibleItems: 3,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 2
                }
            }
        });

    });
</script>
<!-- //flexisel (for special offers) -->

<!-- password-script -->
<script>
    /*   window.onload = function () {
     document.getElementById("password1").onchange = validatePassword;
     document.getElementById("password2").onchange = validatePassword;
     }
     
     function validatePassword() {
     var pass2 = document.getElementById("password2").value;
     var pass1 = document.getElementById("password1").value;
     if (pass1 != pass2)
     document.getElementById("password2").setCustomValidity("Passwords Don't Match");
     else
     document.getElementById("password2").setCustomValidity('');
     //empty string means no validation error
     } */
</script>
<!-- //password-script -->

<!-- smoothscroll -->
<script src="js/SmoothScroll.min.js"></script>
<!-- //smoothscroll -->

<!-- start-smooth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->

<!-- smooth-scrolling-of-move-up -->
<script>
    $(document).ready(function () {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear' 
         };
         */
        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->

<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //js-files -->
