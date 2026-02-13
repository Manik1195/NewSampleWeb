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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clearForm();
            }

        }
        protected void btn_Login(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text.Trim();
            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM USERS WHERE Username=@Username AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    Session["username"] = username;
                    ScriptManager.RegisterStartupScript(this, GetType(),
                  "success",
                   "toastr.success('Logged in successfully');"
                      + "setTimeout(function(){ window.location='App.aspx'; }, 2000);",
                     true);
                    
                   


                }
                else
                {
                    // Login Failed
                    clearForm();
                    /*  ClientScript.RegisterStartupScript(this.GetType(), "alert",
                          "alert('Invalid username or password');", true); */
                    ScriptManager.RegisterStartupScript(this, GetType(),
                    "error",
                     "toastr.error('Invalid username or password');",
                      true);

                }

            }
          

        }
        protected void clearForm()
        {
            txtUser.Text = "";
            txtPassword.Text = "";
        }
    }
}