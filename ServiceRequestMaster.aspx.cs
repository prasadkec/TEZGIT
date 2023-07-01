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
    public partial class ServiceRequestMaster : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
        public static string message = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindServiceRequestMaster();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand("Sp_Mst_CreateServiceRequest", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@ServiceType", ddlServiceRequest.SelectedValue);
                command.Parameters.AddWithValue("@ServiceIssue", txtServiceIssue.Text);
            
                command.Parameters.AddWithValue("@CreatedBy", "ilayaraja");
                command.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                command.Parameters["@ERROR"].Direction = ParameterDirection.Output;


                command.ExecuteNonQuery();
                message = (string)command.Parameters["@ERROR"].Value;
                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('Added Successfully!!');window.location ='EmployeeMaster.aspx';</script>", false);


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

        public void BindServiceRequestMaster()
        {
            SqlCommand command = new SqlCommand("Sp_Mst_ReadServiceRequest", con);
            {
                command.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GvServiceRequestMaster.DataSource = ds;
                GvServiceRequestMaster.DataBind();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        protected void GvServiceRequestMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Id = GvServiceRequestMaster.DataKeys[e.RowIndex].Value.ToString();
                SqlCommand cmdDelete = new SqlCommand("Sp_Mst_DeleteServiceRequest", con);
                cmdDelete.CommandType = CommandType.StoredProcedure;
                cmdDelete.Parameters.AddWithValue("@Id", Id);
                cmdDelete.Parameters.AddWithValue("@ModifiedBy", "ilayaraja");
                cmdDelete.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmdDelete.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                con.Open();
                int k = cmdDelete.ExecuteNonQuery();
                message = (string)cmdDelete.Parameters["@ERROR"].Value;
                cmdDelete.Dispose();
                if (k != 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Msg", "<script language='javascript'>alert('Deleted Succesfully');window.location ='ServiceRequestMaster.aspx';</script>", false);
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