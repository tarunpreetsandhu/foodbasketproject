<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.DBLoader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Single :: w3layouts</title>
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
        <!--//tags -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet">
        <!--pop-up-box-->
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <!--//pop-up-box-->
        <!-- price range -->
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <!-- flexslider -->
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>
    <%
        String categoryname = "";
        if (request.getParameter("categoryname") != null) {
            categoryname = request.getParameter("categoryname");
        } else {
            categoryname = "Soft Drinks";
        }
    %>
    <script>

        var xhr = new XMLHttpRequest();
        function review()
        {

            $("#myModal").modal("show");
        }

        var n = 0;
        function fill(obj)
        {
            var img = obj.src;
            var id = obj.id;
            var val = parseInt(id.substring(id.indexOf("_") + 1));
            var i;
            if (n === 0)
            {
                i = 1;
            } else
            {
                i = n + 1;
            }
            for (; i <= 5; i++)
            {
                if (i <= val)
                {
                    document.getElementById("rating_" + i).src = "rating/filled_star.png";

                } else
                {
                    document.getElementById("rating_" + i).src = "rating/empty_star.png";
                }
            }

        }
        function selected(obj)
        {
            var id = obj.id;
            var val = parseInt(id.substring(id.indexOf("_") + 1));
            n = val;
        }
        function unfill(obj)
        {
            var i;
            if (n === 0)
            {
                i = 1;
            } else
            {
                i = n + 1;
            }
            for (; i <= 5; i++)
            {
                document.getElementById("rating_" + i).src = "rating/empty_star.png";
            }
        }

        function addreview(pid, categoryname)
        {

            if (n === 0)
            {
                document.getElementById("label1").style.display = "block";

            } else
            {
                var review = document.getElementById("review").value;
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText.trim();

                        if (res == "success")
                        {
                            $("#myModal").modal("hide");

                            location.href = "productdetail.jsp?pid=" + pid + "&categoryname=" + categoryname;

                        } else if (res == "notloggedin")
                        {
                            location.href = "index.jsp";
                        } else
                        {
                            alert("Error in adding review");
                        }
                    }
                };
                xhttp.open("GET", "./addreview?pid=" + pid + "&rating=" + n + "&review=" + review, true);
                xhttp.send();


            }
        }
    </script>
    <script>

        function addtocart(pid, name, price)
        {
            var xhttp = new XMLHttpRequest();

            xhttp.onreadystatechange = function ()
            {
                if (this.readyState == 4 && this.status == 200)
                {
                    var res = this.responseText.trim();

                    if (res == "success")
                    {
                        alert("Item Added Successfully");
                        location.href = "products.jsp?pid=" + pid + "&categoryname=<%=categoryname%>";
                    } else if (res == "notloggedin")
                    {
                        alert("Please Login First");
                        location.href = "index.jsp";
                    }
                }
            };
            xhttp.open("GET", "./addtocartlogic?pid=" + pid + "&name=" + name + "&price=" + price, true);
            xhttp.send();
        }

    </script>

    <body>
        <%@include file ="header.jsp" %>
        <!-- banner-2 -->
        <div class="page-head_agile_info_w3l">

        </div>
        <!-- //banner-2 -->
        <!-- page -->
        <div class="services-breadcrumb">
            <div class="agile_inner_breadcrumb">
                <div class="container">
                    <ul class="w3_short">
                        <li>
                            <a href="index.jsp">Home</a>
                            <i>|</i>
                        </li>
                        <li><%=categoryname%></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->
        <!-- Single Page -->
        <%

            String pid = request.getParameter("pid");

            ResultSet rs = DBLoader.executequery("select * from products where pid=" + pid);

            if (rs.next()) {

                String name = rs.getString("name");
                String description = rs.getString("description");
                String price = rs.getString("price");
                String photo = rs.getString("photo");
                String offerprice = rs.getString("offerprice");
                String brand = rs.getString("brand");
                String mid = rs.getString("mid");

        %>
        <div class="banner-bootom-w3-agileits">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l"><%=categoryname%>
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="col-md-5 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider">
                            <ul class="slides">
                                <li data-thumb="<%=photo%>">
                                    <div class="thumb-image">
                                        <img src="<%=photo%>"  data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>


                                <%
                                    ResultSet rsg = DBLoader.executequery("select * from productgallery where pid=" + pid);
                                    while (rsg.next()) {
                                        String gphoto = rsg.getString("photo");

                                %>


                                <li data-thumb="<%=gphoto%>" >
                                    <div class="thumb-image">
                                        <img src="<%=gphoto%>"  data-imagezoom="true" class="img-responsive" alt=""> </div>
                                </li>


                                <%                            }
                                %>

                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>




                <div class="col-md-7 single-right-left simpleCart_shelfItem">
                    <h3><b><%=name%></b></h3>
                    <div class="rating1">


                        <%

                            ResultSet rs3 = DBLoader.executequery("select AVG(rating) as rating from ratings");
                            rs3.next();

                            int rating = rs3.getInt("rating");

                            for (int i = 0; i < rating; i++) {


                        %>
                        <img src="rating/filled_star.png" width="30" height="30"/>

                        <%                                }

                            for (int i = rating; i < 5; i++) {

                        %>
                        <img src="rating/empty_star.png" width="30" height="30"/>


                        <%                            }
                        %>


                    </div>
                    <p>
                        <span class="item_price">&#x20B9; <%=offerprice%></span>
                        <del>&#x20B9; <%=price%></del>
                        <label>Free delivery</label>
                    </p>
                    <div class="single-infoagile">
                        <h4><b> Brand</h4>
                        <p><%=brand%></p>
                    </div>
                    <div class="single-infoagile">
                        <h4><b> Description</h4>
                        <p><%=description%></p>
                    </div>


                    <%
                        ResultSet rs5 = DBLoader.executequery("select * from merchants where mid=" + mid);
                        rs5.next();
                        String mname = rs5.getString("name");
                    %>
                    <div class="single-infoagile">
                        <h4><b> Product By :</b><a href="merchantproducts.jsp?mid=<%=mid%>&name=<%=mname%>"> <%=mname%></a></h4>

                    </div>

                    <br>
                    <%
                    %>


                    <div class="occasion-cart">
                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                            <form action="#" method="post">
                                <fieldset>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="business" value=" " />
                                    <input type="hidden" name="item_name" value="Zeeba Premium Basmati Rice - 5 KG" />
                                    <input type="hidden" name="amount" value="950.00" />
                                    <input type="hidden" name="discount_amount" value="1.00" />
                                    <input type="hidden" name="currency_code" value="USD" />
                                    <input type="hidden" name="return" value=" " />
                                    <input type="hidden" name="cancel_return" value=" " />

                                    <input type="button" onclick="addtocart('<%=pid%>', '<%=name%>', '<%=price%>')" name="submit" value="Add to cart" class="button" />
                                    <br>
                                    <br>

                                    <input type="button"  name="submit" onclick="review()" value="Add Review" class="button" />
                                </fieldset>
                            </form>
                        </div>

                    </div>

                </div>
                <div class="clearfix"> </div>
            </div>
        </div>


        <div style="margin: 20px;">
            <h3 class="tittle-w3l">Previous Reviews
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>

            <%

                ResultSet rs4 = DBLoader.executequery("select * from ratings where pid=" + pid);

                while (rs4.next()) {

                    String username = rs4.getString("username");
                    String review = rs4.getString("review");
                    int ratings = rs4.getInt("rating");


            %>

            <div style="padding: 30px; margin: 20px;background: #ffffff; box-shadow: 1px 2px 9px rgba(0,0,0,0.6)" >

                <h3><%=review%></h3>
                <br>
                <%
                    for (int i = 0; i < ratings; i++) {

                %>
                <img src="rating/filled_star.png" width="20" height="20"/>

                <%                                }

                    for (int i = ratings; i < 5; i++) {

                %>
                <img src="rating/empty_star.png" width="20" height="20"/>


                <%                            }
                %>

                <h5 style="text-align: right"><%=username%></h5>

            </div>


            <%                }
            %>


        </div>



        <div class="modal" id="myModal" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header " style="background: aliceblue;" >
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="color: black;"> Add Review</h4>
                    </div>
                    <div class="modal-body " >
                        <div>



                            <div id="all">

                                <form action="" method="post" id="form1">
                                    <table>
                                        <tr> <label class="form-group"> Give Ratings..</label>
                                        <td>
                                            <img id="rating_1" src="rating/empty_star.png" onmouseover="fill(this);" onmouseout="unfill(this);" onclick="selected(this);" width="50px;" height="50px;">
                                        </td>
                                        <td>
                                            <img id="rating_2" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                        </td>
                                        <td>
                                            <img id="rating_3" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                        </td>
                                        <td>
                                            <img id="rating_4" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                        </td>
                                        <td>
                                            <img  id="rating_5" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                        </td>
                                        </tr>
                                    </table>
                                    <br>
                                    <label> Write Comment : </label> <input style="border-radius: 20px;" type="text" id="review"  class="form-group"/>
                                    <input type="button" value="Submit" class="btn btn-primary" 
                                           style="border-radius: 10px;text-shadow: 2px 2px 5px black" onclick="addreview('<%=pid%>', '<%=categoryname%>')" />
                                    <label style="display: none;color: black;"  id="label1">Please Select Any Rating</label>

                                </form>
                            </div>

                        </div>   
                    </div>
                    <!--</div>-->
                    <div class="modal-footer " style="background: aliceblue;" >
                        <button type="button" class="btn btn-default" style="border-radius: 10px;" data-dismiss="modal" style="" >Close</button>
                    </div>


                </div>
            </div>
        </div>



        <%
            }
        %>
        <!-- //Single Page -->


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
                                               paypalm.minicartk.render(); //use only unique class names other than paypal1.minicart1.Also Replace same class name in css and minicart.min.js

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

        <!-- password-script -->
        <script>
                window.onload = function () {
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
            }
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

        <!-- imagezoom -->
        <script src="js/imagezoom.js"></script>
        <!-- //imagezoom -->

        <!-- FlexSlider -->
        <script src="js/jquery.flexslider.js"></script>
        <script>
            // Can also be used with $(document).ready()
                $(window).load(function () {
                    $('.flexslider').flexslider({
                    animation: "slide",
                controlNav: "thumbnails"
            });
            });
        </script>
        <!-- //FlexSlider-->

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

        <!-- for bootstrap working -->
        <script src="js/bootstrap.js"></script>
        <!-- //for bootstrap working -->
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
                                    <i class="fa fa-map-marker"></i> 123 Sebastian, USA.</li>
                                <li>
                                    <i class="fa fa-mobile"></i> 333 222 3333 </li>
                                <li>
                                    <i class="fa fa-phone"></i> +222 11 4444 </li>
                                <li>
                                    <i class="fa fa-envelope-o"></i>
                                    <a href="mailto:example@mail.com"> mail@example.com</a>
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
                                    <a class="icon fb" href="#">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="icon tw" href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="icon gp" href="#">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="agileits_app-devices">
                            <h5>Download the App</h5>
                            <a href="#">
                                <img src="images/1.png" alt="">
                            </a>
                            <a href="#">
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
                        <h5 style="color: black;">Food Basket</h5>
                        <p style="color: black;">Order online. All your favourite products from the low price online supermarket for grocery home delivery in Delhi,
                            Gurgaon, Bengaluru, Mumbai and other cities in India. Lowest prices guaranteed on Patanjali, Aashirvaad, Maggi,
                            Saffola, Nestle, Amul, Haldiram's and others.</p>
                    </div>
                    <div class="sub-some">
                        <h5 style="color: black;">Shop online with the best deals & offers</h5>
                        <p style="color: black;">Now Get Upto 40% Off On Everyday Essential Products Shown On The Offer Page. The range includes Grocery,Daily Need Products. Discount May Vary From Product To Product.</p>
                    </div>
                    <!-- brands -->
                    <div class="sub-some">
                        <h5 style="color: black;">Popular Brands</h5>
                        <ul>
                            <li>
                                Aashirvaad
                            </li>
                            <li>
                                Amul
                            </li>
                            <li>
                                Bingo
                            </li>
                            <li>
                                Boost
                            </li>
                            <li>
                                Maggi
                            </li>
                            <li>
                                Dabur
                            </li>
                            <li>
                                Coca-Cola
                            </li>
                            <li>
                                Cadbury
                            </li>
                            <li>
                                Bru
                            </li>
                            <li>
                                Bournvita
                            </li>
                            <li>
                                Tang
                            </li>
                            <li>
                                Oreo
                            </li>
                            <li>
                                Taj Mahal
                            </li>
                            <li>
                                Sprite
                            </li>
                            <li>
                                Thums Up
                            </li>

                            <li>
                                Tata
                            </li>
                            <li>
                                Sunfeast
                            </li>
                            <li>
                                Patanjali
                            </li>
                            <li>
                                Kissan
                            </li>
                            <li>
                                Lipton
                            </li>
                            <li>
                                Chings
                            </li>
                            <li>
                                Bonn
                            </li>
                            <li>
                                Kitty
                            </li>
                            <li>
                                Veeba
                            </li>
                            <li>
                                Catch
                            </li>
                            <li>
                                Tops
                            </li>
                            <li>
                                Knnor
                            </li>
                            <li>
                                Agro Pure
                            </li>
                        </ul>
                    </div>
                    <!-- //brands -->
                    <!-- payment -->
                    <div class="sub-some child-momu">
                        <h5 style="color: black;">Payment Method</h5>
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
    </body>

</html>
