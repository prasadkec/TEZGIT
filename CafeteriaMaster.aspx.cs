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
    public partial class CafeteriaMaster : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
        public static string message = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                BindCategory();
                BindCafeteriaMaster();
            }
        }
        public void BindCategory()
        {
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("Sp_Mst_SelectItems", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                ddlCategory.DataSource = dr;
                                ddlCategory.DataTextField = "ItemDesc";
                                ddlCategory.DataValueField = "Id";
                                ddlCategory.DataBind();
                                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                            }
                        }
                        con.Close();
                    }
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


        public void BindCafeteriaMaster()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());

            SqlCommand sqlcmd = new SqlCommand("Sp_Mst_ReadCafeteria", con);
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                //if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                //{
                //    sqlcmd.Parameters.Add("@Search", SqlDbType.VarChar).Value = txtSearch.Text.Trim();
                //}
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GvCafeteriaMaster.DataSource = ds;
                GvCafeteriaMaster.DataBind();
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
       




        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
               
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Mst_CreateCafeteria", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CafeType", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@CafeName", txtName.Text);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@Weightage", txtWeightage.Text);

                Random random = new Random();
                int randomNumber = random.Next();
                string fileExt = Path.GetExtension(fuImage.PostedFile.FileName);
                string fileSavePath = string.Empty;

                if (fuImage.HasFile)
                {
                    string fileExtension = Path.GetExtension(fuImage.PostedFile.FileName);
                    if (fileExtension == ".JPG" || fileExtension == ".PNG" || fileExtension == ".JPEG" || fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg" || fileExtension == ".Jpg")
                    {
                        string FileSavePath = Server.MapPath("~/images");
                        if (!Directory.Exists(FileSavePath))
                            Directory.CreateDirectory(FileSavePath);
                        fuImage.PostedFile.SaveAs(Server.MapPath("~/images/" + randomNumber + fileExt));
                        cmd.Parameters.AddWithValue("@FileName", randomNumber + fileExt);
                        string FilePath = "images" + @"\" + randomNumber + fileExt;
                        cmd.Parameters.AddWithValue("@FilePath", FilePath);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FileName", "noimage.jpg");
                    string FilePath = "images" + @"\" + "noimage.jpg";
                    cmd.Parameters.AddWithValue("@FilePath", FilePath);

                }

            

                cmd.Parameters.AddWithValue("@FileSize", 1235);
                cmd.Parameters.AddWithValue("@CreatedBy", Session["Username"]);
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;


                
                string statusMessage = (string)cmd.Parameters["@ERROR"].Value;

                if (statusMessage.Contains(" Added Successfully"))
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showModal('success');</script>", false);


                }
                else if (statusMessage.Contains(" Alredy Exists"))
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "showerrorModal", "<script language='javascript'>showModal('error');</script>", false);
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

        //protected void jhgj_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CafeteriaMaster.aspx");
        //}

        //protected void jhgjs_Click1(object sender, EventArgs e)
        //{
        //    Response.Redirect("CafeteriaMaster.aspx");
        //}

        protected void GvCafeteriaMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                btnUpdate.Visible = true;
                string Id = GvCafeteriaMaster.DataKeys[e.NewEditIndex].Value.ToString();
                if (!string.IsNullOrEmpty(Id))
                {
                    ViewState["ItemCode"] = Id;
                    con.Open();
                    SqlCommand cmdEdit = new SqlCommand("Sp_Cafeteria_Select", con);
                    cmdEdit.CommandType = CommandType.StoredProcedure;
                    cmdEdit.Parameters.AddWithValue("@ItemCode", Id);
                    using (SqlDataReader dr = cmdEdit.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            dr.Read();

                            ItemDesc.Text = dr["ItemDesc"].ToString();
                            Price.Text = dr["Price"].ToString();
                            Quantity.Text = dr["Quantity"].ToString();
                            Weightage.Text = dr["Weightage"].ToString();
                        }
                        dr.Close();
                    }
                }
                PopupShow();
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

        public void PopupShow()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showPopup", "$('#successModal1').modal('show')", true);
        }
        public void PopupHide()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showPopup", "$('#successModal1').modal('hide')", true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Mst_UpdateCafeteria", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ItemCode", ViewState["ItemCode"]);
                cmd.Parameters.AddWithValue("@ItemDesc", ItemDesc.Text);
                cmd.Parameters.AddWithValue("@Price", Price.Text);

                cmd.Parameters.AddWithValue("@Quantity", Quantity.Text);
                cmd.Parameters.AddWithValue("@Weightage", Weightage.Text);
                cmd.Parameters.AddWithValue("@ModifiedBy", Session["Username"]);
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;

                string statusMessage = (string)cmd.Parameters["@ERROR"].Value;

                if (statusMessage.Contains("Updated Successfully"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showupdatesuccessModal", "<script language='javascript'>showModal('updatesuccess');</script>", false);

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

        protected void btnredirect_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("AddCafeItems.aspx");
        }

        

        protected void btncloseadderror_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("CafeteriaMaster.aspx");
        }

        protected void btnUpdatesuccess_Click(object sender, EventArgs e)
        {
            Response.Redirect("CafeteriaMaster.aspx");
        }

        protected void btncloseaddsuccess_Click1(object sender, EventArgs e)
        {
            Response.Redirect("CafeteriaMaster.aspx");
        }
    }
}