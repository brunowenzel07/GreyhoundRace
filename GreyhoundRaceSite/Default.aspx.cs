using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace GreyhoundRaceSite
{
    public partial class _Default : Page
    {
        static XmlDocument doc = new XmlDocument();
        protected void Page_Load(object sender, EventArgs e)
        {
            doc.Load(Server.MapPath("race.xml"));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetData()
        {
            List<string> raceNames = new List<string>();
            XmlNodeList node = doc.SelectNodes("//UpcomingEvents/RaceEvent");
            for (int i = 0; i < node.Count; i++)
            {
                raceNames.Add(node[i].Attributes[5].Value.ToString());
            }

            //string myJsonString = (new JavaScriptSerializer()).Serialize(raceNames);
            return raceNames;
        }

        protected void button_Click(object sender, EventArgs e)
        {

        }
    }
}