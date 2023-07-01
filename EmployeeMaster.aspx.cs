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
    public partial class EmployeeMaster : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
        public static string message = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (!IsPostBack)
            {
                BindCompanyName();
                BindEmployeeMaster();
            }

        }

        public void BindCompanyName()
        {
            

            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("sp_mst_CompanyNamesindd", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                ddlCompanyName.DataSource = dr;
                                ddlCompanyName.DataTextField = "CompanyName";
                                ddlCompanyName.DataValueField = "CompanyId";
                                ddlCompanyName.DataBind();
                                ddlCompanyName.Items.Insert(0, new ListItem("-Select-", "0"));
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
        public void BindEmployeeMaster()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            SqlCommand sqlcmd = new SqlCommand("Sp_Mst_ReadEmployee", con);
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
                GvEmployeeMaster.DataSource = ds;
                GvEmployeeMaster.DataBind();
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
                SqlCommand command = new SqlCommand("Sp_Mst_CreateEmployee", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CompanyID", ddlCompanyName.SelectedValue);
                command.Parameters.AddWithValue("@EmployeeType", ddlemptype.SelectedValue);
                command.Parameters.AddWithValue("@EmployeeId", txtEmployeeId.Text);
                command.Parameters.AddWithValue("@EmployeeName", txtEmpName.Text);
                command.Parameters.AddWithValue("@EmailID", txtEmpID.Text);
                command.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text);
                command.Parameters.AddWithValue("@AuthorizedPerson", txtAuthorizedperson.Text);                
                command.Parameters.AddWithValue("@Password", GenerateRandomValue(8));
                command.Parameters.AddWithValue("@CreatedBy", Session["Username"]);
                command.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                command.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                command.ExecuteNonQuery();
                message = (string)command.Parameters["@ERROR"].Value;

                //ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showSuccessModal();</script>", false);
                //ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('" + message + "');window.location ='CompanyMaster.aspx';</script>", false);

                string statusMessage = (string)command.Parameters["@ERROR"].Value;

                if (statusMessage.Contains("Added Successfully"))
                {
                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showModal('success');</script>", false);
                }
                else if (statusMessage.Contains("Already Exists"))
                {
                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "showErrorModal", "<script language='javascript'>showModal('error');</script>", false);
                }

                con.Close();
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

        public string GenerateRandomValue(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
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

       

        protected void GvEmployeeMaster_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                btnUpdate.Visible = true;
                string Id = GvEmployeeMaster.DataKeys[e.NewEditIndex].Value.ToString();
                if (!string.IsNullOrEmpty(Id))
                {
                    ViewState["EmployeeId"] = Id;
                    con.Open();
                    SqlCommand cmdEdit = new SqlCommand("Sp_Mst_Employee_Select", con);
                    cmdEdit.CommandType = CommandType.StoredProcedure;
                    cmdEdit.Parameters.AddWithValue("@EmployeeId", Id);
                    using (SqlDataReader dr = cmdEdit.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            dr.Read();
                          
                            EmployeeName.Text = dr["EmployeeName"].ToString();
                            EmailId.Text = dr["EmailID"].ToString();
                            AuthorizedPerson.Text = dr["AuthorizedPerson"].ToString();
                            ContactNumber.Text = dr["ContactNumber"].ToString();
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
                SqlCommand cmd = new SqlCommand("Sp_Mst_UpdateEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeId", ViewState["EmployeeId"]);
                cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName.Text);
                cmd.Parameters.AddWithValue("@EMailID", EmailId.Text);
                
                cmd.Parameters.AddWithValue("@AuthorizedPerson", AuthorizedPerson.Text);
                cmd.Parameters.AddWithValue("@ContactNumber", ContactNumber.Text);
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

        protected void GvEmployeeMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string EmployeeId = GvEmployeeMaster.DataKeys[e.RowIndex].Value.ToString();
                SqlCommand cmdDelete = new SqlCommand("Sp_Mst_DeleteEmployee", con);
                cmdDelete.CommandType = CommandType.StoredProcedure;
                cmdDelete.Parameters.AddWithValue("@EmployeeId", EmployeeId);
                cmdDelete.Parameters.AddWithValue("@ModifiedBy", Session["Username"]);
                cmdDelete.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmdDelete.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                con.Open();
                int k = cmdDelete.ExecuteNonQuery();
                message = (string)cmdDelete.Parameters["@ERROR"].Value;
                cmdDelete.Dispose();
                if (k != 0)
                {

                    string statusMessage = (string)cmdDelete.Parameters["@ERROR"].Value;

                    if (statusMessage.Contains("Deleted Successfully"))
                    {


                          ScriptManager.RegisterStartupScript(this, this.GetType(), "showdeletesuccessModal", "<script language='javascript'>showModal('deletesuccess');</script>", false);

                    }


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