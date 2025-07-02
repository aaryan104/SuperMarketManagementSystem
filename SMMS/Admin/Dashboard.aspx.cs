using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml.Linq;

namespace SuperMarketManagementSystem.SMMS.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                funcon();
                BindData(); 
                fnFetchUser();
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

        public void fnFetchUser()
        {
            /*if (SellerTb.SelectedIndex == 0)
            {
                return;
            }*/
            funcon();
            try
            {
                String qry1 = "SELECT count(*) FROM ProductTbl";
                cmd = new SqlCommand(qry1, conn);
                int rowCount1 = (int)cmd.ExecuteScalar();
                CountProduct.Text = rowCount1.ToString();
                
                String qry2 = "SELECT count(*) FROM CategoryTbl";
                cmd = new SqlCommand(qry2, conn);
                int rowCount2 = (int)cmd.ExecuteScalar();
                CountCategory.Text = rowCount2.ToString();
                
                String qry3 = "SELECT count(*) FROM SellerTbl";
                cmd = new SqlCommand(qry3, conn);
                int rowCount3 = (int)cmd.ExecuteScalar();
                CountSeller.Text = rowCount3.ToString();

                String qry4 = "SELECT sum(Amount) FROM Billtbl";
                cmd = new SqlCommand(qry4, conn);
                int rowCount4 = (int)cmd.ExecuteScalar();
                CountFinance.Text = rowCount4.ToString();

                String qry5 = "SELECT count(*) FROM Billtbl";
                cmd = new SqlCommand(qry5, conn);
                int rowCount5 = (int)cmd.ExecuteScalar();
                CountSells.Text = rowCount5.ToString();

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void countSells()
        {
            try
            {
                funcon();
                String qry6 = "SELECT sum(Amount) FROM Billtbl WHERE SelName=@name";
                cmd = new SqlCommand(qry6, conn);
                cmd.Parameters.AddWithValue("@name", SellerTb.SelectedValue);
                object result = cmd.ExecuteScalar();
                if (result != DBNull.Value)
                {
                    CountSellerAmount.Text = result.ToString();
                }
                else
                {
                    CountSellerAmount.Text = "000";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void countSell()
        {
            try
            {
                funcon();
                String qry7 = "SELECT count(*) FROM Billtbl WHERE SelName=@name";
                cmd = new SqlCommand(qry7, conn);
                cmd.Parameters.AddWithValue("@name", SellerTb.SelectedValue);
                object result = cmd.ExecuteScalar();
                if (result != DBNull.Value)
                {
                    CountSells.Text = result.ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void BindData()
        {
            DataSet ds1 = new DataSet();
            try
            {
                funcon();
                string qry = "SELECT * FROM SellerTbl ORDER BY SelName ASC";
                cmd = new SqlCommand(qry);
                cmd.Connection = conn;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds1);
                SellerTb.DataSource = ds1;
                SellerTb.DataTextField = "SelName";
                SellerTb.DataValueField = "SelName";
                SellerTb.DataBind();
                SellerTb.Items.Insert(0, new ListItem("--Select Name--"));
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void CategoryTb_SelectedIndexChanged(object sender, EventArgs e)
        {
            countSell();
            countSells();
        }
    }
}



