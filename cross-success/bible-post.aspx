<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bible-post.aspx.cs" Inherits="bible_post" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tamil Bible Verse</title>
   
       <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Thambi+2:wght@700&display=swap" rel="stylesheet">
    <!-- Owl Carousel Assets -->
    <link href="https://queenstarters.in/OWL-Carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="https://queenstarters.in/OWL-Carousel/owl-carousel/owl.theme.css" rel="stylesheet">
 <!-- jQuery -->
<script src="js/jquery-2.0.0.min.js" type="text/javascript"></script>


  <link rel="stylesheet" href="editor/dist/css/jquery.wysiwygEditor.css">

   <!-- Toastr -->
  <link rel="stylesheet" href="../../theme/vendor/toastr/toastr.min.css">

    <!-- Bootstrap4 files-->
<script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

<!-- Font awesome 5 -->
<link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

<!-- custom style -->
<link href="css/ui.css" rel="stylesheet" type="text/css"/>
<link href="css/responsive.css" rel="stylesheet" />

<!-- custom javascript -->
<script src="js/script.js" type="text/javascript"></script>

<!-- plugin: fancybox  -->
<script src="plugins/fancybox/fancybox.min.js" type="text/javascript"></script>
<link href="plugins/fancybox/fancybox.min.css" type="text/css" rel="stylesheet">
     <link rel="shortcut icon" href="images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon1.ico" type="image/x-icon">
<style>
#mydiv {
  position: absolute;
  z-index: 9;
    resize: both;
  overflow: auto;

  text-align: center;
  width:1280px;
  cursor: move;
}

#mydivheader {
  padding: 10px;
  cursor: move;
  z-index: 10;
  font-size:50px;
  /*background-color:#00ac47;*/
  color: #2684fc;
  font-weight:bold;
}

.topright {
  position: absolute;
  top: 8px;
  right: 16px;
  font-size: 18px;
}


</style>

<style>

.owl-pagination {
  position: absolute;
  right: 0;
    
  top: -50px;
}
iframe {
      border: none;
      outline: none;
      position: relative;
      //width: 100%;
      background: #fff;
      //padding: 15px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
  
    
    <header class="section-header">
<section class="header-main border-bottom">
<div class="container">
	<a href="../index.html" class="brand-wrap"><img class="logo" src="images/logo.png"></a>
</div> <!-- container.// -->
</section>
</header> <!-- section-header.// -->


<section class="section-content padding-y">
<div class="container">

<div id="dvTable" style = "width:1280px; border:1px solid #ddd;  margin-left:-100px; height:720px; color:Black; text-align: center; background:url('images/bg/1.png')">


 <div id="mydiv" style="padding:15px; ">
 <div id="mydivheader">Click here to move</div>
<p id="bibleverse" style="font-family: 'Baloo Thambi 2', cursive;" ><strong>

இஸ்ரவேல் புத்திரர் கடந்து தீருமளவும், கர்த்தர் யோர்தானின் தண்ணீரை அவர்களுக்கு முன்பாக வற்றிப்போகப்பண்ணினதை, யோர்தானுக்கு மேல்கரையில் குடியிருந்த எமோரியரின் சகல ராஜாக்களும் கேட்டதுமுதற்கொண்டு, அவர்கள் இருதயம் கரைந்து, இஸ்ரவேல் புத்திரருக்கு முன்பாகச் சோர்ந்துபோனார்கள்.

</strong></p>
</div>
</div>




<div class="col-md-12 ">
<div class="card">
	
	
	
	
	<article class="filter-group">
		<header class="card-header">
			<a href="#" data-toggle="collapse" data-target="#collapse_5" aria-expanded="false" class="">
				<i class="icon-control fa fa-chevron-down"></i>
				<h6  class="title">
                <span class=" badge badge-danger m-2" id="versetexthd"></span> 
                <span id="bibleverse_header">Verse Info </span>
                </h6>
			</a>
		</header>
		<div class="filter-content collapse in" id="collapse_5" style="">
			<div class="card-body">
				

				

			

				
			</div><!-- card-body.// -->

            <div class=" card-footer">
            <div class="row">
        
        
         <div class="col-12">
         <div class="row">
<div class="col">
<label>
  <input type="radio" name="imgbg" value="images/bg/1.png" checked>
  <img src="images/bg/1.png" width="100" height="50">
</label>

</div>
<div class="col">
<label>
  <input type="radio" name="imgbg" value="images/bg/2.jpg" checked>
  <img src="images/bg/2.jpg" width="100" height="50">
</label>
</div>
<div class="col">

<label>
  <input type="radio" name="imgbg" value="images/bg/3.png" checked>
  <img src="images/bg/3.png" width="100" height="50">
</label>
</div>
<div class="col">

<label>
  <input type="radio" name="imgbg" value="images/bg/4.png" checked>
  <img src="images/bg/4.png" width="100" height="50">
</label>

</div>
<div class="col">

<label>
  <input type="radio" name="imgbg" value="images/bg/5.png" checked>
  <img src="images/bg/5.png" width="100" height="50">
</label>

</div>
</div>
         </div>
        </div>
            </div>
		</div>
	</article> <!-- filter-group .// -->
</div>
</div>





<div class="col-md-12 ">

<div class=" card">
<div class="card-header text-center">

<div id="dd_verse_list">

</div>
 <span class="float-right mr-2">
   <asp:Button ID="btnExport" CssClass=" btn btn-sm btn-primary" Text="Download" runat="server" UseSubmitBehavior="false"
    OnClick="ExportToImage" OnClientClick="return ConvertToImage(this)" />
   </span>
<span class="float-right mr-2"><input class="none p-1" type="range" min="0" max="100" value="0" id="fader" step="1" ></span>
  <span class="btn btn-primary btn-sm float-right next"><i class=" fa fa-forward"></i>  Next</span>

   <span class="btn btn-primary btn-sm float-right prev mr-2"><i class=" fa fa-backward"></i> Previous</span>
  


				
				
</div>

<div class=" card-body">
<div class=" text-center">
 <label class="checkbox-btn small">
			    <input type="radio" name="bibleoptradio">
			    <span class="btn btn-light btn-sm"> Both </span>
			  </label>

			  <label class="checkbox-btn">
			    <input type="radio" name="bibleoptradio">
			    <span class="btn btn-light btn-sm"> Old testament  </span>
			  </label>

			  <label class="checkbox-btn">
			    <input type="radio" onclick="radio_function(1,2)" name="bibleoptradio">
			    <span class="btn btn-light btn-sm"> New testament  </span>
			  </label>

            

              </div>
<div id="scroll" class="owl-carousel owl-theme mt-4 owl-demo">

 
  </div>
</div>

</div>

  


            
  </div>





</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= FOOTER ========================= -->
<footer class="section-footer border-top padding-y">
	<div class="container">
		<p class="float-md-right"> 
			&copy Copyright 2019 All rights reserved
		</p>
		<p>
			<a href="#">Terms and conditions</a>
		</p>
	</div><!-- //container -->
</footer>


<asp:HiddenField ID="hdnbookname" runat="server" />
    <asp:HiddenField ID="hdnbookno" runat="server" />
    <asp:HiddenField ID="hdnchapterno" runat="server" /> 
     <asp:HiddenField ID="hfImageData" runat="server" /> 

    


    
    </form>

   

    <script src="https://queenstarters.in/OWL-Carousel/owl-carousel/owl.carousel.js"></script>
    <script src="https://queenstarters.in/OWL-Carousel/assets/js/bootstrap-collapse.js"></script>
    <script src="https://queenstarters.in/OWL-Carousel/assets/js/bootstrap-transition.js"></script>
    <script src="https://queenstarters.in/OWL-Carousel/assets/js/bootstrap-tab.js"></script>

<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript" src="js/jquery.plugin.html2canvas.js"></script>

      <script src="editor/dist/js/jquery.wysiwygEditor.js"></script>
<!-- Toastr -->
<script src="../../theme/vendor/toastr/toastr.min.js"></script>

     <script type="text/javascript">
         //$('.wysiwyg-editor').wysiwygEditor();


         function ConvertToImage(btnExport) {
             html2canvas($("#dvTable")[0]).then(function (canvas) {
                 var base64 = canvas.toDataURL();
                 $("[id*=hfImageData]").val(base64);
                 __doPostBack(btnExport.name, "");
             });
             return false;
         }

         $('input:radio[name="imgbg"]').change(function () {

             if ($(this).is(':checked')) {
                 // append goes here

                 $('#dvTable').css("background-image", "url(" + $(this).val() + ")");
                 //alert($(this).val());
                 //dvTable
             }

         });




         $("#fader").on("input", function () {
             $('#bibleverse').css("font-size", $(this).val() + "px");
         });

         // Make the DIV element draggable:
         dragElement(document.getElementById("mydiv"));

         function dragElement(elmnt) {
             var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
             if (document.getElementById(elmnt.id + "")) {
                 // if present, the header is where you move the DIV from:
                 document.getElementById(elmnt.id + "").onmousedown = dragMouseDown; //header
             } else {
                 // otherwise, move the DIV from anywhere inside the DIV:
                 elmnt.onmousedown = dragMouseDown;
             }

             function dragMouseDown(e) {
                 e = e || window.event;
                 e.preventDefault();
                 // get the mouse cursor position at startup:
                 pos3 = e.clientX;
                 pos4 = e.clientY;
                 document.onmouseup = closeDragElement;
                 // call a function whenever the cursor moves:
                 document.onmousemove = elementDrag;
             }

             function elementDrag(e) {
                 e = e || window.event;
                 e.preventDefault();
                 // calculate the new cursor position:
                 pos1 = pos3 - e.clientX;
                 pos2 = pos4 - e.clientY;
                 pos3 = e.clientX;
                 pos4 = e.clientY;
                 // set the element's new position:
                 elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                 elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
             }

             function closeDragElement() {
                 // stop moving when mouse button is released:
                 document.onmouseup = null;
                 document.onmousemove = null;
             }
         }








         $(function () {
            
             load_owl_slide();

             var owl = $("#scroll");

             //owl.owlCarousel();

             // Custom Navigation Events
             $(".next").click(function () {

                 owl.trigger('owl.next');
             })
             $(".prev").click(function () {
                 owl.trigger('owl.prev');
             })
         });

       
         function radio_function(bookno,chapter,bookname) {
             
           //alert(bookno);
         $("[id*=hdnbookno]").val(bookno); 
         $("[id*=hdnchapterno]").val(chapter); 
         $("[id*=hdnbookname]").val(bookname);
         load_verses(bookno,chapter);
         
         }


         
         function radio_versetext_function(verse)
         {
          
          var bookno= $("[id*=hdnbookno]").val();
          var chapter = $("[id*=hdnchapterno]").val();
         
          load_verse_text(bookno,chapter,verse);
         
         }
      function load_verses(book, chapter) {

         
        $.ajax({
            type: "POST",
            url: "bible.aspx/get_verse",
            data: '{book: "' + book + '",chapter: "' + chapter + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {


           

               var html='';

               
                $.each(r.d, function () {

                 html+='<label class="checkbox-btn m-1"><input type="radio" onclick="radio_versetext_function('+this['Value']+')"  name="optradioverse">';
                 html+='<span class="btn btn-outline-primary btn-sm"> '+this['Value']+' </span></label>';             

                   // ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
             
                $("#dd_verse_list").html(html);
            },
            failure: function (response) {
                
                alert(response);
                //toastr.error('Not updated !')
            },
            error: function (jqXHR, exception) {
                alert("11");
                alert(jqXHR.responseText);
                // toastr.error(jqXHR.responseText)                
            },
            beforeSend: function () {

                $("#dd_verse_info").html('Loading..verses');
                // toastr.warning('Processing..')
            },
            complete: function () {
                //toastr.clear();
                $("#dd_verse_info").html('Select Verse');
            }
        });
    }


    function load_verse_text(book, chapter, verse) {

       
        $.ajax({
            type: "POST",
            url: "bible.aspx/get_verse_text",
            data: '{book: "' + book + '",chapter: "' + chapter + '",verse: "' + verse + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

               // $('#verse-list').find('li').remove().end();
              //  var ddlcategory = $("[id*=verse-list]");
             var chapterno= $("[id*=hdnchapterno]").val(); 
             var bookname=$("[id*=hdnbookname]").val();  
              var content='';
              
              $("#versetexthd").html(bookname + ":" + chapterno + ":" + verse);
              $("#mydivheader").html(bookname + ":" + chapterno + ":" + verse);
              //content+=bookname+":"+chapterno+":"+verse;
                $.each(r.d, function () {
                    //ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                   // ddlcategory.append($("<li><span class='badge badge-primary m-2'>" + this['Value'] + "</span>" + this['Text'] + "</li>"));

                   content+=this['Text'];

                });
               $("#bibleverse_header").text(content);
               $("#bibleverse").text(content);
                 
            },
            failure: function (response) {
                alert(response);
            },
            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                $("#verse_text_info").html('Loading..');
            },
            complete: function () {
                //toastr.clear();
                $("#verse_text_info").html('Verse');
            }
        });
    }

   
       function load_owl_slide() {


           $.ajax({
               type: "POST",
               url: "bible-post.aspx/load_bookslider",
               data: '{}',
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (r) {

                   //alert(r.d);

                   var owl = $('#scroll');

                   owl.owlCarousel({
                       jsonPath: 'https://queentouchtech.in/json/slide1.json', //scroll
                       jsonSuccess: customDataSuccess,
                       navigation: true,
                       items: 5
                      
                       

                   });

                   

                   function customDataSuccess(data) {
                       var content = "";

                       var scroll_content = "";
                       for (var i in data["items"]) {

                           var bookno = data["items"][i].bookno;
                           var bookname = data["items"][i].bookname;
                           var bmin = data["items"][i].bookstartno;
                           var bmax = data["items"][i].bookendno;


                           content += '<figure class="card card-product-grid"><div class="p-1"><a href="#" class="btn btn-block btn-primary">' + bookname + ' </a>';

                           for (var k = bmin; k <= bmax; k++) {

                               //content+='<h6 class="badge badge-danger"> '+k+' </h6>';
                               content += '<label class="checkbox-btn chk_chap m-1"><input type="radio"  onclick="radio_function(' + bookno + ',' + k + ',\'' + bookname + '\')" name="optradio">';
                               content += '<span class="btn btn-light btn-sm"> ' + k + ' </span></label>';
                           }


                           content += '</div>';
                           content += '';
                           content += '';
                           content += '</figure>';

                           /*
                           for (var j = bmin; j <= bmax; j++) {
                           scroll_content += '<h4 class=" text-sm"><a  class="btn btn-outline-success btn-sm text-green float-left">' + j + '</a>';
                           }
                           */




                       }

                       $("#scroll").html(content);


                   }


               }
           });


       }


</script>

  

</body>
</html>
