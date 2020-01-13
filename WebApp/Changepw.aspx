<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ChangePw.aspx.vb" Inherits="WebApp.ChangePw" %>


<asp:Content ID="BodyContent3" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row" style=" margin-top:40px;">
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="False" Font-Size="Large" Height="29px" Width="150px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="USER"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2"  runat="server" TextMode="Password" Font-Bold="False" Font-Size="Large" Height="29px" Width="149px">*********</asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="OLD PASSWORD"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3"  runat="server" TextMode="Password" Font-Bold="False" Font-Size="Large" Height="29px" Width="149px">*********</asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="NEW PASSWORD"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4"  runat="server" TextMode="Password" Font-Bold="False" Font-Size="Large" Height="29px" Width="149px">*********</asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="NEW PASSWORD"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="GO !" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
 </asp:Content>

