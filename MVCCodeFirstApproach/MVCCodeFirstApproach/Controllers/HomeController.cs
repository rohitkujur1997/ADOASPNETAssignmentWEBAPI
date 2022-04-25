using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace MVCCodeFirstApproach.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.result = "";
            return View();
        }

        [HttpPost]
        public ActionResult Index(string MatchID, string TeamName1, string TeamName2, string Status, string WinningTeam, String Points)
        {
            String constring = "Data Source=LAPTOP-M52OMNNH\\SQLEXPRESS;Initial Catalog=ASPNETAssignment1;Integrated Security=True;";
            SqlConnection sqlcon = new SqlConnection(constring);
            String pname = "FootBallLeagueProcedure"; ;
            sqlcon.Open();
            SqlCommand com = new SqlCommand(pname, sqlcon);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@MatchID", Convert.ToInt32(MatchID));
            com.Parameters.AddWithValue("@TeamName1", TeamName1);
            com.Parameters.AddWithValue("@TeamName2", TeamName2);
            com.Parameters.AddWithValue("@Status", Status);
            com.Parameters.AddWithValue("@WinningTeam", WinningTeam);
            com.Parameters.AddWithValue("@Points", Convert.ToInt32(Points));
            com.ExecuteNonQuery();
            sqlcon.Close();
            ViewBag.result = "Record Has Been Saved Successfully";
            return View();
        }
    }
}