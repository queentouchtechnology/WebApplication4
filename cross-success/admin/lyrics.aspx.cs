using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Xml;
using System.IO;
using System.Text;
using System.Net;
using System.Data.SqlClient;
using System.Web.Services;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Web.Configuration;
public partial class admin_lyrics : System.Web.UI.Page
{

    function cs = new function();


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        if (txttitle.Value == "")
        {
            pnlwarning.Visible = false;
            pnlsucess.Visible = false;
            pnlerror.Visible = true;
            lbleresult.Text = "Enter title to submit!";
        }
        else if (hdncategoryvalue.Value == "")
        {

            pnlwarning.Visible = false;
            pnlsucess.Visible = false;
            pnlerror.Visible = true;
            lbleresult.Text = "Select Category!";
        }

        else
        {
            add2db();
        }
    }

    protected void add2db()
    {
        DateTime currentTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));

        int cmd_count = 0;

        string save_customer = "INSERT into topics (topic_id,topic_name,topic_desc,topic_cat_id,topic_user_id,topic_date) VALUES (@topic_id,@topic_name,@topic_desc,@topic_cat_id,@topic_user_id,@topic_date)";

        try
        {
            using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
            {
                using (SqlCommand cmd = new SqlCommand(save_customer))
                {
                    cmd.Parameters.AddWithValue("@topic_id ", cs.slno("topic_id", "topics"));
                    cmd.Parameters.AddWithValue("@topic_name", txttitle.Value.ToString());
                    cmd.Parameters.AddWithValue("@topic_desc", editor.Value.ToString());

                    cmd.Parameters.AddWithValue("@topic_date", currentTime.AddMinutes(3).ToString());

                    cmd.Parameters.AddWithValue("@topic_cat_id ", hdncategoryvalue.Value.Trim().ToString());
                    cmd.Parameters.AddWithValue("@topic_user_id", "0");//

                    cmd.Connection = con;
                    con.Open();
                    cmd_count = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            string message = string.Empty;

            if (cmd_count == 1)
            {

                txttitle.Value = "";
                editor.Value = "";
                pnlwarning.Visible = false;
                pnlsucess.Visible = true;
                pnlerror.Visible = false;
                lblsresult.Text = "Activity Submited";

            }
        }

        catch (Exception ex)
        {
            pnlwarning.Visible = false;
            pnlsucess.Visible = false;
            pnlerror.Visible = true;
            lbleresult.Text = ex.Message.ToString() + Session["usermail"].ToString();

        }





    }
}