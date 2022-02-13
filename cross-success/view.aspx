<%@ Page Title="" Language="C#" MasterPageFile="home.master" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link rel="stylesheet" href="theme/vendor/toastr/toastr.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<div class="container">

<div class="row mt-2">
	<aside class="col-md-3">

    <article class="card card-body">
		<div class="form-group form-row">
    <label class="col-md-3 col-form-label">Search</label>
    <div class="col-sm-9 pt-1">
	    <label class="custom-control custom-radio custom-control-inline">
		  <input class="custom-control-input" checked="" value="0" type="radio" name="account_type" >
		  <span class="custom-control-label"> Old testament </span>
		</label>
        <label class="custom-control custom-radio custom-control-inline">
		  <input class="custom-control-input" type="radio" value="1" name="account_type"  >
		  <span class="custom-control-label"> New testament  </span>
		</label>

       
    </div>
  </div>
	</article> <!-- panel-lg.// -->

    <article id="threads_div">
    
    </article>

	</aside> <!-- col.// -->



	<aside class="col-md-9">
   



    <div id="div_info" class="card-body">


		

		<div id="dv_verse">
        
        </div>
		

	
	</div>


    <div id="dv_study">
   
    </div>



	</div>

	


</div>


    <asp:HiddenField ID="hdnverse_id_value" runat="server" />
<script src="theme/vendor/jquery/jquery.min.js"></script>

<!-- Toastr -->
<script src="theme/vendor/toastr/toastr.min.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function () {
        load_book("get_old_bible");


    });


    $('input[type="radio"][name="account_type"]').on('change', function (e) {


        var bible = $('[name="account_type"]:checked').val();

        if (bible === "0") {
            load_book("get_old_bible");
        }
        else if (bible === "1") {

            load_book("get_new_bible");
        }

        else {

            load_book("get_old_bible");
        }
    });

    function showchapter(value, id) {

        load_chapter(value, id);
       // alert(value+"-"+id);

    }

    function show_verse(book, chapter) {

        load_verse(book, chapter);
        // alert(value+"-"+id);

    }

    

    function load_book(bible) {

        $.ajax({
            type: "POST",
            url: "view.aspx/get_threads",

            data: '{bible:"' + bible + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#threads_div").html(response.d);

            },

            failure: function (response) {

                alert(response.d);
            },

            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                toastr.info('Processing..')   
            },
            complete: function () {
                toastr.clear();
            }
        });

    }


    function load_chapter(book, chapter) {

        $.ajax({
            type: "POST",
            url: "view.aspx/get_verse",

            data: '{book:"' + book + '",chapter:"' + chapter + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#list-group-items-" + chapter + "").html(response.d);

            },

            failure: function (response) {

                alert(response.d);
            },

            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                toastr.info('Processing..')
            },
            complete: function () {
                toastr.clear();
            }
        });

    }

    
    function load_chapter(book,id) {

        $.ajax({
            type: "POST",
            url: "view.aspx/get_books",

            data: '{book:"' + book + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#list-group-items-"+id+"").html(response.d);

            },

            failure: function (response) {

                alert(response.d);
            },

            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                toastr.info('Processing..')
            },
            complete: function () {
                toastr.clear();
            }
        });

    }

    function load_verse(book, chapter) {

        $.ajax({
            type: "POST",
            url: "view.aspx/get_verse",

            data: '{book:"' + book + '",chapter:"' + chapter + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#dv_verse").html(response.d);

            },

            failure: function (response) {

                alert(response.d);
            },

            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                toastr.info('Processing..')
            },
            complete: function () {
                toastr.clear();
            }
        });

    }


    function checkbox(book,chapter,verse) {




        //get_info(book, chapter, verse);
        load_study(book, chapter, verse);
      
    }


    function load_study(book, chapter,verse) {

        $.ajax({
            type: "POST",
            url: "view.aspx/get_study",

            data: '{book:"' + book + '",chapter:"' + chapter + '",verse:"' + verse + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#dv_study").html(response.d);

            },

            failure: function (response) {

                alert(response.d);
            },

            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                toastr.info('Processing..')
            },
            complete: function () {
                toastr.clear();
            }
        });

    }

    function get_info(book, chapter, verse) {

        $.ajax({
            type: "POST",
            url: "view.aspx/get_info",

            data: '{book:"' + book + '",chapter:"' + chapter + '",verse:"' + verse + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                $("#div_info").html(response.d);

            },

            failure: function (response) {

                alert(response.d);
            },

            error: function (jqXHR, exception) {
                alert(jqXHR.responseText);
            },
            beforeSend: function () {
                toastr.info('Processing..')
            },
            complete: function () {
                toastr.clear();
            }
        });

    }

     
        </script>
  
</asp:Content>

