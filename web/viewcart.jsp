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
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Checkout :: w3layouts</title>
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
           <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
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
        <% int total = 0;
            %>
        <script>
            function delete_cart(cid) {
                var option = confirm("Are you sure you want to delete it?");
                if (option) {
                    var xhttp = new XMLHttpRequest();

                    xhttp.onreadystatechange = function ()
                    {
                        if (this.readyState == 4 && this.status == 200)
                        {
                            var res = this.responseText.trim();

                            if (res == "success")
                            {
                                alert("Deleted Successfully");
                                location.href = "viewcart.jsp";
                            } else
                            {
                                alert("Error in Deleting");
                            }
                        }
                    };
                    xhttp.open("GET", "./deletecartitem?cid=" + cid, true);
                    xhttp.send();
                }
            }
            function decrease_cart(cid)
            {
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText.trim();

                        if (res == "success")
                        {
                            location.href = "viewcart.jsp";
                        }
                    }
                };
                xhttp.open("GET", "./changeqty?cid=" + cid + "&type=decrease", true);
                xhttp.send();
            }

            function increase_cart(cid)
            {
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var res = this.responseText.trim();

                        if (res == "success")
                        {
                            location.href = "viewcart.jsp";
                        }
                    }
                };
                xhttp.open("GET", "./changeqty?cid=" + cid + "&type=increase", true);
                xhttp.send();
            }
function  placeorder(){
    var reg = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  
    var name = document.getElementById("name").value;
    var number = document.getElementById("number").value;
    var landmark = document.getElementById("landmark").value;
    var address = document.getElementById("address").value;
    var city = document.getElementById("city").value;
     var OK = reg.exec(number);  
        if (!OK)  
          window.alert("phone number isn't  valid");  
        else  {
          
          var xhttp = new XMLHttpRequest();
     

        xhttp.onreadystatechange = function ()
        {
            if (this.readyState == 4 && this.status == 200)
            {
                var res = this.responseText.trim();
//alert(res);
                if (res == "success")
                {
                    alert("Order Booked Successfully...");
                    location.href="bookingsuccess.jsp";
                   
                }
            }
        };
        xhttp.open("GET", "./placeorder?address=" + address + "&city=" + city+"&number="+number+"&name="+name, true);
        xhttp.send();
        }
      
}

 

        </script>

    </head>

    <body>
        <%@include file ="header.jsp" %>
        <!-- banner-2 -->
        
        
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
                        <li>View Cart</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->
        <!-- checkout page -->
        <div class="privacy">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">View Cart
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="checkout-right">
                    <h4>Your shopping cart contains:
                        <span>
                            <%                   
                                String username = session.getAttribute("username").toString();
                                ResultSet rs3 = DBLoader.executequery("select COUNT(*) as count from cart where username='" + username + "'");
                                rs3.next();
                                int count = rs3.getInt("count");

                            %>
                        </span>
                        <%=count%> Products
                    </h4>
                    <div class="table-responsive">
                        <table class="timetable_sub">
                            <thead>
                                <tr>
                                    <th>Sr No.</th>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Product Name</th>

                                    <th>Price</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                   

                                    if (session.getAttribute("username") != null) {
                                        ResultSet rs = DBLoader.executequery("select * from cart where username='" + username + "'");
                                        int s = 1;
                                        while (rs.next()) {
                                            int cid = rs.getInt("cid");
                                            int price = rs.getInt("price");
                                            int qty = rs.getInt("qty");
                                            int pid = rs.getInt("pid");
                                            String name = rs.getString("productname");
                                            total = total + (price * qty);

                                            ResultSet rs1 = DBLoader.executequery("select * from products where pid='" + pid + "'");
                                            rs1.next();
                                            String photo = rs1.getString("photo");
                                %>
                                <tr class="rem1">
                                    <td class="invert"><%=s%></td>
                                    <td class="invert-image">
                                        <a href="single2.html">
                                            <img src="<%=photo%>" alt="" style="width: 100px;height: 100px" class="img-responsive">
                                        </a>
                                    </td>
                                    <td class="invert">
                                        <div class="quantity">
                                            <div class="quantity-select">
                                                <div class="entry value-minus " onclick="decrease_cart('<%=cid%>')"> &nbsp; </div>
                                                <div class="entry value">
                                                    <span><%=qty%></span>
                                                </div>
                                                <div class="entry value-plus active" onclick="increase_cart('<%=cid%>')"> &nbsp; </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="invert"><%=name%></td>
                                    <td class="invert"><%=price%></td>
                                    <td class="invert"><%=(price * qty)%></td>
                                    <td class="invert">
                                        <div class="rem">
                                            <div class="close1" onclick="delete_cart('<%=cid%>')"> </div>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        s++;
                                    }
                                %>
                                <tr class="rem1">
                                    <td class="invert"></td>
                                    <td class="invert"></td>
                                    <td class="invert"></td>
                                    <td class="invert"></td>
                                    <td class="invert"><b>Total</td>
                                    <td class="invert">&#x20B9; <%=total%></td>
                                    <td class="invert"></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="checkout-left">
                    <div class="address_form_agile">
                        <h4>Add a new Details</h4>
                        <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                            <div class="information-wrapper">
                                <div class="first-row">
                                    <form action="placeorder" method="post" class="creditly-card-form agileinfo_form">

                                        <div class="controls">
                                            <label>Enter Full Name:</label>
                                            <br>
                                            <input class="billing-address-name" type="text" name="Enter Name" id="name" placeholder="Full Name" required="">
                                        </div>
                                        <div class="w3_agileits_card_number_grids">
                                            <div class="w3_agileits_card_number_grid_left">
                                                <div class="controls">
                                                    <label>Enter Mobile Number:</label>
                                                    <br>
                                                    <input type="text" placeholder="Enter Mobile Number" name="number" id="number" required="">
                                                </div>
                                            </div>
                                            <div class="w3_agileits_card_number_grid_right">
                                                <div class="controls">
                                                    <label>Enter Landmark:</label>
                                                    <br>
                                                    <input type="text" placeholder="Enter Landmark" name="landmark" id="landmark" required="">
                                                </div>
                                            </div>
                                            <div class="clear"> </div>
                                        </div>
                                        <div class="controls">
                                            <label>Enter Address:</label>
                                            <br>
                                            <input type="text" placeholder="Enter Address" name="address" id="address" required="">
                                        </div>
                                        <div class="controls">
                                            <label>Enter City:</label>
                                            <br>
                                            <select class="option-w3ls" id="city" name="city" required="">
                                                <option>Select City</option>
                                                <option>Ambala</option>
                                                <option>Amritsar</option>
                                                <option>Ajmer</option>
                                                <option>Allahabad</option>
                                                <option>Ahmedabad</option>
                                                <option>Agra</option>
                                                <option>Bangalore</option>
                                                <option>Bhopal</option>
                                                <option>Chennai</option>
                                                <option>Chandigarh</option>
                                                <option>Delhi</option>
                                                <option>Faridabad</option>
                                                <option>Gwalior</option>
                                                <option>Gurugram</option>
                                                <option>Hyderabad</option>
                                                <option>Jalandhar</option>
                                                <option>Jodhpur</option>
                                                <option>Jammu</option>
                                                <option>Jaipur</option>
                                                <option>Kanpur</option>
                                                <option>Kochi</option>
                                                <option>Kolkata</option>
                                                <option>Ludhiana</option>
                                                <option>Meerut</option>
                                                <option>Mumbai</option>
                                                <option>Nagpur</option>
                                                <option>Noida</option>
                                                <option>Pune</option>
                                                <option>Patna</option>
                                                <option>Rajkot</option>
                                                <option>Surat</option>
                                                <option>Srinagar</option>
                                                <option>Tripura</option>
                                                <option>Udaipur</option>
                                                <option>Ujjain</option>
                                                <option>Varanasi</option>
                                                <option>Vadodara</option>

                                            </select>
                                        </div>


                                       

<!--                                        <script
                                            src="https://checkout.razorpay.com/v1/checkout.js"
                                            data-key="rzp_test_96HeaVmgRvbrfT"
                                            data-amount="<%=total%>00"
                                            data-buttontext="Pay with Razorpay"
                                            data-name="Food Basket"
                                            data-description=""
                                            data-image="images/foodbasket.png"
                                            data-prefill.name="Food Basket"
                                            data-prefill.email="email@gmail.com"
                                            data-theme.color="yellowgreen"
                                            >
                                        </script>-->
                                    </form>
                                            <input type="button" value="Place Order COD" onclick="placeorder()" />
                                            <input type="button" id="cashbtn" value="Pay Online" onclick="go()" />


                                </div>
                            </div>

                        </div>






                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //checkout page -->
        <%@include file ="footer.jsp" %>
        <script>
            <%System.out.println("....."+total);%>
            function go(){
                var total123 = <%=total%>;
                alert(total123);
              var options = {
//                  rzp_live_6R4RfSxoYaN6a7
//rzp_test_96HeaVmgRvbrfT
                
                "key": "rzp_test_96HeaVmgRvbrfT", // Enter the Key ID generated from the Dashboard
                "amount":total123*100, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise or INR 500.
                "currency": "INR",
                "name": "Food Basket",
                "description": "",
                "image": "https://example.com/your_logo",
                "handler": function (response) {
//                    alert(response.razorpay_payment_id +"..."+response.razorpay_order_id+ "..."+response.razorpay_signature);
                placeorder();
              
                 },
                "prefill": {
                    "name": "test", "email": "test24pro@gmail.com",
                    "contact": ""
                },
                "notes": {
                    "address": ""
                },
                "theme": {
                    "color": "#F37254"
                }
            };
            var rzp1 = new Razorpay(options);
            document.getElementById('cashbtn').onclick = function (e) {
                rzp1.open();
                e.preventDefault();
            }
        }
            </script>
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

        <!--quantity-->
        <script>
            $('.value-plus').on('click', function () {
                var divUpd = $(this).parent().find('.value'),
                        newVal = parseInt(divUpd.text(), 10) + 1;
                divUpd.text(newVal);
            });

            $('.value-minus').on('click', function () {
                var divUpd = $(this).parent().find('.value'),
                        newVal = parseInt(divUpd.text(), 10) - 1;
                if (newVal >= 1)
                    divUpd.text(newVal);
            });
        </script>
        <!--quantity-->
        <script>
            $(document).ready(function (c) {
                $('.close1').on('click', function (c) {
                    $('.rem1').fadeOut('slow', function (c) {
                        $('.rem1').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $('.close2').on('click', function (c) {
                    $('.rem2').fadeOut('slow', function (c) {
                        $('.rem2').remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $('.close3').on('click', function (c) {
                    $('.rem3').fadeOut('slow', function (c) {
                        $('.rem3').remove();
                    });
                });
            });
        </script>
        <!--//quantity-->

        <!-- password-script -->
        <script>
            /*window.onload = function () {
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
             }*/
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
        <!-- //js-files --
        </body>
    
    </html>