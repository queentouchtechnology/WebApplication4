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
using System.Web.Script.Serialization;

public partial class bible_post : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ExportToImage(object sender, EventArgs e)
    {
        string base64 = Request.Form[hfImageData.UniqueID].Split(',')[1];
        byte[] bytes = Convert.FromBase64String(base64);
        Response.Clear();
        Response.ContentType = "image/png";
        Response.AddHeader("Content-Disposition", "attachment; filename=HTML.png");
        Response.Buffer = true;
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.BinaryWrite(bytes);
        Response.End();
    }


    public static string getconnection_string()
    {
        string constr = ConfigurationManager.ConnectionStrings["cross_success"].ConnectionString;
        return constr;
    }


    public static List<Item> getsslide1()
    {
        string query = "SELECT top 15 ptype,pdiscount,pscat_id,pid,punit_price,pmrp,pimgURL, pname FROM q_products where sadmin='queenstarters'";

        using (SqlConnection con = new SqlConnection(getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<Item> customers = new List<Item>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new Item
                        {
                            pid = sdr["pid"].ToString(),
                            pname = sdr["pname"].ToString(),
                            ptype = sdr["ptype"].ToString(),
                            pdiscount = sdr["pdiscount"].ToString(),
                            pscat_id = sdr["pscat_id"].ToString(),
                            punit_price = sdr["punit_price"].ToString(),
                            pmrp = sdr["pmrp"].ToString(),
                            pimgURL = sdr["pimgURL"].ToString()
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }


    public class Item
    {
        public string pid { get; set; }
        public string pname { get; set; }
        public string ptype { get; set; }
        public string pdiscount { get; set; }
        public string pscat_id { get; set; }
        public string punit_price { get; set; }
        public string pmrp { get; set; }
        public string pimgURL { get; set; }


    }

    public static List<Item_bible> getbookinfo()
    {
        string query = "select bookname,book,MIN(chapter) as bookstart,MAX(chapter) as bookend from  [cross_success].[dbo].[bible] where bookname IS NOT NULL group by bookname,book order by book asc";

        using (SqlConnection con = new SqlConnection(getconnection_string()))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                List<Item_bible> customers = new List<Item_bible>();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(new Item_bible
                        {
                            bookname = sdr["bookname"].ToString(),
                            bookno = sdr["book"].ToString(),
                            bookstartno = sdr["bookstart"].ToString(),
                            bookendno = sdr["bookend"].ToString()
                          
                        });
                    }
                }
                con.Close();
                return customers;
            }
        }
    }

    

    public class Item_bible
    {
        public string bookname { get; set; }
        public string bookno { get; set; }
        public string bookstartno { get; set; }
        public string bookendno { get; set; }   


    }

    [WebMethod]
    public static string load_bookslider()
    {
        var result = new
        {
            items = getbookinfo()
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        string db_json = js.Serialize(result);
        string folderPath = System.Web.Hosting.HostingEnvironment.MapPath("~/json/slide1.json");
        //write string to file
        System.IO.File.WriteAllText(@folderPath, db_json);


        return db_json;
    }

    [WebMethod]
    public static string load_slid1()
    {
        var result = new
        {
            items = getsslide1()
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        string db_json = js.Serialize(result);
        string folderPath = System.Web.Hosting.HostingEnvironment.MapPath("~/json/slide1.json");
        //write string to file
        System.IO.File.WriteAllText(@folderPath, db_json);


        return db_json;
    }
}