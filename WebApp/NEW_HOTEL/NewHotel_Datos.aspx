<%@ Page Title="NEwHotel_Datos" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Datos.aspx.vb" Inherits="WebApp.NewHotel_Datos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
   
    
     <div class="rowmin" style="height:60px; max-height:60px ; vertical-align:middle; text-align: center;">
      

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
       
           <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Height="40px" Text="DATOS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_datos.aspx" TabIndex="10" />
&nbsp;<asp:Button ID="Button3" CssClass="btn btn-info" runat="server" Height="40px" Text="RACK" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Rack.aspx" TabIndex="10" />
&nbsp;<asp:Button ID="Button4" CssClass="btn btn-info"    runat="server" Height="40px" Text="SEG/ORI" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_SegmentoOrigen.aspx" TabIndex="10" />    
&nbsp;<asp:Button ID="Button5" CssClass="btn btn-info"   runat="server" Height="40px" Text="TIPO" Width="70px"  PostBackUrl="~/NEW_HOTEL/NewHotel_TipoHab.aspx" TabIndex="10"/>
&nbsp;<asp:Button ID="Button6" CssClass="btn btn-info"   runat="server" Height="40px" Text="OCUP" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Ocup.aspx" TabIndex="10"/>
&nbsp;<asp:Button ID="Button7" CssClass="btn btn-info"   runat="server" Height="40px" Text="CARACT" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Caracterisitica.aspx" TabIndex="10"/>
&nbsp;<asp:Button ID="Button20" CssClass="btn btn-info" runat="server" Height="40px" Text="CONCEPTO" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_CONCEPTO.aspx"  TabIndex="10"/>
         &nbsp;<asp:Button ID="Button14" CssClass="btn btn-info" runat="server" Height="40px" Text="COBROS" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_COBROS.aspx"  TabIndex="10"/>
         &nbsp;<asp:Button ID="Button15" CssClass="btn btn-info" runat="server" Height="40px" Text="REGIMEN" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_REGIMEN.aspx"  TabIndex="10"/>
&nbsp;<asp:Button ID="Button8" CssClass="btn btn-info" runat="server" Height="40px" Text="TRASP M" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_TM.aspx"  TabIndex="10"/>
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  TabIndex="10"/>
&nbsp;<asp:Button ID="Button10" CssClass="btn btn-info" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  TabIndex="10"/>
         &nbsp;<asp:Button ID="Button16" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  TabIndex="10"/>
           
    </div>
     <div class="container" >
         
    <div class="row3" >
        <div class ="col-xs-12"style="vertical-align:middle; text-align: center;" >
         <asp:Label ID="Label30" runat="server"  Text="Label" Font-Size="XX-Large"></asp:Label>
       
            </div>
        <br /><br />
</div>
          
         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label1" runat="server" Text="Nombre" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox1" runat="server" Width="200px" AutoPostBack="false" BackColor="#CADDBD" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>           

                   
         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label32" runat="server" Text="Grupo" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
           <asp:TextBox ID="TextBox24" runat="server" Width="200px" AutoPostBack="false" BackColor="#CADDBD" ></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>    
    
         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
           <asp:Label ID="Label100" runat="server" Text="CODIGOHOT" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           <asp:TextBox ID="TextBox100" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>


         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
         
               <asp:Label ID="Label2" runat="server" Text="Telefono" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label3" runat="server" Text="Direccion" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label4" runat="server" Text="Poblacion" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label5" runat="server" Text="CodPostal" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
              
                   <asp:TextBox ID="TextBox5" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
            <br /><br />
               </div><br />    
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label6" runat="server" Text="CIF" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label7" runat="server" Text="NumHabit" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox7" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label8" runat="server" Text="NomFiscal" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox8" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div>  <br />  
    </div>
         
         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label9" runat="server" Text="Id Policia" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>
         
         <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label10" runat="server" Text="SecuenPoli" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox10" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>


             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label11" runat="server" Text="Ruta Policia" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox11" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label12" runat="server" Text="CambSabana" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox12" runat="server" Width="200px" TextMode="Number">2</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label13" runat="server" Text="UltimNumFact" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox13" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label14" runat="server" Text="UltimNumAb" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox14" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label15" runat="server" Text="TipologiaSAL" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox15" runat="server" Width="200px" AutoCompleteType="Disabled">SAL</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label16" runat="server" Text="E_Mail" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox16" runat="server" Width="200px" TextMode="Email"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label17" runat="server" Text="NºCamas" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox17" runat="server" Width="200px" TextMode="Number">0</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label18" runat="server" Text="NºCamasExt" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox18" runat="server" Width="200px" TextMode="Number">0</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label19" runat="server" Text="NºCunas" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox19" runat="server" Width="200px" TextMode="Number">0</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label20" runat="server" Text="SegmCasa" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox20" runat="server" Width="200px">CASA</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label21" runat="server" Text="CategHotel" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox21" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label22" runat="server" Text="Web" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox22" runat="server" Width="200px"></asp:TextBox>
           <br /><br />
               </div><br />    
    </div>

             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label23" runat="server" Text="ImpTasaTur" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:TextBox ID="TextBox23" runat="server" Width="200px">0</asp:TextBox>
           <br /><br />
               </div><br />    
    </div>


             <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label24" runat="server" Text="TasaTurist" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:CheckBox ID="CheckBox1" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>

            <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label25" runat="server" Text="CierreAut" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:CheckBox ID="CheckBox2" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>

            <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label26" runat="server" Text="ImpuetIncl" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:CheckBox ID="CheckBox3" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>

            <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label27" runat="server" Text="RegimBB" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:CheckBox ID="CheckBox4" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>

            <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label28" runat="server" Text="RegMP" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:CheckBox ID="CheckBox5" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>

            <div class="row2">
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
           <asp:Label ID="Label29" runat="server" Text="RegPC" Font-Size="Large" Font-Bold="True"></asp:Label>    
           <br /><br />
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                   <asp:CheckBox ID="CheckBox6" runat="server" ></asp:CheckBox>
           <br /><br />
               </div><br />    
    </div>





            <div class="row2">
       
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
             <asp:Button ID="Button12" CssClass="btn btn-success" runat="server" Text="GUARDAR" TabIndex="1" />
              <br /><br /><br /><br />
            <asp:FileUpload ID="FileUpload1"   runat="server" />
               
                <br /><br /><br /><br />

               <asp:FileUpload ID="FileUpload2"  runat="server" />  <%-- class="file_input_button"--%>
                
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           


             

                <asp:Button ID="Button13" CssClass="btn btn-danger" runat="server" Text="CANCELAR"  TabIndex="9" />
              <br /><br /> <br /><br />


                          <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text="CARGAR DBF HOTELS" />
                <br />
                <asp:Label ID="Label50" runat="server"></asp:Label>
               
                    <br /><br /><br /><br />
                      
               
                <asp:Button ID="Button11" CssClass="btn btn-success"  runat="server" Text="CARGAR DBF DATHOTEL" />
                <br />
                <asp:Label ID="Label31" runat="server"></asp:Label>
                <br />
                   
               </div><br />    <br /><br />
                
    </div>


         
         
         
         
         
         
         
         

         
    </div>           
    <br />
    
         
      
   

</asp:Content>