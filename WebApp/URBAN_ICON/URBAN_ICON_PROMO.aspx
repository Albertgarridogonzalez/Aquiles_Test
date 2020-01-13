<%@ Page Title="URBAN_ICON_PROMO" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/URBAN_ICON/URBAN_ICON.Master" CodeBehind="URBAN_ICON_PROMO.aspx.vb" Inherits="WebApp.URBAN_ICON_PROMO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
   
    
     <div class="row" style=" margin-top:40px; vertical-align:middle; text-align: center; height : 2580px; background-image:url(https://www.reggaetonbarcelona.es/wp-content/uploads/2017/09/opaciti.png?id=2810.webp) ">
        <br />
        <br />
        <br />
        <br />
        <br /> 

<%--  esto es para tener un dropdown          <div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
      <li><a href="/NEW_HOTEL/NewHotel_Crea.aspx">Dropdown link</a></li>
      <li><a href="/NEW_HOTEL/NewHotel_Crea.aspx">Dropdown link</a></li>
    </ul>   
  </div>--%>
       







            
                    <ContentTemplate>

                        <p>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="FECHA" Visible="TRUE"></asp:Label>
                            <asp:TextBox ID="TextBox8" runat="server" TextMode="Date"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="NOMBRE" Visible="TRUE"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" Visible="TRUE">NOMBRE</asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="PRECIO" Visible="TRUE"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" Visible="TRUE">PRECIO</asp:TextBox>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="CONCEPTO" Visible="TRUE"></asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server" Visible="TRUE">CARGO</asp:TextBox>
                        </p>
         <p>
                            <asp:Label ID="Label5" runat="server" Text="MAIL"></asp:Label>
                            <asp:TextBox ID="TextBox9" runat="server" Visible="TRUE" TextMode="Email">MAIL</asp:TextBox>
                            <br />
                            <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Mediante archivo adjunto acepta pago" />
                            <br />
                        </p>

                          <asp:FileUpload ID="FileUpload1" runat="server" />

                          <br />
         <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Cargar Pago" />
         <br />
         <br />
         <br />  



                    </ContentTemplate>
                
                        <br />

         

                
    </div>


         
         
         
         
         
         
         
         

    
         
      
   

</asp:Content>