<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shuffle.aspx.cs" Inherits="cross_success_shuffle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QUEEN TOUCH TECHNOLOGY</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="../theme/vendor/toastr/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <link rel="shortcut icon" href="images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon1.ico" type="image/x-icon">
    <style>
        body{
  font-family: 'Nunito', sans-serif;
  padding: 50px;
}


        .animate {
        
        /* Start the shake animation and make the animation last for 0.5 seconds */
  animation: shake 0.5s;

  /* When the animation is finished, start again */
  animation-iteration-count: infinite;
        }

        .zoomm {
    animation: zoom-in-zoom-out 1s infinite ;
}

@keyframes zoom-in-zoom-out {
  0% {
    transform: scale(1, 1);
  }
  50% {
    transform: scale(1.2, 1.2);
  }
  100% {
    transform: scale(1, 1);
  }
}


        @keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}

.card{
    border-radius: 4px;
    background: #fff;
    box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
      transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
  padding: 14px 80px 18px 36px;
  cursor: pointer;
}

.card:hover,.zoo{
     transform: scale(1.05);
  box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
}
.card h3{
  font-weight: 600;
}

.card img{
  position: absolute;
  top: 20px;
  right: 15px;
  max-height: 120px;
}

.card-1{
  background-image: url(https://ionicframework.com/img/getting-started/ionic-native-card.png);
      background-repeat: no-repeat;
    background-position: right;
    background-size: 80px;
}

.card-2{
   background-image: url(https://ionicframework.com/img/getting-started/components-card.png);
      background-repeat: no-repeat;
    background-position: right;
    background-size: 80px;
}

.card-3{
   background-image: url(https://ionicframework.com/img/getting-started/theming-card.png);
      background-repeat: no-repeat;
    background-position: right;
    background-size: 80px;
}

@media(max-width: 990px){
  .card{
    margin: 20px;
  }
} 


    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">

                
               

               <div class=" row">

                   <span class="badge badge-default float-right "><img src="images/logo.png" /></span>
        
        
               </div>
                <hr />

                 <div class="row" id="appSummary">
    <div class="col text-center">
       <h1 id="heading" class="card-title d-inline">Selected Members on 19-10-2021 Bible Quiz</h1>
      <p class="lead">One Person will eliminate On Every 5 Seconds <span id="counter" class="badge badge-warning"></span></p>
        <br />
        <span class=" btn btn-danger btn-sm" onclick="refresh()">Re Shuffle</span>
    </div>
  </div>


                
               
  <div class="row shuffle" id="shuffle">
    
    
    

    
    
    
  </div>
</div>
        </div>
    </form>
    <script src="../theme/vendor/toastr/toastr.min.js"></script>
    <script>

        var counter = 0;
       

        $(function () {
            var parent = $(".shuffle");
            var divs = parent.children();
            var target;
            var offset;
            var index = 1;
            initialize();
           

          

          
            

            var interval = setInterval(function () {

                if ($('div.shuffle h3').length > 1) {
                   
                    counter++;
                    $("#counter").html(counter);
                  
                    if (counter == 5) {

                        load_filtered_users();
                        counter = -1;
                    }
                    

                   
                   
                       animatedivs();
                    
                }
                else {
                    $(".shuffle").find("div:first").removeClass("animate");
                    $(".shuffle").find("div:first").removeClass("col-md-4");
                    $(".shuffle").find("div:first").addClass("col-md-12 zoomm");

                    $(".shuffle").find("div>div:first").removeClass("card-1");
                    $(".shuffle").find("div>div:first").addClass("card-3");
                    
                    $("#heading").html("WINNER for Today's Bible Quiz is");
                    $(".lead").hide();

                    
                }

                
            }, 1000);


           
        });

        function animatedivs() {
            //alert($('div.shuffle h3').length);

            const array1 = [];
            const array2 = [];


            for (var i = 0; i < $('div.shuffle h3').length; i++) {
                
                array1.push(i);
                array2.push(i);
            }
            var rnd_array1 = array1[Math.floor(Math.random() * array1.length)];
            var rnd_array2 = array2[Math.floor(Math.random() * array2.length)];

            var animating = false;
            if (animating) {
                return;
            }
            else {
                clickedDiv = $('div.shuffle').children().eq(rnd_array1);
                prevDiv = $('div.shuffle').children().eq(rnd_array2);

                var x = "";
                var y = "";

                var xx = "";
                var yy = "";

                x = clickedDiv.offset().top;
                y = clickedDiv.offset().left;

                xx = prevDiv.offset().top;
                yy = prevDiv.offset().left;

                //alert(x);
                clickedDiv.animate({
                    top: xx - x,
                    left: yy - y
                }, 600), prevDiv.animate({

                    top: x - xx,
                    left: y - yy
                }, 600,function () {

                     prevDiv.css('top', '0px');
                     prevDiv.css('left', '0px');
                     clickedDiv.css('top', '0px');
                     clickedDiv.css('left', '0px');
                     //prevDiv.position(clickedDiv);
                    animating = false;
                });
            }

           
        }
        function refresh() {

            var isGood = confirm('Are you confirm to shuffle again?');
            if (isGood) {
                $.ajax({
                    type: "POST",
                    url: "shuffle.aspx/update_all",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {

                        if (r.d == "success") {
                            location.reload();
                        }
                    },
                    failure: function (response) {

                        alert(response.d);
                        // toastr.error('Not updated !')
                    },
                    error: function (jqXHR, exception) {

                        alert(jqXHR.responseText);
                        // toastr.error(jqXHR.responseText)                
                    },
                    beforeSend: function () {


                        //toastr.warning('Processing..')
                    },
                    complete: function () {
                        //toastr.clear();



                    }
                });
            } else {
                return; 
            }

           
        }

        function initialize() {

            $("#heading").html("Selected Members on Today's Bible Quiz");
            $(".lead").show();


            $.ajax({
                type: "POST",
                url: "shuffle.aspx/update_all",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    load_users();
                   
                },
                failure: function (response) {

                    alert(response.d);
                    // toastr.error('Not updated !')
                },
                error: function (jqXHR, exception) {

                    alert(jqXHR.responseText);
                    // toastr.error(jqXHR.responseText)                
                },
                beforeSend: function () {


                    //toastr.warning('Processing..')
                },
                complete: function () {
                    //toastr.clear();



                }
            });
        }

        function load_users() {

            
            $.ajax({
                type: "POST",
                url: "shuffle.aspx/get_users",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var obj = JSON.parse(r.d);
                    var html = '';                 
                   
                  
                    for (var i = 0; i < obj.length; i++) {

                        html += '<div class="col-md-4 animate mt-5"><div class="card card-1">';
                        html += '<h3>' + obj[i].name+'</h3>';
                        html += "<p>Selected Members on Today's Bible Quiz</p>";
                        html += '</div>';
                        html += '</div> </div>';
                    }
                    $("#shuffle").html(html);
                },
                failure: function (response) {

                    alert(response.d);
                   // toastr.error('Not updated !')
                },
                error: function (jqXHR, exception) {

                    alert(jqXHR.responseText);
                   // toastr.error(jqXHR.responseText)                
                },
                beforeSend: function () {

                   
                   //toastr.warning('Processing..')
                },
                complete: function () {
                   //toastr.clear();

                    
                    
                }
            });
        }


        function load_filtered_users() {


            $.ajax({
                type: "POST",
                url: "shuffle.aspx/get_filtered_users",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    var obj = JSON.parse(r.d);
                    var html = '';


                    for (var i = 0; i < obj.length; i++) {

                        html += '<div class="col-md-4 animate mt-5"><div class="card card-1">';
                        html += '<h3>' + obj[i].name + '</h3>';
                        html += "<p>Selected Members on Today's Bible Quiz</p>";
                        html += '</div>';
                        html += '</div> </div>';
                    }
                    $("#shuffle").html(html);
                },
                failure: function (response) {

                    alert(response.d);
                    // toastr.error('Not updated !')
                },
                error: function (jqXHR, exception) {

                    alert(jqXHR.responseText);
                    // toastr.error(jqXHR.responseText)                
                },
                beforeSend: function () {


                    //toastr.warning('Processing..')
                },
                complete: function () {
                    //toastr.clear();

                }
            });
        }


       

    </script>

</body>
</html>
