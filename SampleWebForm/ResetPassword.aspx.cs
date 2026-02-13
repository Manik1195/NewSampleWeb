using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleWebForm
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_ResetPassword(object sender,EventArgs e)
        {
            if (txtcreate.Text != txtconfirm.Text)
            {
                lblMsg.Text = "Passwords do not match";
                txtcreate.Text = "";
                txtconfirm.Text = "";
                return;
            }
            if (Session["ResetEmail"] ==null)
            {
                lblMsg.Text = "Session Expired ,Try again";
                Response.Redirect("Login.aspx");
            }
            string email = Session["ResetEmail"].ToString();
            string newPassword = txtcreate.Text;
            string query = "UPDATE Users SET Password=@password WHERE Email=@email";
            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs)){
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@password",newPassword);
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    Session.Remove("ResetEmail");
                    Session.Remove("otp");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMsg.Text = "User not found";
                }
            }

        }
    }
}