
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Gallery</title>
       
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
     
    
    </head>
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

        function addreview()
        {
            if (n  === 0)
            {
                document.getElementById("label1").style.display = "block";

            } else
            {
             
             
            }
        }
    </script>
    <body>
   
        
        
        
                         <input type="button" class="btn btn-success" value="ADD REVIEW"
                        style="border-radius: 10px;text-shadow: 2px 2px 5px black;" onclick="review()"/>
             
                         

            <div class="modal" id="myModal" >
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header " style="background: aliceblue;" >
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="color: white;"> Add Review</h4>
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
                                        <label> Write Comment : </label> <input style="border-radius: 20px;" type="text" id="comment"  class="form-group"/>
                                        <input type="button" value="Submit" class="btn btn-primary"
                                               style="border-radius: 10px;text-shadow: 2px 2px 5px black" onclick="addreview()" />
                                        <label style="display: none;color: tomato;" id="label1">Please Select Any Rating</label>

                                    </form>
                                </div>
                             
                            </div>   
                        </div>
                            <!--</div>-->
                            <div class="modal-footer " style="background: yellowgreen;" >
                                <button type="button" class="btn btn-default" style="border-radius: 10px;" data-dismiss="modal" style="" >Close</button>
                            </div>
                        

                    </div>
                </div>
            </div>

        </div>        

        
        
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
