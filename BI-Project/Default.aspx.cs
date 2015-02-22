using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace BI_Project
{
    public partial class _Default : System.Web.UI.Page
    {

        OleDbConnection conn = new OleDbConnection("Provider=SQLOLEDB.1;Data Source=.;Integrated Security=SSPI;Initial Catalog=callcenter");
        SqlConnection myConnection= new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginClick(object sender, EventArgs e)
        {
            string email = Login1.UserName;
            string password = Login1.Password;
            //myConnection.Open();
            //SqlCommand mycommand = new SqlCommand("select count(*) from MANAGERS where email='" + email + "' and password='" + password + "'", myConnection);
            //SqlDataReader myReader = null;
            //myReader = mycommand.ExecuteReader();
            //if (myReader.Read())
            //{
            //   // Response.Redirect("main.aspx");
            //}

            conn.Open();
            string str="select count(*) from dbo.MANAGERS where email='" + email + "' and password='" + password + "'";
            OleDbCommand cmd = new OleDbCommand(str, conn);
            Int32 manager = (Int32) cmd.ExecuteScalar();
            OleDbCommand cmd2 = new OleDbCommand("select count(*) from dbo.operators where email='" + email + "' and password='" + password + "'", conn);
            Int32 operators = (Int32)cmd2.ExecuteScalar();
            if (manager>0)
            {
                Response.Redirect("main.aspx");
                

            }
            else if (operators>0)
            {
                Response.Redirect("main.aspx");
            }
            else
            {
                Feedback.Text = "Invalid Username or Password. Please Try Again";
            }
            
        }
    }
}
