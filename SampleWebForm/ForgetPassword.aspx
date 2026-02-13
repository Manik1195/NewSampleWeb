<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="SampleWebForm.ForgetPassword" %>

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
        *{
            margin:0;
            padding:0;
        }
        body{
            background:#eee;
        }
        .otp-container{
            display:flex;
            gap:30px;
            justify-content:center;
            max-width:500px;
            width:100%;
            margin:150px auto;
            padding:20px;
            position:relative;
            padding-top:30px;
            background:#fff;
            box-shadow:0px 0px 10px #9d9292;
            border-radius:10px;
            padding-top:50px;

        }
        .GOTP, .VOTP {
            display: flex;
            flex-flow: column;
            width: 50%;
            gap: 20px;
        }

        .input-field {
            background-color: #eee;
            padding: 10px;
            border: none;
            border-radius: 5px;
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
        .btn:hover{
            background-color:#9575CD;
            transition:.5s;
        }
        .header{
            position:absolute;
            width:40%;
            top:-30px;
            left:30%;
            padding:5px;
           background:#fff;
           border-radius:5px;
           text-align:center;
           font-family:sans-serif;
          
            
        }
       

    </style>
</head>
<body>
    <form id="form1" runat="server">
       
      <div class="otp-container">
          <div class="header">
              <h2>Generate OTP</h2>
          </div>
        
      <div class="GOTP" id="otpdefault" runat="server">
              <asp:TextBox ID="txtEmail" placeholder="Enter Email" runat="server" CssClass="input-field"></asp:TextBox>
              <asp:Button ID="btn1" Text="Generte OTP" runat="server" OnClick="btn_GenerateOTP" CssClass="btn" />
              </div>
        <div class="VOTP" visible="false" id="otpfield" runat="server">
            <asp:TextBox ID="txtOTP" placeholder="Enter OTP" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:Button ID="btn2" Text="Verify OTP" runat="server" OnClick="btn_VerifyOTP" CssClass="btn" />
             <asp:Label runat="server" ID="lblmsg"></asp:Label>
        </div>

          </div>
        
    </form>
</body>
</html>
