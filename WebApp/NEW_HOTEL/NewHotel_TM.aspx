<%@ Page Title="Mantenimiento" LCID = 1034 Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewHotel_TM.aspx.vb" Inherits="WebApp.NewHotel_TM" %>
 


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
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-success" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button10" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
      &nbsp;<asp:Button ID="Button13" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>
   

    <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>TIPOHAB</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView1"  class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_TIPOHAB" BorderStyle="Solid" Font-Bold="True" Width="650px"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true"  >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                      <Columns>
           
           
                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="150px" >
                      <ControlStyle Width="150px"></ControlStyle>
                  </asp:BoundField>
            

                                
                 <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
               <asp:SqlDataSource ID="TM_TIPOHAB" runat="server"  
                 >
             </asp:SqlDataSource>
               
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
   

    <div class="row">

        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>CONCEPTO</h2>
            <p>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView2" class="table"  HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_CONCEPTO" BorderStyle="Solid" Font-Bold="True" Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            

                                
          <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_CONCEPTO" runat="server" ></asp:SqlDataSource>
              
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
    
    <%-- SEGUNDA ROW --%>
        <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
              <h2>TARIFA</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView3" class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_TARIFA" BorderStyle="Solid" Font-Bold="True" Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
                      <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_TARIFA" runat="server"></asp:SqlDataSource>
              
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
   

    




    
               <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>OFERTA</h2>
            <p>
                 <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView10" class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_OFERTA" BorderStyle="Solid" Font-Bold="True"  Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
           <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_OFERTA" runat="server"></asp:SqlDataSource>
              
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








      <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>ORIGEN</h2>
            <p>
          <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView4" class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_ORIGEN" BorderStyle="Solid" Font-Bold="True"  Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20"  EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                      <Columns>
           
         <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            

                                
                <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
               <asp:SqlDataSource ID="TM_ORIGEN" runat="server"  
                 >
             </asp:SqlDataSource>
               
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
          
    <%-- TECERA ROW --%>
             <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>SEGMENTO</h2>
            <p>
                 <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView5" class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_SEGMENTO" BorderStyle="Solid" Font-Bold="True"  Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
             <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_SEGMENTO" runat="server"></asp:SqlDataSource>
              
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
   

    <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
              <h2>REGIMEN</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView6" class="table"  HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_REGIMEN" BorderStyle="Solid" Font-Bold="True" Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
               <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            

                                
           <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_REGIMEN" runat="server"></asp:SqlDataSource>
              
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


             <%-- CUARTA ROW --%>
             <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>CANALES</h2>
            <p>
                 <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView7" class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_CANALES" BorderStyle="Solid" Font-Bold="True"  Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_CANALES" runat="server"></asp:SqlDataSource>
              
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
   

    <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
              <h2>ESTADOS</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView8" class="table"  HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_ESTADO" BorderStyle="Solid" Font-Bold="True" Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
             <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            

                                
           <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_ESTADO" runat="server"></asp:SqlDataSource>
              
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


                   <%-- QUINTA ROW --%>
             <div class="row">
        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>TIPOCOBRO</h2>
            <p>
                 <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView9" class="table" HorizontalAlign="Center" style="max-height:700px ;text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_TIPOCOBRO" BorderStyle="Solid" Font-Bold="True"  Width="650px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
           <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="80px" >
                  <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="80px"  >
                      <ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="200px" >
                      <ControlStyle Width="200px"></ControlStyle>
                  </asp:BoundField>
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
    
                
                                
<ControlStyle Width="60px"></ControlStyle>
                  </asp:CommandField>
                
            

                                
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
                <asp:SqlDataSource ID="TM_TIPOCOBRO" runat="server"></asp:SqlDataSource>
              
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
















     <div class="rowmin">
    <div class="col-md-12" >
        <br /><br />
<asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="Button11" ControlStyle-CssClass ="btn btn-success" runat="server" Text="CARGAR TRASPASO MAESTRO" />
                 <asp:Label ID="Label50" runat="server"></asp:Label>
       <br /><br />       
    </div>
    </div>



     </div>
</asp:Content>
