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

namespace SuperMarketManagementSystem.SMMS.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static String Date;
        public static int PrId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                funcon();
                BindData();
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
                msg.InnerText = ex.ToString();
            }
        }

        public void fungrid()
        {
            try
            {
                funcon();
                String qry = "SELECT * FROM ProductTbl ORDER BY PrCat DESC";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductList.DataSource = ds;
                ProductList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string Date = Convert.ToDateTime(DateTb.Value).ToString("yyyy-MM-dd");
            String img = "~/SMMS/Admin/Product_Img/" + ImgUpload.FileName;

            DateTime inputDate = Convert.ToDateTime(DateTb.Value);
            DateTime currentDate = DateTime.Now;
            try
            {
                funcon();
                string checkNameQuery = "SELECT COUNT(*) FROM ProductTbl WHERE PrName=@checkName";
                cmd = new SqlCommand(checkNameQuery, conn);
                cmd.Parameters.AddWithValue("@checkName", NameTb.Value);
                int nameExists = (int)cmd.ExecuteScalar();

                if (nameExists > 0)
                {
                    MessageBox.Show("This Product is already available, Please Try Something Else!");
                }
                else if(inputDate < currentDate)
                {
                    MessageBox.Show("The date cannot be in the past. Please enter a future date.");
                }
                else
                {
                    string qry = "INSERT INTO ProductTbl(PrName,PrCat,PrPrice,PrQty,PrExpDate,PrDesc,PrImg) VALUES(@name,@category,@price,@qty,@exp,@desc,@img)";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@name", NameTb.Value);
                    cmd.Parameters.AddWithValue("@category", CategoryTb.SelectedValue);
                    cmd.Parameters.AddWithValue("@price", PriceTb.Value);
                    cmd.Parameters.AddWithValue("@qty", QtyTb.Value);
                    cmd.Parameters.AddWithValue("@exp", Date);
                    cmd.Parameters.AddWithValue("@desc", ProdDescTb.Value);
                    cmd.Parameters.AddWithValue("@img", img);

                    int res = cmd.ExecuteNonQuery();

                    ImgUpload.SaveAs(Server.MapPath(img));

                    if (res > 0)
                    {
                        msg.InnerText = "Data inserted successfully!";
                        PriceTb.Value = string.Empty;
                        QtyTb.Value = string.Empty;
                        ProdDescTb.Value = string.Empty;
                    }
                    else
                    {
                        msg.InnerText = "Data insertion failed.";
                    }
                }

                conn.Close();
                fungrid();
            }
            catch (Exception ex)
            {
                msg.InnerText = ex.ToString();
            }
        }

        public void BindData()
        {
            DataSet ds1 = new DataSet();
            try
            {
                funcon();
                string qry = "SELECT * FROM CategoryTbl";
                cmd = new SqlCommand(qry);
                cmd.Connection = conn;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds1);
                CategoryTb.DataSource = ds1;
                CategoryTb.DataTextField = "CatName";
                CategoryTb.DataValueField = "CatId";
                CategoryTb.DataBind();
                CategoryTb.Items.Insert(0, new ListItem("select"));
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void CategoryTb_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BindData();
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = ProductList.SelectedRow;
            PrId = Convert.ToInt32(rw.Cells[1].Text);
            NameTb.Value = rw.Cells[2].Text;
            CategoryTb.Text = rw.Cells[3].Text;
            PriceTb.Value = rw.Cells[4].Text;
            QtyTb.Value = rw.Cells[5].Text;
            Date = rw.Cells[6].Text;
            ProdDescTb.Value = rw.Cells[7].Text;
            
            add.Enabled = false;
            NameTb.Disabled = true;
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            try
            {
                String img = "~/SMMS/Admin/Product_Img/" + ImgUpload.FileName;
                //Response.Write(PrId);
                funcon();
                
                    String qry = "UPDATE ProductTbl SET PrPrice=@price,PrQty=@qty,PrDesc=@desc WHERE PrId=@Prid";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@PrId", PrId);
                    //cmd.Parameters.AddWithValue("@name", NameTb.Value);
                    //cmd.Parameters.AddWithValue("@category", CategoryTb.SelectedValue);
                    cmd.Parameters.AddWithValue("@price", PriceTb.Value);
                    cmd.Parameters.AddWithValue("@qty", QtyTb.Value);
                    cmd.Parameters.AddWithValue("@desc", ProdDescTb.Value);
                    //cmd.Parameters.AddWithValue("@exp", Date);  ,PrExpDate=@exp

                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        msg.InnerText = "Data Update!";
                        add.Enabled = true;
                        NameTb.Disabled= false;
                        NameTb.Value = string.Empty;
                        PriceTb.Value = string.Empty;
                        QtyTb.Value = string.Empty;
                        ProdDescTb.Value = string.Empty;
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
                String qry = "DELETE FROM ProductTbl WHERE PrId=@id";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", PrId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    msg.InnerText = "Data Remove!";
                    add.Enabled = true;
                    PriceTb.Value = string.Empty;
                    QtyTb.Value = string.Empty;
                    ProdDescTb.Value = string.Empty;
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
                String qry = "SELECT * from ProductTbl WHERE PrName LIKE @search + '%'";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@search", search);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ProductList.DataSource = ds;
                ProductList.DataBind();
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