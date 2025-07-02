using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperMarketManagementSystem.SMMS
{
    public partial class login : System.Web.UI.Page
    {

        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;

        protected void Page_Load(object sender, EventArgs e)
        {

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
                Response.Write(ex.ToString());
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            String role = txtRole.Text;
            String email = txtEmail.Text;
            String pass = txtPassword.Text;

            if (role == "Admin")
            {
                if (email == "admin@gmail.com" && pass == "admin123")
                {
                    Response.Redirect("~/SMMS/Admin/Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Incorrect email or password!";

                }
            }
            else
            {
                funcon();
                string qry = "SELECT COUNT(*) FROM SellerTbl WHERE SelEmail=@eml AND SelPassword=@pwd";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("eml", txtEmail.Text);
                cmd.Parameters.AddWithValue("pwd", txtPassword.Text);

                int cnt = Convert.ToInt32(cmd.ExecuteScalar() ?? 0);

                if (cnt > 0)
                {
                    Session["s_eml"] = txtEmail.Text;
                    Response.Redirect("~/SMMS/Seller/Billing.aspx");
                }
                else
                {
                    lblMessage.Text = "Incorrect email or password!";
                }
                conn.Close();
            }
        }
    }
}