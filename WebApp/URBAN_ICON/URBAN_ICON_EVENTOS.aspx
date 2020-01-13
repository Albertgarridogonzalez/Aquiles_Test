<%@ Page Title="URBAN_ICON_EVENTOS" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/URBAN_ICON/URBAN_ICON.Master" CodeBehind="URBAN_ICON_EVENTOS.aspx.vb" Inherits="WebApp.URBAN_ICON_EVENTOS" %>
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
       







            <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1"  class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" Style="text-align: center; overflow-x: AUTO" runat="server" AutoGenerateColumns="False" DataSourceID="EVENTO" BorderStyle="Solid" Font-Bold="True" maxwidth="400" Width="400px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <RowStyle Height="35px" />
                            <Columns>


                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small"  >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                          <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="FECHA"  HeaderText="FECHA" SortExpression="FECHA" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="LUGAR" HeaderText="LUGAR" SortExpression="LUGAR" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         



      <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info" ControlStyle-Width="80px"   ShowHeader="True" ButtonType="Button" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger"  ControlStyle-Width="80px" ShowDeleteButton="True" />
            





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
                        <asp:SqlDataSource ID="EVENTO" runat="server"></asp:SqlDataSource>

                        <p>
                            <asp:DropDownList ID="DropDownList1" runat="server" onselectedindexchanged="SChanged"
                       AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="HORAS"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number">HORAS</asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="PRECIO"></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number">PRECIO</asp:TextBox>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="CARGO"></asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server">CARGO</asp:TextBox>
                            <br />
                            <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                            <br />
                        </p>

                          <br />
         <asp:Button ID="Button1" CssClass="btn btn-success"  runat="server" Text="Añadir contrato" />
         <br />
         <br />
         <br />  



                    </ContentTemplate>
                </asp:UpdatePanel>
         <asp:Button ID="Button2" CssClass="btn btn-info"  runat="server" Text="Actualiza Lista" />
                        <br />

         
                         <asp:GridView ID="GridView2"  class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" Style="text-align: center; overflow-x: AUTO" runat="server" AutoGenerateColumns="False" DataSourceID="PAGOS" BorderStyle="Solid" Font-Bold="True" maxwidth="400" Width="400px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <RowStyle Height="35px" />
                            <Columns>


                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small"  >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                          <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="HORAS" HeaderText="HORAS" SortExpression="HORAS" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                              <asp:BoundField DataField="PRECIO" HeaderText="PRECIO" SortExpression="PRECIO" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         <asp:CheckBoxField DataField="ACEPTA" HeaderText="ACEPTA" SortExpression="ACEPTA" ControlStyle-Width="50px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>
                             
                                         <asp:CheckBoxField DataField="PAGADO" HeaderText="PAGADO" SortExpression="PAGADO" ControlStyle-Width="50px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>




      <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info" ControlStyle-Width="80px"   ShowHeader="True" ButtonType="Button" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger"  ControlStyle-Width="80px" ShowDeleteButton="True" />
            





                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridViEW>
                        <asp:SqlDataSource ID="PAGOS" runat="server"></asp:SqlDataSource>

                        <p>



                
    </div>


         
         
         
         
         
         
         
         

    
         
      
   

</asp:Content>