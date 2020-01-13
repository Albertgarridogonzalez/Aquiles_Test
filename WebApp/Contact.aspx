<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="WebApp.Contact" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>





<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div style="background-color:yellow;" runat="server">
       <input type="file" name="adjunto_excel" accept=".xlsx" id="excel_selected" runat="server"/>
       <asp:Button runat="server" Text="ACEPTAR" ID="aceptarCarga" OnClick="aceptarCarga_Click" />
       <asp:TextBox runat="server" ID="textBoxTest" Width="500px" Height="500px" Text="test"></asp:TextBox>

   </div>
</asp:Content>
