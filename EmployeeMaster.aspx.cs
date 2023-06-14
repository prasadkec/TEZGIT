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
                 SqlCommand command = new SqlCommand("sp_mst_CompanyNamesindd", con);
                    command.CommandType = CommandType.StoredProcedure;

                con.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    selectMenu.Items.Clear(); // Clear any existing items

                    while (reader.Read())
                    {
                        string companyName = reader["CompanyName"].ToString();
                        selectMenu.Items.Add(new ListItem(companyName, companyName));
                    }

                    reader.Close();
                con.Close();
                BindCompanyMaster();

            }

        }

        public void BindCompanyMaster()
        {
            SqlCommand command = new SqlCommand("sp_mst_viewemployee", con);
            {
                command.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GvEmployeeMaster.DataSource = ds;
                GvEmployeeMaster.DataBind();
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
                SqlCommand command = new SqlCommand("sp_mst_insertemployee", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;



                command.Parameters.AddWithValue("@CompanyID", selectMenu.SelectedValue);
                command.Parameters.AddWithValue("@EmployeeName", txtEmpName.Text);
                command.Parameters.AddWithValue("@EmailID", txtEmpID.Text);
                command.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text);
                command.Parameters.AddWithValue("@AuthorizedPerson", txtAuthorizedperson.Text);
                command.Parameters.AddWithValue("@CreatedBy", "ilayaraja");
                command.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                command.Parameters["@ERROR"].Direction = ParameterDirection.Output;


                command.ExecuteNonQuery();
                message = (string)command.Parameters["@ERROR"].Value;
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