using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //creating a image object
        System.Drawing.Image bitmap = (System.Drawing.Image)Bitmap.FromFile(Server.MapPath("onam.jpg")); // set image 
        //draw the image object using a Graphics object
        Graphics graphicsImage = Graphics.FromImage(bitmap);

        //Set the alignment based on the coordinates   
        StringFormat stringformat = new StringFormat();
        stringformat.Alignment = StringAlignment.Far;
        stringformat.LineAlignment = StringAlignment.Far;

        StringFormat stringformat2 = new StringFormat();
        stringformat2.Alignment = StringAlignment.Center;
        stringformat2.LineAlignment = StringAlignment.Center;

        //Set the font color/format/size etc..  
        Color StringColor = System.Drawing.ColorTranslator.FromHtml("#933eea");//customise color adding
        Color StringColor2 = System.Drawing.ColorTranslator.FromHtml("#e80c88");//customise color adding
        string Str_TextOnImage = "Happy";//Your Text On Image
        string Str_TextOnImage2 = "Onam";//Your Text On Image

        graphicsImage.DrawString(Str_TextOnImage, new Font("arial", 40,
        FontStyle.Regular), new SolidBrush(StringColor), new Point(268, 245),
        stringformat); Response.ContentType = "image/jpeg";

        graphicsImage.DrawString(Str_TextOnImage2, new Font("Edwardian Script ITC", 111,
        FontStyle.Bold), new SolidBrush(StringColor2), new Point(145, 255),
        stringformat2); Response.ContentType = "image/jpeg";

        bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);
    }
}