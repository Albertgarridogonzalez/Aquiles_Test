<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Cobros.aspx.vb" Inherits="WebApp.NewHotel_cobros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
         &nbsp;<asp:Button ID="Button11" CssClass="btn btn-success" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  />
         &nbsp;<asp:Button ID="Button12" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
         &nbsp;<asp:Button ID="Button13" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>

    <div class="row">
       
        <div  class="col-md-12" style="vertical-align:middle; text-align: center;" >
            <h2>
                <br />
                     <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        
                 <asp:GridView ID="GridView1" class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" maxwith="900" Width="900px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20">
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
<ControlStyle Font-Size="XX-Small" Width="0px"></ControlStyle>
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO" HeaderText="COD" SortExpression="CODIGO"  ControlStyle-Width="80px" >
<ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESC" SortExpression="DESCRIPCION"  ControlStyle-Width="260px" >
<ControlStyle Width="260px"></ControlStyle>
                  </asp:BoundField>

                   <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO"  ControlStyle-Width="60px" >
<ControlStyle Width="60px"></ControlStyle>
                  </asp:BoundField>

                  <asp:BoundField DataField="CUENTA_CONTABLE" HeaderText="CONTABLE" SortExpression="CUANTA_CONTABLE"  ControlStyle-Width="260px"  >
<ControlStyle Width="260px"></ControlStyle>
                  </asp:BoundField>

                  <asp:CheckBoxField DataField="CREDITO" HeaderText="CRED" SortExpression="CREDITO" ControlStyle-Width="40px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>

                   <asp:CheckBoxField DataField="ACTIVO_CREDITO" HeaderText="ACT CRED" SortExpression="ACTIVO_CREDITO" ControlStyle-Width="40px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>

             <asp:CheckBoxField DataField="ACTIVO_COBRO" HeaderText="ACT COB" SortExpression="ACTIVO_COBRO" ControlStyle-Width="40px">
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
             
             <asp:SqlDataSource ID="SqlTest" runat="server"  
                 >
             </asp:SqlDataSource>

                                                                             </ContentTemplate>
                </asp:UpdatePanel>
               
                <asp:FileUpload ID="FileUpload1" runat="server" />
               
                <asp:Button ID="Button10" CssClass="btn btn-success"  runat="server" Text="CARGAR TIPOCOB.DBF" />
                <br />
                <asp:Label ID="Label50" runat="server"></asp:Label>
                <br />
                

               </h2>
           
                
                 &nbsp;<br />
            <br />
            
            <br />
            <br />
            <br />
        </div>
          
    </div>    
          
        
       
      
   

</asp:Content>