<%@ Page Title="Traspaso" LCID = 1034 Language="vb" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Traspaso.aspx.vb" Inherits="WebApp.Traspaso" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
   

    <div class="row" style=" margin-top:40px;" >
        <div class="col-md-4">
            <h2>Status Hotel</h2>
            <p>
                <br />
                <asp:TextBox ID="TextBox1" runat="server"  Font-Size="Large" Height="25px" Width="250px"></asp:TextBox>
&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Search" Height="25px" Width="70px" />
                <br />
                <br />
                <br />
                <asp:DropDownList ID="DropDownList1" style="text-align:center;" runat="server" Width="250px" Height="25px">
                </asp:DropDownList>
&nbsp;  
                <asp:Button ID="Button2" runat="server" Text=Check Height="25px" Width="70px" />
                <br />
                <br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server"  Font-Size="Large" Height="25px" Width="150px" Enabled="False" Visible="False">01/01/2018</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image1" runat="server" BackColor="Lime" Height="35px" Visible="False" Width="35px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;
                <asp:Image ID="Image2" runat="server" BackColor="Red" Height="35px" Visible="False" Width="35px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Group"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Hotel"></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server" Text="BBDD"></asp:Label>
                <br />
                <br />
            </p>
            <hr aria-dropeffect="popup" style="width: 330px" />
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4">
            <h2>Applications</h2>
            <p>
                <br />
            <asp:Button ID="Button7" runat="server" Text="CARGA DATOS" Height="25px" Width="130px" Visible="False" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" Text="DES. TODO " Height="25px" Width="130px" Visible="False" />
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="CONEXION" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Font-Bold="True" Width="356px" Visible="False">http://81.184.0.161:9696/tesiproPMS/api/v1/chain/</asp:TextBox>
                <br />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="ID CHAIN" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Font-Bold="True" Visible="False">1</asp:TextBox>
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="ID PROPERTY" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Font-Bold="True" Visible="False">1</asp:TextBox>
                <br />
                <br />
                
               
                
                <asp:CheckBox ID="CheckBox2" runat="server" Text="ORIGENES" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image3" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image16" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox3" runat="server" Text="SEGMENTOS" Font-Size="Medium" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image4" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image17" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox4" runat="server" Text="CANALES" Font-Size="Medium" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image5" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image18" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox5" runat="server" Text="REQUERIMIENTOS" Font-Size="Medium" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image6" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image19" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox6" runat="server" Text="EVENTOS" Font-Size="Medium" Visible="False" Enabled="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image7" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image20" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox7" runat="server" Text="POLITICAS" Font-Size="Medium" Visible="False" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image8" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image21" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox8" runat="server" Text="CARACTERISTICAS" Font-Size="Medium" Visible="False" />
                &nbsp;&nbsp; <asp:Image ID="Image9" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image22" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox9" runat="server" Text="TIPOLOGIAS" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image10" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image23" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox10" runat="server" Text="MODULOS" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image11" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image24" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox11" runat="server" Text="HABITACIONES" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image12" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image25" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox12" runat="server" Text="CONCEPTOS" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image13" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image26" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox13" runat="server" Text="AGENCIAS" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image14" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image27" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <asp:CheckBox ID="CheckBox14" runat="server" Text="PARTICULARES" Font-Size="Medium" Visible="False"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="Image15" runat="server" BackColor="Lime" Height="25px" Visible="False" Width="25px"  style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;"/>
&nbsp;<asp:Image ID="Image28" runat="server" BackColor="Red" Height="25px" Visible="False" Width="25px" style="border-style:solid; Border-Radius:100px; border-width:2px; border-color:darkgray;" />
                <br />
                <br />
                <br />
                <br />
                <br />
            <asp:Button ID="Button5" runat="server" Text="SEND !" Height="25px" Width="130px" Visible="False" />
                &nbsp;
                &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                </p>
            <hr aria-dropeffect="popup" style="width: 329px" />
            <p>
                <br />
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4">
            <h2>Reporting</h2>
            <p>
                <br />
                &nbsp;
                <asp:Label ID="Label7" runat="server"></asp:Label>
                <br />
&nbsp;
                <br />
&nbsp;
                <asp:Label ID="Label8" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;
                <asp:Label ID="Label9" runat="server"></asp:Label>
                <br />
                <br />
                &nbsp;
                <asp:Label ID="Label10" runat="server"></asp:Label>
                <br />
&nbsp;
                <br />
&nbsp;
                <asp:Label ID="Label11" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;
                <asp:Label ID="Label12" runat="server"></asp:Label>
                <br />
&nbsp;
                <br />
&nbsp;
                <asp:Label ID="Label13" runat="server"></asp:Label>
                <br />
&nbsp;
                <br />
&nbsp;
                <asp:Label ID="Label14" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;
                <asp:Label ID="Label15" runat="server"></asp:Label>
                <br />
                <br />
                &nbsp;
                <asp:Label ID="Label16" runat="server"></asp:Label>
                <br />
&nbsp;
                <br />
&nbsp;
                <asp:Label ID="Label17" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;
                <asp:Label ID="Label18" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;
                <asp:Label ID="Label19" runat="server"></asp:Label>
                <br />
                <br />
                &nbsp;
                <asp:Label ID="Label20" runat="server"></asp:Label>
                <br />
&nbsp;
                <br />
&nbsp;
                <asp:Label ID="Label21" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;
                <asp:Label ID="Label22" runat="server"></asp:Label>
                <br />
            </p>
            <hr aria-dropeffect="popup" style="width: 329px; margin-left: 0px;" />
            <p>
                <br />
            </p>
            <p>
                &nbsp;</p>
        </div>
    </div>

</asp:Content>

