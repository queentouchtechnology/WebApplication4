using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using System.Collections.Specialized;
using System.Net.Mail;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using System.Text;

public partial class view : System.Web.UI.Page
{
    static function cs = new function();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string get_threads(string bible)
    {
        string query = string.Empty;

        if (bible == "get_old_bible")
        {
            query = " select Book,tam_bookname, MAX(chapter) as chapter from [new_bible]  where book < '39'  GROUP BY tam_bookname,Book";
        }
        else
        {
            query = " select Book,tam_bookname, MAX(chapter) as chapter from [new_bible]  where book > '38' GROUP BY tam_bookname,Book";
        }
      
        StringBuilder sb = new StringBuilder();
        DataTable dt = getData(query);
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.AppendLine("<div class='list-group'><article class='list-group-item'>");
                sb.AppendLine("<header class='filter-header'><a href='#' onclick='showchapter(" + dt.Rows[i]["Book"] + ","+i+")' data-toggle='collapse' data-target='#collapse" + i + "' aria-expanded='false' ");
                sb.AppendLine("class='collapsed'><i class='icon-control fa fa-chevron-down'></i><h6  class='title'>" + dt.Rows[i]["tam_bookname"] + " </h6></a>");
                sb.AppendLine("</header><div class='filter-content collapse' id='collapse"+i+"' style=''>");
                sb.AppendLine("<ul class='list-group'><li class='list-group-item'><span class='glyphicon glyphicon-pencil text-primary'></span>");
                sb.AppendLine("<a href='bible.aspx?book=" + dt.Rows[i]["Book"] + "'>" + dt.Rows[i]["chapter"] + " Books</a><ul id='list-group-items-"+i+"' class='list-group'></ul></li></ul></div> </article></div>");

             



            }


        }

        return sb.ToString();


    }

     [WebMethod]
    public static string get_books(string book)
    {
        string query = string.Empty;


        query = "select chapter from [new_bible] where book = '"+book+"' GROUP BY chapter order by chapter asc";
        
      
        StringBuilder sb = new StringBuilder();
        DataTable dt = getData(query);
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.AppendLine(" <li class='list-group-item'> <span class='glyphicon glyphicon-comment text-success'></span><a onclick='show_verse(" + book + "," + dt.Rows[i]["chapter"] + ")'  href='#'>Chapter " + dt.Rows[i]["chapter"] + "</a><span class='badge'>.</span></li>");
                
                
            }


        }

        return sb.ToString();


    }

     [WebMethod]
    public static string get_verse(string book,string chapter)
    {
        string query = string.Empty;

        // book, chapter
        query = "select Versecount from [new_bible] where book= '"+book+"' and chapter='"+chapter+"' order by Versecount asc";
        
      
        StringBuilder sb = new StringBuilder();
        DataTable dt = getData(query);
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.AppendLine(" <label class='checkbox-btn'><input type='radio' name='verse_check' value='" + dt.Rows[i]["Versecount"] + "' onclick='checkbox(" + book + "," + chapter + "," + dt.Rows[i]["Versecount"] + ")'>");
                sb.AppendLine(" <span class='btn btn-light'> " + dt.Rows[i]["Versecount"] + " </span></label>");
             
            }


        }

        return sb.ToString();


    }

    [WebMethod]
     public static string get_study(string book, string chapter,string verse)
    {
        string query = string.Empty;

        // book, chapter
        query = "Select [new_bible].tam_bookname,[new_bible].tam_verse,topic_desc from [topics] LEFT OUTER JOIN [new_bible] on [new_bible].ID=[topics].topic_cat_id where [new_bible].book='" + book + "'  and [new_bible].chapter='" + chapter + "' and [new_bible].Versecount='" + verse + "'  and topic_desc!=''";
        
      
        StringBuilder sb = new StringBuilder();
        DataTable dt = getData(query);
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
              
                sb.AppendLine("<article class='box mb-3'><div class='icontext w-100'>");
                sb.AppendLine("<img src='http://placehold.it/70x70' class='img-xs icon rounded-circle'>");
                sb.AppendLine("<div class='text'><h6 class='mb-1'>Ldjm </h6></div></div><div class='mt-3'>" + dt.Rows[i]["topic_desc"] + "</div></article>");

                   
            }


        }

        return sb.ToString();


    }

    [WebMethod]
    public static string get_info(string book, string chapter, string verse)
    {
        string query = string.Empty;

        // book, chapter
        query = "select tam_bookname,tam_verse from [new_bible] where book= '" + book + "' and chapter='" + chapter + "' and Versecount='"+verse+"'";


        StringBuilder sb = new StringBuilder();
        DataTable dt = getData(query);
        if (dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                 sb.AppendLine("<header class='section-heading'><h6 id='sp_verse_text'>" + dt.Rows[0]["tam_verse"] + "</h6><div class='rating-wrap'> ");
                 sb.AppendLine("<strong class='label-rating text-sm'>  <span id='sp_verse_info' class='text-muted'>" + dt.Rows[0]["tam_bookname"] +":"+chapter+":"+verse+ "</span></strong></div></header>");


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