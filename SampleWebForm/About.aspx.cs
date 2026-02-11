using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleWebForm
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Request.QueryString["msg"] == "imp")
                {
                    lblmsg.Text = "all fiels should be filled";
                }
                else if (Request.QueryString["msg"] == "invalid")
                {
                    lblmsg.Text = "Invalid username or password";
                }
                
            }
            

        }
        protected void btnClick(object sender, EventArgs e)
        {
            string username = txtusername.Text;
            string passord = txtpassword.Text;

          
                if (username == "admin" && passord == "admin123")
                {
                    Session["username"] = username;
                    Response.Redirect("App.aspx");
                }
                else if (username=="" || passord == "") { 
                   
                    lblmsg.Text = "all fields should mandatory to fill";
                Response.Redirect("About.aspx?msg=imp");
            }
                else
                {
                    lblmsg.Text = "Invalid username or password";
                Response.Redirect("About.aspx?msg=invalid");
            }
            
            
     

        }
        protected void clearForm()
        {
           txtusername.Text = "";
           txtpassword.Text = "";
            lblmsg.Text = "";

        }
    }
}