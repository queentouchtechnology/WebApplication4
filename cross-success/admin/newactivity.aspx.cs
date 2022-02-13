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


public partial class member_newactivity : System.Web.UI.Page
{

    static function cs = new function();



    protected void Page_Load(object sender, EventArgs e)
    {

      
    }


    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        // update(Request.QueryString["id"]);
        if (editor.Value!=null)
        {
            add2db();
        }

        else
        {
            
            pnlwarning.Visible = false;
            pnlsucess.Visible = false;
            pnlerror.Visible = true;
            lbleresult.Text = "Enter message to submit!";
        }
        
        //Response.Write(hdnverse_id_value.Value.Trim().ToString());
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
                    cmd.Parameters.AddWithValue("@topic_name", "Bible Study");//txttitle.Value.ToString()
                    cmd.Parameters.AddWithValue("@topic_desc", editor.Value.ToString());

                    cmd.Parameters.AddWithValue("@topic_date", currentTime.AddMinutes(3).ToString());

                    cmd.Parameters.AddWithValue("@topic_cat_id ", hdnverse_id_value.Value.Trim().ToString());
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

               // txttitle.Value = "";
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

    public static DataTable getData(string tablename, string id, string value)
    {

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from " + tablename + " where " + id + "= '" + value + "' ", con); //where s_admin='" + cs.gethost() + "'
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);

            con.Close();
        }
        return dt;
    }


    [WebMethod]
    public static string jsontable(DataTable table)
    {
        var JSONString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            JSONString.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                JSONString.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    if (j < table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == table.Rows.Count - 1)
                {
                    JSONString.Append("}");
                }
                else
                {
                    JSONString.Append("},");
                }
            }
            JSONString.Append("]");
        }
        return JSONString.ToString();
    }

    [WebMethod]
    public static string get_book()
    {
        return jsontable(getData("new_bible", "book", "0")).ToString();

    }

   

    [WebMethod]
    public static List<ListItem> get_bible_books()
    {
        string query = "SELECT DISTINCT book, tam_bookname FROM new_bible where book < '39' order by book asc ";

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["book"].ToString(),
                            Text = sdr["tam_bookname"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

    [WebMethod]
    public static List<ListItem> get_bible_new_books()
    {
        string query = "SELECT DISTINCT book, tam_bookname FROM new_bible where book > '38' order by book asc ";

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["book"].ToString(),
                            Text = sdr["tam_bookname"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

    [WebMethod]
    public static List<ListItem> get_chapters(string book)
    {
        string query = "SELECT DISTINCT chapter FROM new_bible where book ='" + book + "' order by chapter asc ";

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["chapter"].ToString(),
                            Text = sdr["chapter"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

    [WebMethod]
    public static List<ListItem> get_verse(string book, string chapter)
    {
        string query = "SELECT Versecount FROM new_bible where book ='" + book + "' and chapter='" + chapter + "' order by Versecount asc ";

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["Versecount"].ToString(),
                            Text = sdr["Versecount"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

    [WebMethod]
    public static List<ListItem> get_verse_text(string book, string chapter, string verse)
    {
        string query = "SELECT tam_verse,id FROM new_bible where book ='" + book + "' and chapter='" + chapter + "' and Versecount='" + verse + "' order by Versecount asc ";

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["id"].ToString(),
                            Text = sdr["tam_verse"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }


    [WebMethod]
    public static List<ListItem> get_verse_text_chapter(string book, string chapter)
    {
        string query = "SELECT tam_verse,Versecount FROM new_bible where book ='" + book + "' and chapter='" + chapter + "' order by Versecount asc ";

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<ListItem> customers = new List<ListItem>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new ListItem
                        {
                            Value = sdr["Versecount"].ToString(),
                            Text = sdr["tam_verse"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }
}