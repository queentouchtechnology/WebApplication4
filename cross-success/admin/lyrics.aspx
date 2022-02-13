<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="lyrics.aspx.cs" Inherits="admin_lyrics" %>

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
                                 <div class="col-lg-6">
                                 <div class="form-group">

                                 <input type="text" class="form-control form-control-user" id="txttitle" runat="server" aria-describedby="emailHelp" placeholder="Enter thread title..">
                                 
                                 </div>
                                 </div>
                                 <div class="col-lg-6">

                                 <select id="dd_cat_list" name="category_info" class="custom-select form-control">
				
				</select>


                                 
                                 </div>
                                 
                                 </div>

                              
                              </div>

                                <div class="card-body">
                                  

                                  <textarea id="editor" runat="server" class="wysiwyg-editor"></textarea>

                                </div>
                            </div>
      
     <button id="btnsubmit" type="button" class="btn btn-primary btn-block mt-3" runat="server"><i class="fa fa fa-envelope text-white p-1"></i>Submit</button>
 

   


                </div>

    <asp:HiddenField ID="hdncategoryvalue" runat="server" />
    

  <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.5.1/less.js"></script>
  <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
  <script src="../editor/dist/js/jquery.wysiwygEditor.js"></script>


<!-- Toastr -->
<script src="../theme/vendor/toastr/toastr.min.js"></script>



  <script type="text/javascript">

      $('.wysiwyg-editor').wysiwygEditor();

      jQuery(document).ready(function () {

          load_book("get_bible_books");
          //load_dd_category();

      });





  </script>

</asp:Content>

