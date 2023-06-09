using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace TEZBI
{
    public partial class CompanyMaster : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
        public static string message = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCompanyMaster();
            }
        }
        public void BindCompanyMaster()
        {
            SqlCommand sqlcmd = new SqlCommand("Sp_Mst_ReadCompany", con);
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    sqlcmd.Parameters.Add("@Search", SqlDbType.VarChar).Value = txtSearch.Text.Trim();
                }
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GvCompanyMaster.DataSource = ds;
                GvCompanyMaster.DataBind();
            }
            catch (Exception ex)
            {

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
                SqlCommand cmd = new SqlCommand("Sp_Mst_CreateCompany", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CompanyId", txtCompanyId.Text);
                cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("@CompanyEMailID", txtEmailId.Text);
                cmd.Parameters.AddWithValue("@AuthorizedPerson", txtAuthorizedPerson.Text);
                cmd.Parameters.AddWithValue("@ContactNumber", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@CreatedBy", "ilayaraja");
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;
                //Response.Write("<script>alert('" + message + "');window.location ='CompanyMaster.aspx';</script>");
                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('Added Successfully!!');window.location ='CompanyMaster.aspx';</script>", false);
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

        protected void GvCompanyMaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvCompanyMaster.PageIndex = e.NewPageIndex;
            BindCompanyMaster();

            //GridView1.Attributes.Add( tab - pane fade show active
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindCompanyMaster();
        }

        protected void GvCompanyMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                btnUpdate.Visible = true;
                string Id = GvCompanyMaster.DataKeys[e.NewEditIndex].Value.ToString();
                if (!string.IsNullOrEmpty(Id))
                {
                    ViewState["CompanyId"] = Id;
                    con.Open();
                    SqlCommand cmdEdit = new SqlCommand("Sp_Mst_Company_Select", con);
                    cmdEdit.CommandType = CommandType.StoredProcedure;
                    cmdEdit.Parameters.AddWithValue("@CompanyId", Id);
                    using (SqlDataReader dr = cmdEdit.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            dr.Read();
                            CompanyName.Text = dr["CompanyName"].ToString();
                            EmailId.Text = dr["CompanyEmailID"].ToString();
                            ContactNo.Text = dr["ContactNumber"].ToString();
                            AuthorizedPerson.Text = dr["AuthorizedPerson"].ToString();                            
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showPopup", "$('#successModal').modal('show')", true);
        }
        public void PopupHide()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showPopup", "$('#successModal').modal('hide')", true);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Mst_UpdateCompany", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CompanyId", ViewState["CompanyId"]);
                cmd.Parameters.AddWithValue("@CompanyName", CompanyName.Text);
                cmd.Parameters.AddWithValue("@CompanyEMailID", EmailId.Text);
                cmd.Parameters.AddWithValue("@AuthorizedPerson", AuthorizedPerson.Text);
                cmd.Parameters.AddWithValue("@ContactNumber", ContactNo.Text);
                cmd.Parameters.AddWithValue("@ModifiedBy", "ilayaraja");
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;               
                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('Updated Successfully!!');window.location ='CompanyMaster.aspx';</script>", false);
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

        protected void GvCompanyMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string CompanyId = GvCompanyMaster.DataKeys[e.RowIndex].Value.ToString();
                SqlCommand cmdDelete = new SqlCommand("Sp_Mst_DeleteCompany", con);
                cmdDelete.CommandType = CommandType.StoredProcedure;
                cmdDelete.Parameters.AddWithValue("@CompanyId", CompanyId);
                cmdDelete.Parameters.AddWithValue("@ModifiedBy", "ilayaraja");                
                cmdDelete.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmdDelete.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                con.Open();
                int k = cmdDelete.ExecuteNonQuery();
                message = (string)cmdDelete.Parameters["@ERROR"].Value;
                cmdDelete.Dispose();
                if (k != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Msg", "<script language='javascript'>alert('Deleted Succesfully');window.location ='CompanyMaster.aspx';</script>", false);
                    return;
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
    }
}
