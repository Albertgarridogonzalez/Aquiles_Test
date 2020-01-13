<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/manual/MANUAL_TECNICO.Master"  CodeBehind="Manual_GestionVentas.aspx.vb" Inherits="WebApp.Manual_GestionVentas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
    

    <div class="row">
        <div class="col-md-12">
            <h2>GESTION DE VENTAS</h2>
            <p>
                <br />
                <br />
                <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" Width="297px" style="margin-right: 30px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>SELECCIONA UNA OPCION</asp:ListItem>
                     <asp:ListItem>1 - CODIFICACION TARIFAS</asp:ListItem>
                    <asp:ListItem>2 - CREACION TARIFAS</asp:ListItem>
                    <asp:ListItem>3 - CARGA DE PRECIOS (BAR)</asp:ListItem>
                    <asp:ListItem>4 - CARGA DE PRECIOS (FIT)</asp:ListItem>
                    <asp:ListItem>5 - OFERTAS</asp:ListItem>
                    <asp:ListItem>6 - PAQUETES</asp:ListItem>
                    <asp:ListItem>7 - EVENTOS PLANNING</asp:ListItem>
                    <asp:ListItem>8 - AVISOS PLANNING</asp:ListItem>
                    <asp:ListItem>10 - OVERBOOKING</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                   <iframe id="iframeDrive" runat ="server" name ="iframename" src = ""  height="3800"  width ="1200" style="max-width:100%; " allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" ></iframe>
            </p>
            <hr aria-dropeffect="popup" style="width: 330px" />
            <p>
                &nbsp;</p>
        </div>

       <%-- <div class="col-md-8" style="overflow-x:auto">
            <h2>DOCUMENTATION<p>
                &nbsp;

                        <br />
                <br />
                
                     
            </p>
       
            <p>
                <br />
            </p>
            <p>
                &nbsp;</p>
        </div>--%>
    </div>

</asp:Content>
