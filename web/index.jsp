`<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="vmm.DBLoader" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <title>Food Basket</title>
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
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">


        <script>
            function gotoproducts(categoryname)
            {
                location.href = "products.jsp?categoryname=" + categoryname;
            }
             
        function gotoproductdetail(pid,categoryname)
        {
            location.href="productdetail.jsp?pid="+pid+"&categoryname="+categoryname;
        }
        
        </script>

    </head>

    <body>
        <%@include file ="header.jsp" %>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                <li data-target="#myCarousel" data-slide-to="3" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Big
                                <span>Save</span>
                            </h3>
                            <p>Get flat
                                <span>10%</span> Cashback</p>
                            <a class="button2" href="products_shopnow.jsp">Shop Now </a>
                        </div>
                    </div>
                </div>
                <div class="item item2">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Healthy
                                <span>Saving</span>
                            </h3>
                            <p>Get Upto
                                <span>30%</span> Off</p>
                            <a class="button2" href="products_shopnow.jsp">Shop Now </a>
                        </div>
                    </div>
                </div>
                <div class="item item3">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Big
                                <span>Deal</span>
                            </h3>
                            <p>Get Best Offer Upto
                                <span>20%</span>
                            </p>
                            <a class="button2" href="products_shopnow.jsp">Shop Now </a>
                        </div>
                    </div>
                </div>
                <div class="item item4">
                    <div class="container">
                        <div class="carousel-caption">
                            <h3>Today
                                <span>Discount</span>
                            </h3>
                            <p>Get Now
                                <span>40%</span> Discount</p>
                            <a class="button2" href="products_shopnow.jsp">Shop Now </a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- //banner -->

        <!-- top Products -->

        <div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l"> Categories
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>

                <div class="row">
                    <%                       
                        ResultSet rs = DBLoader.executequery("select * from categories");
                        while (rs.next()) 
                        {
                            String categoryname = rs.getString("categoryname");
                            String photo = rs.getString("photo");

                    %>
                    <div class="col-sm-4" onclick="gotoproducts('<%=categoryname%>')">
                        <div style="padding:10px; text-align: center; box-shadow: 1px 1px 3px rgba(0,0,0.7); border-radius:5px; ">
                            <img src="<%=photo%>" class="img-responsive" style="width:600px; height:200px"/>
                            <h3><%=categoryname%></h3>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- special offers -->
        <div class="featured-section" id="projects">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Special Offers
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->
                <div class="content-bottom-in">
                    <ul id="flexiselDemo1">
                       
                            <%
                                ResultSet rs1 = DBLoader.executequery("select * from products ORDER BY pid DESC LIMIT 5");
                                while (rs1.next())
                                {
                                    String name = rs1.getString("name");
                                    String categoryname = rs1.getString("categoryname");
                                    String photo = rs1.getString("photo");
                                    int price= rs1.getInt("price");
                                    int offerprice = rs1.getInt("offerprice");
                                    int pid  = rs1.getInt("pid");
                                    
                            %>
                            <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="productdetail.jsp?pid=<%=pid%>&categoryname=<%=categoryname%>">
                                        <img src="<%=photo%>" alt="" class="img-responsive">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="productdetail.jsp?pid=<%=pid%>&categoryname=<%=categoryname%>"><%=name%></a>
                                    </h4>
                                    <br>
                                    <div class="w3l-pricehkj">
                                        <span class="item_price"> &#x20B9;<%=offerprice%></span>
                                        <del>&#x20B9;<%=price%></del>
                                        
                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="#" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Aashirvaad, 5g" />
                                                <input type="hidden" name="amount" value="220.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="button" name="submit" onclick="gotoproductdetail('<%=pid%>','<%=categoryname%>')" value="View Details" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                            <%
                                }
                            %>
                      
                    </ul>
                </div>
            </div>
        </div>
        <!-- //special offers -->
<%@include file ="footer.jsp" %>

    </body>

</html>