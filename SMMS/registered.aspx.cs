using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SuperMarketManagementSystem.SMMS
{
    public partial class registered : System.Web.UI.Page
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
            try
            {
                funcon();
                string checkEmailQuery = "SELECT COUNT(*) FROM SellerTbl WHERE SelEmail=@checkEmail";
                cmd = new SqlCommand(checkEmailQuery, conn);
                cmd.Parameters.AddWithValue("@checkEmail", EmailTb.Text);
                int emailExists = (int)cmd.ExecuteScalar();

                if (emailExists > 0)
                {
                    msg.InnerText = "This email is already in use. Please use a different email!";
                }
                else
                {
                    string qry = "INSERT INTO SellerTbl(SelName,SelEmail,SelPassword,SelPhone,SelAddress) values(@name,@email,@password,@phone,@address)";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@name", NameTb.Text);
                    cmd.Parameters.AddWithValue("@email", EmailTb.Text);
                    cmd.Parameters.AddWithValue("@password", PasswordTb.Text);
                    cmd.Parameters.AddWithValue("@phone", PhoneTb.Text);
                    cmd.Parameters.AddWithValue("@address", AddressTb.Text);

                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                        Response.Redirect("~/SMMS/login.aspx");
                    //msg.InnerText = "Account Created!";
                    else
                        msg.InnerText = "Account Not Created!";
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }
    }
}