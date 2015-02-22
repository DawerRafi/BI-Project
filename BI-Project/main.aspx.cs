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
            string str = "SELECT cust.NAME Customer_Name,TYPE Complaint_Type,op.name Operator_Name,IssueDate FROM callcenter.dbo.complaints comp,callcenter.dbo.Customer cust,callcenter.dbo.Complaint_Type typ,callcenter.dbo.Operators op WHERE comp.CUS_ID=cust.CUS_ID and comp.TYPEID=typ.TYPEID and op.OPID=comp.OPID and ResolutionDate IS NULL "
            +"and DATEDIFF(day,IssueDate,GETDATE())>20";
            OleDbCommand cmd = new OleDbCommand(str, conn);
            OleDbDataReader rdr= cmd.ExecuteReader();

            string str2 = "select NAME,SUM(SatisfactionRate)/COUNT(SatisfactionRate) as Rate,COUNT(SatisfactionRate) as Complaints_Handled from callcenter.dbo.Complaints comp,callcenter.dbo.Operators op where op.OPID=comp.OPID and resolved=1 group by NAME order by Rate desc";
            OleDbCommand cmd2 = new OleDbCommand(str2, conn);
            OleDbDataReader rdr2 = cmd2.ExecuteReader();

            string sampledata2 = "[";

            while (rdr2.Read())
            {
                sampledata2 += "['" + rdr2["NAME"].ToString() + "','" + rdr2["Rate"].ToString() + "','" + rdr2["Complaints_Handled"].ToString() + "'],";
            }
            sampledata2 = sampledata2.Remove(sampledata2.Length - 1, 1);
            sampledata2 += "]";

            string sampledata = "[";

            while (rdr.Read())
            {
                sampledata += "['" + rdr["Customer_Name"].ToString() + "','" + rdr["Complaint_Type"].ToString() + "','" + rdr["Operator_Name"].ToString() + "','" + rdr["IssueDate"].ToString() + "'],";
            }
            sampledata=sampledata.Remove(sampledata.Length - 1, 1);
            sampledata += "]";
            //ScriptManager.RegisterClientScriptBlock(this, GetType(), "script", "$(document).ready(function () { Gauge(50); });", true);
            ScriptManager s = new ScriptManager();
            s.LoadScriptsBeforeUI = false;
            
            //sc.RegisterClientScriptBlock(this.GetType(), "script", "$(document).ready(function () {Gauge(50); });");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "$(document).ready(function () {Gauge(80,0,'Satisfactory Rate'); Gauge2(10,1,'Issue Resolution Time');Gauge(50,2,'Call Connectivity'); Table("+sampledata+","+sampledata2+");  });", true);
        }
        
    }
}