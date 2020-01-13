<%@ Page enableSessionState="true" Title="Dashboard" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.vb" Inherits="WebApp.Dashboard" %>

<%--<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
  
    <div class="row" style=" margin-top:40px; background-image:url(https://tesipro.com/wp-content/uploads/2013/08/Central-Reservas-Tesipro.jpg)">
        <asp:Button ID="Button1" runat="server" Text="Button" />
        
        <div >    <%-- style="overflow-x :SCROLL;"--%>
            <%--;overflow:HIDDEN;--%>
        <asp:GridView ID="GridView1" class="table"  HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" Width="367px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" Visible="False">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="GRUPO" HeaderText="GRUPO" SortExpression="GRUPO" />
                <asp:BoundField DataField="NOMBRE_CORTO" HeaderText="NOMBRE" SortExpression="NOMBRE_CORTO" />
                <asp:BoundField DataField="COD" HeaderText="COD" SortExpression="COD" />
                <asp:CheckBoxField DataField="column1" HeaderText="1" SortExpression="column1" > 
                <ItemStyle Font-Names="Arial Black" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="column2" HeaderText="2" SortExpression="column2" />
                <asp:CheckBoxField DataField="column3" HeaderText="3" SortExpression="column3" />
                <asp:CheckBoxField DataField="column4" HeaderText="4" SortExpression="column4" />
                <asp:CheckBoxField DataField="column5" HeaderText="5" SortExpression="column5" />
                <asp:CheckBoxField DataField="column6" HeaderText="6" SortExpression="column6" />
                <asp:CheckBoxField DataField="column7" HeaderText="7" SortExpression="column7" />
                <asp:CheckBoxField DataField="column8" HeaderText="8" SortExpression="column8" />
                <asp:CheckBoxField DataField="column9" HeaderText="9" SortExpression="column9" />
                <asp:CheckBoxField DataField="column10" HeaderText="10" SortExpression="column10" />
                <asp:CheckBoxField DataField="E_11" HeaderText="11" SortExpression="E_11" />
                <asp:CheckBoxField DataField="E_12" HeaderText="12" SortExpression="E_12" />
                <asp:CheckBoxField DataField="E_13" HeaderText="13" SortExpression="E_13" />
                <asp:CheckBoxField DataField="E_14" HeaderText="14" SortExpression="E_14" />
                <asp:CheckBoxField DataField="E_15" HeaderText="15" SortExpression="E_15" />
                <asp:CheckBoxField DataField="E_16" HeaderText="16" SortExpression="E_16" />
                <asp:CheckBoxField DataField="E_17" HeaderText="17" SortExpression="E_17" />
                <asp:CheckBoxField DataField="E_18" HeaderText="18" SortExpression="E_18" />
                <asp:CheckBoxField DataField="E_19" HeaderText="19" SortExpression="E_19" />
                <asp:CheckBoxField DataField="E_20" HeaderText="20" SortExpression="E_20" />
                <asp:BoundField DataField="LAST_CIERRE" HeaderText="LAST_CIERRE" SortExpression="LAST_CIERRE" />
                <asp:BoundField DataField="FECHAHORA_FIN" HeaderText="FECHAHORA_FIN" SortExpression="FECHAHORA_FIN" />
                <asp:BoundField DataField="LAST_UPDATE" HeaderText="LAST_UPDATE" SortExpression="LAST_UPDATE" />

                                
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
             <asp:SqlDataSource ID="SqlTest" runat="server"  SelectCommand="SELECT [GRUPO], [NOMBRE_CORTO], [COD], [1] AS column1, [2] AS column2, [3] AS column3, [4] AS column4, [5] AS column5, [6] AS column6, [7] AS column7, [8] AS column8, [9] AS column9, [10] AS column10, [E_11], [E_12], [E_13], [E_14], [E_15], [E_16], [E_17], [E_18], [E_19], [E_20], [LAST_CIERRE], [FECHAHORA_FIN], [LAST_UPDATE] FROM [Dashboard] ORDER BY [GRUPO]">
        </asp:SqlDataSource>
        <br />
        <br />
            </div>

        <div class="alert alert-danger alert-dismissible" id="ALERT" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel1"))%> tiene errores en el cierre.
</div>

        
        <div class="alert alert-danger alert-dismissible" id="ALERT2" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel2"))%> tiene errores en el cierre.
</div>
        
        <div class="alert alert-danger alert-dismissible" id="ALERT3" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel3"))%> tiene errores en el cierre.
</div>

                
        <div class="alert alert-success alert-dismissible" id="ALERTok" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Perfecto!</strong> Estado de los cierres de los Hoteles son Correctos.
</div>




                <div class="alert alert-danger alert-dismissible" id="INFORME1" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel4"))%> tiene errores en el informe de Producción4.
</div>

        
        <div class="alert alert-danger alert-dismissible" id="INFORME2" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel5"))%> tiene errores en el informe de Producción5.
</div>
        
        <div class="alert alert-danger alert-dismissible" id="iNFORME3" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel6"))%> tiene errores en el informe de Producción6.
</div>

                
        <div class="alert alert-success alert-dismissible" id="INFORMEOK" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Perfecto!</strong> Estado de los informes de producción de los Hoteles son Correctos.
</div>



        
                <div class="alert alert-danger alert-dismissible" id="conexion1" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel7"))%> no responde.
</div>

        
        <div class="alert alert-danger alert-dismissible" id="conexion2" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel8"))%>no responde.
</div>
        
        <div class="alert alert-danger alert-dismissible" id="conexion3" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> El Hotel <%Response.Write(Session("Nombre_hotel9"))%> no responde.
</div>

                
        <div class="alert alert-success alert-dismissible" id="conexionok" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Perfecto!</strong> Todos los hoteles están correctamente conectados.
</div>


     </div>
</asp:Content>
