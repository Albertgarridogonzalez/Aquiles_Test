<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="Hoteles.aspx.vb" Inherits="WebApp.Hoteles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    


   
    <div class="row" style=" margin-top:40px; vertical-align:middle; text-align: center; height : 580px; background-image:url(https://tesipro.com/wp-content/uploads/2013/08/Booking2-tesipro-1.jpg)">
        
        <div  class="col-md-12" style="vertical-align:middle; text-align: center;" >
            <h2>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" CssClass="btn btn-info"  runat="server" Text="HOTEL" Width="150px" Height="50px" />
                &nbsp;
                <asp:Button ID="Button2" CssClass="btn btn-info"  runat="server" Text="NEW HOTEL" Width="150px" Height="50px" />
                <br />
                <br />
            </h2>
           
                
                 &nbsp;<br />
            <br />
            
            <br />
            <br />
            <br />
       <%--        <asp:Timer ID="Timer1" runat="server" Interval="2500">
            </asp:Timer>
        </div>
         
        <div class="container">
            

        <div>
         
       
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
            <h2>Estado Hoteles Instalando&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server"></asp:Label>
                </h2>
  <div class="progress" >
  <div class="progress progress-striped active">
      <div id="ProgressBar1"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
      </ContentTemplate>
       </asp:UpdatePanel>--%>

      
     
       
        <div>
         

        </div>  
       
     </div>   
       
      

    </div>
</asp:Content>