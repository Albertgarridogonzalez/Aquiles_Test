Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.OleDb


Public Class Test

    'https://social.msdn.microsoft.com/Forums/vstudio/en-US/a35e5154-b0df-40b6-b012-494efd7ffa4a/import-data-from-a-excel-file-into-sql-server-through-vbnet?forum=vbgeneral
    Inherits System.Web.UI.Page

    Protected WithEvents btnPopup As System.Web.UI.WebControls.Button


#Region " Web Form Designer Generated Code "



    'This call is required by the Web Form Designer.

    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()



    End Sub



    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init

        'CODEGEN: This method call is required by the Web Form Designer

        'Do not modify it using the code editor.

        InitializeComponent()

    End Sub



#End Region



    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load, Me.Load


        SqlTest.SelectCommand = "SELECT ID,CODHAB, HAB, TIPO, MODULO1,MODULO2,MODULO3,MODULO4, PLANTA FROM [HOTEL_DATOS_RACK] WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'ORDER BY PLANTA, HAB ASC "
        SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_RACK SET CODHAB= @CODHAB, HAB = @HAB , TIPO =@TIPO ,MODULO1 = @MODULO1, MODULO2 = @MODULO2 ,PLANTA = @PLANTA     WHERE [ID] = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_RACK WHERE CODhab = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_RACK VALUES ( '" & Session("NewHotelID") & "','','','','','','','0','')           "
        SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_RACK WHERE ID = 0"


    End Sub



End Class

