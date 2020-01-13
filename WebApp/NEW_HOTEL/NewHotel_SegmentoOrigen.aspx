<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_SegmentoOrigen.aspx.vb" Inherits="WebApp.NewHotel_SegmentoOrigen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }

       
            function Get_ID_NewHotel()
    {

                var @Id_NewHotel = '<%= Session("NewHotelID") %>';
                 
       
    }

        </SCRIPT>
    
     <div class="rowmin" style="height:60px; max-height:60px ; vertical-align:middle; text-align: center;">
      
       
           <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="40px" Text="DATOS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_datos.aspx"/>
&nbsp;<asp:Button ID="Button3" CssClass="btn btn-info" runat="server" Height="40px" Text="RACK" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Rack.aspx" />
&nbsp;<asp:Button ID="Button4" CssClass="btn btn-success"    runat="server" Height="40px" Text="SEG/ORI" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_SegmentoOrigen.aspx" />    
&nbsp;<asp:Button ID="Button5" CssClass="btn btn-info"   runat="server" Height="40px" Text="TIPO" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_TipoHab.aspx" />
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-info"   runat="server" Height="40px" Text="OCUP" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Ocup.aspx" />
&nbsp;<asp:Button ID="Button7" CssClass="btn btn-info"   runat="server" Height="40px" Text="CARACT" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Caracterisitica.aspx" />
&nbsp;<asp:Button ID="Button20" CssClass="btn btn-info" runat="server" Height="40px" Text="CONCEPTO" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_CONCEPTO.aspx"  />
         &nbsp;<asp:Button ID="Button11" CssClass="btn btn-info" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  />
         &nbsp;<asp:Button ID="Button12" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
         &nbsp;<asp:Button ID="Button13" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>

     <div class="row3">
        <div class ="col-xs-12"style="vertical-align:middle; text-align: center;">
         <asp:Label ID="Label30" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
            </div>

    <div class="row">
       
        
        <div  class="col-md-12" style="vertical-align:middle; text-align: center;padding-right :30PX" >
            <h2>
                <br />
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Label ID="Label52" runat="server" Font-Size="Large" Text="Label"></asp:Label>
                        <br />
                 <asp:GridView ID="GridView1" class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" Width="600" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" ShowFooter="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>

                
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller"/>
                
                <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" ControlStyle-Width="80px"/>
                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" ControlStyle-Width="300px" />
                  <asp:CheckBoxField DataField="ESORIGEN" HeaderText="ESORIGEN" SortExpression="ESORIGEN" ControlStyle-Width="50px"> 
                <ItemStyle Font-Names="Arial Black" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="CASA" HeaderText="CASA" SortExpression="CASA" ControlStyle-Width="50px"> 
                <ItemStyle Font-Names="Arial Black" />
                </asp:CheckBoxField>
            
                
               <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger" ShowDeleteButton="True" />
            

           
           


                                
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
             
             <asp:SqlDataSource ID="SqlTest" runat="server">
             </asp:SqlDataSource>

                                                                                           </ContentTemplate>
                </asp:UpdatePanel>

                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="Button10" CssClass="btn btn-success"  runat="server" Text="CARGAR SGMENTS.DBF" />
                <br />
                <asp:Label ID="Label50" runat="server"></asp:Label>
                      <asp:Label ID="Label51" runat="server"></asp:Label>
                <br />
                

               </h2>
            
            <br />
            <br />
            <br />
        </div>
        </div>
        <div class="row">


         <div  class="col-md-12" style="vertical-align:middle; text-align: center;padding-right :30PX" >
            <h2>
                <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Label ID="Label53" runat="server" Font-Size="Large" Text="Label"></asp:Label>
                        <br />
                 <asp:GridView ID="GridView2" class="table" OnRowDeleting="OnRowDeleting2" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" BorderStyle="Solid" Font-Bold="True" Width="600px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" ShowFooter="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>

                
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"/>
                
                <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" ControlStyle-Width="80px"/>
                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION" ControlStyle-Width="300px" />
                  <asp:CheckBoxField DataField="ESORIGEN" HeaderText="ESORIGEN" SortExpression="ESORIGEN" ControlStyle-Width="50px"> 
                <ItemStyle Font-Names="Arial Black" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="CASA" HeaderText="CASA" SortExpression="CASA" ControlStyle-Width="50px"> 
                <ItemStyle Font-Names="Arial Black" />
                </asp:CheckBoxField>
            
                
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger" ShowDeleteButton="True" />
            

            

                                
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
             
             <asp:SqlDataSource ID="SqlDataSource1" runat="server">
             </asp:SqlDataSource>

                                                                                           </ContentTemplate>
                </asp:UpdatePanel>

            <br />
            <br />
            <br />
        </div>


          
    </div>    
          
        
       
      
   

    </div>
</asp:Content>