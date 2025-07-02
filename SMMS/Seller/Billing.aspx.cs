using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SuperMarketManagementSystem.SMMS.Seller
{
    public partial class Billing : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static String eml = String.Empty;
        public static int PrId, newQty, Stock, Seller;
        public static int GrandTotal = 0;
        public static String SellerName;

        protected void Page_Load(object sender, EventArgs e)
        {
            funcon();
            fungrid();

            if (Session["s_eml"] != null)
            {
                eml = Session["s_eml"].ToString();
                fnFetchUser();
                fnFetchid();
            }
            else
            {
                Response.Redirect("~/SMMS/login.aspx");
            }

            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[5]
                {
                    new DataColumn("No"),
                    new DataColumn("Product"),
                    new DataColumn("Price"),
                    new DataColumn("Quantity"),
                    new DataColumn("Total")
                });
                ViewState["Bill"] = dt;
                this.BindBill();
            }
        }

        public void funcon()
        {
            string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            conn = new SqlConnection(conStr);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
        }

        public void BindBill()
        {
            BillList.DataSource = (DataTable)ViewState["Bill"];
            this.DataBind();
        }

        public void fnFetchUser()
        {
            funcon();
            String qry = "SELECT SelName FROM SellerTbl WHERE SelEmail=@u_eml";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@u_eml", eml);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtName.Text = dr["SelName"].ToString();
                SellerName = txtName.Text;
            }
        }

        public void fnFetchid()
        {
            funcon();
            String qry = "SELECT SelId FROM SellerTbl WHERE SelEmail=@u_eml";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@u_eml", eml);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                id.Text = dr["SelId"].ToString();
                Seller = Convert.ToInt32(id.Text);
            }
        }

        public void fungrid()
        {
            funcon();
            String qry = "SELECT PrId,PrName,PrPrice,PrQty,PrImg from ProductTbl ORDER BY PrCat DESC";
            cmd = new SqlCommand(qry, conn);
            sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ProductList.DataSource = ds;
            ProductList.DataBind();
            conn.Close();
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = ProductList.SelectedRow;
            PrId = Convert.ToInt32(rw.Cells[1].Text);
            NameTb.Value = rw.Cells[2].Text;
            PriceTb.Value = rw.Cells[3].Text;
            Stock = Convert.ToInt32(rw.Cells[4].Text);

            if (Stock <= 0)
            {
                btnAtb.Enabled = false;
                NameTb.Value = string.Empty;
                PriceTb.Value = string.Empty;
                QtyTb.Value = string.Empty;
                NameTb.Disabled = true;
                PriceTb.Disabled = true;
                QtyTb.Disabled = true;
                MessageBox.Show(NameTb.Value + "Out Of Stock");
            }
            else
            {
                btnAtb.Enabled = true;
                NameTb.Disabled = false;
                PriceTb.Disabled = false;
                QtyTb.Disabled = false;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            NameTb.Value = string.Empty;
            PriceTb.Value = string.Empty;
            QtyTb.Value = string.Empty;
        }

        public void UpdateStock()
        {
            newQty = (Stock - Convert.ToInt32(QtyTb.Value));

            if (newQty < 0)
            {
                MessageBox.Show("Total Quantity Not Available");
                return;
            }
            else
            {
                try
                {
                    funcon();
                    String qry = "UPDATE ProductTbl SET PrQty=@qty WHERE PrId=@PrId";
                    cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@PrId", PrId);
                    cmd.Parameters.AddWithValue("@qty", newQty);
                    cmd.ExecuteNonQuery();

                    Dictionary<int, int> removedQty = (Dictionary<int, int>)ViewState["RemovedQty"] ?? new Dictionary<int, int>();
                    removedQty[PrId] = Convert.ToInt32(QtyTb.Value);
                    ViewState["RemovedQty"] = removedQty;

                    fungrid();
                }
                catch (Exception ex)
                {
                    OutputBill.InnerText = ex.ToString();
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Response.Write("clicked Yes for cancel Bill!");

            Dictionary<int, int> removedQty = (Dictionary<int, int>)ViewState["RemovedQty"];
            if (removedQty != null)
            {
                foreach (var entry in removedQty)
                {
                    int productId = entry.Key;
                    int qtyToAddBack = entry.Value;

                    try
                    {
                        funcon();
                        String qry = "UPDATE ProductTbl SET PrQty = PrQty + @qty WHERE PrId = @PrId";
                        cmd = new SqlCommand(qry, conn);
                        cmd.Parameters.AddWithValue("@PrId", productId);
                        cmd.Parameters.AddWithValue("@qty", qtyToAddBack);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        OutputBill.InnerText = ex.ToString();
                    }
                }
                ViewState["RemovedQty"] = null;

                Response.Redirect("~/SMMS/Seller/Billing.aspx");
            }
        }

        protected void GivenMoney_TextChanged(object sender, EventArgs e)
        {
            int grandTotal = Convert.ToInt32(grandTotalLabel.Text);
            int givenMoney = Convert.ToInt32(GivenMoney.Text);

            int balance = givenMoney - grandTotal;

            CountMoney.Text = balance.ToString();
        }

        private void CalculateGrandTotal()
        {
            GrandTotal = 0;
            foreach (GridViewRow row in BillList.Rows)
            {
                int total = Convert.ToInt32(row.Cells[4].Text);
                GrandTotal += total;
            }
            grandTotalLabel.Text = GrandTotal.ToString();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                funcon();
                string qry = "INSERT INTO BillTbl (BillDate, Seller, SelName, Amount) OUTPUT INSERTED.BillId VALUES (@date, @seller, @name, @amount)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);
                cmd.Parameters.AddWithValue("@seller", Seller);
                cmd.Parameters.AddWithValue("@name", SellerName);
                cmd.Parameters.AddWithValue("@amount", GrandTotal);

                int billId = (int)cmd.ExecuteScalar();

                foreach (GridViewRow row in BillList.Rows)
                {
                    string product = row.Cells[1].Text;
                    int price = Convert.ToInt32(row.Cells[2].Text);
                    int qty = Convert.ToInt32(row.Cells[3].Text);
                    int total = Convert.ToInt32(row.Cells[4].Text);

                    string productQry = "INSERT INTO ProductSells (Sel_name, Bill_no, Product, Price, Quantity, Total, [Date/Time]) VALUES (@SelName, @BillNo, @Product, @Price, @Qty, @Total, @Date)";
                    SqlCommand productCmd = new SqlCommand(productQry, conn);
                    productCmd.Parameters.AddWithValue("@SelName", SellerName);
                    productCmd.Parameters.AddWithValue("@BillNo", billId);
                    productCmd.Parameters.AddWithValue("@Product", product);
                    productCmd.Parameters.AddWithValue("@Price", price);
                    productCmd.Parameters.AddWithValue("@Qty", qty);
                    productCmd.Parameters.AddWithValue("@Total", total);
                    productCmd.Parameters.AddWithValue("@Date", DateTime.Now);
                    productCmd.ExecuteNonQuery();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                OutputBill.InnerText = ex.ToString();
            }
        }

        private void UpdateCounts()
        {
            int itemCount = BillList.Rows.Count;
            int qtyCount = 0;

            foreach (GridViewRow row in BillList.Rows)
            {
                int qty = Convert.ToInt32(row.Cells[3].Text);
                qtyCount += qty;
            }
            countItem.Text = itemCount.ToString();
            countQty.Text = qtyCount.ToString();
        }

        protected void btnAtb_Click(object sender, EventArgs e)
        {
            newQty = (Stock - Convert.ToInt32(QtyTb.Value));


            if (newQty < 0)
            {
                MessageBox.Show("Total Quantity Not Available");
                return;
            }
            else
            {

                int total = Convert.ToInt32(PriceTb.Value) * Convert.ToInt32(QtyTb.Value);

                DataTable dt = (DataTable)ViewState["Bill"];
                dt.Rows.Add(BillList.Rows.Count + 1,
                    NameTb.Value.Trim(),
                    PriceTb.Value.Trim(),
                    QtyTb.Value.Trim(),
                    total
                    );

                ViewState["Bill"] = dt;
                this.BindBill();
                UpdateStock();
                NameTb.Value = string.Empty;
                PriceTb.Value = string.Empty;
                QtyTb.Value = string.Empty;

                CalculateGrandTotal();
                UpdateCounts();
            }
        }
    }
}