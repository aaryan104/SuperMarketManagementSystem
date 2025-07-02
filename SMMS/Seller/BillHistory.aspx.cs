using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Configuration;

namespace SuperMarketManagementSystem.SMMS.Seller
{
    public partial class BillHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda; 
        public static String eml = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            funcon();
            fungrid();
            if (Session["s_eml"] != null)
            {
                eml = Session["s_eml"].ToString();
            }
            else
            {
                Response.Redirect("~/SMMS/login.aspx");
            }
        }

        public void funcon()
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
                MessageBox.Show(ex.ToString());
                //msg.InnerText = ex.ToString();
            }
        }


        public void fungrid()
        {
            //MessageBox.Show(eml);
            try
            {
                funcon();
                String qry = "SELECT BillId,BillDate,Seller,Amount FROM BillTbl WHERE Seller = (SELECT SelId FROM SellerTbl WHERE SelEmail=@eml)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@eml", eml);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductList.DataSource = ds;
                ProductList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                //msg.InnerText = ex.ToString();
            }
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}