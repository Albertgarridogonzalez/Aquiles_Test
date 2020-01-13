Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader

Public Class NEWHOTEL_Verificadores

    Inherits Page
    Dim Dt As DataTable
    Dim Singleton As SingletonDb = SingletonDb.GetInstance
    Dim Cn As SqlConnection = Singleton.GetConnection
    Dim Da As New SqlDataAdapter
    Dim Cmd As New SqlCommand
    Dim sql_result As SqlDataReader
    Dim New_Conexion As String
    Dim database As String
    Dim servidor As String
    Dim usuario As String
    Dim password As String
    Dim Hotel As String
    Dim Grupo As String
    Dim Codigohot As String
    Dim Last_Cierre As DateTime
    Dim Status As Boolean
    Dim Hotel_Send As String
    Dim Id_Hotel As Integer




    ' *****************FUNCIONES****************** 





    '   ***********CARGA DATOS PAGINA ********


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load


        Try
            If Session("Tesipro") = 1 Then
                SingletonDb.GetInstance().ChangeConnectionString(1)

            Else
                Session("Tesipro") = 0
                SingletonDb.GetInstance().ChangeConnectionString(0)
            End If


            TRASPASO_MAESTRO.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            MAESTRO_TRASPASO.ConnectionString = SingletonDb.GetInstance.GetConnectionString

            'SqlTest7.ConnectionString = SingletonDb.GetInstance.GetConnectionString


        Catch ex As Exception
            Console.WriteLine(ex.ToString)

        End Try


        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("TECNICO") = False Then
            If Session("INSTALACION") = False Then
                Response.Redirect("/Login")
            End If

        End If


        If Session("ADMIN") = False Then
            Button9.Enabled = False
        Else
            Button9.Enabled = True

        End If


        TRASPASO_MAESTRO.SelectCommand = "EXEC.SP_VERIFICA_TRASPASO_MAESTRO '" & Session("NewHotelID") & "'  "
        'TRASPASO_MAESTRO.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        MAESTRO_TRASPASO.SelectCommand = "EXEC.SP_VERIFICA_TRASPASO '" & Session("NewHotelID") & "'  "



    End Sub



    'Response.Redirect(Request.Url.AbsoluteUri)


End Class