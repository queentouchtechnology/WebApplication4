using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication4.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult signin()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult createaccount()
        {
           return View();
        }
        public ActionResult dashboard()
        {
           return View();
        }
        public ActionResult profile()
        {
            return View();
        }

        public ActionResult bible()
        {
            return View();
        }
        public ActionResult shop()
        {
            return View();
        }
        public ActionResult edit_profile()
        {
            return View();
        }

        

    }
}