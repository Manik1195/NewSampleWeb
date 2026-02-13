using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SampleWebForm
{
    public partial class App : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadProducts();
                if (Request.QueryString["msg"] == "added")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(),
                        "toast",
                        "toastr.success('Product added successfully');",
                        true);

                    // 🔥 Remove query string without reloading page
                    ScriptManager.RegisterStartupScript(this, GetType(),
                        "cleanUrl",
                        "window.history.replaceState({}, document.title, window.location.pathname);",
                        true);
                }


            }
        }
        protected void btn_Submit(object sender, EventArgs e)
        {
         
            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using(SqlConnection con=new SqlConnection(cs))
            {
                string query= @"INSERT INTO Products
                        (ProductName, Price, Category, Description)
                        VALUES
                        (@name, @price, @cat, @des)";
                SqlCommand cmd=new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@price", Price.Text);
                cmd.Parameters.AddWithValue("@cat", Category.Text);
                cmd.Parameters.AddWithValue("@des", Des.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(),
                 "success",
                  "toastr.success('Product added successfully');",
                    true);

            }
            /* Response.Redirect(Request.RawUrl);  *///if we refresh ...it will not call this event again// to avoid duplicate entry
            Response.Redirect("App.aspx?msg=added");

            clearFields();
            LoadProducts();  // after submitting the record..this function will fetch the table updated table data 
        }
        private void clearFields()
        {
            Name.Text = "";
            Category.Text = "";
            Price.Text = "";
            Des.Text = "";
        }
        private void LoadProducts()
        {
            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM dbo.Products";
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvProducts.DataSource = dt;
                    gvProducts.DataBind();
                }
            }
        }
        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            LoadProducts();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            LoadProducts();
        }
        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvProducts.Rows[e.RowIndex];

            string name = ((TextBox)row.FindControl("txtEditName")).Text;
            string cat = ((TextBox)row.FindControl("txtEditCat")).Text;
            string price = ((TextBox)row.FindControl("txtEditPrice")).Text;
            string des = ((TextBox)row.FindControl("txtEditDes")).Text;

            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(@"
            UPDATE Products
            SET ProductName=@n,
                Category=@c,
                Price=@p,
                Description=@d
            WHERE Id=@id", con);

                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@c", cat);
                cmd.Parameters.AddWithValue("@p", price);
                cmd.Parameters.AddWithValue("@d", des);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(),
                 "success",
                  "toastr.success('Product updated successfully');",
                   true);

            }

            gvProducts.EditIndex = -1;
            LoadProducts();
        }
        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

            string cs = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Products WHERE Id=@id", con);

                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(),
                 "success",
                 "toastr.success('Product deleted successfully');",
                    true);

            }

            LoadProducts();
        }


    }

}