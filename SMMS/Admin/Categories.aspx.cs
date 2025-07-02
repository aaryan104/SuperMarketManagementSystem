using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SuperMarketManagementSystem.SMMS.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int CatId;

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
                String qry = "SELECT * from CategoryTbl";
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
                string checkCateQuery = "SELECT COUNT(*) FROM CategoryTbl WHERE CatName = @checkCate";
                cmd = new SqlCommand(checkCateQuery, conn);
                cmd.Parameters.AddWithValue("@checkCate", NameTb.Value);
                int categoryExists = (int)cmd.ExecuteScalar();

                if (categoryExists > 0)
                {
                    MessageBox.Show("This Category is already in use. Please use a different Category!");
                }
                else
                {
                    string qry = "INSERT INTO CategoryTbl(CatName,CatDescription) values(@name,@desc)";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@name", NameTb.Value);
                    cmd.Parameters.AddWithValue("@desc", DescTb.Value);

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
            CatId = Convert.ToInt32(rw.Cells[1].Text);
            NameTb.Value = rw.Cells[2].Text;
            DescTb.Value = rw.Cells[3].Text;

            add.Enabled = false;
            NameTb.Disabled = true;
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            try
            {
                //Response.Write(CustId);
                funcon();
                String qry = "UPDATE CategoryTbl SET CatDescription=@desc WHERE CatId=@catid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@catid", CatId);
                //cmd.Parameters.AddWithValue("@name", NameTb.Value);
                cmd.Parameters.AddWithValue("@desc", DescTb.Value);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Data Update!";
                    add.Enabled = true;
                    NameTb.Disabled = false;
                    NameTb.Value = String.Empty;
                    DescTb.Value = String.Empty;
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
                String qry = "DELETE FROM CategoryTbl WHERE CatId=@id";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", CatId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Data Remove!";
                    add.Enabled = true;
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
                String qry = "SELECT * from CategoryTbl WHERE CatName LIKE @search + '%'";
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