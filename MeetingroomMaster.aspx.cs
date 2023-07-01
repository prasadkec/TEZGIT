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
    public partial class MeetingroomMaster : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Sp_Mst_CreateMeetingRoom", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MeetingRoomName ", txtMeetingRoomName.Text);
                cmd.Parameters.AddWithValue("@Credits", txtCredits.Text);
                cmd.Parameters.AddWithValue("@RoomCapacity", txtRoomCapacity.Text);


                Random random = new Random();
                int randomNumber = random.Next();
                string fileExt = Path.GetExtension(fuImage.PostedFile.FileName);
                string fileSavePath = string.Empty;

                if (fuImage.HasFile)
                {
                    string fileExtension = Path.GetExtension(fuImage.PostedFile.FileName);
                    if (fileExtension == ".JPG" || fileExtension == ".PNG" || fileExtension == ".JPEG")
                    {
                        string FileSavePath = Server.MapPath("~/images");
                        if (!Directory.Exists(FileSavePath))
                            Directory.CreateDirectory(FileSavePath);
                        fuImage.PostedFile.SaveAs(Server.MapPath("~/images/" + randomNumber + fileExt));
                        cmd.Parameters.AddWithValue("@FileName", randomNumber + fileExt);
                        string FilePath = "images" + @"\" + randomNumber + fileExt;
                        cmd.Parameters.AddWithValue("@FilePath", FilePath);
                    }
                    else
                    {
                        logerrors("File format you uploaded is not supported");
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FileName", "noimage.jpg");
                    string FilePath = "images" + @"\" + "noimage.jpg";
                    cmd.Parameters.AddWithValue("@FilePath", FilePath);

                }
                cmd.Parameters.AddWithValue("@FileSize", 1235);
                cmd.Parameters.AddWithValue("@CreatedBy", "Murali");
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;
                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "<script language='javascript'>alert('Added Successfully!!');window.location ='MeetingRoomMaster.aspx';</script>", false);
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
            SqlCommand command = new SqlCommand("Sp_Mst_ReadMeetingRoom", con);
            {
                command.CommandType = CommandType.StoredProcedure;
            }
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(command);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GvMeetingRoomMaster.DataSource = ds;
                GvMeetingRoomMaster.DataBind();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        protected void GvMeetingRoomMaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string Id = GvMeetingRoomMaster.DataKeys[e.RowIndex].Value.ToString();
                SqlCommand cmdDelete = new SqlCommand("Sp_Mst_DeleteMeetingRoom", con);
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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Msg", "<script language='javascript'>alert('Deleted Succesfully');window.location ='MeetingRoomMaster.aspx';</script>", false);
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