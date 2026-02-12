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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clearFields();
               
            }


        }
        protected void btn_Register(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            string name = txtName.Text.Trim();
            string email=txtEmail.Text.Trim();
            string password = txtPasword.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string mobile = "+91" + txtMobile.Text.Trim();
            string username = email;

            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string check = "SELECT COUNT(*) FROM Users WHERE Email=@Email";
                SqlCommand cmdCheck = new SqlCommand(check, con);
                cmdCheck.Parameters.AddWithValue("@Email", email);
                int count = (int)cmdCheck.ExecuteScalar();
                if (count > 0)
                {
                    // Email already exists
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Email is already registered. Please use another email.');", true);
                    return;
                }
                string query= @"INSERT INTO Users 
                                      (Name, Email, Username, Password, Gender, Mobile)
                                      VALUES
                                      (@Name, @Email, @Username, @Password, @Gender, @Mobile)";
                SqlCommand cmd=new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Mobile", mobile);

                cmd.ExecuteNonQuery();

                Response.Redirect("Login.aspx");
            }
        }
        private void clearFields()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPasword.Text = "";
            txtMobile.Text = "";
            ddlGender.SelectedValue = "";

        }
    }
}     