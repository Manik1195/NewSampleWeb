<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="App.aspx.cs" Inherits="SampleWebForm.App" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body{
            background-color:#eee;
        }
        .container1 {
            display: grid;
            margin: 80px auto;
            max-width: 500px;
            width: 100%;
            padding: 20px;
            position: relative;
            box-shadow: 0px 0px 10px #d0c5c5;
            border-radius: 10px;
            background-color:#fff;
        }

        .form-group {
            display: flex;
        }

        .input-field {
            border: none;
            background-color: #eee;
            border-radius: 5px;
            padding: 5px;
        }

            .input-field:focus {
                border:1px solid #e6d9d9 !important;
                outline: none !important;
                transition:.5s;

            }

        .lbl {
            width: 150px;
        }

        .header {
            width: 50%;
            position: absolute;
            top: -30px;
            left: 25%;
            background-color: #2e88cf;
            color: #fff;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-container {
            margin-top: 60px;
        }
      .btn{
         
          border:none;
          outline:none;
          background-color:#2b6ee2;
          border-radius:10px;
          color:#fff;
          width:100px;
          margin-left:30px;
      }
      .btn:hover{
          background-color:#5482d0;
          transition:.4s ease-in;
          transform:scale(1.03);
          color:#fff;
      }
        .btn-1 {
            display: flex;
            justify-content: center;
        }

        .grid {
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px #7a7474;
            border-radius: 8px;
            overflow: hidden;
        }

            .grid th {
                background: #2e88cf;
                color: white;
                padding: 12px;
                text-align: left;
            }

            .grid td {
                padding: 10px;
                border-bottom: 1px solid #eee;
            }

            .grid tr:hover {
                background: #f5f9ff;
            }

            .grid tr:nth-child(even) {
                background: #f5efef;
            }
            .grid th,
            .grid td {
                border-left: none !important;
                border-right: none !important;
                border-top: none;
            }
            .grid-container{
               
            }
        i {
            background-color: rebeccapurple;
            color: #fff;
            padding: 5px;
            margin-left: 5px;
            border-radius: 5px;
            width:50px;
        }
        i:hover{
            background-color:#9360c5;
            transition:0.6s;
        }

        .grid a {
            text-decoration: none !important;
        }

            .grid a:hover {
                text-decoration: none !important;
            }
            .warn{
                color:red;
            }

    
    </style>
    <div class="container1">
        <div class="header">
        <h2>Add Product</h2>
            </div>
        <div class="form-container">
        <div class="form-group">
            <asp:Label runat="server" ID="lblName" Text="Name:" CssClass="lbl"></asp:Label>
        <asp:TextBox runat="server" ID="Name" CssClass="input-field" ></asp:TextBox>
            </div>
        <div class="form-group">
             <asp:Label runat="server" ID="lblCategory" Text="Category:" CssClass="lbl"></asp:Label>
        <asp:TextBox runat="server" ID="Category" CssClass="input-field" ></asp:TextBox>
            </div>
        <div class="form-group">
             <asp:Label runat="server" ID="lblPrice" Text="Price:" CssClass="lbl"></asp:Label>
         <asp:TextBox runat="server" ID="Price" CssClass="input-field" ></asp:TextBox>
            </div>
        <div class="form-group"> 
             <asp:Label runat="server" ID="lblDes" Text="Description:" CssClass="lbl"></asp:Label>
         <asp:TextBox runat="server" ID="Des" CssClass="input-field" ></asp:TextBox>
            </div>
            <asp:Label runat="server" ID="lblwarn" CssClass="warn"></asp:Label>
            
        <div class="btn-1">
            <asp:Button runat="server" ID="btn" Text="Submit" CssClass="btn" OnClick="btn_Submit" />
        </div>
        </div>

    </div>
    <div class="grid-container">
<asp:GridView ID="gvProducts"
    runat="server"
    AutoGenerateColumns="false"
    CssClass="grid"
    GridLines="None"
    DataKeyNames="Id"
    width="100%"
    OnRowEditing="gvProducts_RowEditing"
    OnRowCancelingEdit="gvProducts_RowCancelingEdit"
    OnRowUpdating="gvProducts_RowUpdating"
    OnRowDeleting="gvProducts_RowDeleting">

    <Columns>

        
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <%# Eval("Id") %>
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:TemplateField HeaderText="Product">
            <ItemTemplate>
                <%# Eval("ProductName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditName"
                    runat="server"
                    Text='<%# Bind("ProductName") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

      
        <asp:TemplateField HeaderText="Category">
            <ItemTemplate>
                <%# Eval("Category") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditCat"
                    runat="server"
                    Text='<%# Bind("Category") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                ₹ <%# Eval("Price") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditPrice"
                    runat="server"
                    Text='<%# Bind("Price") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <%# Eval("Description") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditDes"
                    runat="server"
                    Text='<%# Bind("Description") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton runat="server"
                    CommandName="Edit">
                  
                      <i class="bi bi-pencil-square"></i>
                    </asp:LinkButton>

                <asp:LinkButton runat="server"
                    CommandName="Delete"
                    Text="Delete"
                   
                    OnClientClick="return confirm('Delete this product?');" >
                     <i class="bi bi-trash"></i>
                </asp:LinkButton>

                
            </ItemTemplate>

            <EditItemTemplate>
                <asp:LinkButton runat="server"
                    CommandName="Update"
                    Text="Update"
                    CssClass="btn btn-sm btn-success" />

                <asp:LinkButton runat="server"
                    CommandName="Cancel"
                    Text="Cancel"
                    CssClass="btn btn-sm btn-secondary" />
            </EditItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

        </div>

    
  
</asp:Content>
 
