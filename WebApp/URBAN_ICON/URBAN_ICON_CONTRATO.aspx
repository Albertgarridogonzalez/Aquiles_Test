<%@ Page Title="URBAN_ICON_CONTRATO" LCID = 1034 Language="VB"  AutoEventWireup="true" MasterPageFile="~/URBAN_ICON/URBAN_ICON.Master" CodeBehind="URBAN_ICON_CONTRATO.aspx.vb" Inherits="WebApp.URBAN_ICON_CONTRATO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <SCRIPT LANGUAGE="JavaScript">
         function url() {
            
          hidden = open('Parametros', 'NewWindow', 'top = auto, left = auto, width = 300, height = 320, status = no, resizable = no, scrollbars = no, menubar = no, resizable = no, titlebar = no, toolbar = no');
      }
      </SCRIPT>
   
    
     <div class="row" style=" margin-top:40px; vertical-align:middle; text-align: center; height : 5580px; background-image:url(https://www.reggaetonbarcelona.es/wp-content/uploads/2017/09/opaciti.png?id=2810.webp) ">
        <br />
        <br />
        <br />
        <br />
        <br /> 

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
       







            <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1"  class="table" OnRowDeleting="OnRowDeleting" HorizontalAlign="Center" Style="text-align: center; overflow-x: AUTO" runat="server" AutoGenerateColumns="False" DataSourceID="EVENTO" BorderStyle="Solid" Font-Bold="True" maxwidth="800" Width="800px" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Medium" AllowPaging="True" PageSize="20" EnableSortingAndPagingCallbacks="true" Visible="False">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <RowStyle Height="35px" />
                            <Columns>


                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="true" ControlStyle-Width="0px" ControlStyle-Font-Size="XX-Small"  >
                                    <ItemStyle Font-Size="XX-Small" />
                                </asp:BoundField>
                          <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" ControlStyle-Width="180px"><ControlStyle Width="180px"></ControlStyle></asp:BoundField>
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" ControlStyle-Width="100px"><ControlStyle Width="150px"></ControlStyle></asp:BoundField>
                         <asp:BoundField DataField="LUGAR" HeaderText="LUGAR" SortExpression="LUGAR" ControlStyle-Width="100px"><ControlStyle Width="100px"></ControlStyle></asp:BoundField>      
                         



      <asp:CommandField ShowEditButton="True" ControlStyle-CssClass ="btn btn-info"   ShowHeader="True" ButtonType="Button" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-danger" ShowDeleteButton="True" />
            





                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="DarkGray" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="EVENTO" runat="server"></asp:SqlDataSource>


                            </ContentTemplate>
                </asp:UpdatePanel>


                        <p>
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:Button ID="Button2" CssClass="btn btn-info"  runat="server" Text="Cargar Eventos" />
                            <br />
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>
                            <asp:Button ID="Button4" CssClass="btn btn-info"  runat="server" Text="Cargar Personal" />
                            <br />
                            <br />
                            <asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox14" runat="server">NIE</asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="Button3" CssClass="btn btn-info"  runat="server" Text="Cargar Contrato" />
                            <br />
                            <br />
                            <br />
                            

                            CONTRATO DE PROVISIÓN DE SERVICIOS PROFESIONALES 
REGGAETON BARCELONA
 
REUNIDOS: 
DE UNA PARTE, ABRAHAM JESUS CHIRIVELLA ORTUÑO con NIF 46711538 X actuando en nombre de  la Agrupación  Profesional REGGAETON BARCELONA con N.I.F. cuyo domicilio a efectos fiscales  radica en la Calle Caporal Fradera 18, Malgrat de Mar, Barcelona.   
DE OTRA PARTE, Don <asp:TextBox ID="TextBox5" runat="server" Enabled="False" Width="251px"></asp:TextBox> con NIF <asp:TextBox ID="TextBox6" runat="server"  Enabled="False"></asp:TextBox>, actúa en nombre y representación propios, como prestador de los servicios que son descritos en el presente contrato. 
Ambas partes se reconocen recíprocamente, según intervienen, plena capacidad jurídica para contratar, y establecen a través del presente acuerdo una relación de prestación de servicios. 
 
EXPONEN: 
I. Que Don <asp:TextBox ID="TextBox7" runat="server"   Enabled="False" Width="253px"></asp:TextBox> como suministrador o prestador de servicios, tiene como actividad principal ejercer como VIP MANAGER.
II. Que Don <asp:TextBox ID="TextBox8" runat="server"   Enabled="False" Width="255px"></asp:TextBox> dispone de los conocimientos necesarios para prestar este tipo de servicios y cumple con todas las obligaciones que la ley exige a los profesionales que  desarrollan esta actividad.  
III. Que Don, ABRAHAM JESUS CHIRIVELLA ORTUÑO es un trabajador autónomo que desea contratar parte de los servicios que ofrece el Prestador, para  el desarrollo de su actividad profesional, relativa a la promoción de espectáculos y eventos musicales.
 IV. Que, en virtud de las consideraciones precedentes, las Partes, de sus libres y espontáneas voluntades, han acordado otorgar el presente Contrato de Prestación de Servicios, con sujeción a las siguientes. 

ESTIPULACIONES 

1. OBJETO DEL ACUERDO 
 ABRAHAM JESUS CHIRIVELLA ORTUÑO encomienda a Don <asp:TextBox ID="TextBox9" runat="server"   Enabled="False" Width="251px"></asp:TextBox> la realización de una actividad de 6 horas el día <asp:TextBox ID="TextBox15" runat="server"   Enabled="False"></asp:TextBox> en la Sala Oak. 
A cambio como contraprestación por los servicios prestados,  el prestatario pagará precio cierto en los términos y condiciones establecidas en la Estipulación  5. 
 
2. INEXISTENCIA DE RELACIÓN LABORAL
Las Partes expresamente manifiestan su intención de llevar a cabo una contratación entre profesionales por lo que se excluye cualquier clase de relación laboral entre ambos. El Colaborador manifiesta que tiene plena libertad de decisión respecto a los servicios que presta, que realizará los encargos concretos que se le encomienden con plena independencia organizativa y de los medios utilizados. 
 
3. OBLIGACIONES DEL PRESTATARIO 
 Al objeto de prestar los servicios  descritos en el presente contrato, don <asp:TextBox ID="TextBox16" runat="server"   Enabled="False" Width="256px"></asp:TextBox> asume las siguientes obligaciones: 
3.1. Desarrollar los servicios descritos que se ajusten a cada encargo. 
3.2. Ceder de forma íntegra y completa de los derechos de autoría que pudieran derivar del presente encargo en beneficio del prestatario, ABRAHAM JESUS CHIRIVELLA ORTUÑO y REGGAETON BARCELONA. 
3.3. Cumplir con las instrucciones del prestatario, informando periódicamente sobre las actividades realizadas. 
3.4. Asume la responsabilidad por los eventuales daños y perjuicios derivados de un mal uso de todos los materiales o información que el prestatario hubiese cedido para el desarrollo de las actividades descritas y la ejecución del presente contrato. 


  4. OBLIGACIONES DEL PRESTADOR 
 Al objeto de recibir los servicios objeto del presente contrato, DON ABRAHAM JESUS CHIRIVELLA ORTUÑO, asume las siguientes obligaciones: 
4.1. Suministrar a la prestadora de servicios toda la documentación e información que fuera requerida por ésta, para el correcto desarrollo de los servicios descritos en la estipulación 1 del presente contrato. 
4.2. Abonar el precio estipulado. 
4.3. Colaborar  en cualquier solicitud de información o aclaración que la prestadora de servicios requiera, para el desarrollo y prestación de los servicios objeto de este contrato. 
 
5.  PRECIO 
5.1. El importe de la remuneración será abonado por el prestatario de acuerdo a la tarifa de precios de acordada y adjuntada más abajo: 
 CONCEPTO	 <asp:TextBox ID="TextBox10" runat="server"   Enabled="False"></asp:TextBox>  PRECIO  <asp:TextBox ID="TextBox11" runat="server"   Enabled="False"></asp:TextBox>  

  
5.2. Facturación. Forma de pago 
Los pagos de cada encargo serán abonados a semana vencida en efectivo una vez finalizada la prestación de servicios. Se entregará un justificante del pago que el beneficiario deberá firmar.

6. CONFIDENCIALIDAD 
6.1. Dada la naturaleza de los servicios objeto del presente contrato, ambas Partes se someten a las más rigurosas normas de confidencialidad, comprometiéndose tanto durante la vigencia del presente contrato, como después de la finalización del mismo, a tratar bajo la más estricta confidencialidad todos los datos, información y documentos que las Partes se intercambien con vistas a la ejecución del presente contrato. 
6.2. Ningún dato, documento o información,  podrá ser utilizado para una  finalidad distinta al objeto del presente contrato. 

6.3. El incumplimiento de esta obligación dará lugar a la resolución automática del presente contrato, así mismo,  determinará la obligación de resarcimiento de la parte a la que se atribuya el incumplimiento, por los daños y perjuicios causados. 
 
7. CESIÓN DE LOS DERECHOS DE UTILIZACIÓN Y PROPIEDAD INTELECTUAL 
Con sujeción al pago de las facturas emitidas por los servicios aquí acordados, el prestador de los servicios cede al prestatario con carácter de exclusivo, la totalidad de los derechos de explotación sobre actividades realizadas por aquélla o por cuenta de aquélla para la ejecución del presente contrato. 
Esta cesión abarca entre otros, los derechos de reproducción, distribución, comunicación pública y transformación de las obras o representaciones artísticas realizadas por la prestadora de los servicios descritos. 
 
8. TRATAMIENTO DE DATOS DE CARÁCTER PERSONAL 
Ambas Partes cumplirán, en lo que afecte a cada una de ellas, las disposiciones de la Ley Orgánica 15/1999 de 13 de diciembre, de Protección de Datos de Carácter Personal (en adelante, “LOPD”), así como del Real Decreto 1720/2007 de 21 de diciembre, por el que se aprueba el Reglamento de desarrollo de la LOPD y de cualesquiera otras normas vigentes o que en un futuro vengan a sustituir y/o a modificar éstas. 
Ambas partes se  comprometen a preservar en la más estricta confidencialidad cualquiera de los datos obtenidos como consecuencia de la ejecución del presente encargo, incluyendo los datos técnicos y los datos personales de los clientes y de las partes contratantes. 
 Ambas partes se comprometen a no utilizar los datos personales de terceros, obtenidos como consecuencia de la ejecución del presente encargo, para la contratación, promoción u ofrecimiento de servicios, publicidad o informaciones de ningún tipo. 
 
9. DURACIÓN DEL CONTRATO 
El presente contrato tiene una vigencia de una única actuación. 
 

10. RESOLUCIÓN 
Cualquiera de las partes tendrá derecho extinguir de forma voluntaria el presente contrato, siempre y cuando comunique su intención con un preaviso de 15  días. En tal caso, la resolución del contrato devendrá efectiva una vez trascurridos los 15 días desde que la parte que instase la resolución. 
Una vez resuelto el contrato, deberán respetarse y cumplirse cuantas obligaciones que hubiesen asumido las partes como consecuencia del presente contrato. 
Conforme al artículo 1124 del Código Civil, cualquiera de las Partes, en caso de incumplimiento por la contraparte de una o más obligaciones bajo este contrato, podrá requerir su cumplimiento o dar por resuelto el contrato, con el abono de la indemnización de daños y perjuicios que, en su caso, proceda. 
 
11. LEY APLICABLE Y JURISDICCIÓN COMPETENTE 
11.1. El presente contrato y anexos está sujeto y deberá interpretarse de acuerdo con la legislación española, comprendiendo la integridad de los acuerdos habidos entre las Partes con relación al objeto de este contrato y, por tanto, anulan y prevalecen sobre cualesquiera otros acuerdos escritos o verbales que pudieran haber existido entre las Partes con anterioridad a la fecha de firma del presente contrato. 
11.2. Ante cualquier desavenencia o litigio entre las Partes en relación con el cumplimiento, eficacia o interpretación del presente contrato, las Partes se someten expresamente a la jurisdicción y competencia de los Juzgados y Tribunales de la ciudad de Barcelona. 
 
ABRAHAM JESUS CHIRIVELLA ORTUÑO en nombre y representación de REGGAETÓN BARCELONA. 



Don <asp:TextBox ID="TextBox12" runat="server"   Enabled="False" Width="249px"></asp:TextBox> Suministrador de servicios profesionales. 
FIRMA: 

En Barcelona, <asp:TextBox ID="TextBox13" runat="server"   Enabled="False"></asp:TextBox>. 



                            <br />
                            <br />
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Mediante este documento acepta el contrato" />
                            <br />
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br />
                            <br />
                            <asp:Button ID="Button5" CssClass="btn btn-success" ONCLICK="Upload" runat="server" Text="ACEPTA" />



                            <br />
                            <br />
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" Enabled="False" Visible="False">HORAS</asp:TextBox>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" Enabled="False" Visible="False">PRECIO</asp:TextBox>
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Number" Enabled="False" Visible="False">CARGO</asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                            <br />
                        </p>
                
         <br />
         <br />                   <br />





                
    </div>


         
         
         
         
         
         
         
         

    
         
      
   

</asp:Content>