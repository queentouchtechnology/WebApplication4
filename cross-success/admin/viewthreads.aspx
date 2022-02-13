<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="viewthreads.aspx.cs" Inherits="admin_viewthreads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <!-- Toastr -->
  <link rel="stylesheet" href="../vendor/toastr/toastr.min.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div id="threads_div" >

</div>
 <script src="../theme/vendor/jquery/jquery.min.js"></script>




<script type="text/javascript">


    jQuery(document).ready(function () {

       

        show_threads();

    });



    function show_threads() {

        $.ajax({
            type: "POST",
            url: "viewthreads.aspx/get_threads",

            data: '{}',
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
                //toastr.info('Processing..')   
            },
            complete: function () {
                //toastr.clear();
            }
        });

    }

      



     
        </script>

</asp:Content>

