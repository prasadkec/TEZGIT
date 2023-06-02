using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            SqlCommand sqlcmd = new SqlCommand("sp_mst_viewcompany", con);
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
            }
            try
            {
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
                SqlCommand cmd = new SqlCommand("sp_mst_insertcompany", con);
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
                Response.Write("<script>alert('" + message + "');</script>");
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
    }
}
