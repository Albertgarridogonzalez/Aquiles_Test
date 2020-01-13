<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Tareas.aspx.vb" Inherits="WebApp.Tareas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
    

    <div class="row" style=" margin-top:40px;" >
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div style="overflow-x :SCROLL;">
            <%--;overflow:HIDDEN;--%>
        <asp:GridView ID="GridView1"  HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" Width="367px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="NOMHOTEL" HeaderText="NOMHOTEL" SortExpression="NOMHOTEL" />
                <asp:BoundField DataField="FECHA_INICIO" HeaderText="FECHA_INICIO" SortExpression="FECHA_INICIO" />
                <asp:BoundField DataField="FECHA_FIN" HeaderText="FECHA_FIN" SortExpression="FECHA_FIN" />
                <asp:BoundField DataField="PROCEDIMIENTO" HeaderText="PROCEDIMIENTO" SortExpression="PROCEDIMIENTO" />

                                
                <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" />
                <asp:CheckBoxField DataField="OK" HeaderText="OK" SortExpression="OK" />
                <asp:CheckBoxField DataField="ERROR" HeaderText="ERROR" SortExpression="ERROR" />

                                
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
             <asp:SqlDataSource ID="SqlTest" runat="server" SelectCommand="SELECT * FROM FN_LISTADO_TAREA_PENDIENTE() ">
        </asp:SqlDataSource>
        <br />
        <br />
            </div>
     </div>
</asp:Content>

