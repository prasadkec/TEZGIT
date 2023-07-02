using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TEZBI
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the remember me cookies exist
            //if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
            //{
            //    // Retrieve the username and password from the cookies
            //    string username = Request.Cookies["Username"].Value;
            //    string password = Request.Cookies["Password"].Value;

            //    // Populate the login fields with the stored credentials
            //    txtUserName.Text = username;
            //    txtPassword.Text = password;

            //    // Optionally, you can also set the "Remember Me" checkbox to be checked
            //    flexCheckChecked.Checked = false;
            //}
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Check if the "Remember Me" checkbox is selected
            //if (flexCheckChecked.Checked)
            //{
            //    // Create a cookie to store the username
            //    HttpCookie usernameCookie = new HttpCookie("Username");
            //    usernameCookie.Value = txtUserName.Text;
            //    usernameCookie.Expires = DateTime.Now.AddDays(90); // Set the cookie expiration date (e.g., 30 days from now)
            //    Response.Cookies.Add(usernameCookie);

            //    // Create a cookie to store the password
            //    HttpCookie passwordCookie = new HttpCookie("Password");
            //    passwordCookie.Value = txtPassword.Text;
            //    passwordCookie.Expires = DateTime.Now.AddDays(90); // Set the cookie expiration date (e.g., 30 days from now)
            //    Response.Cookies.Add(passwordCookie);
            //}

            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter();
            string UserName = string.Empty;
            string EmployeeType = string.Empty;
            try
            {
                SqlCommand cmd = new SqlCommand("Sp_Mst_ValidateLogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                cmd.Dispose();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    UserName = ds.Tables[0].Rows[0]["Username"].ToString();
                    EmployeeType = ds.Tables[0].Rows[0]["EmployeeType"].ToString();

                    if (EmployeeType == "Admin")
                    {
                        Session["Username"] = UserName;
                        Session["EmployeeType"] = "Administrator";
                        Response.Redirect("CompanyMaster.aspx");
                    }
                    else if (EmployeeType == "Employee")
                    {
                        Session["Username"] = UserName;
                        Session["EmployeeType"] = EmployeeType;

                        Response.Redirect("Cafeteria.aspx");
                    }
                    else
                    {
                     //popup
                    }
                }
            }
            catch(Exception Ex)
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