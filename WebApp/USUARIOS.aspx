<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="USUARIOS.aspx.vb" Inherits="WebApp.USUARIOS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
  

    <div class="row gradient"  style=" margin-top:40px;" >
       
        <div  class="col-md-12 gradient" style="vertical-align:middle; text-align: center;" >
            <h2>
                <br />
                     <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <br />
                       
                 <asp:GridView ID="GridView1"  HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" Width="800px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20">
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

                     <Columns>


                         <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller">
                             <ControlStyle Font-Size="XX-Small" Width="0px"></ControlStyle>
                             <ItemStyle Font-Size="XX-Small" />
                         </asp:BoundField>
                         <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" ControlStyle-Width="100px">
                             <ControlStyle Width="40px"></ControlStyle>
                         </asp:BoundField>


                         <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" ControlStyle-Width="100px">
                             <ControlStyle Width="50px"></ControlStyle>
                         </asp:BoundField>

                      
                         <asp:BoundField DataField="PW" HeaderText="PW" SortExpression="PW" ControlStyle-Width="100px">
                             <ControlStyle Width="30px" ></ControlStyle>
                         </asp:BoundField>
                         <asp:BoundField DataField="MAIL" HeaderText="MAIL" SortExpression="MAIL" ControlStyle-Width="250px">
                             <ControlStyle Width="30px"></ControlStyle>
                         </asp:BoundField>
                         <asp:CheckBoxField DataField="ADMIN" HeaderText="ADMIN" SortExpression="ADMIN" ControlStyle-Width="50px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>
                         <asp:CheckBoxField DataField="TECNICO" HeaderText="TECNICO" SortExpression="TECNICO" ControlStyle-Width="50px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>

                         <asp:CheckBoxField DataField="MANUAL" HeaderText="MANUAL" SortExpression="MANUAL" ControlStyle-Width="50px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>

                         <asp:CheckBoxField DataField="INSTALACION" HeaderText="INSTALACION" SortExpression="INSTALACION" ControlStyle-Width="50px">
                             <ItemStyle Font-Names="Arial Black" />
                         </asp:CheckBoxField>



                         <asp:CommandField ShowEditButton="True" ShowHeader="True" ControlStyle-Width="60px">




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
             
             <asp:SqlDataSource ID="SqlTest" runat="server"  
                 >
             </asp:SqlDataSource>

                                                                             </ContentTemplate>
                </asp:UpdatePanel>
               
                <asp:Button ID="Button10" runat="server" Text="CHECK SQL" Visible="False" />
                <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
            <asp:Button ID="Button11" runat="server" Text="subir" Visible="False" />
            <asp:Button ID="Button12" runat="server" CssClass="btn btn-info"  Text="CHECK LINKED SERVERS" />
                <br />
            <br />
            <asp:Button ID="Button13" runat="server" CssClass="btn btn-info"  Text="CHECK ALL SQL" />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <asp:Button ID="Button14" runat="server" Text="CHECK THIS SQL"  CssClass="btn btn-info"/>
                <asp:Label ID="Label50" runat="server"></asp:Label>
                <br />
            <br />
                       
                 <asp:GridView ID="GridView2"  HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlError" BorderStyle="Solid" Font-Bold="True" Width="800px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20">
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

                     <Columns>


                         <asp:BoundField DataField="HOTEL" HeaderText="HOTEL" SortExpression="HOTEL" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller">
                             
                         </asp:BoundField>
                         <asp:BoundField DataField="ERROR" HeaderText="ERROR" SortExpression="ERROR" ControlStyle-Width="100px">
                             <ControlStyle Width="40px"></ControlStyle>
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
             
                   
             <asp:SqlDataSource ID="SqlError" runat="server"  
                 >
             </asp:SqlDataSource>


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