<%@ Page Title="NEwHotel_Datos" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/NEW_HOTEL/NEW_HOTEL.Master" CodeBehind="NewHotel_Crea.aspx.vb" Inherits="WebApp.NewHotel_Crea" %>
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
&nbsp;<asp:Button ID="Button9" CssClass="btn btn-info" runat="server" Height="40px" Text="CONF.TEC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Datos_Tecnicos.aspx"  />
&nbsp;<asp:Button ID="Button10" CssClass="btn btn-success" runat="server" Height="40px" Text="CREAR" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Crea.aspx"  />
           &nbsp;<asp:Button ID="Button14" CssClass="btn btn-info" runat="server" Height="40px" Text="VERIFIC" Width="70px" PostBackUrl="~/NEW_HOTEL/NewHotel_Procesando.aspx"  />
    </div>
     <div class="container">
         
    <div class="row3">
        <div class ="col-xs-12"style="vertical-align:middle; text-align: center;">
         <asp:Label ID="Label30" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
       
            <asp:Timer ID="Timer1" runat="server" Interval="1500" Enabled="False">
            </asp:Timer>
       
            </div>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button21" runat="server" Text="SELECT ALL" CssClass="btn btn-info" />
        <br />
        <br />
    </div>
          
         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox1" runat="server" Text="CREA HOTEL" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
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
    





              <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox5" runat="server" Text="CONFIG" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar5"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label5" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    




         
              <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox9" runat="server" Text="REGIMEN" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel9" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar9"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label10" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    









         <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox2" runat="server" Text="TIPOHAB" Font-Size="Large" CssClass="ChkBoxClass"/>
               <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>         

               
                
            <div class="progress" >
            <div class="progress progress-striped active">
            <div id="ProgressBar2"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
            <asp:Label ID="Label2" runat="server"></asp:Label>
             </div>
             </div>
            </ContentTemplate>
                
       </asp:UpdatePanel>
               
               <br /><br />
               </div><br />    
    </div>


             <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox3" runat="server" Text="ORI / SEG" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar3"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label3" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    

             <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox4" runat="server" Text="RACK" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar4"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label4" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    

        
             <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox6" runat="server" Text="OCUP" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel6" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar6"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label6" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    





          <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox7" runat="server" Text="CONCEPTO" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel7" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar7"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label8" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    
        



         
          <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox8" runat="server" Text="COBROS" Font-Size="Large" CssClass="ChkBoxClass" />
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel8" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar8"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label9" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    
        



         
           <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox11" runat="server" Text="CARACT" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel11" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar11"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label11" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    
        





           <div class="row2">

           <div  class="col-xs-3" style="vertical-align:middle; text-align: left;padding-left:40px"  >
               <asp:CheckBox ID="CheckBox10" runat="server" Text="TMAESTRO" Font-Size="Large" CssClass="ChkBoxClass"/>
           <br /><br />
           </div> 
               
           <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px" >
                 <asp:UpdatePanel ID="UpdatePanel10" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>         
                
                    
                     
                        <div class="progress"  >
                           <div class="progress progress-striped active">
                              <div id="ProgressBar10"  role="progressbar" class="progress-bar progress-bar-success" runat="server"><span></span></div>
                              <asp:Label ID="Label7" runat="server"></asp:Label>
                           </div>
                        </div>
                    </ContentTemplate>
                     
                 </asp:UpdatePanel>
                  <br /><br />
            </div><br />    
         </div>    



         








            <div class="row2">
       
       
           <div  class="col-xs-3" style="vertical-align:middle; text-align: right;"  >
              
           
             <asp:Button ID="Button12" CssClass="btn btn-success" runat="server" Text="CREAR HOTEL" />
              <br /><br />
           
           </div> 
               <div  class="col-xs-9" style="vertical-align:middle;text-align: left;padding-left:25px"  >
           
                <asp:Button ID="Button13"  CssClass="btn btn-info" runat="server" Text="CHECK" />
              <br /><br />
                   
               </div><br />    <br /><br />
                
    </div>


         
         
         
         
         
         
         
         

         
    </div>           
    <br />
    
         
      
   

</asp:Content>