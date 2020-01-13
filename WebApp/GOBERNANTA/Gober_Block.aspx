<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/GOBERNANTA/Gober.Master" CodeBehind="Gober_Block.aspx.vb" Inherits="WebApp.Gober_Block" %>
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
                   
             <asp:SqlDataSource ID="SqlTest" runat="server"  
                 >
             </asp:SqlDataSource>

                                                                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Label ID="Label52" runat="server" Text="DESDE HABITA"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:Label ID="Label53" runat="server" Text="HASTA HAB"></asp:Label>
                        ITA<br />
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:Label ID="Label54" runat="server" Text="DESDE FECHA"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:Label ID="Label55" runat="server" Text="HASTA FECHA"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:Label ID="Label56" runat="server" Text="MOTIVO   USU"></asp:Label>
                        <br />
                        <asp:Label ID="Label57" runat="server" Text="TIPO BLOCK"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Selected="True">BLOQ</asp:ListItem>
                            <asp:ListItem>OUT</asp:ListItem>
                            <asp:ListItem>DESBLOQ</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="Button1" CssClass="btn btn-success  btn3d"  runat="server" Text="OK"  Height="35px" Width="100px" />
                        

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