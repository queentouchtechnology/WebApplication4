<%@ Page Title="" Language="C#" MasterPageFile="home.master" AutoEventWireup="true" CodeFile="bible.aspx.cs" Inherits="bible" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<!-- Toastr -->
  <link rel="stylesheet" href="../theme/vendor/toastr/toastr.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="section-content padding-y bg" >

<div class="container">



<div class="row">
<div class="col-md-3">
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
<div class="col-md-3">
	<article class="card card-body">
		
         

        <div class="form-group pull-right">
    	<select id="dd_verse_list" name="verse_info" class="custom-select form-control">
					<option id="dd_verse_info" value="0">Select Chapter</option>
				
				</select>
</div>




	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
</div>













<article class="card mt-2">
	<div class="card-body">
		<div class="row">
			
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

<script src="../theme/vendor/jquery/jquery.min.js"></script>

<!-- Toastr -->
<script src="../theme/vendor/toastr/toastr.min.js"></script>

<script type="text/javascript">
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
            url: "bible.aspx/"+books+"",
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
    });


    function load_verses(book,chapter) {


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
                    ddlcategory.append($("<li><span class='badge badge-primary m-2'>" + this['Value'] + "</span>" + this['Text'] + "</li>"));
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

    function load_verse_text(book,chapter,verse) {


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

</asp:Content>

