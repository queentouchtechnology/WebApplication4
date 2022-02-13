<%@ Page Language="C#" AutoEventWireup="true" CodeFile="div-to-image.aspx.cs" Inherits="div_to_image" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate tamil bible verse image</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Baloo+Thambi+2:wght@700&display=swap" rel="stylesheet">


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


</head>
<body class=" bg-light">
    <form id="form1" runat="server">

    
<header class="section-header">
<section class="header-main border-bottom">
<div class="container p-2">
	<a href="../index.html" class="brand-wrap"><img class="logo" src="images/logo1.png"></a>
</div> <!-- container.// -->
</section>
</header> <!-- section-header.// -->


<section class=" mt-2">
    <div class="container">



<div class="row">
<div class="col-md-4">
	<article class="card card-body">
		<div class="form-group form-row">
    <label class="col-md-3 col-form-label">Search</label>
    <div class="col-sm-9 pt-1">
	    <label class="custom-control custom-radio custom-control-inline">
		  <input class="custom-control-input" checked="" value="0" type="radio" name="account_type" value="option1">
		  <span class="custom-control-label"> Old testament </span>
		</label>
        <label class="custom-control custom-radio custom-control-inline">
		  <input class="custom-control-input" type="radio" value="1" name="account_type"  value="option2">
		  <span class="custom-control-label"> New testament  </span>
		</label>

       
    </div>
  </div>
	</article> <!-- panel-lg.// -->
</div><!-- col // -->
<div class="col-md-3">
	<article class="card card-body">

      

     <div class="form-group pull-right">
    	<select id="dd_books_list" name="category_info" class="custom-select form-control">
					<option id="dd_books_info" value="0">Select Book</option>
				
				</select>
</div>


	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
<div class="col-md-3">
	<article class="card card-body">
		

          


         <div class="form-group pull-right">
    	<select id="dd_chapter_list" name="chapter_info" class="custom-select form-control">
					<option id="dd_chapters_info" value="0">Select Chapter</option>
				
				</select>
</div>




	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
<div class="col-md-2">
	<article class="card card-body">
		
         

        <div class="form-group pull-right">
    	<select id="dd_verse_list" name="verse_info" class="custom-select form-control">
					<option id="dd_verse_info" value="0">Verse</option>
				
				</select>
</div>




	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
</div>













<article class="card mt-2">
	<div class="card-body">
		<div class="row">
        <div class="topright">
       
			<img id="versemove" class="" src="images/bibleopen.jpg" width="36" height="36" />
            </div>
			<aside class="col-md-12">
				<h5 id="verse_text_info"></h5>
				<ul id="verse-list" class=" list-unstyled">
					
				</ul>
			</aside>



		</div> <!-- row.// -->
	
	</div> <!-- card-body.// -->
</article>
</div>
</section>

<section class="mt-2">
    <div class="container">


   







    <div class="row">

    	
  <div class="col p-1">
  	<article class="card card-body">
     <asp:HiddenField ID="hfImageData" runat="server" />   
   <p class=" p-1">Font Size</p>
  <input class="none p-1" type="range" min="0" max="100" value="0" id="fader" step="1" >
  </article>
  
  </div>
  <div class="col p-1">
  		<article class="card card-body">
   <p class=" p-1">Click the button to download the image</p>
  <asp:Button ID="btnExport" CssClass=" btn btn-sm btn-primary" Text="Download" runat="server" UseSubmitBehavior="false"
    OnClick="ExportToImage" OnClientClick="return ConvertToImage(this)" />
    
    </article>
    </div>
   
</div>
    
</div>
</section>


<section class=" mt-2">
    <div class="container">



<div class="row">
<div class="col">
<label>
  <input type="radio" name="imgbg" value="images/bg/1.png" checked>
  <img src="images/bg/1.png" width="150" height="100">
</label>

</div>
<div class="col">
<label>
  <input type="radio" name="imgbg" value="images/bg/2.jpg" checked>
  <img src="images/bg/2.jpg" width="150" height="100">
</label>
</div>
<div class="col">

<label>
  <input type="radio" name="imgbg" value="images/bg/3.png" checked>
  <img src="images/bg/3.png" width="150" height="100">
</label>
</div>
<div class="col">

<label>
  <input type="radio" name="imgbg" value="images/bg/4.png" checked>
  <img src="images/bg/4.png" width="150" height="100">
</label>

</div>
<div class="col">

<label>
  <input type="radio" name="imgbg" value="images/bg/5.png" checked>
  <img src="images/bg/5.png" width="150" height="100">
</label>

</div>
</div>
</div>
</section>


<section class="mt-2">
  <div class=" container-fluid">
    <div class="row">
  <div class="col-12">
  

<div id="dvTable" style = "width:1280px; margin-left:135px; border:1px solid #ddd; height:720px; color:Black; text-align: center; background:url('images/bg/1.png')">


 <div id="mydiv" style="padding:15px; ">
 <div id="mydivheader">Click here to move</div>
<p id="bibleverse" style="font-family: 'Baloo Thambi 2', cursive;" ><strong>

இஸ்ரவேல் புத்திரர் கடந்து தீருமளவும், கர்த்தர் யோர்தானின் தண்ணீரை அவர்களுக்கு முன்பாக வற்றிப்போகப்பண்ணினதை, யோர்தானுக்கு மேல்கரையில் குடியிருந்த எமோரியரின் சகல ராஜாக்களும் கேட்டதுமுதற்கொண்டு, அவர்கள் இருதயம் கரைந்து, இஸ்ரவேல் புத்திரருக்கு முன்பாகச் சோர்ந்துபோனார்கள்.

</strong></p>
</div>
</div>
</div></div>
 
  
  
  </div>
    </section>

     <footer class="section-footer border-top bg mt-2">
	<div class="container">
		<section class="footer-top  padding-y">
			 <!-- row.// -->
		</section>	<!-- footer-top.// -->

		<section class="footer-bottom row">
			<div class="col-md-2">
				<p class="text-muted"> &copy Cross Success </p>
			</div>
			<div class="col-md-8 text-md-center">
				<span  class="px-2">info@queentouchtech.io</span>
				<span  class="px-2">+91 9487200764</span>
				<span  class="px-2">Tirunelveli</span>
			</div>
			<div class="col-md-2 text-md-right text-muted">
				<i class="fab fa-lg fa-cc-visa"></i>
				<i class="fab fa-lg fa-cc-paypal"></i>
				<i class="fab fa-lg fa-cc-mastercard"></i>
			</div>
		</section>
	</div><!-- //container -->
</footer>
    </form>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript" src="js/jquery.plugin.html2canvas.js"></script>
<script type="text/javascript">
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

    jQuery(document).ready(function () {
        load_book("get_bible_books");
        // load_old_book();
        // load_new_book();

    });



    $('input[type="radio"][name="account_type"]').on('change', function (e) {


        var bible = $('[name="account_type"]:checked').val();

        if (bible === "0") {
            load_book("get_bible_books");
        }

        else {

            load_book("get_bible_new_books");
        }


        //alert(bible);
    });


    function load_book(books) {


        $.ajax({
            type: "POST",
            url: "bible.aspx/" + books + "",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {


                $('#dd_books_list').find('option').remove().end().append('<option value="0">Select Book</option>').val('0');

                var ddlcategory = $("[id*=dd_books_list]");



                // ddlcategory.empty().append('<option selected="selected" value="0">Select Book</option>');
                $.each(r.d, function () {
                    ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));


                });
            },
            failure: function (response) {

                alert(response);
                //toastr.error('Not updated !')
            },
            error: function (jqXHR, exception) {

                alert(jqXHR.responseText);
                // toastr.error(jqXHR.responseText)                
            },
            beforeSend: function () {

                $("#dd_books_info").html('Loading..books');
                // toastr.warning('Processing..')
            },
            complete: function () {
                //toastr.clear();
                $("#dd_books_info").html('Select Book');
            }
        });
    }


    $('select[id=dd_chapter_list]').change(function () {
        var book_value = $('#dd_books_list option:selected').val();
        var chapter_value = $('#dd_chapter_list option:selected').val();
        // alert(book_value + chapter_value);
        load_verse_text_chapter(book_value, chapter_value);
        load_verses(book_value, chapter_value);


        //var book_text = $('#dd_books_list option:selected').text();
        //var chapter_text = $('#dd_chapter_list option:selected').text();

        // $("#mydivheader").html(book_text);
        // $("#mydivheader").append(":" + chapter_text);
    });


    function load_verses(book, chapter) {


        $.ajax({
            type: "POST",
            url: "bible.aspx/get_verse",
            data: '{book: "' + book + '",chapter: "' + chapter + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {


                $('#dd_verse_list').find('option').remove().end().append('<option value="0">Select Book</option>').val('0');

                var ddlcategory = $("[id*=dd_verse_list]");



                // ddlcategory.empty().append('<option selected="selected" value="0">Select Book</option>');
                $.each(r.d, function () {
                    ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));

                });
            },
            failure: function (response) {

                alert(response);
                //toastr.error('Not updated !')
            },
            error: function (jqXHR, exception) {

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


    $('select[id=dd_books_list]').change(function () {
        var book_value = $('#dd_books_list option:selected').val();
        //alert(book_value);
        load_chapters(book_value);


        // var book_text = $('#dd_books_list option:selected').text();
        // var chapter_text = $('#dd_chapter_list option:selected').text();

        //$("#mydivheader").html(book_text);
        //$("#mydivheader").append(":" + chapter_text);


    });






    function load_chapters(book) {


        $.ajax({
            type: "POST",
            url: "bible.aspx/get_chapters",
            data: '{book: "' + book + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {


                $('#dd_chapter_list').find('option').remove().end().append('<option value="0">Select Chapter</option>').val('0');

                var ddlcategory = $("[id*=dd_chapter_list]");



                // ddlcategory.empty().append('<option selected="selected" value="0">Select Book</option>');
                $.each(r.d, function () {
                    ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            },
            failure: function (response) {

                alert(response);
                //toastr.error('Not updated !')
            },
            error: function (jqXHR, exception) {

                alert(jqXHR.responseText);
                // toastr.error(jqXHR.responseText)                
            },
            beforeSend: function () {

                $("#dd_chapters_info").html('Loading..Chapters');
                // toastr.warning('Processing..')
            },
            complete: function () {
                //toastr.clear();
                $("#dd_chapters_info").html('Select Chapter');
            }
        });
    }

    $('select[id=dd_verse_list]').change(function () {
        var book_value = $('#dd_books_list option:selected').val();
        var chapter_value = $('#dd_chapter_list option:selected').val();
        var verse_value = $('#dd_verse_list option:selected').val();

        //alert(book_value + chapter_value + verse_value);
        load_verse_text(book_value, chapter_value, verse_value);

        var book_text = $('#dd_books_list option:selected').text();
        var chapter_text = $('#dd_chapter_list option:selected').text();
        var verse_text = $('#dd_verse_list option:selected').text();

        $("#mydivheader").html(book_text);
        $("#mydivheader").append(":" + chapter_text);
        $("#mydivheader").append(":" + verse_text);

    });



    function load_verse_text_chapter(book, chapter) {


        $.ajax({
            type: "POST",
            url: "bible.aspx/get_verse_text_chapter",
            data: '{book: "' + book + '",chapter: "' + chapter + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                $('#verse-list').find('li').remove().end();
                var ddlcategory = $("[id*=verse-list]");
                $.each(r.d, function () {
                    //ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    // ddlcategory.append($("<li><span class='badge badge-primary m-2'>" + this['Value'] + "</span>" + this['Text'] + "</li>"));
                });
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

    function load_verse_text(book, chapter, verse) {


        $.ajax({
            type: "POST",
            url: "bible.aspx/get_verse_text",
            data: '{book: "' + book + '",chapter: "' + chapter + '",verse: "' + verse + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                $('#verse-list').find('li').remove().end();
                var ddlcategory = $("[id*=verse-list]");
                $.each(r.d, function () {
                    //ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                    ddlcategory.append($("<li><span class='badge badge-primary m-2'>" + this['Value'] + "</span>" + this['Text'] + "</li>"));

                    $("#bibleverse").text(this['Text']);

                });


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

</script>


</body>
</html>
