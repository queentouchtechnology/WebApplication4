using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Web.Configuration;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Data;

public partial class song : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.PopulateBlog();
        }
    }

    private void PopulateBlog()
    {
        string blogId = Request.QueryString["id"].Trim().ToString(); //this.Page.RouteData.Values["BlogId"].ToString();
        string query = "SELECT [topic_name], [topic_desc] FROM [topics] WHERE [topic_id] = @topic_id";
        string conString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Parameters.AddWithValue("@topic_id", blogId);
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        //lblTitle.Text = dt.Rows[0]["topic_name"].ToString();
                       dv_song.InnerHtml = dt.Rows[0]["topic_desc"].ToString();
                    }
                }
            }
        }
    }
}