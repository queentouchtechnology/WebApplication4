<%@ WebHandler Language="C#" Class="biblequiz_question" %>

using System;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class biblequiz_question : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
       
        string callback = context.Request.QueryString["callback"];
     

      
        string json = this.GetquizJSON();

      
        if (!string.IsNullOrEmpty(callback))
        {
            json = string.Format("{0}({1});", callback, json);
        }


        context.Response.ContentType = "text/json";
        context.Response.Write(json);
    }



    private string GetquizJSON()
    {
        List<object> customers = new List<object>();
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT * FROM quiz where DATEADD(dd, 0, DATEDIFF(dd, 0, createdAt)) = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))";// WHERE createdAt=@createdAt
                cmd.Parameters.AddWithValue("@createdAt", System.DateTime.Today.ToString());
               
                       
                    
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new
                        {
                            quizID = sdr["id"],
                            quizname = sdr["name"],
                            quizwinner = sdr["userid"],

                            quiz_question = sdr["question"],
                            quiz_verse = sdr["bb_verse"],
                            quiz_answer = sdr["answer"],
                            quiz_dt = sdr["createdAt"]

                        });
                    }
                }
                conn.Close();
            }
            return (new JavaScriptSerializer().Serialize(customers));
        }
    }



    public bool IsReusable {
        get {
            return false;
        }
    }

}