<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Gobernanta/Gober.Master" CodeBehind="GoberLogin.aspx.vb" Inherits="WebApp.GoberLogin" %>
<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="row" style=" margin-top:40px; vertical-align:middle; text-align: center; height : 580px; background-image:url(https://tesipro.com/wp-content/uploads/2013/08/Booking2-tesipro-1.jpg)">
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Font-Bold="False" Font-Size="Large" Height="29px" Width="150px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="USER"></asp:Label>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2"  runat="server" TextMode="Password" Font-Bold="False" Font-Size="Large" Height="29px" Width="149px">*********</asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="PASSWORD"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server">Change Password</asp:LinkButton>
        <br />
&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:LinkButton ID="LinkButton2" runat="server">Recovery Password</asp:LinkButton>
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox1" runat="server" Text="MODO DEBUG&quot;NoUsar&quot;" Visible="true" />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" CssClass="btn btn-success  btn3d"  runat="server" Text="GO !"  Height="35px" Width="100px" />
        <asp:Button ID="LabelTest" runat="server" Text="TEST" Visible="False" />
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
