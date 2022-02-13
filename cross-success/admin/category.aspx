<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <!-- Toastr -->
  <link rel="stylesheet" href="../theme/vendor/toastr/toastr.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




        <!-- Begin Page Content -->
                <div class="container-fluid">

                      <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dahboard</h1>
                    </div>


<div class="row">
	<div class="col-md-6">
<div class="card card-body">
	<h4 class="title py-3">Add Category
    
    <div class="form-group pull-right">
    	<select id="dd_cat_list" name="category_info" class="custom-select form-control">
					<option value="0">Select Category</option>
				
				</select>
</div>
    
    </h4>
	<form>
		<div class="form-group">   
			<input class="form-control" name="category_info_text" id="txtcatname"  placeholder="Category name.." type="text">
		</div>
		<div class="form-group">
			<input class="form-control" name="category_info_text" id="txtcatdesc" placeholder="Description here.." type="text">
		</div>
		
		<div class="form-group">


        <a href="#" id="addcat" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">Add Category</span>
                                    </a>


                                     <a href="#" id="cat_remove" class="btn btn-danger btn-icon-split btn-sm pull-right">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">Remove</span>
                                    </a>
			
		</div>
	</form>
</div>
	</div> <!-- col // -->
	<div class="col-md-6">

<div class="card card-body">
	<h4 class="title py-3">Add Product</h4>
	<form>
    <div class="form-group">
    	<select class="custom-select form-control">
					<option value="0">Select Category</option>
				
				</select>
</div>

		<div class="form-group">
			<input class="form-control" name="" placeholder="Product Name.." type="text">
		</div>
		<div class="form-group">
			<div class="input-group">
				<input class="form-control" placeholder="Quantity" name="" type="text">
				
				<select class="custom-select form-control">
					<option>Pieces</option>
					<option>Litres</option>
					<option>Tons</option>
					<option>Gramms</option>
				</select>
			</div>
		</div>
		<div style=" display:none;" class="form-group text-muted">
			<p>Select template type:</p>
			<label class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" value="option1">
			   <span class="form-check-label">Request price</span>
			</label>
			<label class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" value="option2">
			  <dspaniv class="form-check-label">Request a sample
			</dspaniv></label>
		</div>
		<div class="form-group">


        <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-flag"></i>
                                        </span>
                                        <span class="text">Add Product</span>
                                    </a>
			
		</div>
	</form>
</div>

	</div> <!-- col // -->
</div>


</div>

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
    
      $('a[id=cat_remove]').click(function () {
      var category_value = $('#dd_cat_list option:selected').val();
      remove_category_info(category_value);

       });
    $('a[id=addcat]').click(function () {


        var name = "";
        var desc = "";
       
        if ($('#txtcatname').val() === "" || $('#txtcatdesc').val() === "") {
           

            toastr.error('Enter category title and description...')

        }
        else {
            name = $('#txtcatname').val();
            desc = $('#txtcatdesc').val();
            add_category_db(name, desc);
        }

    });


      $('select[name=category_info]').change(function () {
        basic_categoryinfochange();
    });


     $('input[name=category_info_text]').change(function () {

     var category_value = $('#dd_cat_list option:selected').val();

      var name = $('#txtcatname').val();
      var desc = $('#txtcatdesc').val();
        update_category(name, desc, category_value);
    });



     function add_category_db(cname,cdesc) {
        $.ajax({
            type: "POST",
            url: "category.aspx/add_cat",
            data: '{name: "' + cname + '",desc:"' + cdesc + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d == "1") {
                    toastr.success('Category Added!')
                    $('#txtcatname').val('');
                    $('#txtcatdesc').val('');
                    load_dd_category();
                }
                else { toastr.error(response.d) }
            },
            failure: function (response) {
                toastr.error(response.d)
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

    function load_dd_category() {


        $.ajax({
            type: "POST",
            url: "category.aspx/getcategory",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                var ddlcategory = $("[id*=dd_cat_list]");


                ddlcategory.empty().append('<option selected="selected" value="0">Select Category</option>');
                $.each(r.d, function () {
                    ddlcategory.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
        });

    }


      function basic_categoryinfochange() {


        var category_value = $('#dd_cat_list option:selected').val();

        if (category_value == "0") {
            return;
        }
        else {

        
       
           get_category_info(category_value);
           name = $('#txtcatname').val();
            desc = $('#txtcatdesc').val();
            //update_category(name, desc, category_value);
        }

    }

    function update_category(cname, cdesc,id) {


        $.ajax({
            type: "POST",
            url: "category.aspx/updatecategory",
            data: '{name: "' + cname + '",desc:"' + cdesc + '",id:"' + id + '"}',

            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                if (r.d == "1") { 
                load_dd_category();                  
                    toastr.success('Updated !');
                }
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

    function get_category_info(id) {

        $.ajax({
            type: "POST",
            url: "category.aspx/getcategoryinfo",
            data: '{catid: "' + id + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

            

                var data_obj = JSON.parse(r.d);

                $('#txtcatname').val(data_obj["cat_name"]);
                $('#txtcatdesc').val(data_obj["cat_desc"]);
            },

            failure: function (response) {
                toastr.error(response.d);
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

     function remove_category_info(id) {

        $.ajax({
            type: "POST",
            url: "category.aspx/removecategoryinfo",
            data: '{catid: "' + id + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {

                if (r.d == "1") {

                    $('#txtcatname').val("");
                    $('#txtcatdesc').val("");
                    load_dd_category();
                    toastr.success('Removed !')
                }
            },

            failure: function (response) {
                toastr.error('Not Removed !')
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

