<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Rack.aspx.vb" Inherits="WebApp.NewHotel_Rack" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Pararos', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
     <div class="rowmin" style="height:60px; max-height:60px ; vertical-align:middle; text-align: center;">
      
       
           <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Height="40px" Text="DATOS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_datos.aspx"/>
&nbsp;<asp:Button ID="Button3" CssClass="btn btn-success" runat="server" Height="40px" Text="RACK" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Rack.aspx" />
&nbsp;<asp:Button ID="Button4" CssClass="btn btn-info"    runat="server" Height="40px" Text="SEG/ORI" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_SegmentoOrigen.aspx" />    
&nbsp;<asp:Button ID="Button5" CssClass="btn btn-info"   runat="server" Height="40px" Text="TIPO" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_TipoHab.aspx" />
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-info"   runat="server" Height="40px" Text="OCUP" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Ocup.aspx" />
&nbsp;<asp:Button ID="Button7" CssClass="btn btn-info"   runat="server" Height="40px" Text="CARACT" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Caracterisitica.aspx" />
&nbsp;<asp:Button ID="Button20" CssClass="btn btn-info" runat="server" Height="40px" Text="CONCEPTO" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_CONCEPTO.aspx"  />
         &nbsp;<asp:Button ID="Button11" CssClass="btn btn-info" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  />
         &nbsp;<asp:Button ID="Button12" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
         &nbsp;<asp:Button ID="Button13" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>

    <div class="row">

                                      <div class="alert alert-danger alert-dismissible" id="ALERT" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> HAY HABITACIONES CON ERRORES EN LA TIPOLOGÍA HAB : <%Response.Write(Session("ErrorHAB"))%>.
</diV>

       
          <div class="alert alert-danger alert-dismissible" id="ALERT2" runat="server" role="alert" visible="false">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Atención!</strong> EL CAMPO COD SOLO PUEDE SER NUMÉRICO REVISA LA HAB : <%Response.Write(Session("ErrorHAB2"))%>.
</diV>



        <div  class="col-md-12" style="vertical-align:middle; text-align: center;" >
           
                     <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <br />


                        <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList2" runat="server" Visible="False">
                        </asp:DropDownList>
                        &nbsp;
                        <asp:Button ID="Button21"   CssClass="btn btn-success" runat="server" Text="CAMBIAR"/>
                        &nbsp;
                        <asp:Button ID="Button22"  CssClass="btn btn-success" runat="server" Text="CAMBIAR" Visible="False" />
                        <br />
                 <asp:GridView ID="GridView1" RowStyle-Height ="30px" AllowMultiRowEdit="True" OnRowDataBound="OnRowDataBound" FullRowMode ="FALSE" class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" style="text-align:center;overflow-x :AUTO" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlTest" BorderStyle="Solid" Font-Bold="True" maxwith="600" Width="600px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="false" PageSize="20">
            <AlternatingRowStyle BackColor="#CCCCCC" />
                     <RowStyle Height ="35px" />

            <Columns>
           
                
                  <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible ="true" ControlStyle-Width="0px" ControlStyle-Font-Size="Smaller" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" >
<ControlStyle Font-Size="XX-Small" Width="0px"></ControlStyle>
                  <ItemStyle Font-Size="XX-Small" />
                  </asp:BoundField>
                  <asp:BoundField DataField="CODHAB" HeaderText="COD" SortExpression="CODHAB"  ControlStyle-Width="80px" >
<ControlStyle Width="80px"></ControlStyle>
                  </asp:BoundField>
                                  <asp:BoundField DataField="HAB" HeaderText="HAB" SortExpression="HAB"  ControlStyle-Width="60px" >
<ControlStyle Width="60px"></ControlStyle>
                  </asp:BoundField>

                  <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO"  ControlStyle-Width="100px"  >
<ControlStyle Width="100px"></ControlStyle>
                  </asp:BoundField>

                  <asp:BoundField DataField="MODULO1" HeaderText="M1" SortExpression="MODULO1" ControlStyle-Width="60px">
<ControlStyle Width="60px"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="MODULO2" HeaderText="M2" SortExpression="MODULO2" ControlStyle-Width="60px">
<ControlStyle Width="60px"></ControlStyle>
                  </asp:BoundField>
              <asp:BoundField DataField="PLANTA" HeaderText="P" SortExpression="PLANTA" ControlStyle-Width="40px" >
            

                                
<ControlStyle Width="40px"></ControlStyle>
                  </asp:BoundField>
            

                                
                  <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button"  /> 
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

            
    <%--<div class="rowmin">--%>

  <div  class="col-md-12" style="text-align: left" >
                        <asp:TextBox ID="TextBox1" runat="server">DVL</asp:TextBox>
                        &nbsp;<asp:TextBox ID="TextBox7" runat="server">DOVBLE</asp:TextBox>
                        <asp:TextBox ID="TextBox8" runat="server" Width="85px">ORDEN</asp:TextBox>
                        &nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Text="SALA" /> <asp:Button ID="Button24" runat="server" Text="CREAR TIPOLOGIA" />
                       
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server">000</asp:TextBox>
                        <asp:TextBox ID="TextBox3" runat="server">DVL</asp:TextBox>  <asp:Button ID="Button25" runat="server" Text="CAMBIAR TIPO HAB" />
                       
                        <br />
                        <asp:TextBox ID="TextBox4" runat="server">DFL</asp:TextBox>
                        <asp:TextBox ID="TextBox5" runat="server">DVL</asp:TextBox><asp:Button ID="Button26" runat="server" Text="UPDATEA TIPOLOGIA" />
                       
                        <br />
                        <asp:TextBox ID="TextBox6" runat="server">DFL</asp:TextBox>  <asp:Button ID="Button27" runat="server" Text="ELIMINAR TIPOLOGIA" />
                       
       <br /> <br /> <br />

      </div>


      <div  class="col-MD-12" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar1"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label1" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    




            </div>   

           </div>  
        <div class="rowmin">


      <div  class="col-MD-6" style="text-align: left;padding-left:25px" >
     
         <asp:FileUpload ID="FileUpload1" runat="server" />
               
                <br />
               
                <asp:Button ID="Button10" CssClass="btn btn-success"  runat="server" Text="CARGAR HABITAC.DBF" />
                <br />
            <br />
               
                <asp:Button ID="Button23" CssClass="btn btn-danger"  runat="server" Text="BORRAR RACK" />
                <br />
                <asp:Label ID="Label50" runat="server"></asp:Label>
               
                
                
               <asp:Label ID="Label51" runat="server" Text="Label"></asp:Label>
                

               
           
                
              
            
                     <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="7000">
                     </asp:Timer>
           
                
              
            
            <br />
          <br />
           
                
              
            
            <br />
           </div>
            </div>
     <div class="rowmin">

               <div  class="col-MD-6" style="text-align: left" >
     
        
                   <asp:Button ID="Button15" CssClass="btn btn-info"  runat="server" Text="DESCARGAR PLANTILLA EXCEL" />
                   
                   <br />
                   
                   <br />
                   
                   <asp:FileUpload ID="FileUpload2" runat="server" />
               
                   <br />
               
                <asp:Button ID="Button14" CssClass="btn btn-success"  runat="server" Text="CARGAR PLANTILLA EXCEL" />
                <br />
            <br />
               

               
                

                

               
           
                
              
            
                     <asp:Timer ID="Timer2" runat="server" Enabled="False" Interval="7000">
                     </asp:Timer>
           
                
              
            
            <br />
           </div>

      
   <%--   <div  class="col-xs-5" style="text-align: right" >
                             <asp:Button ID="Button24" runat="server" Text="CREAR TIPOLOGIA" /><br />
                             <asp:Button ID="Button25" runat="server" Text="CAMBIAR TIPO HAB" /><br />
                             <asp:Button ID="Button26" runat="server" Text="UPDATEA TIPOLOGIA" /><br />
                             <asp:Button ID="Button27" runat="server" Text="ELIMINAR TIPOLOGIA" /><br />
      </div>--%>
              <%--</div>--%>



 </div>                     
        
         
        

                  


        
            
           


               
             
            <br />
            <br />
        
          
     
          
        
       
      
   

</asp:Content>