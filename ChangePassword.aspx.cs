using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;

namespace TEZBI
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string newPassword = txtNewPassword.Text;
            string retypeNewPassword = txtRetypeNewPassword.Text;

            // Check if the new password and retype password match
            if (newPassword == retypeNewPassword)
            {
                // Update the password in the database
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString();


                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Construct the SQL query to update the password
                    string query = "UPDATE Tez_Mst_Employee SET Password = @NewPassword WHERE Username = @Username";

                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@NewPassword", newPassword);
                        command.Parameters.AddWithValue("@Username", username);

                        // Execute the update query
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Password changed successfully
                            // You can display a success message or redirect to another page
                            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showModal('success');</script>", false);
                          

                            //Response.Redirect("ChangePassword.aspx");
                        }
                        else
                        {
                            // No rows affected, username not found
                            // Display an error message
                            lblErrorMessage.Text = "Invalid username. Please try again.";
                        }
                    }
                }
            }
            else
            {
                // Passwords don't match, display an error message
                lblErrorMessage.Text = "Passwords do not match. Please try again.";
            }

        }

        protected void closebutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}