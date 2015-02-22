<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BI_Project._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome, please enter your credentials</h2>
  <div style="width: 40%; height: 250px; float: none; vertical-align: top; display: inline;"
         align="center">
        <form action="main.aspx" method="post">
     
           <asp:Login ID="Login1" runat="server" OnLoggingIn="LoginClick">
           </asp:Login>
        <asp:Literal ID="Feedback" runat="server"></asp:Literal>
       </form>
    </div>
</asp:Content>
