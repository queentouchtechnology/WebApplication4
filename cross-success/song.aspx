<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="song.aspx.cs" Inherits="song" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<!-- Toastr -->
  <link rel="stylesheet" href="../theme/vendor/toastr/toastr.min.css">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<section class="section-content padding-y bg" >

<div class="container">

<article class="card">
	<div id="dv_song" runat="server" class="card-body">
		
		
		
	</div> <!-- card-body.// -->
</article>

</div>

</section>

<script src="../theme/vendor/jquery/jquery.min.js"></script>

<!-- Toastr -->
<script src="../theme/vendor/toastr/toastr.min.js"></script>
</asp:Content>

