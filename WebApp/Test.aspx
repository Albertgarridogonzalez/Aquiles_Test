<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Test.aspx.vb" Inherits="WebApp.Test"%>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>

      <HEAD>

            <title>Página con PopUp</title>

            <meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">

            <meta name="CODE_LANGUAGE" content="Visual Basic 7.0">

            <meta name="vs_defaultClientScript" content="JavaScript">

            <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">

            <SCRIPT LANGUAGE="JavaScript">



            </SCRIPT>

           <script>
var x = document.getElementById("demo");

   function getLocation() {
   if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
      x.innerHTML = "Geolocation is not supported by this browser..";
   }
 }

     function showPosition(position) {
      x.innerHTML = "Latitude: " + position.coords.latitude + 
     "<br>Longitude: " + position.coords.longitude; 
  }
  </script>

      </HEAD>

      <body>

          
               






                  <form id="form1" runat="server">

          
               






                  <asp:Localize ID="Localize1" runat="server"></asp:Localize>

          


            </form>

                      <eo:Grid ID="Grid1"  DataSourceID="SqlTest" runat="server" BorderColor="#C7D1DF" BorderWidth="1px" ClientIDMode="AutoID" ColumnHeaderAscImage="00050303" ColumnHeaderDescImage="00050304" ColumnHeaderDividerImage="00050302" FixedColumnCount="1" Font-Bold="False" Font-Italic="False" Font-Names="Verdana" Font-Overline="False" Font-Size="9pt" Font-Strikeout="False" Font-Underline="False" GridLineColor="199, 209, 223" GridLines="Both" Height="200px" ItemHeight="19" Width="380px">
                          <ItemStyles>
                              <eo:GridItemStyleSet>
                                  <ItemStyle CssText="background-color: white" />
                                  <ItemHoverStyle CssText="background-image: url(00050206); background-repeat: repeat-x" />
                                  <SelectedStyle CssText="background-image: url(00050207); background-repeat: repeat-x" />
                                  <CellStyle CssText="padding-left:8px;padding-top:2px; color:#336699;white-space:nowrap;" />
                              </eo:GridItemStyleSet>
                          </ItemStyles>
                          <ColumnHeaderStyle CssText="background-image:url('00050301');padding-left:8px;padding-top:2px;font-weight: bold;color:white;" />
                          <Columns>
                              <eo:RowNumberColumn>
                              </eo:RowNumberColumn>
                              <eo:StaticColumn HeaderText="Header">
                              </eo:StaticColumn>
                              <eo:StaticColumn HeaderText="Header">
                              </eo:StaticColumn>
                          </Columns>
                          <ColumnTemplates>
                              <eo:TextBoxColumn>
                                  <TextBoxStyle CssText="BORDER-RIGHT: #7f9db9 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7f9db9 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 8.75pt; PADDING-BOTTOM: 1px; MARGIN: 0px; BORDER-LEFT: #7f9db9 1px solid; PADDING-TOP: 2px; BORDER-BOTTOM: #7f9db9 1px solid; FONT-FAMILY: Tahoma" />
                              </eo:TextBoxColumn>
                              <eo:DateTimeColumn>
                                  <DatePicker ControlSkinID="None" DayCellHeight="16" DayCellWidth="19" DayHeaderFormat="FirstLetter" DisabledDates="" OtherMonthDayVisible="True" SelectedDates="" TitleLeftArrowImageUrl="DefaultSubMenuIconRTL" TitleRightArrowImageUrl="DefaultSubMenuIcon">
                                      <PickerStyle CssText="border-bottom-color:#7f9db9;border-bottom-style:solid;border-bottom-width:1px;border-left-color:#7f9db9;border-left-style:solid;border-left-width:1px;border-right-color:#7f9db9;border-right-style:solid;border-right-width:1px;border-top-color:#7f9db9;border-top-style:solid;border-top-width:1px;font-family:Courier New;font-size:8pt;margin-bottom:0px;margin-left:0px;margin-right:0px;margin-top:0px;padding-bottom:1px;padding-left:2px;padding-right:2px;padding-top:2px;" />
                                      <CalendarStyle CssText="background-color: white; border-right: #7f9db9 1px solid; padding-right: 4px; border-top: #7f9db9 1px solid; padding-left: 4px; font-size: 9px; padding-bottom: 4px; border-left: #7f9db9 1px solid; padding-top: 4px; border-bottom: #7f9db9 1px solid; font-family: tahoma" />
                                      <TitleStyle CssText="background-color:#9ebef5;font-family:Tahoma;font-size:12px;padding-bottom:2px;padding-left:6px;padding-right:6px;padding-top:2px;" />
                                      <TitleArrowStyle CssText="cursor:hand" />
                                      <MonthStyle CssText="font-family: tahoma; font-size: 12px; margin-left: 14px; cursor: hand; margin-right: 14px" />
                                      <DayHeaderStyle CssText="font-family: tahoma; font-size: 12px; border-bottom: #aca899 1px solid" />
                                      <DayStyle CssText="font-family: tahoma; font-size: 12px; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                                      <DayHoverStyle CssText="font-family: tahoma; font-size: 12px; border-right: #fbe694 1px solid; border-top: #fbe694 1px solid; border-left: #fbe694 1px solid; border-bottom: #fbe694 1px solid" />
                                      <TodayStyle CssText="font-family: tahoma; font-size: 12px; border-right: #bb5503 1px solid; border-top: #bb5503 1px solid; border-left: #bb5503 1px solid; border-bottom: #bb5503 1px solid" />
                                      <SelectedDayStyle CssText="font-family: tahoma; font-size: 12px; background-color: #fbe694; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                                      <DisabledDayStyle CssText="font-family: tahoma; font-size: 12px; color: gray; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                                      <OtherMonthDayStyle CssText="font-family: tahoma; font-size: 12px; color: gray; border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid; border-bottom: white 1px solid" />
                                  </DatePicker>
                              </eo:DateTimeColumn>
                              <eo:MaskedEditColumn>
                                  <MaskedEdit ControlSkinID="None" TextBoxStyle-CssText="BORDER-RIGHT: #7f9db9 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7f9db9 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 1px; MARGIN: 0px; BORDER-LEFT: #7f9db9 1px solid; PADDING-TOP: 2px; BORDER-BOTTOM: #7f9db9 1px solid; font-family:Courier New;font-size:8pt;">
                                  </MaskedEdit>
                              </eo:MaskedEditColumn>
                          </ColumnTemplates>
                          <FooterStyle CssText="padding-bottom:4px;padding-left:4px;padding-right:4px;padding-top:4px;" />
                      </eo:Grid>
          <asp:SqlDataSource ID="SqlTest" runat="server"  
                 >
             </asp:SqlDataSource>
                  </form>

      </body>
    
 