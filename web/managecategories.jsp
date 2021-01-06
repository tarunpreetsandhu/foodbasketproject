<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <title>Grocery Shoppy an Ecommerce Category Bootstrap Responsive Web Template | Home :: w3layouts</title>

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


            var jsonarr;

            function addcategory()
            {
                var formdata = new FormData();

                var controls = document.getElementById("form1").elements;
                var flag = 0;

                for (var i = 0; i < controls.length; i++)
                {
                    //if name is given to every input type
                    if (controls[i].name == "" || controls[i].name == null)
                    {
                        flag = 1;
                    }
                    if (controls[i].type == "file")
                    {
                        //if file is selected by user
                        if (controls[i].files.length > 0)
                        {
                            formdata.append(controls[i].name, controls[i].files[0]);
                        } else
                        {
                            flag = 2;
                        }
                    } else
                    {
                        // for input type text ,password, email
                        formdata.append(controls[i].name, controls[i].value);
//                        alert(formdata);
                    }
                }
                if (flag == 1)
                {
                    alert("CHECK: --> Give name attribute to all controls in form");
                } else if (flag == 2)
                {
                    alert("CHECK: --> Select Files for file controls");
                } else
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
                                document.getElementById("status").innerHTML = "Category added Successfuly";
                                document.getElementById("status").style.color = "green";

                                document.getElementById("categoryname").value = "";
                                document.getElementById("description").value = "";
                                document.getElementById("myfile").value = "";


                                fetchcategory();

                            } else
                            {
                                document.getElementById("status").innerHTML = "Category Already exist";
                                document.getElementById("status").style.color = "red";

                            }

                        }
                    };

                    xhr.open("POST", "addcategory", true);


                    xhr.send(formdata);

                }

            }

            function fetchcategory()
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
                        ans += "<th>Category Name</th>";
                        ans += "<th>Description</th>";
                        ans += "<th>Photo</th>";
                        ans += "<th>Delete</th>";
                        ans += "</tr>";

                        for (var i = 0; i < jsonarr.length; i++)
                        {
                            var o = jsonarr[i];
                            ans += "<tr>";
                            ans += "<td>" + o.categoryname + "</td>";
                            ans += "<td>" + o.description + "</td>";
                            ans += "<td><img src=\"" + o.photo + "\" width=\"60\" height=\"60\"  />&nbsp;<span onclick=\"editphoto('" + i + "')\" >edit</span></td>";
                            ans += "<td><span onclick=\"deletecategory('" + o.categoryname + "')\" class=\"fa fa-trash\" style=\"font-size:25px;color:red;\" ></span></td>";
                            ans += "</tr>";

                        }

                        ans += "</table>";

                        document.getElementById("sec").innerHTML = ans;

                    }
                };

                xhr.open("GET", "fetchcategories", true);
                xhr.send();


            }

            function deletecategory(categoryname)
            {
                var option = confirm("Are you sure you want to delete "+categoryname+"?");

                if (option == true)
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
                                document.getElementById("status").innerHTML = "Deleted successfuly";

                                fetchcategory();

                            } else
                            {
                                document.getElementById("status").innerHTML = "Error in deletion";

                            }
                        }
                    };

                    xhr.open("GET", "deletecategory?categoryname=" + categoryname, true);
                    xhr.send();

                }

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
<body onload="fetchcategory()">
    <div class="container">

        <h3 class="tittle-w3l">Add Category
            <span class="heading-style">
                <i></i>
                <i></i>
                <i></i>
            </span>
        </h3>

        <div class="row">

            <div class="col-sm-8 offset-sm-2" >
                <form id="form1">

                    <div class="form-group">
                        <label for="categoryname">Enter Category Name:</label>
                        <input type="text" placeholder="Enter Category name" name="categoryname" id="categoryname" class="form-control"  />
                    </div> 

                    <div class="form-group">
                        <label for="description">Enter Description:</label>
                        <input type="text" placeholder="Enter Description" name="description" id="description" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="myfile">Choose Photo:</label>
                        <input type="file" name="myfile" id="myfile"  />
                    </div>
                </form>
                <input type="button" class="btn btn-success" value="ADD" onclick="addcategory()" />

                <h3 id="status"></h3>
            </div>

        </div>
        <br>
       
        <div class="container">
            <h3 class="tittle-w3l text-center">Already Added Categories
                <span class="heading-style">
                    <i></i>
                    <i></i>
                    <i></i>
                </span>
            </h3>
        </div>
        <div id="sec"></div>
    </div>

</body>
</html>
