<%@ Page Title="Estadistica" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Estadistica.aspx.vb" Inherits="WebApp.Estadistica" %>
 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
    
   
    <div class="row" style=" margin-top:40px;" >
       <%-- <div style="overflow-x :SCROLL;">  --%>
     <div class="col-lg-6" style="overflow-x :SCROLL;" >
         
            <h2>Estadisticas</h2>
            <p>
                <br />
&nbsp;       

        
                <br />
                TOP 5 INCIDENCIAS RESUELTAS<br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Chart ID="Chart2" CssClass="CANVAS" HorizontalAlign="left" CanResize="true" style="margin-left:0px ; text-align:center ;overflow-x :auto;background-color:#9e9e9e" runat="server" DataSourceID="SqlDataSource2" Height="607px" Font-Size="Small" Width="500px" BackColor="Transparent" BackSecondaryColor="Gray" >
                    <Series>
                        <asp:Series Name="Series1" XValueMember="DESC_PROCESO" YValueMembers="CANTIDAD" BackGradientStyle="HorizontalCenter" Font="Microsoft Sans Serif, 3pt" LabelAngle="30" Palette="EarthTones" LabelBackColor="Black">
                  
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                    <%--     <AxisY IsLabelAutoFit="False" IntervalAutoMode="1">
                        </AxisY>--%>
                            <AxisY Title="CANTIDAD INCIDENCIAS RESUELTAS"  Minimum="0" Maximum="Auto" Interval="5"> </AxisY>
                            <AxisX Title="PROCEDIMIENTOS" Minimum="0" LineWidth="3"  Interval="1" LabelAutoFitMaxFontSize ="8" IsLabelAutoFit ="true" LabelAutoFitStyle ="LabelsAngleStep30" > </AxisX>
                            <Area3DStyle Enable3D="True" Inclination="20" LightStyle="Realistic" > </Area3DStyle>
                            
                        </asp:ChartArea>
                        <%--<AxisY Title="Some Title" Minimum="0" Maximum="500" Interval="10"> </AxisY>--%>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"  SelectCommand="SELECT top 5 [CANTIDAD], [DESC_PROCESO] FROM [CHARTVIEW] ORDER BY [CANTIDAD] DESC"></asp:SqlDataSource>
                
                <br />
&nbsp;  
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<br />
            </p>
            <hr aria-dropeffect="popup" style="width: 330px" />
            <p>
                &nbsp;</p>
        
       </div>
         <div class="col-lg-6" style="overflow-x :SCROLL;">

                     <%--<div style="overflow-x :SCROLL;">  --%> 
            <h2>Estadisticas</h2>
            <p>
                <br />
&nbsp;       

        
                <br />
                TOP 5 HOTELES CON MAS INCIDENCIAS<br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Chart ID="Chart1"  CssClass="Chart"  HorizontalAlign="left" CanResize="true" style="margin-left:0px ; text-align:center ;overflow-x :auto;background-color:#9e9e9e" runat="server" DataSourceID="SqlTest" Height="607px" Font-Size="Small" Width="500px" BackColor="Transparent" >
                    <Series>
                        <asp:Series Name="Series1" BackGradientStyle="HorizontalCenter" Font="Microsoft Sans Serif, 3pt" LabelAngle="30" Palette="EarthTones" LabelBackColor="Black" XValueMember="HOTEL" YValueMembers="CANTIDAD">
                  
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                    <%--     <AxisY IsLabelAutoFit="False" IntervalAutoMode="1">
                        </AxisY>--%>
                            <AxisY Title="CANTIDAD INCIDENCIAS RESUELTAS"  Minimum="0" Maximum="Auto" Interval="3"> </AxisY>
                            <AxisX Title="HOTELES" Minimum="0" LineWidth="3"  Interval="1" LabelAutoFitMaxFontSize ="8" IsLabelAutoFit ="true" LabelAutoFitStyle ="LabelsAngleStep30" > </AxisX>
                            <Area3DStyle Enable3D="True" Inclination="20" LightStyle="Realistic" > </Area3DStyle>
                            
                        </asp:ChartArea>
                        <%--<AxisY Title="Some Title" Minimum="0" Maximum="500" Interval="10"> </AxisY>--%>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="Sqltest" runat="server"  SelectCommand="SELECT top 5 [CANTIDAD], [HOTEL] FROM [CHARTVIEW2] ORDER BY [CANTIDAD] DESC"></asp:SqlDataSource>
                
                
                <br />
&nbsp;  
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<br />
            </p>
            <hr aria-dropeffect="popup" style="width: 330px" />
            <p>
                &nbsp;</p>

          </div>
     




     </div>
</asp:Content>