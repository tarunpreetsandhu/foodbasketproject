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
       
        <div class="container">
            <h3 class="tittle-w3l">View Orders
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>
        </div>

        <%            
            ResultSet rs = DBLoader.executequery("select * from orders");
            while (rs.next()) 
            {
                int oid = rs.getInt("oid");
                int totalprice = rs.getInt("totalprice");
                String date = rs.getString("datetime");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String username=rs.getString("username");
        %>
        <div style="margin: 20px;padding:20px; box-shadow: 1px 1px 8px rgba(0,0,0,0.4);">
            <div class="row">
                <div class="col-sm-8">
                    <h3>ORDER ID: <%=oid%> </h3>
                    <h4>DATE: <%=date%></h4>
                    <br>
                    <h4>ADDRESS: <%=address%></h4>
                    <h4>CITY: <%=city%></h4>
                </div>
                <div class="col-sm-4">
                    <h4>USERNAME: <%=username%></h4>
                    <h4>TOTAL PRICE: <%=totalprice%></h4>
                </div>
           
        </div>
        <div class="card">
            <div class="card-header">
                <a class="collapsed card-link" data-toggle="collapse" href="#collapse<%=oid%>">
                    View Details
                </a>
            </div>
            <div id="collapse<%=oid%>" class="collapse" data-parent="#accordion">
                <div class="card-body">
                    <table class="table table-bordered table-responsive">
                        <thead>
                            <tr>
                                <th>NO.</th>
                                <th>NAME</th>
                                <th>PHOTO</th>
                                <th>PRICE</th>
                                <th>QTY</th>
                                <th>TOTAL</th>
                            </tr>
                        </thead>
                    <%
                    ResultSet rs1=DBLoader.executequery("select * from orderdetails where oid="+oid+"");
                    int s=1;
                    while(rs1.next())
                        {
                            int pid=rs1.getInt("pid");
                            int price=rs1.getInt("price");
                            int qty=rs1.getInt("qty");
                     ResultSet rs2=DBLoader.executequery("select * from products where pid="+pid+"");
                     rs2.next();
                     String name = rs2.getString("name");
                     String photo = rs2.getString("photo");
                    %>
                    <tbody>
                        <tr>
                            <td><%=s%></td>
                            <td><%=name%></td>
                            <td><img src="<%=photo%>" style="width:70 px;height: 70px;"></td>
                            <td><%=price%></td>
                            <td><%=qty%></td>
                            <td><%=price*qty%></td>
                            
                        </tr>
                       
                    </tbody>
                    <%
                        s++;
                    }
                    %>
                    
                    </table>
                </div>
            </div>
       </div>
          
</div>
        <%
            }
        %>

        
        
	  <%@include file ="footer.jsp" %>
    </body>

</html>
