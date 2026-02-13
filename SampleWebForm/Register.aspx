<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SampleWebForm.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <!-- Toastr CSS -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

<!-- jQuery (Required) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Momo+Signature&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
    <style>
        body{
            background-color:#eee;
        }
        .Reg-container{
            display:grid;
           max-width:500px;
           width:100%;
           margin:60px auto;
           background-color:#fff;
           box-shadow:0px 0px 10px #a59e9e;
           border-radius:10px;
           padding:10px;
           

        }
        .input-field{
            margin-top:20px;
            padding:10px;
            border-radius:5px;
            width:90%;
            border:none;
            background-color:#eee;
            margin-left:10px;
        }
        .btn{
            border:none;
            outline:none;
            padding:10px;
            background-color:#4875d0;
            color:#fff;
            border-radius:5px;
            width:93%;
            margin-top:20px;
            margin-left:10px;
            margin-bottom:10px;
        }
        .heading h2{
            text-align:center;
            font-family:sans-serif;
        }
        .line{
            border-top:1px solid #eee;
            width:100%;
        }
        .input-field:focus{
            border:none;
            outline:none;
            transition:.5s;
            border:1px solid #888;
        }
        .btn:hover{
            background-color:#7798d9;
            transition:.6s;
        }
        .validate{
            margin-top:5px;
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
         <div class="Reg-container">
            <div class="heading">
                <h2>Register</h2>
                <div class="line"></div>
            </div>
             <div class="form-container">
                 <div class="form-group">
                     <asp:TextBox runat="server" ID="txtName" placeholder="Name" CssClass="input-field"></asp:TextBox>
                     <asp:RequiredFieldValidator
                         runat="server"
                         ControlToValidate="txtName"
                         ErrorMessage="Name is required"
                         ForeColor="Red"
                         Display="Dynamic"
                         CssClass="validate">
                     </asp:RequiredFieldValidator>

                
            </div>
             <div class="form-group">
              
                 <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Email"></asp:TextBox>
                 <asp:RequiredFieldValidator
                     runat="server"
                     ControlToValidate="txtEmail"
                     ErrorMessage="Email is required"
                     ForeColor="Red"
                     autocomplete="off"
                     Display="Dynamic"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator
                     runat="server"
                     ControlToValidate="txtEmail"
                     ValidationExpression="^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$"
                     ErrorMessage="Enter valid email"
                     ForeColor="Red"
                     Display="Dynamic">
                 </asp:RegularExpressionValidator>
             </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtPasword" runat="server" CssClass="input-field" placeholder="password" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator
                         runat="server"
                         ControlToValidate="txtPasword"
                         ErrorMessage="Password is required"
                         ForeColor="Red"
                         autocomplete="new-password"
                         Display="Dynamic">
                     </asp:RequiredFieldValidator>

                     <asp:RegularExpressionValidator
                         runat="server"
                         ControlToValidate="txtPasword"
                         ValidationExpression="^.{6,}$"
                         ErrorMessage="Password must be at least 6 characters"
                         ForeColor="Red"
                         Display="Dynamic">
                     </asp:RegularExpressionValidator>

                 </div>
                 <div class="form-group">
                     <asp:DropDownList runat="server" ID="ddlGender" CssClass="input-field" Style="width: 93%">
                         <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                         <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                         <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                         <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator
                         runat="server"
                         ControlToValidate="ddlGender"
                         InitialValue=""
                         ErrorMessage="Please select gender"
                         ForeColor="Red"
                         Display="Dynamic">
                     </asp:RequiredFieldValidator>

             </div>
             <div class="form-group">
                 <div style="display: flex; align-items: center;">
                     <span style="padding: 10px 10px; border-radius: 5px; background: #eee; margin-top: 20px; margin-left: 10px; margin-right: 10px;">+91</span>
                     <asp:TextBox runat="server" ID="txtMobile" MaxLength="10"
                         Width="75%" placeholder="Enter 10-digit number" CssClass="input-field"></asp:TextBox>
                     <asp:RequiredFieldValidator
                         runat="server"
                         ControlToValidate="txtMobile"
                         ErrorMessage="Mobile number required"
                         ForeColor="Red"
                         Display="Dynamic">
                     </asp:RequiredFieldValidator>

                     <asp:RegularExpressionValidator
                         runat="server"
                         ControlToValidate="txtMobile"
                         ValidationExpression="^\d{10}$"
                         ErrorMessage="Enter valid 10-digit number"
                         ForeColor="Red"
                         Display="Dynamic">
                     </asp:RegularExpressionValidator>

                     </div></div>
             <div class="form-btn">
                 <asp:Button runat="server" ID="btn" OnClick="btn_Register" Text="Register" CssClass="btn" />
             </div>
                 </div>
             </div>
    </form>
</body>
</html>
