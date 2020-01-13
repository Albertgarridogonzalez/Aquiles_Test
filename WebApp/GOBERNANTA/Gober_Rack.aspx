<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/GOBERNANTA/Gober.Master" CodeBehind="Gober_Rack.aspx.vb" Inherits="WebApp.Gober_Rack" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Pararos', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
   
    <div class="row">
       
        <div  class="col-md-12" style="vertical-align:middle; text-align: center;" >
            <h2>
              
                     <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                   
                 <asp:GridView ID="GridView1"  OnRowCommand="GridView1_RowCommand"  OnRowDataBound="OnRowDataBound" FullRowMode ="FALSE" class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" maxwith="600"  BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" >
                     
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
                  <asp:TemplateField>
                  <ItemTemplate>
                  <asp:Button Text="<>" runat="server" CssClass="btn btn-info" ControlStyle-Width="40px" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                  </ItemTemplate>
                  </asp:TemplateField>
                 
                  <asp:BoundField DataField="DESCHAB" ControlStyle-BackColor="" HeaderText="HAB" SortExpression="DESCHAB"  Visible ="true" ControlStyle-Width="100px" ControlStyle-Font-Bold="true">

                  <ControlStyle Font-Bold="True" Width="100px" />
                  </asp:BoundField>
                  <asp:BoundField DataField="TIPOHAB" HeaderText="TIPO" SortExpression="TIPOHAB"  ControlStyle-Width="100px" ControlStyle-Font-Bold="true">
<ControlStyle Width="40px"></ControlStyle>
                  </asp:BoundField>

                                  <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO"  ControlStyle-Width="100px" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
<ControlStyle Width="30px"></ControlStyle>
                  <HeaderStyle CssClass="Hide" />
                  <ItemStyle CssClass="Hide" />
                  </asp:BoundField>

                                                 <asp:BoundField DataField="SITUACION" HeaderText="SITUACION" SortExpression="SITUACION"  ControlStyle-Width="100px"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
<ControlStyle Width="30px"></ControlStyle>
                  <HeaderStyle CssClass="Hide" />
                  <ItemStyle CssClass="Hide" />
                  </asp:BoundField>

                                                 <asp:BoundField DataField="ID_DRESERVA_PREASIGNADA" HeaderText="ID_DRESERVA_PREASIGNADA" SortExpression="ID_DRESERVA_PREASIGNADA" ControlStyle-Width="100px"  HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
<ControlStyle Width="30px"></ControlStyle>
                  <HeaderStyle CssClass="Hide" />
                  <ItemStyle CssClass="Hide" />
                  </asp:BoundField>


                                           <asp:BoundField DataField="ID_BLOQUEO" HeaderText="ID_BLOQUEO" SortExpression="ID_BLOQUEO"  ControlStyle-Width="100px" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
<ControlStyle Width="30px"></ControlStyle>
                  <HeaderStyle CssClass="Hide" />
                  <ItemStyle CssClass="Hide" />
                  </asp:BoundField>

                      

                  <asp:TemplateField>
                  <ItemTemplate>
                  <asp:Image runat="server" ControlStyle-Width="40px" ImageUrl= "~/Imagenes/icono user.png"  Width="25PX" Height ="25PX"/>
                  </ItemTemplate>
                  </asp:TemplateField>
                 

<%--                  <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO"  ControlStyle-Width="100px"  > <%Response.Write(Session("Nombre_hotel6"))%>   "~/Imagenes/icono user.png"   ~/Imagenes/icono user.png
<ControlStyle Width="50px"></ControlStyle> 
                  </asp:BoundField>

                  <asp:BoundField DataField="MODULO1" HeaderText="M1" SortExpression="MODULO1" ControlStyle-Width="60px">
<ControlStyle Width="30px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="MODULO2" HeaderText="M2" SortExpression="MODULO2" ControlStyle-Width="60px">
<ControlStyle Width="30px"></ControlStyle>
                  </asp:BoundField>
              <asp:BoundField DataField="PLANTA" HeaderText="P" SortExpression="PLANTA" ControlStyle-Width="40px" >
            

                                
<ControlStyle Width="40px"></ControlStyle>
                  </asp:BoundField>
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" >
                  <ControlStyle CssClass="btn btn-info" />
                  </asp:CommandField>
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger" ShowDeleteButton="True" >
            

                                
                  <ControlStyle CssClass="btn btn-danger" />
                  </asp:CommandField>--%>
            
                
                  <asp:TemplateField>
                  <ItemTemplate>
                  <asp:Button ButtonType="Image" ImageUrl="~/Imagenes/mante.png"  runat="server" CssClass="btn btn-info" ControlStyle-Height ="25PX" ControlStyle-Width="25px" CommandName="block" CommandArgument="<%# Container.DataItemIndex %>" />
                  </ItemTemplate>
                  </asp:TemplateField>
                                
                  <asp:ButtonField ButtonType="Image" ImageUrl="~/Imagenes/mante.png" ControlStyle-Width="25PX" ControlStyle-Height ="25PX" CommandName="block" />
            

                                
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
               
                <br />
            <br />
            <br />
               
                <br />
                <asp:Label ID="Label50" runat="server"></asp:Label>
               
                
                
                <br />
                

               <asp:Label ID="Label51" runat="server" Text="Label"></asp:Label>
                

               </h2>
           
                
                 &nbsp;<br />
            <br />
            
            <br />
            <br />
            <br />
        </div>
          
    </div>    
          
        
       
      
   

</asp:Content>