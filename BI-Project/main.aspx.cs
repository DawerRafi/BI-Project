using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace BI_Project
{
    public partial class main : System.Web.UI.Page
    {
        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB.1;Data Source=.;Integrated Security=SSPI;Initial Catalog=callcenter");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            string str = "SELECT * FROM dbo.complaints WHERE ResolutionDate IS NULL";
            OleDbCommand cmd = new OleDbCommand(str, conn);
            OleDbDataReader manager = cmd.ExecuteReader();

            //ScriptManager.RegisterClientScriptBlock(this, GetType(), "script", "$(document).ready(function () { Gauge(50); });", true);
            ScriptManager s = new ScriptManager();
            s.LoadScriptsBeforeUI = false;
            
            //sc.RegisterClientScriptBlock(this.GetType(), "script", "$(document).ready(function () {Gauge(50); });");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "$(document).ready(function () {Gauge(80,0,'Satisfactory Rate'); Gauge(20,1,'Issue Resolution Time');Gauge(50,2,'Call Connectivity'); Gauge(50,2,'Call Connectivity'); Gauge(50,2,'Call Connectivity'); Gauge(50,2,'Call Connectivity'); });", true);
        }
        
    }
}