<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="threads.aspx.cs" Inherits="threads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<!-- Toastr -->
  <link rel="stylesheet" href="../theme/vendor/toastr/toastr.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section class="section-content padding-y bg" >

<div class="container">




<article class="card">
	<div class="card-body">
		<div class="row">
			<aside class="col-md-6">
				
				<h5>Father S. J BErchamans</h5>
				<ul id="songlist" class="list-check">
					
				</ul>
			</aside>
			<aside class="col-md-6">
				
			</aside>
		</div> <!-- row.// -->
		<hr>
		<p>
			
		</p>
	</div> <!-- card-body.// -->
</article>



</div>

</section>

<script src="../theme/vendor/jquery/jquery.min.js"></script>

<!-- Toastr -->
<script src="../theme/vendor/toastr/toastr.min.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function () {

        load_dd_category();
      const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });
        

    });
    
     
         function load_dd_category() {


        $.ajax({
            type: "POST",
            url: "threads.aspx/getcategory",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                var ddlcategory = $("[id*=dd_cat_list]");

                var list= $("#songlist");

                ddlcategory.empty().append('<option selected="selected" value="0">Select Category</option>');
                $.each(r.d, function () {
                    ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));

                    list.append($("<li><a href='song.aspx?id="+this['Value']+"'>"+this['Text']+"</a></li>"));


                });
            }
        });

    }

         function load_threads() {


        $.ajax({
            type: "POST",
            url: "threads.aspx/get_threads",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                alert(r.d);
            },
            failure: function (response) {
                toastr.error('Not updated !')
            },
            error: function (jqXHR, exception) {
                toastr.error(jqXHR.responseText)                
            },
            beforeSend: function () {
                toastr.warning('Processing..')
            },
            complete: function () {
                 toastr.clear();
            }
        });

    }   

   

  

</script>



</asp:Content>

