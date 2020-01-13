Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader

Public Class NEWHOTEL_Procesando

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





    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load


        Try
            If Session("Tesipro") = 1 Then
                SingletonDb.GetInstance().ChangeConnectionString(1)

            Else
                Session("Tesipro") = 0
                SingletonDb.GetInstance().ChangeConnectionString(0)
            End If




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

        'If IsPostBack Then
        '    Response.Redirect("/NEW_HOTEL/NewHotel_Verificadores")
        '    Timer1.Enabled = False


        Response.AppendHeader("Refresh", "2;url=/NEW_HOTEL/NewHotel_Verificadores")
        'End If



    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick

        'Timer1.Enabled = False


    End Sub
End Class