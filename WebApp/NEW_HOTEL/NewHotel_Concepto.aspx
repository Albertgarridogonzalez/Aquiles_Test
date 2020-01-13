<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Concepto.aspx.vb" Inherits="WebApp.NewHotel_Concepto" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
    <div class="rowmin" style="height:60px; max-height:120px ; vertical-align:middle; text-align: center;">
      
       
           <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="40px" Text="DATOS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_datos.aspx"/>
&nbsp;<asp:Button ID="Button3" CssClass="btn btn-info" runat="server" Height="40px" Text="RACK" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Rack.aspx" />
&nbsp;<asp:Button ID="Button4" CssClass="btn btn-info"    runat="server" Height="40px" Text="SEG/ORI" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_SegmentoOrigen.aspx" />    
&nbsp;<asp:Button ID="Button5" CssClass="btn btn-info"   runat="server" Height="40px" Text="TIPO" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_TipoHab.aspx" />
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-info"   runat="server" Height="40px" Text="OCUP" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Ocup.aspx" />
&nbsp;<asp:Button ID="Button7" CssClass="btn btn-info"   runat="server" Height="40px" Text="CARACT" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Caracterisitica.aspx" />
&nbsp;<asp:Button ID="Button20" CssClass="btn btn-success" runat="server" Height="40px" Text="CONCEPTO" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_CONCEPTO.aspx"  />
&nbsp;<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  />
        &nbsp;<asp:Button ID="Button12" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button10" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
        &nbsp;<asp:Button ID="Button13" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>
    <div class="rowmin">
    <div class="col-md-12" >
        <br /><br />
       <br /><br />       
    </div>
    </div>


    <div class="row">
        <div class="col-md-12" style="vertical-align: middle; text-align: center;">
            <h2>HABITACION</h2>
            <p>
                <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1"  class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" Style="text-align: center; overflow-x: AUTO" runat="server" AutoGenerateColumns="False" DataSourceID="HABITACION" BorderStyle="Solid" Font-Bold="True" maxwidth="800" Width="800px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <RowStyle Height="35px" />
                            <Columns>


                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                          <asp:BoundField DataField="CONCEPTO" HeaderText="CONC" SortExpression="CONCEPTO" ControlStyle-Width="80px"><ControlStyle Width="80px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESC" SortExpression="DESCRIPCION" ControlStyle-Width="100px"><ControlStyle Width="150px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="CUENTA_CONTABLE" HeaderText="CTA" SortExpression="CUENTA_CONTABLE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         <asp:BoundField DataField="IVA" HeaderText="IVA" SortExpression="IVA" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                               




      <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger" ShowDeleteButton="True" />
            





                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="HABITACION" runat="server"></asp:SqlDataSource>

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
            <h2>EXTRAS HABITACION</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView2"  class="table" OnRowDeleting="OnRowDeleting2" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="EXTHABITACION" BorderStyle="Solid" Font-Bold="True"  maxwidth="800" Width="800px"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                     <Columns>


            

                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                        <asp:BoundField DataField="CONCEPTO" HeaderText="CONC" SortExpression="CONCEPTO" ControlStyle-Width="80px"><ControlStyle Width="80px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESC" SortExpression="DESCRIPCION" ControlStyle-Width="100px"><ControlStyle Width="150px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="CUENTA_CONTABLE" HeaderText="CTA" SortExpression="CUENTA_CONTABLE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         <asp:BoundField DataField="IVA" HeaderText="IVA" SortExpression="IVA" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                          



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
               <asp:SqlDataSource ID="EXTHABITACION" runat="server"  
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
    <%--segunda--%>
    <div class="row">


         <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>VARIOS</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView3"  class="table" OnRowDeleting="OnRowDeleting3" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="VARIOS" BorderStyle="Solid" Font-Bold="True"  maxwidth="800" Width="800px"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                     <Columns>


               

                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                          <asp:BoundField DataField="CONCEPTO" HeaderText="CONC" SortExpression="CONCEPTO" ControlStyle-Width="80px"><ControlStyle Width="80px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESC" SortExpression="DESCRIPCION" ControlStyle-Width="100px"><ControlStyle Width="150px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="CUENTA_CONTABLE" HeaderText="CTA" SortExpression="CUENTA_CONTABLE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         <asp:BoundField DataField="IVA" HeaderText="IVA" SortExpression="IVA" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                
  




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
               <asp:SqlDataSource ID="VARIOS" runat="server"  
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
            <h2>RESTAURACION</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView4"  class="table" OnRowDeleting="OnRowDeleting4" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="REST" BorderStyle="Solid" Font-Bold="True"  maxwidth="800" Width="800px"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                     <Columns>


           

                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                         <asp:BoundField DataField="CONCEPTO" HeaderText="CONC" SortExpression="CONCEPTO" ControlStyle-Width="80px"><ControlStyle Width="80px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESC" SortExpression="DESCRIPCION" ControlStyle-Width="100px"><ControlStyle Width="150px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="CUENTA_CONTABLE" HeaderText="CTA" SortExpression="CUENTA_CONTABLE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         <asp:BoundField DataField="IVA" HeaderText="IVA" SortExpression="IVA" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                
           





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
               <asp:SqlDataSource ID="REST" runat="server"  
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
        <%--tercera--%>

        <div class="col-md-12" style="vertical-align:middle; text-align: center;">
            <h2>DEPOSITOS</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView5"  class="table" OnRowDeleting="OnRowDeleting5"  HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="DEP" BorderStyle="Solid" Font-Bold="True"  maxwidth="800" Width="800px"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />
                     <Columns>


                       

                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CONCEPTO" HeaderText="CONC" SortExpression="CONCEPTO" ControlStyle-Width="80px"><ControlStyle Width="80px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="DESCRIPCION" HeaderText="DESC" SortExpression="DESCRIPCION" ControlStyle-Width="100px"><ControlStyle Width="150px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="CUENTA_CONTABLE" HeaderText="CTA" SortExpression="CUENTA_CONTABLE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         <asp:BoundField DataField="IVA" HeaderText="IVA" SortExpression="IVA" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" ControlStyle-Width="30px"><ControlStyle Width="30px"></ControlStyle></asp:BoundField>
                            

                       <asp:BoundField DataField="ID_COBRO" HeaderText="ID_COBRO" SortExpression="ID_COBRO" ControlStyle-Width="30px"></asp:BoundField>
                    
               





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
               <asp:SqlDataSource ID="DEP" runat="server"  
                 >
             </asp:SqlDataSource>
               
            <p>
                <br />
            </p>
                                        </ContentTemplate>
                </asp:UpdatePanel>

            
    <div class="rowmin">

        <div class="col-md-12" style="vertical-align:middle; text-align: left;">

                <asp:FileUpload ID="FileUpload1" runat="server" />
               
                <br />
               
                <asp:Button ID="Button11" CssClass="btn btn-success"  runat="server" Text="CARGAR CONCEPTOS.DBF" />
                <br />
                <br />
                <br />
            <br />
     
        
                   <asp:Button ID="Button15" CssClass="btn btn-info"  runat="server" Text="DESCARGAR PLANTILLA EXCEL" />
                   
                   <br />
                   
                   <asp:FileUpload ID="FileUpload2" runat="server" />
               
                <br />
               
                <asp:Button ID="Button14" CssClass="btn btn-success"  runat="server" Text="CARGAR PLANTILLA EXCEL" />
                <br />
            <br />
            <br />


          </p>
            <hr aria-dropeffect="popup" style="width: 329px" />
            <p>
        </div>

            </div>
              <%--<h2>REGIMEN</h2>
            <p>
         <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                 <asp:GridView ID="GridView6"  HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="TM_REGIMEN" BorderStyle="Solid" Font-Bold="True" Width="367px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small">
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_PMS" HeaderText="AZ" SortExpression="CODIGO_PMS"  ControlStyle-Width="50px" >
                  </asp:BoundField>
                  <asp:BoundField DataField="CODIGO_CRS" HeaderText="BL" SortExpression="CODIGO_CRS"  ControlStyle-Width="50px"  >
                  </asp:BoundField>
                  <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCR" SortExpression="DESCRIPCION"  ControlStyle-Width="100px" >
                  </asp:BoundField>
            

                                
                <asp:CommandField ShowEditButton="True" ShowHeader="True"  ControlStyle-Width="60px">
                
            

                                
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
            <p>--%>
        </div>
    </div>




     </div>
</asp:Content>
