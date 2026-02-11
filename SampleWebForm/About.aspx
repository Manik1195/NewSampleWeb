<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SampleWebForm.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container{
            display:flex;
            flex-flow:column;
            gap:20px;
           
        }
    .btn{
        border:none;
        display:flex;
        outline:none;
        padding:10px;
        color:#fff;
        background-color:blueviolet;
        width:100px;
        font-family:sans-serif;
        width:100%;
 
 
       
    }
    .input-field{
        border:none;
        outline:none;
        border:1px solid #999;
        padding:5px;
    }

</style>
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>

    <div class="container">
     <asp:TextBox runat="server" CssClass="input-field"  ID="txtusername" ></asp:TextBox>
        <asp:TextBox runat="server" CssClass="input-field" ID="txtpassword"></asp:TextBox>
    <asp:Button runat="server" CssClass="btn" ID="btn1"  Text="Click" OnClick="btnClick"></asp:Button>
        <asp:Label runat="server" ID="lblmsg" style="color:red;"></asp:Label>
        </div>
   
</asp:Content>
