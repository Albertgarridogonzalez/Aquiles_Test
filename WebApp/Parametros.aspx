<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Parametros.aspx.vb" Inherits="WebApp.Parametros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Ridge" TextMode="Number">0</asp:TextBox>
&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Ridge" TextMode="Number">0</asp:TextBox>
&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Ridge" TextMode="Date">01/01/2001</asp:TextBox>
&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Ridge" TextMode="Date">01/01/2001</asp:TextBox>
&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <br />
        </div>
    </form>
</body>
</html>
