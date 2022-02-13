using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cross_success_shuffle : System.Web.UI.Page
{
    functions cs = new functions();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static string getconnection_string()
    {
        string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        return constr;
    }

    public static string update_value()
    {
       
        string response = string.Empty;
        int cmd_count = 0;

        string save_customer = "update users set isActive= @updatevalue where id='" + get_random_user() + "'";
        try
        {
            using (SqlConnection con = new SqlConnection(getconnection_string()))
            {
                using (SqlCommand cmd = new SqlCommand(save_customer))
                {
                    cmd.Parameters.AddWithValue("@updatevalue ", "0");

                    cmd.Connection = con;
                    con.Open();
                    cmd_count = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }


            if (cmd_count == 1)
            {
                response = "success";
            }
        }
        catch (Exception ex)
        {

            response = ex.Message.ToString();

        }

        return response;
    }
    [WebMethod]
    public static string update_all()
    {

        string response = string.Empty;
        int cmd_count = 0;

        string save_customer = "update users set isActive= @updatevalue where role='selected' and orgId=@orgId";
        try
        {
            using (SqlConnection con = new SqlConnection(getconnection_string()))
            {
                using (SqlCommand cmd = new SqlCommand(save_customer))
                {
                    cmd.Parameters.AddWithValue("@updatevalue ", "1");
                    cmd.Parameters.AddWithValue("@orgId","2");
                    
                    cmd.Connection = con;
                    con.Open();
                    cmd_count = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }


            if (cmd_count > 1)
            {
                response = "success";
            }
        }
        catch (Exception ex)
        {

            response = ex.Message.ToString();

        }

        return response;
    }

    public static string get_random_user()
    {
        int response = 0;


        try
        {
            using (SqlConnection con = new SqlConnection(getconnection_string()))
            {

                string cmdText = "SELECT TOP 1 id FROM users where role= 'selected' and isActive=1 ORDER BY NEWID()";
                SqlCommand command = new SqlCommand(cmdText, con);
                try
                {
                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        response = int.Parse(reader[0].ToString());
                        return response.ToString();
                    }
                    else
                        return response.ToString();
                }
                catch (SqlException ee)
                {
                    return null;
                }
                finally
                {
                    con.Close();
                }
            }
        }
        catch (Exception ex)
        { 
        
        }
        return response.ToString();
    }


    public static string get_count_user()
    {
        int response = 0;


        try
        {
            using (SqlConnection con = new SqlConnection(getconnection_string()))
            {

                string cmdText = "SELECT COUNT(*) FROM users where role= 'selected' and isActive=1";
                SqlCommand command = new SqlCommand(cmdText, con);
                try
                {
                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        response = int.Parse(reader[0].ToString());
                        return response.ToString();
                    }
                    else
                        return response.ToString();
                }
                catch (SqlException ee)
                {
                    return null;
                }
                finally
                {
                    con.Close();
                }
            }
        }
        catch (Exception ex)
        {

        }
        return response.ToString();
    }





    [WebMethod]
    public static string get_filtered_users()
    {
        return jsontable(get_filtered_data()).ToString();

    }


    private static DataTable get_filtered_data()
    {
        DataTable dt = new DataTable();

        if (System.Convert.ToInt32( get_count_user())>1)
        {
            if (update_value() == "success")
            {

                using (SqlConnection con = new SqlConnection(getconnection_string()))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from users where role= 'selected' and isActive=1 ", con); //where s_admin='" + cs.gethost() + "'
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    da.Fill(dt);

                    con.Close();
                }
            }
        }
        return dt;

    }


    public static DataTable getData()
    {

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(getconnection_string()))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from users where role= 'selected' and isActive=1 ", con); //where s_admin='" + cs.gethost() + "'
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
    public static string get_users()
    {
        return jsontable(getData()).ToString();

    }

}