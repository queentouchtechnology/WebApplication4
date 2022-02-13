using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_member : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Session["usermail"] as string))
            {
                return;
            }
            else
            {
                return;
               // Response.Redirect("~/myaccount/login.aspx");
                //The code

            }
        }
        catch (Exception ex)
        {

        }
    }
}
