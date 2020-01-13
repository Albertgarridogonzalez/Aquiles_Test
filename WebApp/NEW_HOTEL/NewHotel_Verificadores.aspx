<%@ Page Title="Mantenimiento" LCID = 1034 Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewHotel_Verificadores.aspx.vb" Inherits="WebApp.NewHotel_Verificadores" %>
 


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
            <h2>REGISTROS DEL AZUL QUE NO ESTÁN CREADOS EN EL TRASPASO MAESTRO</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView1"  class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TRASPASO_MAESTRO" BorderStyle="Solid" Font-Bold="True" Width="650px"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true"  >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                      <Columns>
           
           
         <%--         <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>--%>
                  <asp:BoundField DataField="ENTIDAD" HeaderText="ENTIDAD" SortExpression="ENTIDAD"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="CODIGO_PMS" SortExpression="CODIGO_PMS"  ControlStyle-Width="100px"  >
                      <ControlStyle Width="100px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="CODIGO_CRS" SortExpression="CODIGO_CRS"  ControlStyle-Width="100px" >
                      <ControlStyle Width="100px"></ControlStyle>
                  </asp:BoundField>
            

              
                
            

                                
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
               <asp:SqlDataSource ID="TRASPASO_MAESTRO" runat="server"  
                 >
             </asp:SqlDataSource>
               
                                        </ContentTemplate>
                </asp:UpdatePanel>
          </p>
            <hr aria-dropeffect="popup" style="width: 329px" />
        </div>

          </div>
   

    <div class="row">

        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>REGISTROS DEL TRASPASO MAESTRO QUE NO ESTÁN CREADOS EN LA BASE DE DATOS DEL BLANCO , O QUE SON INCORRECTOS (EJ: CONFIGURACIÓN BRK SUMA_DIA)</h2>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView2" class="table"  HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="MAESTRO_TRASPASO" BorderStyle="Solid" Font-Bold="True" Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
          <%--      <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>--%>
                  <asp:BoundField DataField="ENTIDAD" HeaderText="ENTIDAD" SortExpression="ENTIDAD"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="CODIGO_PMS" SortExpression="CODIGO_PMS"  ControlStyle-Width="100px"  >
                      <ControlStyle Width="100px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="CODIGO_CRS" SortExpression="CODIGO_CRS"  ControlStyle-Width="100px" >
                      <ControlStyle Width="100px"></ControlStyle>
                  </asp:BoundField>
            

                                
       
            

                                
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
                <asp:SqlDataSource ID="MAESTRO_TRASPASO" runat="server" ></asp:SqlDataSource>
              
            <p>
                <br />
            </p>
                                                          </ContentTemplate>
                </asp:UpdatePanel>
          </p>
            <hr aria-dropeffect="popup" style="width: 329px" />
            <p>
        </div>
     
        </div>
    
   


</asp:Content>
