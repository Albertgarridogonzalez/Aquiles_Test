<%@ Page Title="LOGIN" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.vb" Inherits="WebApp.login" %>




<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" runat="server" style="margin-right :-100px ">
             
    
    <div class="row" style=" margin-top:40px; vertical-align:middle; text-align: center; height : 580px; background-image:url(https://tesipro.com/wp-content/uploads/2013/08/Central-Reservas-Tesipro.jpg) ">
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="False" Font-Size="Large" Height="29px" Width="150px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="USER"></asp:Label>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2"  runat="server" TextMode="Password" Font-Bold="False" Font-Size="Large" Height="29px" Width="149px">*********</asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="PASSWORD"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server">Change Password</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server">Recovery Password</asp:LinkButton>
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="MODO DEBUG&quot;NoUsar&quot;" Visible="FALSE" />   <%--DEBUGG !!!!!!!!!!!!!!!!!--%>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:Button ID="Button1" CssClass="btn btn-success  btn3d" runat="server" Text="GO!" Height="35px" Width="100px" />
       
        <asp:Button ID="LabelTest" runat="server" Text="TEST" Visible ="FALSE" />
        <asp:Label ID="LabelTest2" runat="server" Visible="False" />
        &nbsp;
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
              
    </div>
       
 </asp:Content>
