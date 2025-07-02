using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SuperMarketManagementSystem.SMMS.Admin
{
    public partial class ProductSells : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["BillId"] != null)
                {
                    string billId = Request.QueryString["BillId"];
                    SearchOpt3.Text = billId; 
                    SearchByBillNo(billId);
                }
                else
                {
                    fungrid();
                }
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
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void fungrid()
        {
            try
            {
                funcon();
                String qry = "SELECT * FROM ProductSells";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductsList.DataSource = ds;
                ProductsList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void SearchOpt_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                string search = SearchOpt.Text;
                funcon();
                String qry = "SELECT * from ProductSells WHERE Sel_name LIKE @search + '%'";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@search", search);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductsList.DataSource = ds;
                ProductsList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            SearchOpt.Text = "";
        }

        protected void SearchOpt_TextChanged2(object sender, EventArgs e)
        {
            try
            {
                string search2 = SearchOpt2.Text;
                funcon();
                String qry = "SELECT * from ProductSells WHERE Product LIKE @search2 + '%'";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@search2", search2);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductsList.DataSource = ds;
                ProductsList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            SearchOpt2.Text = "";
        }

        protected void SearchByBillNo(string billId)
        {
            try
            {
                funcon();
                String qry = "SELECT * FROM ProductSells WHERE Bill_no = @billId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@billId", billId);  // Use the BillId passed in QueryString

                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductsList.DataSource = ds;
                ProductsList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void SearchOpt_TextChanged3(object sender, EventArgs e)
        {
            try
            {
                string search = SearchOpt3.Text;
                SearchByBillNo(search);
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}
