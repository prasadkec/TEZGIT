using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TEZBI
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendPassword_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;

            // Check if the username exists in the Tez_Mst_Employee table
            if (CheckUsernameExists(username))
            {
                // Show a JavaScript alert with a success message
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessModal", "<script language='javascript'>showModal('success');</script>", false);

            }
            else
            {
                // Show a JavaScript alert with an error message
                string script = "alert('Username not found. Please try again.');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowAlert", script, true);
            }
        }

        private bool CheckUsernameExists(string username)
        {
           
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString();


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Construct the SQL query to check if the username exists
                string query = "SELECT COUNT(*) FROM Tez_Mst_Employee WHERE Username = @Username";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);

                    // Execute the query and get the count of matching records
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count > 0;
                }
            }
        }

        protected void closebutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}