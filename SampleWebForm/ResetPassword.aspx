<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="SampleWebForm.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <!-- Toastr CSS -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

<!-- jQuery (Required) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Toastr JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Momo+Signature&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
    <style>
        body{
            background-color:#eee;
        }
        .reset-container{
            display:grid;
            width:600px;
            margin:150px auto;
            box-shadow:0px 0px 10px #8c8383;
            border-radius:10px;
            padding:20px;
            background-color:#fff;
            padding-top:40px;
            padding-bottom:30px;
            position:relative;
        }
        .field-container{
            width:50%;
            display:flex;
            flex-flow:column;
            margin:0 auto;
            gap:10px;
        }
        .input-field{
            border:none;
            background-color:#eee;
            border-radius:5px;
            padding:10px;
        }
        .input-field::placeholder{
            font-family:"Montserrat";
        }
        .btn{
              padding:10px;
            border:none;
            outline:none;
            background-color:#7645cb;  
            color:#fff;
            border-radius: 5px;
            font-family:"Montserrat";

        }
         .header{
            position:absolute;
            width:40%;
            top:-30px;
            left:30%;
           font-family:sans-serif;
           background:#fff;
           border-radius:5px;
           text-align:center;
           font-family:sans-serif;
           }
           .btn:hover{
            background-color:#9575CD;
            transition:.5s;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="reset-container">
                 <div class="header">
              <h2>Generate OTP</h2>
          </div>
                <div class="field-container">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                <asp:TextBox ID="txtcreate" runat="server" placeholder="Create new Password" CssClass="input-field"></asp:TextBox>
                       <asp:RequiredFieldValidator
                         runat="server"
                         ControlToValidate="txtcreate"
                         ErrorMessage="Password is required"
                         ForeColor="Red"
                         autocomplete="new-password"
                         Display="Dynamic">
                     </asp:RequiredFieldValidator>

                     <asp:RegularExpressionValidator
                         runat="server"
                         ControlToValidate="txtcreate"
                         ValidationExpression="^.{6,}$"
                         ErrorMessage="Password must be at least 6 characters"
                         ForeColor="Red"
                         Display="Dynamic">
                     </asp:RegularExpressionValidator>
                <asp:TextBox ID="txtconfirm" runat="server" placeholder="Confirm Password" CssClass="input-field"></asp:TextBox>
                <asp:Button ID="btn" Text="Reset Password" runat="server" OnClick="btn_ResetPassword" CssClass="btn" />
                    </div>
            </div>
        </div>
    </form>
</body>
</html>
