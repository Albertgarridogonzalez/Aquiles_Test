<%@ Page Title="URBAN_ICON_EVENTOS" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/URBAN_ICON/URBAN_ICON.Master" CodeBehind="URBAN_ICON_PAGOS.aspx.vb" Inherits="WebApp.URBAN_ICON_PAGOS" %>
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
                        <asp:SqlDataSource ID="EVENTO" runat="server"></asp:SqlDataSource>

                        <p>
                            <asp:DropDownList ID="DropDownList1" runat="server" >
                            </asp:DropDownList>
                            <asp:Button ID="Button6" CssClass="btn btn-info"  runat="server" Text="Cargar Personal" />
                            <br />
                            <asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="HORAS" Visible="False"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" Visible="False">HORAS</asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="PRECIO" Visible="False"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" Visible="False">PRECIO</asp:TextBox>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="CARGO" Visible="False"></asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server" Visible="False">CARGO</asp:TextBox>
                            <br />
                            <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                            <br />
                        </p>

                          <br />
         <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Cargar Pago" />
         <br />
         <br />
         <br />  



                    </ContentTemplate>
                
                        <br />

         
                        <asp:SqlDataSource ID="PAGOS" runat="server"></asp:SqlDataSource>

                        <p>



                
                            Nombre :



                
                            <asp:TextBox ID="TextBox4" runat="server" Width="251px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; Fecha &nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            RECIBI DE REGGAETON BARCELONA LA CANTIDAD DE



                
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            <br />
                            COMO CONCEPTO DE



                
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox8" runat="server" Enabled="False"></asp:TextBox> 
                            <br />
                            <br />
                            FIRMA MEDIANTE ARCHIVO ADJUNTO<br />
                            <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br />
                            <br />
                            <asp:Button ID="Button5" CssClass="btn btn-success" ONCLICK="Upload" runat="server" Text="ACEPTA" />



                
    </div>


         
         
         
         
         
         
         
         

    
         
      
   

</asp:Content>