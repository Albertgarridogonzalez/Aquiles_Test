<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Caracterisitica.aspx.vb" Inherits="WebApp.NewHotel_Caracteristica" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Pararos', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
     <div class="rowmin" style="height:60px; max-height:60px ; vertical-align:middle; text-align: center;">
      
       
           <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="40px" Text="DATOS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_datos.aspx"/>
&nbsp;<asp:Button ID="Button3" CssClass="btn btn-info" runat="server" Height="40px" Text="RACK" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Rack.aspx" />
&nbsp;<asp:Button ID="Button4" CssClass="btn btn-info"    runat="server" Height="40px" Text="SEG/ORI" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_SegmentoOrigen.aspx" />    
&nbsp;<asp:Button ID="Button5" CssClass="btn btn-info"   runat="server" Height="40px" Text="TIPO" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_TipoHab.aspx" />
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-info"   runat="server" Height="40px" Text="OCUP" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Ocup.aspx" />
&nbsp;<asp:Button ID="Button7" CssClass="btn btn-success"   runat="server" Height="40px" Text="CARACT" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Caracterisitica.aspx" />
&nbsp;<asp:Button ID="Button20" CssClass="btn btn-info" runat="server" Height="40px" Text="CONCEPTO" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_CONCEPTO.aspx"  />
         &nbsp;<asp:Button ID="Button11" CssClass="btn btn-info" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  />
         &nbsp;<asp:Button ID="Button12" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
&nbsp;<asp:Button ID="Button13" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
    </div>

   
    
       


                 <div class="row3" style="vertical-align:middle; text-align: center; height:200px " >
                        <div class="col-md-4" style="vertical-align:middle; text-align: center; vertical-align:middle; text-align: center;">


                        

                        <asp:Label ID="Label52" runat="server" Text="Caract 1"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label53" runat="server" Text="Caract 2"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                   
                            
                            <asp:Label ID="Label54" runat="server" Text="Caract 3"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                       
                            <asp:Label ID="Label55" runat="server" Text="Caract 4"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                     
                            <asp:Label ID="Label56" runat="server" Text="Caract 5"></asp:Label>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <br />

                            </DIV >
                      <div class="col-md-4" style="vertical-align:middle; text-align: center; vertical-align:middle; text-align: center;">

                        <asp:Label ID="Label57" runat="server" Text="Caract 6"></asp:Label>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label58" runat="server" Text="Caract 7"></asp:Label>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label59" runat="server" Text="Caract 8"></asp:Label>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label60" runat="server" Text="Caract 9"></asp:Label>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label61" runat="server" Text="Caract10"></asp:Label>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                      
                        <br />
                              </DIV >
                                    
          
                       
              
                          <div class="col-md-4" style="vertical-align:middle; text-align: center; vertical-align:middle; text-align: center;">

                                   <asp:Label ID="Label62" runat="server" Text="Caract 11"></asp:Label>
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label63" runat="server" Text="Caract 12"></asp:Label>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label64" runat="server" Text="Caract 13"></asp:Label>
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label65" runat="server" Text="Caract 14"></asp:Label>
                        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label66" runat="server" Text="Caract 15"></asp:Label>
                        <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                      


                                    </DIV >
                      
                    </DIV >                 

    
         <div class="row" style ="overflow-y:scroll; max-height:1000px">
        <div  class="col-md-12" style="vertical-align:middle; text-align: center" >
            <h2>
                
                <br />
                     <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <br />

               <asp:Button ID="Button10" CssClass="btn btn-success" runat="server" Text="GUARDAR" />



                 <asp:GridView ID="GridView1"  AllowMultiRowEdit="True" FullRowMode ="FALSE" class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO; overflow:auto" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" maxwith="600px" maxhight="600px" hight="600px" Width="600px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="false" PageSize="50"  >
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>


                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide">
<ControlStyle Font-Size="XX-Small" Width="0px"></ControlStyle>
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODHAB" HeaderText="COD" SortExpression="CODHAB"  ControlStyle-Width="80px" >
<ControlStyle Width="40px"></ControlStyle>
                  </asp:BoundField>
                <asp:BoundField DataField="DESCHAB" HeaderText="DESCHAB" SortExpression="DESCHAB"  ControlStyle-Width="80px" >
<ControlStyle Width="40px"></ControlStyle>
                  </asp:BoundField>
                        
                   <asp:CheckBoxField DataField="CARACT1" HeaderText="1" SortExpression="CARACT1" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT2" HeaderText="2" SortExpression="CARACT2" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT3" HeaderText="3" SortExpression="CARACT3" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT4" HeaderText="4" SortExpression="CARACT4" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT5" HeaderText="5" SortExpression="CARACT5" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT6" HeaderText="6" SortExpression="CARACT6" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT7" HeaderText="7" SortExpression="CARACT7" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT8" HeaderText="8" SortExpression="CARACT8" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT9" HeaderText="9" SortExpression="CARACT9" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT10" HeaderText="10" SortExpression="CARACT10" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT11" HeaderText="11" SortExpression="CARACT11" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT12" HeaderText="12" SortExpression="CARACT12" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT13" HeaderText="13" SortExpression="CARACT13" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT14" HeaderText="14" SortExpression="CARACT14" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
                   <asp:CheckBoxField DataField="CARACT15" HeaderText="15" SortExpression="CARACT15" ControlStyle-Width="25px" >
                  <ControlStyle Width="25px"></ControlStyle>
                  </asp:CheckBoxField>
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" />
           
            

                                
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" CssClass="HeaderFreez"  />
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
                <asp:Label ID="Label50" runat="server" Visible="False"></asp:Label>
               
                
                
                <br />
                

               <asp:Label ID="Label51" runat="server" Text="Label" Visible="False"></asp:Label>
                

               </h2>
           
                
                 &nbsp;<br />
            <br />
            
            <br />
            <br />
            <br />
        </div>
          
    </div>    
      <div class="rowmin" >
        <div  class="col-md-12" style="vertical-align:middle; text-align: left" >
          

            <br />
     
        
                   <asp:Button ID="Button15" CssClass="btn btn-info"  runat="server" Text="DESCARGAR PLANTILLA EXCEL" />
                   
                   <br />
                   
                   <br />
                   
                   <asp:FileUpload ID="FileUpload2" runat="server" />
               
                <br />
               
                <asp:Button ID="Button14" CssClass="btn btn-success"  runat="server" Text="CARGAR PLANTILLA EXCEL" />
                <br />
            <br />
            <br />

            </div>
          
    </div>    

</asp:Content>