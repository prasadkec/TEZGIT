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
    public partial class Cafeteria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindListViewControls();
            }
        }
        private void BindListViewControls()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
            string query = "select ItemCode,ItemDesc from Tez_Mst_Cafeteria";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable table = new DataTable();

            da.Fill(table);

            ListView1.DataSource = table;
            ListView1.DataBind();
        }

        protected void lnkItemDesc_Click(object sender, EventArgs e)
        {

        }        
    }
}