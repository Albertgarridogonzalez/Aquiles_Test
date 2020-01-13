<%@ Page Title="NEwHotel_Datos" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Datos_Tecnicos.aspx.vb" Inherits="WebApp.NewHotel_Datos_Tecnicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
         &nbsp;<asp:Button ID="Button11" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  />
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  />
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-success" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button10" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
         &nbsp;<asp:Button ID="Button14" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
           
    </div>
     <div class="container">
         
    <div class="row3">
        <div class ="col-xs-12"style="vertical-align:middle; text-align: center;">
         <asp:Label ID="Label30" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
       
            </div>
        <br /><br />
</div>
          
         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label1" runat="server" Text="Nombre Interno" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox1" runat="server" Width="200px" AutoPostBack="false" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>           
    
         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label100" runat="server" Text="Cod Copiar" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           <asp:TextBox ID="TextBox100" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>


         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
         
               <asp:Label ID="Label2" runat="server" Text="Cod Voxel" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label3" runat="server" Text="Ruta Voxel" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label4" runat="server" Text="Empresa Voxel" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label5" runat="server" Text="Cod Trascont" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
              
                   <asp:TextBox ID="TextBox5" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
            <br /><br />
               </div><br />    
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label6" runat="server" Text="Ruta Trascont" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label7" runat="server" Text="Ruta Logo" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox7" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>


                  <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label8" runat="server" Text="IP" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox8" runat="server" Width="200px" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>
        
                           <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label9" runat="server" Text="DB" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox9" runat="server" Width="200px" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>





                   <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label11" runat="server" Text="User" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox11" runat="server" Width="200px" AutoPostBack="false" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>           
                   <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label12" runat="server" Text="Pw" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox12" runat="server" Width="200px" AutoPostBack="false" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>           




              <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label15" runat="server" Text="Tipo_defecto" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox13" runat="server" Width="200px" AutoPostBack="false" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>           


               <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label16" runat="server" Text="Crea Conceptos Standard" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
            <asp:CheckBox ID="CheckBox20" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>     




         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label10" runat="server" Text="Cod Corto" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox10" runat="server" Width="200px" AutoPostBack="false" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>           



                            <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label13" runat="server" Text="Activar" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
            <asp:CheckBox ID="CheckBox10" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>        
         

                                  <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label14" runat="server" Text="New Hotel Activado" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
            <asp:CheckBox ID="CheckBox11" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>     

                           











            <div class="row2">
       
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
             <asp:Button ID="Button12" ControlStyle-CssClass ="btn btn-success" runat="server" Text="GUARDAR" />
              <br /><br />
           
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                <asp:Button ID="Button13" ControlStyle-CssClass ="btn btn-danger" runat="server" Text="CANCELAR" />
              <br /><br />
                   
               </div><br />    <br /><br />
                
    </div>


         
         
         
         
         
         
         
         

         
    </div>           
    <br />
    
         
      
   

</asp:Content>