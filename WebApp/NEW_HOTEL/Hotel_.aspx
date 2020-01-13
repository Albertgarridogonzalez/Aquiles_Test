<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="Hotel_.aspx.vb" Inherits="WebApp.Hotel_" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    


   
    <div class="row" style=" margin-top:40px; vertical-align:middle; text-align: center; height : 5580px; background-image:url(https://tesipro.com/wp-content/uploads/2013/08/Booking2-tesipro-1.jpg)">
        
        <div  class="col-md-12" style="vertical-align:middle; text-align: center;" >
            <h2>
                <br />
                <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Crear Hotel Nuevo" Visible="False" />
                <br />
                 <asp:GridView ID="GridView1"   class="table" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest2" BorderStyle="Solid" Font-Bold="True" Width="367px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium">
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
            <Columns>
                <asp:CommandField ButtonType="Button"  ControlStyle-CssClass ="btn btn-info" SelectText="Select" ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" />
                <asp:BoundField DataField="GRUPO" HeaderText="GRUPO" SortExpression="GRUPO" />
                <asp:BoundField DataField="NOMBRE_CORTO" HeaderText="NOMBRE" SortExpression="NOMBRE_CORTO" />
                <asp:CheckBoxField DataField="NEW_HOTEL" HeaderText="NEW_HOTEL" SortExpression="NEW_HOTEL"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" > 
                <ItemStyle Font-Names="Arial Black" />
                </asp:CheckBoxField>
            
                                
               

                                
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1"  />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
             <asp:SqlDataSource ID="SqlTest2" runat="server"  >
        </asp:SqlDataSource>
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