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
        <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Kitchen Products :: w3layouts</title>
        <!--/tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Grocery Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <%
            String gmid = request.getParameter("mid");
            String mname = request.getParameter("name");

        %>
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <script>
            function gotoproductdetail(pid,categoryname)
            {
                location.href = "productdetail.jsp?pid=" + pid + "&categoryname="+categoryname;
            }
            function gotoproductdetails(pid, categoryname1)
            {
                location.href = "productdetail.jsp?pid=" + pid + "&categoryname=" + categoryname1;
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


    </head>

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

                        <li class ="active">By <%=mname%></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //page -->
        <!-- top Products -->
        <div class="ads-grid">
            <div class="container">
                <!-- tittle heading -->
                <h3 class="tittle-w3l">Products by <%=mname%>
                    <span class="heading-style">
                        <i></i>
                        <i></i>
                        <i></i>
                    </span>
                </h3>
                <!-- //tittle heading -->

                <div class="agileinfo-ads-display col-md-12 w3l-rightpro">
                    <div class="wrapper">

                        <div class="product-sec1">
                            <%
                                ResultSet rs = DBLoader.executequery("select * from products where mid='" + gmid + "'");
                                while (rs.next()) {
                                    int pid = rs.getInt("pid");
                                    String name = rs.getString("name");
                                    String photo = rs.getString("photo");
                                    int price = rs.getInt("price");
                                    int offerprice = rs.getInt("offerprice");
                                    String categoryname = rs.getString("categoryname");


                            %>
                            <div class="col-xs-4 product-men">
                                <div class="men-pro-item simpleCart_shelfItem">
                                    <div class="men-thumb-item">
                                        <img src="<%=photo%>" alt="" style="width: 120px;height: 144px;">
                                        <div class="men-cart-pro">
                                            <div class="inner-men-cart-pro">

                                                <a href="productdetail.jsp?pid=<%=pid%>&categoryname=<%=categoryname%>" class="link-product-add-cart">Quick View</a>
                                            </div>
                                        </div>
                                        <span class="product-new-top">New</span>
                                    </div>
                                    <div class="item-info-product ">
                                        <h4>
                                            <a href="productdetail.jsp?pid=<%=pid%>&categoryname=<%=categoryname%>"><%=name%></a>
                                        </h4>
                                        <div class="info-product-price">
                                            <span class="item_price"> &#x20B9;<%=offerprice%></span>
                                            <del>&#x20B9;<%=price%></del>
                                        </div>
                                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                            <form action="#" method="post">
                                                <fieldset>
                                                    <input type="hidden" name="cmd" value="_cart" />
                                                    <input type="hidden" name="add" value="1" />
                                                    <input type="hidden" name="business" value=" " />
                                                    <input type="hidden" name="item_name" value="Zeeba Basmati Rice - 5 KG" />
                                                    <input type="hidden" name="amount" value="950.00" />
                                                    <input type="hidden" name="discount_amount" value="1.00" />
                                                    <input type="hidden" name="currency_code" value="USD" />
                                                    <input type="hidden" name="return" value=" " />
                                                    <input type="hidden" name="cancel_return" value=" " />
                                                    <input type="button" name="submit" onclick="gotoproductdetail('<%=pid%>','<%=categoryname%>')" value="View Details" class="button" />
                                                    <br>
                                                    <br>
                                                    <br>
                                                </fieldset>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div class="clearfix"></div>
                        </div>


                    </div>
                </div>
                <!-- //product right -->
            </div>
        </div>
        <!-- //top products -->
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
                            ResultSet rs1 = DBLoader.executequery("select * from products ORDER BY pid LIMIT 6");
                            while (rs1.next()) {
                                String name = rs1.getString("name");
                                String categoryname1 = rs1.getString("categoryname");
                                String photo = rs1.getString("photo");
                                int price = rs1.getInt("price");
                                int offerprice = rs1.getInt("offerprice");
                                int pid = rs1.getInt("pid");

                        %>
                        <li>
                            <div class="w3l-specilamk">
                                <div class="speioffer-agile">
                                    <a href="productdetail.jsp?pid=<%=pid%>&categoryname=<%=categoryname1%>">
                                        <img src="<%=photo%>" alt="" class="img-responsive" style="width:235px;height: 258px;">
                                    </a>
                                </div>
                                <div class="product-name-w3l">
                                    <h4>
                                        <a href="productdetail.jsp?pid=<%=pid%>&categoryname=<%=categoryname1%>"><%=name%></a>
                                    </h4>
                                    <br>
                                    <br>
                                    <div class="w3l-pricehkj">
                                        <span class="item_price"> &#x20B9;<%=offerprice%></span>
                                        <del>&#x20B9;<%=price%></del>
                                        <br>
                                        <br>
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
                                                <input type="button" name="submit" onclick ="gotoproductdetails('<%=pid%>', '<%=categoryname1%>')" value="View Details" class="button" />
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