<%@page import="vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>
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
            function fetchactivemerchants()
            {
                
                var xhr = new XMLHttpRequest();

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var res = xhr.responseText;
                        res = res.trim();

                        var jsonobj = JSON.parse(res);

                        jsonarr = jsonobj["ans"];

                        var ans = "<table class=\"table table-bordered\">";

                        ans += "<tr>";
                        ans += "<th>Merchant Name</th>";
                        ans += "<th>E-Mail</th>";
                        ans += "<th>Phone No</th>";
                        ans += "<th>Address</th>";
                        ans += "<th>City</th>";
                        ans += "<th>Password</th>";
                        ans += "<th>Photo</th>";
                        ans += "<th>Status</th>";
                        ans += "</tr>";

                        for (var i = 0; i < jsonarr.length; i++)
                        {
                            var o = jsonarr[i];
                            ans += "<tr>";
                            ans += "<td>" + o.name + "</td>";
                            ans += "<td>" + o.email + "</td>";
                            ans += "<td>" + o.phoneno + "</td>";
                            ans += "<td>" + o.address + "</td>";
                            ans += "<td>" + o.city + "</td>";
                            ans += "<td>" + o.password + "</td>";
                            ans += "<td><img src=\"" + o.photo + "\" width=\"60\" height=\"60\"  />&nbsp;<span onclick=\"editphoto('" + i + "')\" ></span></td>";
                            ans += "<td><button onclick=\"changestatus('pending','" + o.mid + "')\" class=\"btn btn-primary\" >Block</button></td>";
                            ans += "</tr>";

                        }

                        ans += "</table>";

                        document.getElementById("activemerchants").innerHTML = ans;
                        
                        fetchpendingmerchants();
                    }
                };

                xhr.open("GET", "fetchmerchants?status=active", true);
                xhr.send();


            }
             function fetchpendingmerchants()
             {
               
                var xhr = new XMLHttpRequest();

                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState === 4 && xhr.status == 200)
                    {
                        //get response from server
                        var res = xhr.responseText;
                        res = res.trim();

                        var jsonobj = JSON.parse(res);

                        jsonarr = jsonobj["ans"];

                        var ans = "<table class=\"table table-bordered\">";

                        ans += "<tr>";
                        ans += "<th>Merchant Name</th>";
                        ans += "<th>E-Mail</th>";
                        ans += "<th>Phone No</th>";
                        ans += "<th>Address</th>";
                        ans += "<th>City</th>";
                        ans += "<th>Password</th>";
                        ans += "<th>Photo</th>";
                        ans += "<th>Status</th>";
                        ans += "</tr>";

                        for (var i = 0; i < jsonarr.length; i++)
                        {
                            var o = jsonarr[i];
                            ans += "<tr>";
                            ans += "<td>" + o.name + "</td>";
                            ans += "<td>" + o.email + "</td>";
                            ans += "<td>" + o.phoneno + "</td>";
                            ans += "<td>" + o.address + "</td>";
                            ans += "<td>" + o.city + "</td>";
                            ans += "<td>" + o.password + "</td>";
                            ans += "<td><img src=\"" + o.photo + "\" width=\"60\" height=\"60\"  />&nbsp;<span onclick=\"editphoto('" + i + "')\" ></span></td>";
                            ans += "<td><button onclick=\"changestatus('active','" + o.mid + "')\" class=\"btn btn-primary\" >Approve</button></td>";
                            ans += "</tr>";

                        }

                        ans += "</table>";

                        document.getElementById("pendingmerchants").innerHTML = ans;

                    }
                };

                xhr.open("GET", "fetchmerchants?status=pending", true);
                xhr.send();


            }
            
            function changestatus(status,mid)
            {
               
                  var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState === 4 && xhr.status == 200)
                        {
                            //get response from server
                            var res = xhr.responseText;
                            res = res.trim();
                            
                            if (res == "success")
                            {
                                document.getElementById("status").innerHTML = "Status Changed";

                                fetchactivemerchants();

                            } else
                            {
                                document.getElementById("status").innerHTML = "Error in changing  status";

                            }
                        }
                    };

                    xhr.open("GET", "changestatus?status="+status+"&mid="+mid, true);
                    xhr.send();

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
    <body onload="fetchactivemerchants()">
       <div class="container">
            <h3 class="tittle-w3l">Manage Merchants
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>
           <h1>Active Merchants</h1>
           <div id="activemerchants"></div>
           
           <h1>Pending Merchants</h1>
           <div id="pendingmerchants"></div>
           
        </div>

           <div id="status"></div>
       
	  <%@include file ="footer.jsp" %>
    </body>
</html>
