<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SampleWebForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Momo+Signature&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
    <title></title>
    <style>
        *{
            margin:0;
            padding:0;
        }
        body{
            background:#eee;
        }
        .Log-container {
            display:grid;
            grid-template-columns:1fr 1fr;
            max-width: 800px;
            height:400px;
            width: 100%;
            margin: 60px auto;
            background-color: #fff;
            box-shadow: 0px 0px 10px #a59e9e;
            border-radius: 10px;
            
        }
        .form-container{
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
            width:94%;
            margin-top:20px;
            margin-left:10px;
            margin-bottom:10px;
            font-family:"Roboto";
        }
        .heading h2{
            text-align:center;
            font-family:sans-serif;
            margin-bottom:10px;
            margin-top:10px;
            font-family:"Montserrat";
        }
        .line{
            border-top:1px solid #eee;
            width:100%;
            margin-bottom:30px;
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
        .link{
            display:flex;
            justify-content:center;
            gap:10px;
            margin-top:5px;
            margin-bottom:10px;
            font-family:"Poppins";
        }
        .link p{
            color:#888;
            font-size:12px;
        }
        .link a{
            text-decoration:none;
            font-size:12px;
        }
        .image img{
            width:100%;
            height:100%;
            object-fit:cover;
            border-bottom-left-radius:10px;
            border-top-left-radius:10px;
        }
        .forget a{
            text-decoration:none;
            margin-top:60px;
            display:flex;
            justify-content:center;
            font-size:12px;
            font-family:sans-serif;
        }
    </style>
</head>
<body>
  
         <div class="Log-container">
             <div class="image">
                 <img src="assets/login.jpg" />
             </div>
            
             <div class="form-container">
                    <form id="form1" runat="server" autocomplete="off">
            <div class="heading">
                <h2>Login</h2>
                <div class="line"></div>
            </div>
                 <div class="form-group">
                     <asp:TextBox runat="server" ID="txtUser" placeholder="Username" CssClass="input-field"></asp:TextBox>
                     <asp:RequiredFieldValidator
                         runat="server"
                         ControlToValidate="txtUser"
                         ErrorMessage="UserName is required"
                         ForeColor="Red"
                         Display="Dynamic"
                         autocomplete="off"
                         CssClass="validate">
                     </asp:RequiredFieldValidator>

                
            </div>
             <div class="form-group">
              
                   <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" placeholder="password" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator
                     runat="server"
                     ControlToValidate="txtPassword"
                     ErrorMessage="Password is required"
                     ForeColor="Red"
                     autocomplete="new-password"
                     Display="Dynamic"></asp:RequiredFieldValidator>

             </div>
                 <div class="form-btn">
                     <asp:Button runat="server" ID="btn" OnClick="btn_Login" Text="Login" CssClass="btn" />
                 </div>
                        </form>
                  <div class="link">
                 <p>Are you new to this site?</p>
                 <a href="Register.aspx">Click here to Register</a>
             </div>
                 <div class="forget">
                     <a href="#">Forgot password?</a>
                 </div>
             </div>
              
            
         </div>
  
 
</body>
</html>
