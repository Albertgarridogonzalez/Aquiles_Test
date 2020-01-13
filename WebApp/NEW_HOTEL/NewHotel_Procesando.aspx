<%@ Page Title="Mantenimiento" LCID = 1034 Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewHotel_Procesando.aspx.vb" Inherits="WebApp.NewHotel_Procesando" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
  <div class="rowmin" style="height:60px; max-height:60px ; vertical-align:middle; text-align: center;">
      
       
           <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="40px" Text="DATOS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_datos.aspx"/>
&nbsp;<asp:Button ID="Button3" CssClass="btn btn-info" runat="server" Height="40px" Text="RACK" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Rack.aspx" />
&nbsp;<asp:Button ID="Button4" CssClass="btn btn-info"    runat="server" Height="40px" Text="SEG/ORI" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_SegmentoOrigen.aspx" />    
&nbsp;<asp:Button ID="Button5" CssClass="btn btn-info"   runat="server" Height="40px" Text="TIPO" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_TipoHab.aspx" />
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-info"   runat="server" Height="40px" Text="OCUP" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Ocup.aspx" />
&nbsp;<asp:Button ID="Button7" CssClass="btn btn-info"   runat="server" Height="40px" Text="CARACT" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Caracterisitica.aspx" />
&nbsp;<asp:Button ID="Button20" CssClass="btn btn-info" runat="server" Height="40px" Text="CONCEPTO" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_CONCEPTO.aspx"  />
      &nbsp;<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  />
      &nbsp;<asp:Button ID="Button12" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button10" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
      &nbsp;<asp:Button ID="Button13" CssClass="btn btn-success" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>
   

    <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>&nbsp;</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                    <ContentTemplate>
               
            <p>
                <br />
             <%--   <img alt="" src="https://media.giphy.com/media/30mqDxHuySkw/giphy.gif" />
                <asp:Image ID="Image1" runat="server" ImageUrl="https://media.giphy.com/media/30mqDxHuySkw/giphy.gif" />
                <eo:ImageZoom ID="ImageZoom1" runat="server" Height="150px" Width="200px"></eo:ImageZoom>--%>
                <%--<img src="https://media.giphy.com/media/30mqDxHuySkw/giphy.gif" alt="gif image" />--%>
                <div style="width:100%;height:0;padding-bottom:100%; Border-Radius:100px"><iframe src="https://giphy.com/embed/30mqDxHuySkw" style="Border-Radius:300px" width="500px" height="500px"  frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/processing-30mqDxHuySkw">via GIPHY</a></p>
                <p>
                </p>
                <p>
                </p>
            </p>
                                        </ContentTemplate>
                </asp:UpdatePanel>
          </p>
            <p>
        </div>

          </div>
   

    <div class="row">

        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>&nbsp;</h2>
            <p>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
              
            <p>
                <br />
            </p>
                                                          </ContentTemplate>
                </asp:UpdatePanel>
            <asp:Timer ID="Timer1" runat="server" Interval="900" Enabled="False">
            </asp:Timer>
          </p>
            <p>
        </div>
     
        </div>
    
   


</asp:Content>
