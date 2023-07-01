using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TEZBI
{
    public partial class Cafeteria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Cartcount();
                BindListViewControls();
                BindItems();
                BindListViewControlsCart();
                TotalCartAmount();
            }
        }

        public void BindListViewControls()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            string query = "select Id as Itemcode,ItemDesc from Tez_Mst_Cafeteria_Items";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable table = new DataTable();

            da.Fill(table);

            ListView1.DataSource = table;
            ListView1.DataBind();
        }

        public void TotalCartAmount()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("select sum(Price * Quantity) as ItemTotalAmount from Tez_Mst_Cafeteria_Cart", con);
                int TotalAmount = Convert.ToInt32(cmd.ExecuteScalar());
                if (TotalAmount > 0)
                {
                    lblTotalPrice.Text = TotalAmount.ToString();

                }
            }
            catch (Exception ex)
            {
                logerrors(ex.Message);
            }
            finally
            {
                con.Close();
            }

        }
        public void BindListViewControlsCart()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            string query = "select b.ItemType,a.ItemCode,a.ItemDesc,a.ItemFilePath,a.Price,a.Quantity,sum(a.Price * a.Quantity) as ItemTotalAmount,a.Weightage  " +
                           "from Tez_Mst_Cafeteria_Cart as a inner join Tez_Mst_Cafeteria_Cart as b on b.ItemCode = a.ItemCode " +
                           "group by b.ItemType,a.ItemCode,a.ItemDesc,a.ItemFilePath,a.Price,a.Quantity,a.Weightage ";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();

            da.Fill(ds);




            ListView2.DataSource = ds;
            ListView2.DataBind();
        }
        protected void ListView2_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;

                //DropDownList ddlincredecre = e.Item.FindControl("ddlincredecre") as DropDownList;
                //ddlincredecre.SelectedValue = lblQuantity.Text;



                Label lblItemcount = e.Item.FindControl("lblItemcount") as Label;
                lblItemcount.Text = lblQuantity.Text;


                //Label lblPrice1 = (Label)e.Item.FindControl("lblPrice1");
                //Label lblitemcode = (Label)e.Item.FindControl("lblitemcode");

                //int selectedvalue = Convert.ToInt32(ddlincredecre.SelectedValue);
                //SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
                //con.Open();
                //SqlCommand Cmnd = new SqlCommand("select Price  from Tez_Mst_Cafeteria_Cart where  ItemCode='" + lblitemcode.Text + "'", con);
                //int price = Convert.ToInt32(Cmnd.ExecuteScalar());

                //lblPrice1.Text = Convert.ToString(selectedvalue * price);

            }
        }
        public void Cartcount()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            try
            {

                con.Open();
                SqlCommand Cmnd = new SqlCommand("select count(*) from Tez_Mst_Cafeteria_Cart where status='L'", con);
                object result = Cmnd.ExecuteScalar();
                if (result != null)
                {
                    lblcartcount.Text = result.ToString();
                }
            }
            catch (Exception ex)
            {
                logerrors(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public void BindItems()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            string query = "select a.itemtype,a.itemcode,a.itemdesc,a.Price,a.quantity,a.weightage,a.ItemFileName,a.ItemFilePath from Tez_Mst_Cafeteria as a inner join Tez_Mst_Cafeteria_Items as b on b.id=a.ItemType";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable table = new DataTable();

            da.Fill(table);

            LstItems.DataSource = table;
            LstItems.DataBind();
        }
        protected void lnkItemDesc_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            var btn = (LinkButton)sender;
            //btn.CssClass = "nav-link light-text cafenav 1 active";
            var item = (ListViewItem)btn.NamingContainer;
            
            LinkButton lnkItemDesc = (LinkButton)item.FindControl("lnkItemDesc");
            lnkItemDesc.CssClass = "nav-link light-text cafenav active";
            int previousItemIndex = Convert.ToInt32(ViewState["PreviousItemIndex"]);
            ListViewItem lastItem = ListView1.Items[previousItemIndex];
            LinkButton prevLnkItemDesc = (LinkButton)lastItem.FindControl("lnkItemDesc");
            prevLnkItemDesc.CssClass = "nav-link light-text cafenav ";
            int clickedItemIndex = item.DataItemIndex;

            string query = "select a.itemtype,a.itemcode,a.itemdesc,a.Price,a.quantity,a.weightage,a.ItemFileName,a.ItemFilePath " +
            " from Tez_Mst_Cafeteria as a inner join Tez_Mst_Cafeteria_Items as b on b.id=a.ItemType where a.ItemType=" + lnkItemDesc.CommandArgument;

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable table = new DataTable();

            da.Fill(table);

            LstItems.DataSource = table;
            LstItems.DataBind();


        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            var btn = (Button)sender;
            var item = (ListViewItem)btn.NamingContainer;

            Image Image1 = (Image)item.FindControl("Image1");
            Label lblimage = (Label)item.FindControl("lblimage");
            Label lblitemtype = (Label)item.FindControl("lblitemtype");
            Label lblitemcode = (Label)item.FindControl("lblitemcode");
            Label lblName = (Label)item.FindControl("lblName");
            Label lblWeight = (Label)item.FindControl("lblWeight");
            Label lblPrice = (Label)item.FindControl("lblPrice");
            DropDownList ddlincredecre = (DropDownList)item.FindControl("ddlincredecre");

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Trn_Cafeteria_Cart", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ItemType", lblitemtype.Text);
                cmd.Parameters.AddWithValue("@ItemCode", lblitemcode.Text);
                cmd.Parameters.AddWithValue("@ItemDesc", lblName.Text);
                cmd.Parameters.AddWithValue("@ItemFilePath", lblimage.Text);
                cmd.Parameters.AddWithValue("@Price", lblPrice.Text);
                cmd.Parameters.AddWithValue("@Quantity", ddlincredecre.SelectedValue);
                cmd.Parameters.AddWithValue("@Weightage", lblWeight.Text);
                cmd.Parameters.AddWithValue("@Cart", "Y");
                cmd.Parameters.AddWithValue("@CreatedBy", "Murali");
                cmd.ExecuteNonQuery();



                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showModal('success');</script>", false);
            }
            catch (Exception ex)
            {
                logerrors(ex.Message);
            }
            finally
            {
                con.Close();
            }

        }
        public void logerrors(string error)
        {
            string pageName = Path.GetFileName(Request.Path);
            string filename = "Log_" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt";
            string filepath = Server.MapPath("~/ErrorLog/" + filename);
            if (File.Exists(filepath))
            {
                using (StreamWriter stwriter = new StreamWriter(filepath, true))
                {
                    stwriter.WriteLine(DateTime.Now);
                    stwriter.WriteLine("Date and Time");
                    stwriter.WriteLine("Page :" + pageName);
                    stwriter.WriteLine(error);
                    stwriter.WriteLine(DateTime.Now);
                    stwriter.WriteLine("-------------------END-------------");
                }
            }
            else
            {
                StreamWriter stwriter = File.CreateText(filepath);
                stwriter.WriteLine(DateTime.Now);
                stwriter.WriteLine("-------------------START-------------");
                stwriter.WriteLine("Page :" + pageName);
                stwriter.WriteLine(error);
                stwriter.WriteLine(DateTime.Now);
                stwriter.WriteLine("-------------------END-------------");
                stwriter.WriteLine("");
                stwriter.Close();
            }
        }

        protected void ddlincredecre_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDownList = (DropDownList)sender;
            ListViewDataItem listView = (ListViewDataItem)dropDownList.NamingContainer;

            DropDownList ddlincredecre = (DropDownList)listView.FindControl("ddlincredecre");
            Label lblPrice1 = (Label)listView.FindControl("lblPrice1");
            Label lblitemcode = (Label)listView.FindControl("lblitemcode");

            int selectedvalue = Convert.ToInt32(ddlincredecre.SelectedValue);
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            con.Open();
            SqlCommand Cmnd = new SqlCommand("select Price  from Tez_Mst_Cafeteria_Cart where  ItemCode='" + lblitemcode.Text + "'", con);
            int price = Convert.ToInt32(Cmnd.ExecuteScalar());

            lblPrice1.Text = Convert.ToString(selectedvalue * price);


        }
        protected void ListView2_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            ListViewItem item = this.ListView2.Items[e.ItemIndex];
            string id = (item.FindControl("lblItemcode") as Label).Text;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Cafeteria_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ItemCode", id);
                cmd.ExecuteNonQuery();
                //ScriptManager.RegisterStartupScript(this, GetType(), "showerrorModal", "<script language='javascript'>showModal('error');</script>", false);

                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>window.location ='Cafeteria.aspx';</script>", false);
                //}
            }
            catch (Exception ex)
            {
                logerrors(ex.Message);
            }
            finally
            {
                con.Close();
            }


        }
        protected void LstItems_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;
                Panel myDiv = (Panel)e.Item.FindControl("myDiv");
                if (lblQuantity.Text == "0" || String.IsNullOrEmpty(lblQuantity.Text))
                {
                    myDiv.Attributes.Add("style", "display:none");
                }
                DropDownList ddlincredecre = e.Item.FindControl("ddlincredecre") as DropDownList;
                //ddlincredecre.SelectedValue = lblQuantity.Text;

                if (lblQuantity.Text != "")
                {
                    int Qty = int.Parse(lblQuantity.Text);

                    //for (int i = 0; i < Qty; i++)
                    //{
                    //    ddlincredecre.Items.Insert(i, new ListItem(i.ToString()));
                    //}
                    for (int i = 0; i <= Qty; i++)
                    {
                        //if (i == 0)
                        //{
                        //    ddlincredecre.Items.Remove("Select");
                        //}
                        //else if (i <= Qty)
                        //{
                        //    ddlincredecre.Items.Add(i.ToString());                       
                        //}
                        if (i == 0)
                        {
                            ddlincredecre.Items.Remove("Select");
                        }
                        else if (i <= Qty)
                        {
                            ListItem li = new ListItem();
                            li.Text = i.ToString();
                            li.Value = i.ToString();
                            ddlincredecre.Items.Add(li);
                        }
                    }
                }
            }
        }

       

        protected void btncheckstatement_Click(object sender, EventArgs e)
        {
            Response.Redirect("CafeteriaStatement.aspx");
        }
    }
}