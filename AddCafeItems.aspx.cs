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
    public partial class AddCafeItems : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
        public static string message = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCafeteriaItemsMaster();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Sp_Mst_CreateItems", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ItemDesc", txtItemName.Text);
                cmd.Parameters.AddWithValue("@CreatedBy", "Murali");
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;

                //string statusMessage = (string)cmd.Parameters["@ERROR"].Value;

                //if (statusMessage.Contains(" Added Successfully"))
                //{
                    ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('Added Successfully!!');window.location ='AddCafeItems.aspx';</script>", false);


                    //ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showModal('success');</script>", false);
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

        public void BindCafeteriaItemsMaster()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            SqlCommand sqlcmd = new SqlCommand("Sp_Mst_ReadCafeteriaItems", con);
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
                GvCafeItemsMaster.DataSource = ds;
                GvCafeItemsMaster.DataBind();
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
            Response.Redirect("CafeteriaMaster.aspx");
        }
    }
}