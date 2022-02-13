using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
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
using System.Web.Configuration;
using System.IO;
using System.Data;

public partial class admin_viewthreads : System.Web.UI.Page
{
    static function cs = new function();

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    public static string get_threads()
    {
        //topic_type,topic_replies ,topic_view 
        string query = " SELECT [new_bible].tam_verse,[topics].topic_desc FROM [new_bible] LEFT JOIN [topics] ON [new_bible].ID = [topics].topic_cat_id where [topics].topic_desc!='' order by [topics].id desc";


        StringBuilder sb = new StringBuilder();
        DataTable dt = getData(query);
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.AppendLine("<article class='card card-product-list'><div class='card-body'><div class='row'>");
                sb.AppendLine("<article class='col-sm-12'><a href='#' class='title mt-2 h5'>" + dt.Rows[i]["tam_verse"] + "</a>");
                sb.AppendLine("<div>" + dt.Rows[i]["topic_desc"] + "</div></article></div> </div></article>");




            }


        }

        return sb.ToString();


    }





    public static DataTable getData(string qry)
    {

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {

            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con); //where s_admin='" + cs.gethost() + "'
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);

            con.Close();
        }
        return dt;
    }
    public static string TimeAgo(DateTime dateTime)
    {
        string result = string.Empty;

        DateTime currentTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).AddMinutes(3);

        var timeSpan = currentTime.Subtract(dateTime);

        if (timeSpan <= TimeSpan.FromSeconds(60))
        {
            result = string.Format("{0} seconds ago", timeSpan.Seconds);
        }
        else if (timeSpan <= TimeSpan.FromMinutes(60))
        {
            result = timeSpan.Minutes > 1 ?
                String.Format("about {0} minutes ago", timeSpan.Minutes) :
                "about a minute ago";
        }
        else if (timeSpan <= TimeSpan.FromHours(24))
        {
            result = timeSpan.Hours > 1 ?
                String.Format("about {0} hours ago", timeSpan.Hours) :
                "about an hour ago";
        }
        else if (timeSpan <= TimeSpan.FromDays(30))
        {
            result = timeSpan.Days > 1 ?
                String.Format("about {0} days ago", timeSpan.Days) :
                "yesterday";
        }
        else if (timeSpan <= TimeSpan.FromDays(365))
        {
            result = timeSpan.Days > 30 ?
                String.Format("about {0} months ago", timeSpan.Days / 30) :
                "about a month ago";
        }
        else
        {
            result = timeSpan.Days > 365 ?
                String.Format("about {0} years ago", timeSpan.Days / 365) :
                "about a year ago";
        }

        return result;
    }
}