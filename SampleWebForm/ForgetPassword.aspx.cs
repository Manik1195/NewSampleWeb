using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleWebForm
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                otpfield.Visible = false;
            }

        }
        protected void btn_GenerateOTP(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                lblmsg.Text = "Plese Enter Email";
                return;
            }
            Random rand = new Random();
            string otp=rand.Next(100000, 999999).ToString();

            Session["otp"] = otp;
            Session["ResetEmail"] = txtEmail.Text;

            SendOtpMail(txtEmail.Text, otp);
            otpfield.Visible = true;
            otpdefault.Visible = false;
            lblmsg.Text = "OTP sent successfully!";

        }
        protected void btn_VerifyOTP(object sender, EventArgs e)
        {
            if (Session["otp"] != null)
            {
                if (txtOTP.Text == Session["otp"].ToString())
                {
                    Response.Redirect("ResetPassword.aspx");
                }
                else
                {
                    lblmsg.Text = "Invalid otp";
                }
            }

        }
        private void SendOtpMail(string email,string otp)
        {
            try
            {
                MailMessage msg = new MailMessage();
                msg.To.Add(email);
                msg.Subject = "Password Reset OTP";
                msg.Body = "Your OTP:" + otp;
                msg.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(msg);
            }
            catch (Exception ex)
            {
                lblmsg.Text = "Error sending mail: " + ex.Message;
            }
        }


    }
}