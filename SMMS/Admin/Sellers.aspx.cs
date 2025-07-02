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

namespace SuperMarketManagementSystem.SMMS.Admin
{
    public partial class Sellers : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int SelId;

        protected void Page_Load(object sender, EventArgs e)
        {
            fungrid();
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
                msg.InnerText = ex.ToString();
            }
        }

        public void fungrid()
        {
            try
            {
                funcon();
                String qry = "SELECT * from SellerTbl ORDER BY SelName ASC";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                CustomerList.DataSource = ds;
                CustomerList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            try
            {
                funcon();
                string checkEmailQuery = "SELECT COUNT(*) FROM SellerTbl WHERE SelEmail = @checkEmail";
                cmd = new SqlCommand(checkEmailQuery, conn);
                cmd.Parameters.AddWithValue("@checkEmail", EmailTb.Value);
                int emailExists = (int)cmd.ExecuteScalar();

                if (emailExists > 0)
                {
                    MessageBox.Show("This email is already in use. Please use a different email!");
                }
                else
                {
                    string qry = "INSERT INTO SellerTbl(SelName,SelEmail,SelPassword,SelPhone,SelAddress) values(@name,@email,@password,@phone,@address)";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@name", NameTb.Value);
                    cmd.Parameters.AddWithValue("@email", EmailTb.Value);
                    cmd.Parameters.AddWithValue("@password", PasswordTb.Value);
                    cmd.Parameters.AddWithValue("@phone", PhoneTb.Value);
                    cmd.Parameters.AddWithValue("@address", AddressTb.Value);

                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                        msg.InnerText = "Data inserted!";
                    else
                        msg.InnerText = "not insert";
                    conn.Close();
                    fungrid();
                }
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        protected void CustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = CustomerList.SelectedRow;
            SelId = Convert.ToInt32(rw.Cells[1].Text);
            NameTb.Value = rw.Cells[2].Text;
            EmailTb.Value = rw.Cells[3].Text;
            PasswordTb.Value = rw.Cells[4].Text;
            PhoneTb.Value = rw.Cells[5].Text;
            AddressTb.Value = rw.Cells[6].Text;

            add.Enabled = false;
            NameTb.Disabled = true;
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            try
            {
                //Response.Write(CustId);
                funcon();
                
                    String qry = "UPDATE SellerTbl SET SelEmail=@email,SelPassword=@password,SelPhone=@phone,SelAddress=@address WHERE SelId=@Selid";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@SelId", SelId);
                    cmd.Parameters.AddWithValue("@name", NameTb.Value);
                    cmd.Parameters.AddWithValue("@email", EmailTb.Value);
                    cmd.Parameters.AddWithValue("@password", PasswordTb.Value);
                    cmd.Parameters.AddWithValue("@phone", PhoneTb.Value);
                    cmd.Parameters.AddWithValue("@address", AddressTb.Value);

                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        msg.InnerText = "Data Update!";
                        add.Enabled = true;
                        NameTb.Disabled = false;
                        NameTb.Value = String.Empty;
                        EmailTb.Value = String.Empty;
                        PasswordTb.Value = String.Empty;
                        PhoneTb.Value = String.Empty;
                        AddressTb.Value = String.Empty;
                    }
                    else
                    {
                        msg.InnerText = "Data not Update!";
                        conn.Close();
                    }
                    fungrid();
                
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }


        protected void delete_Click(object sender, EventArgs e)
        {
            try
            {
                funcon();
                String qry = "DELETE FROM SellerTbl WHERE SelId=@id";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", SelId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Data Remove!";
                    add.Enabled= true;
                }
                else
                {
                    msg.InnerText = "Data not Removed!";
                    conn.Close();
                }
                fungrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void SearchOpt_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string search = SearchOpt.Text;

                funcon();
                String qry = "SELECT * from SellerTbl WHERE SelName LIKE @search + '%'";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@search", search);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                CustomerList.DataSource = ds;
                CustomerList.DataBind();
                conn.Close();
                //MessageBox.Show(search);
            }
            catch (Exception ex)
            {
                //Response.Write("Error");
                msg.InnerText = ex.ToString();
            }
        }
    }
}