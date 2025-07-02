using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperMarketManagementSystem
{
    public partial class drop : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            fnBindAllCity();
        }

        public void fnConnectDB()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                conn = new SqlConnection(conStr);
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    // Response.Write("connection success");
                }
                else
                {
                    Response.Write("not connect");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnBindAllCity()
        {
            DataSet ds1 = new DataSet();
            try
            {
                fnConnectDB();
                string qry = "SELECT DrCity FROM DropDwnTbl";
                cmd = new SqlCommand(qry);
                cmd.Connection = conn;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds1);
                city.DataSource = ds1;
                city.DataTextField = "DrCity";
                city.DataValueField = "DrCity";
                city.DataBind();
                city.Items.Insert(0, new ListItem("select"));
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void city_SelectedIndexChanged(object sender, EventArgs e)
        {
            fnBindAllCity();
        }

    }
}