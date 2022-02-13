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

public partial class admin_category : System.Web.UI.Page
{

    static function cs = new function();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string getcategoryinfo(string catid)
    {
        return jsontable(getData("categories", "cat_id", catid)).ToString();
    }

    [WebMethod]
    public static string removecategoryinfo(string catid)
    {
        return removeData("categories", "cat_id", catid).ToString();
    }

    [WebMethod]
    public static string updatecategory(string name, string desc,string id)
    {
        int count;
        // return user.id.ToString();

        using (SqlConnection conn = new SqlConnection())
        {

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "update categories set cat_name=@cat_name,cat_desc=@cat_desc where cat_id=@cat_id ";//where username like @SearchText + '%'";

                //u_name=@u_name,u_email=@u_email,u_mobile=@u_mobile,
                cmd.Parameters.AddWithValue("@cat_id", id);

                //o_status o_payment_status o_paymode
                cmd.Parameters.AddWithValue("@cat_name", name);
                cmd.Parameters.AddWithValue("@cat_desc", desc);
              

                cmd.Connection = conn;
                conn.Open();
                count = cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        return count.ToString();
    }


    [WebMethod]
    public static List<ListItem> getcategory()
    {
        string query = "SELECT cat_id, cat_name FROM categories";

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
                            Value = sdr["cat_id"].ToString(),
                            Text = sdr["cat_name"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

    //Add Category
    [WebMethod]
    public static string add_cat(string name, string desc)
    {

        int count;
        // return user.id.ToString();

        using (SqlConnection conn = new SqlConnection())
        {

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlCommand cmd = new SqlCommand())
            {

                string qry = "INSERT into categories (cat_id,cat_name,cat_desc) VALUES (@cat_id,@cat_name,@cat_desc)";

                cmd.CommandText = qry;//where username like @SearchText + '%'";
                //u_name=@u_name,u_email=@u_email,u_mobile=@u_mobile,
                cmd.Parameters.AddWithValue("@cat_id", System.Convert.ToInt32(cs.slno("cat_id", "categories")));
                //o_status o_payment_status o_paymode
                cmd.Parameters.AddWithValue("@cat_name", name);
                cmd.Parameters.AddWithValue("@cat_desc", desc);

                cmd.Connection = conn;
                conn.Open();
                count = cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        return count.ToString();

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
    public static string removeData(string tablename, string id, string value)
    {
        int count;

        using (SqlConnection con = new SqlConnection(cs.getconnection_string()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from " + tablename + " where " + id + "= '" + value + "' ", con); //where s_admin='" + cs.gethost() + "'
            count = cmd.ExecuteNonQuery();
            con.Close();
        }
        return count.ToString();
    }
    [WebMethod]
    public static string jsontable(DataTable table)
    {
        var JSONString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            // JSONString.Append("[");
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
            // JSONString.Append("]");
        }
        return JSONString.ToString();
    }
}