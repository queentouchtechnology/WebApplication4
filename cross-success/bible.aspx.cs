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

public partial class bible : System.Web.UI.Page
{
    static functions cs = new functions();

    public static string getconnection_string()
    {
        string constr = ConfigurationManager.ConnectionStrings["cross_success"].ConnectionString;
        return constr;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static DataTable getData(string tablename, string id, string value)
    {

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(getconnection_string()))
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

        using (SqlConnection con = new SqlConnection(getconnection_string()))
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

        using (SqlConnection con = new SqlConnection(getconnection_string()))
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

        using (SqlConnection con = new SqlConnection(getconnection_string()))
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

        using (SqlConnection con = new SqlConnection(getconnection_string()))
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
    public static List<ListItem> get_verse_text(string book, string chapter,string verse)
    {
        string query = "SELECT tam_verse,Versecount FROM new_bible where book ='" + book + "' and chapter='" + chapter + "' and Versecount='" + verse + "' order by Versecount asc ";

        using (SqlConnection con = new SqlConnection(getconnection_string()))
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


     [WebMethod]
     public static List<ListItem> get_verse_text_chapter(string book, string chapter)
     {
         string query = "SELECT tam_verse,Versecount FROM new_bible where book ='" + book + "' and chapter='" + chapter + "' order by Versecount asc ";

         using (SqlConnection con = new SqlConnection(getconnection_string()))
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