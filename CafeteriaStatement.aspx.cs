using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TEZBI
{
    public partial class CafeteriaStatement : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["con"].ToString());
        private string message;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCafeteriatable();
            }
        }

       
        public void PopupShow()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showPopup", "$('#editModal').modal('show')", true);
        }
        public void PopupHide()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showPopup", "$('#editModal').modal('hide')", true);
        }


        public void BindCafeteriatable()
        {
            SqlCommand sqlcmd = new SqlCommand("Sp_ReadCafeteria", con);
            {
                sqlcmd.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    sqlcmd.Parameters.Add("@Search", SqlDbType.VarChar).Value = txtSearch.Text.Trim();
                }
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlcmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GvCafeteria.DataSource = ds;
                GvCafeteria.DataBind();
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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindCafeteriatable();
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

        protected void closebutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cafeteria.aspx");
        }

       





        //protected void btnUpdate_Click1(object sender, EventArgs e)
        //{
        //    try
        //    {


        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("Sp_UpdateCafeteria", con);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@ItemCode", ViewState["ItemCode"]);
        //            cmd.Parameters.AddWithValue("@ItemDesc", txtItemDesc.Text);
        //            cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
        //            cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text).ToString() );
        //            cmd.Parameters.AddWithValue("@Weightage", txtWeightage.Text);
        //            cmd.Parameters.AddWithValue("@ModifiedBy", "Murali");
        //            cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
        //            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
        //            cmd.ExecuteNonQuery();
        //            message = (string)cmd.Parameters["@ERROR"].Value;
        //            ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('Updated Successfully!!');window.location ='CafeteriaStatement.aspx';</script>", false);

        //    }
        //    catch (Exception ex)
        //    {
        //        logerrors(ex.Message);
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }

        //}

        //protected void GvCafeteria_RowEditing1(object sender, GridViewEditEventArgs e)
        //{
        //    try
        //    {
        //        btnUpdate.Visible = true;
        //        string Id = GvCafeteria.DataKeys[e.NewEditIndex].Value.ToString();
        //        if (!string.IsNullOrEmpty(Id))
        //        {
        //            ViewState["ItemCode"] = Id;
        //            con.Open();
        //            SqlCommand cmdEdit = new SqlCommand("Sp_Cafeteria_Select", con);
        //            cmdEdit.CommandType = CommandType.StoredProcedure;
        //            cmdEdit.Parameters.AddWithValue("@ItemCode", Id);
        //            using (SqlDataReader dr = cmdEdit.ExecuteReader())
        //            {
        //                if (dr.HasRows)
        //                {
        //                    dr.Read();

        //                    txtItemDesc.Text = dr["ItemDesc"].ToString();
        //                    txtPrice.Text = dr["Price"].ToString();
        //                    txtQuantity.Text = dr["Quantity"].ToString();
        //                    txtWeightage.Text = dr["Weightage"].ToString();
        //                }
        //                dr.Close();
        //            }
        //        }
        //        PopupShow();
        //    }
        //    catch (Exception ex)
        //    {
        //        logerrors(ex.Message);
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}
    }
}