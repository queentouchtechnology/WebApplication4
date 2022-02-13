<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="newactivity.aspx.cs" Inherits="member_newactivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

  <link rel="stylesheet" href="../editor/dist/css/jquery.wysiwygEditor.css">
   <!-- Toastr -->
  <link rel="stylesheet" href="../theme/vendor/toastr/toastr.min.css">



   <style type="text/css">
   
    iframe {
      border: none;
      outline: none;
      position: relative;
      //width: 100%;
      background: #fff;
      //padding: 15px;
    }
  </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="container-fluid">


   <div class="row">
    <div class="col-lg-12">
        <asp:Panel ID="pnlsucess" CssClass="alert alert-success" Visible="false" runat="server">
       <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a> <asp:Label ID="lblsresult" Text="" runat="server"></asp:Label>
        </asp:Panel>

          <asp:Panel ID="pnlerror" CssClass="alert alert-danger" Visible="false" runat="server">
              <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>  <asp:Label ID="lbleresult" runat="server" Text=""></asp:Label>
        </asp:Panel>
          <asp:Panel ID="pnlwarning" CssClass="alert alert-warning" Visible="false" runat="server">
             <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-info"></i>
                                    </a>   <asp:Label ID="lblwresult" runat="server" Text=""></asp:Label>
        </asp:Panel>
    

    </div>
     </div>
  



                    <!-- Page Heading -->
                   

                   <div class="card mb-2 py-2 ">

                              <div class="card-header">
                                 <div class="row">


                                     <div class="col-lg-3">
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
<div class="col-lg-3">
	<article class="card card-body">

      

     <div class="form-group pull-right">
    	<select id="dd_books_list" name="category_info" class="custom-select form-control">
					<option id="dd_books_info" value="0">Select Book</option>
				
				</select>
</div>


	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
<div class="col-lg-3">
	<article class="card card-body">
		

          


         <div class="form-group pull-right">
    	<select id="dd_chapter_list" name="chapter_info" class="custom-select form-control">
					<option id="dd_chapters_info" value="0">Select Chapter</option>
				
				</select>
</div>




	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
<div class="col-lg-3">
	<article class="card card-body">
		
         

        <div class="form-group pull-right">
    	<select id="dd_verse_list" name="verse_info" class="custom-select form-control">
					<option id="dd_verse_info" value="0">Select Chapter</option>
				
				</select>
</div>




	</article> <!-- panel-lg.// -->
</div> <!-- col // -->
                                 
                                 
                                 </div>

                              
                              </div>

                                <div class="card-body">
                                  

                                  <textarea id="editor" runat="server" class="wysiwyg-editor"></textarea>

                                </div>

                                <div class="card-footer">

                                <span id="sp_verse"></span>
                                </div>

                            </div>
      
     <button id="btnsubmit" type="button" class="btn btn-primary btn-block mt-3" onServerClick="btnsubmit_Click" runat="server"><i class="fa fa fa-envelope text-white p-1"></i>Submit</button>
 

   


                </div>

    <asp:HiddenField ID="hdnverse_id_value" runat="server" />
    

  <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.js"></script>
  <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
  <script src="../editor/dist/js/jquery.wysiwygEditor.js"></script>


<!-- Toastr -->
<script src="../theme/vendor/toastr/toastr.min.js"></script>



  <script type="text/javascript">

      $('.wysiwyg-editor').wysiwygEditor();
    
      jQuery(document).ready(function () {

          load_book("get_bible_books");
         // load_dd_category();
          
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
              url: "newactivity.aspx/" + books + "",
              data: '{}',
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: function (r) {


                 

                  var ddlcategory = $("[id*=dd_books_list]");



                  ddlcategory.empty().append('<option selected="selected" value="0">Select Book</option>');
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

                  $('#dd_books_list').find('option').remove().end().append('<option value="0">Loading..books</option>').val('0');
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


      function load_verses(book, chapter) {


          $.ajax({
              type: "POST",
              url: "newactivity.aspx/get_verse",
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
              url: "newactivity.aspx/get_chapters",
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
              url: "newactivity.aspx/get_verse_text_chapter",
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
              url: "newactivity.aspx/get_verse_text",
              data: '{book: "' + book + '",chapter: "' + chapter + '",verse: "' + verse + '"}',
              contentType: "application/json; charset=utf-8",
              dataType: "json",
              success: function (r) {

                  $('#verse-list').find('li').remove().end();
                  var ddlcategory = $("[id*=verse-list]");
                  $.each(r.d, function () {
                      //ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                      // ddlcategory.append($("<li><span class='badge badge-primary m-2'>" + this['Value'] + "</span>" + this['Text'] + "</li>"));

                      $("[id*=hdnverse_id_value]").val(this['Value']);

                      $("#sp_verse").html(this['Value'] + this['Text']);
                  });
              },
              failure: function (response) {
                  alert(response);
              },
              error: function (jqXHR, exception) {
                  alert(jqXHR.responseText);
              },
              beforeSend: function () {
                  $("#sp_verse").html('Loading..');
              },
              complete: function () {
                  //toastr.clear();
                  $("#verse_text_info").html('Verse');
              }
          });
      }


      get_verse_id


  </script>

</asp:Content>

