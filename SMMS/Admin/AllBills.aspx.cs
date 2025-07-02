using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SuperMarketManagementSystem.SMMS.Admin
{
    public partial class AllBills : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int Bid;

        protected void Page_Load(object sender, EventArgs e)
        {
            funcon();
            if (!this.IsPostBack)
            {
                fungrid();
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
            try
            {
                funcon();
                String qry = "SELECT * FROM BillTbl";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                BillsList.DataSource = ds;
                BillsList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                //msg.InnerText = ex.ToString();
            }
        }

        protected void BillsList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int billId = Convert.ToInt32(BillsList.DataKeys[e.RowIndex].Value);
                funcon();

                string qry1 = "DELETE FROM ProductSells WHERE Bill_no=@BillId";
                SqlCommand cmd1 = new SqlCommand(qry1, conn);
                cmd1.Parameters.AddWithValue("@BillId", billId);
                cmd1.ExecuteNonQuery();

                string qry2 = "DELETE FROM BillTbl WHERE BillId=@BillId";
                SqlCommand cmd = new SqlCommand(qry2, conn);
                cmd.Parameters.AddWithValue("@BillId", billId);
                cmd.ExecuteNonQuery();

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
                fungrid();
        }

        protected void SearchOpt_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                string search = SearchOpt.Text;

                funcon();

                string qry = "SELECT * from BillTbl WHERE SelName LIKE @search + '%'";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@search", search);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                BillsList.DataSource = ds;
                BillsList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            SearchOpt.Text = "";
        }


        protected void BillsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int billId = Convert.ToInt32(BillsList.SelectedDataKey.Value);
            Response.Redirect($"ProductSells.aspx?BillId={billId}");
        }

    }
}
