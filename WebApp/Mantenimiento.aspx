<%@ Page Title="Mantenimiento" LCID = 1034 Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mantenimiento.aspx.vb" Inherits="WebApp.Mantenimiento" %>
 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    


    <div class="row"  style=" margin-top:40px; vertical-align:middle; text-align: center; height : 580px; background-image:url(https://tesipro.com/wp-content/uploads/2013/08/Central-Reservas-Tesipro.jpg) ">
        <div class="col-md-4">
            <h2>Status Hotel</h2>
            <p>
                <br />
                <asp:TextBox ID="TextBox1" runat="server"  Font-Size="Large" Height="25px" Width="235px"></asp:TextBox>
&nbsp;
                <asp:Button ID="Button1" CssClass="btn btn-info "  runat="server" Text="SEARCH" Height="35px" Width="80px" TabIndex="1" />
                <br />
                <br />
                <br />
                <asp:DropDownList ID="DropDownList1" style="text-align:center;" runat="server" Width="235px" Height="25px" TabIndex="2">
                </asp:DropDownList>
&nbsp;  
                <asp:Button ID="Button2" CssClass="btn btn-info "  runat="server" Text=CHECK Height="35px" Width="80px" TabIndex="3" />
                <br />
                <br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server"  Font-Size="Large" Height="25px" Width="150px" Enabled="False">01/01/2018</asp:TextBox>
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
            <div class="alert alert-danger alert-dismissible"  runat="server" id="ALERT_TEST" style="visibility:hidden" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Atención!</strong> Error en el cierre.
            </div>

        </div>
        <div class="col-md-4">
            <h2>Applications</h2>
            <p>
                <br />
                <asp:DropDownList ID="DropDownList2" style="text-align:center;" runat="server" Height="25px" Width="235px" Font-Size="Medium">
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:Button ID="Button4" CssClass="btn btn-info "  runat="server" Height="35px" Text="CHARGE" Width="80px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Height="35px" Text="Seleccionar Datos" Width="160px" Visible="False" />
                <br />
                <br />
            <asp:TextBox ID="TextBox10" runat="server" BorderStyle="Ridge" TextMode="Number" Visible="False"  Font-Size="Large" Height="30px" Width="170px" AutoCompleteType="Disabled">0</asp:TextBox>
            <asp:TextBox ID="TextBox14" runat="server" BorderStyle="Ridge" Visible="False"  Font-Size="Large" Height="30px" Width="170px" AutoCompleteType="Disabled">0</asp:TextBox>
            <asp:Label ID="Label10" runat="server" Text="Label1" Visible="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <br />
                <asp:CheckBox ID="CheckBox2" runat="server" Text="No Cerrable" Visible="False" />
                <br />
                <asp:CheckBox ID="CheckBox3" runat="server" Text="De Sistema" Visible="False" />
                <br />
            <asp:TextBox ID="TextBox11" runat="server" BorderStyle="Ridge" TextMode="Number" Visible="False"  Font-Size="Large" Height="30px" Width="170px">0</asp:TextBox>
            <asp:Label ID="Label11" runat="server" Text="Label2" Visible="False"></asp:Label>
                <br />
                <br />
            <asp:TextBox ID="TextBox12" runat="server" BorderStyle="Ridge" TextMode="Date" Visible="False"  Font-Size="Large" Height="30px" Width="170px">01/01/2001</asp:TextBox>
            <asp:Label ID="Label12" runat="server" Text="Label3" Visible="False"></asp:Label>
                <br />
                <br />
            <asp:TextBox ID="TextBox13" runat="server" BorderStyle="Ridge" TextMode="Date" Visible="False"  Font-Size="Large" Height="30px" Width="170px">01/01/2001</asp:TextBox>
            <asp:Label ID="Label13" runat="server" Text="Label4" Visible="False"></asp:Label>
                <br />
                <br />
            <asp:Button ID="Button5" CssClass="btn btn-success"  runat="server" Text="SEND !" Height="35px" Width="100px" Visible="False" />
                &nbsp;
         <%--       <button type="button" class="btn btn-labeled btn-success" >
                <span class="btn-label"><i class="glyphicon glyphicon-thumbs-up"></i></span>Thumbs
                Up</button>--%>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button9" CssClass="btn btn-danger"  runat="server" Text="FORZAR" TabIndex="4" Height="35px" Width="100px" Visible="False"  />
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
            <asp:Button ID="Button7" CssClass="btn btn-danger"  runat="server" Text="TRASPASO" TabIndex="4" />
                   &nbsp;<asp:Button ID="Button10" CssClass="btn btn-danger"  runat="server" Text="CHECK LINKED SERVER" TabIndex="4" />
                &nbsp;<asp:Button ID="Button8" CssClass="btn btn-danger"  runat="server" Text="CHECK SQL" TabIndex="4" />
      
                <br />
      
                <br />
                <asp:Button ID="Button6" runat="server" Text="By Process" Height="25px" Visible="False" />
                <br />
                <asp:CheckBox ID="CheckBox1" runat="server" Visible="False" Checked="True" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Chart ID="Chart1" runat="server" Width="320px" Height="220px" Visible="False">
                    <Series>
                        <asp:Series Name="Series1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
               

            </p>
            <hr aria-dropeffect="popup" style="width: 329px; margin-left: 0px;" />
            <p>
                <br />
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="alert alert-danger alert-dismissible" id="ALERT" runat="server" role="alert" visible="false">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Atención!</strong> El Hotel <%Response.Write(Session("SQL_ERROR"))%> tiene errores en el cierre.
        </div>
    </div>

</asp:Content>
