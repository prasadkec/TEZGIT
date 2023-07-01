using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            


            string username = txtUserName.Text;
            string password = txtPassword.Text;
            string employeeType = "";

            con.Open();
            using (SqlCommand command = new SqlCommand("Sp_Mst_ValidateLogin", con))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);

                SqlParameter employeeTypeParam = new SqlParameter("@EmployeeType", SqlDbType.VarChar, 20);
                employeeTypeParam.Direction = ParameterDirection.Output;
                command.Parameters.Add(employeeTypeParam);

                command.ExecuteNonQuery();

                employeeType = employeeTypeParam.Value.ToString();
            }
            con.Close();

            if (employeeType == "Admin")
            {
                Session["Username"] = username;
                Session["EmployeeType"] = employeeType;

                Response.Redirect("CafeteriaMaster.aspx");
            }
            else if (employeeType == "Employee")
            {
                Session["Username"] = username;
                Session["EmployeeType"] = employeeType;

                Response.Redirect("Cafeteria.aspx");
            }
            else
            {

                //lblErrorMessage.Text = "Invalid credentials. Please try again.";
            }
        }
    }
}