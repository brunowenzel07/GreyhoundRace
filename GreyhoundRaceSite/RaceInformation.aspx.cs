using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace GreyhoundRaceSite
{
    public partial class RaceInformation : System.Web.UI.Page
    {
        static string name = "";
        static XmlDocument doc = new XmlDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            name = Request.QueryString["name"];
            doc.Load(Server.MapPath("race.xml"));
        }

        [WebMethod]
        public static string GetRaceData()
        {
            string st = "";
            XmlNode node = doc.SelectSingleNode("//UpcomingEvents/RaceEvent[@Name='" + name + "']");

            st = "Event Number " + node.Attributes[1].Value.ToString() + " </br>" + 
                "Time to Begin " + node.Attributes[2].Value.ToString()+" </br>" + 
                "Time to End " + node.Attributes[3].Value.ToString() + " </br>" + 
                 "Distance to run " + node.Attributes[4].Value.ToString() + "</br></br></br>";
            return st;
        }

        [WebMethod]
        public static string GetRacersData()
        {
            string st = "";
            XmlNode race = doc.SelectSingleNode("//UpcomingEvents/RaceEvent[@Name='" + name + "']");
            XmlNodeList node = race.SelectNodes("//Entry");

            foreach (XmlNode item in node)
            {
                st += "<h3>Racer Name </h3>" + item.Attributes[1].Value.ToString() +
                      "<h3> Odds Decimal </h3>" + item.Attributes[2].Value.ToString() + "</br>";
            }
            return st;
        }
    }
}