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

public partial class threads : System.Web.UI.Page
{
    static function cs = new function();


    protected void Page_Load(object sender, EventArgs e)
    {

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
    public static string get_threads()
    {
        return jsontable(getData("topics", "topic_cat_id", "1")).ToString();
    
    }

    [WebMethod]
    public static List<ListItem> getcategory()
    {
        string query = "SELECT topic_id, topic_name FROM topics";

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
                            Value = sdr["topic_id"].ToString(),
                            Text = sdr["topic_name"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }
}