Imports System.Data.SqlClient
Imports System.Net
Imports System.Text


Public Class RecoveryPW
    Inherits Page
    Dim sql_connection As New SqlConnection
    Dim sql_query As New SqlCommand
    Dim sql_result As SqlDataReader
    Dim sql_connection2 As New SqlConnection
    Dim sql_query2 As New SqlCommand
    Dim sql_result2 As SqlDataReader
    Dim LoginREG As String
    Dim Loginok As Boolean
    Dim UserId As Integer

    Dim Singleton As SingletonDb = SingletonDb.GetInstance
    Dim Cn As SqlConnection = Singleton.GetConnection




    Public Function Conexion_Tesipro()
        'If Session("Tesipro") = 1 Then

        '    Return ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
        'Else
        Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
        'End If
    End Function



    Public Sub Guarda_Log(PROCESO, CATEGORIA)
        sql_connection.ConnectionString = Conexion_Tesipro()
        sql_query.Connection = sql_connection
        sql_query.CommandText = "insert into LOG_USUARIO Values ('" & TextBox1.Text & "','" & PROCESO & "', GETDATE(),''," & CATEGORIA & ")"
        sql_query.CommandTimeout = 300
        sql_connection.Open()
        sql_query.ExecuteNonQuery()
        sql_connection.Close()


    End Sub



    Public Sub login(sender As Object, e As EventArgs) Handles Button1.Click



        sql_connection.ConnectionString = Conexion_Tesipro()
        'sql_connection.ConnectionString = "Server=192.168.60.183\sql2014;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly24401;"
        'sql_connection.ConnectionString = "Server=149.202.72.170;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly2440;"
        't

        sql_query.Connection = sql_connection
        'sql_connection.Open()
        ' sql_query.CommandText = "SELECT TOP 1 * FROM MANTENIMIENTO_USUARIO WHERE MAIL = '" & TextBox1.Text & "'"
        'sql_result = sql_query.ExecuteReader
        'If sql_result.HasRows Then

        'Do While sql_result.Read()
        '        Dim query_result As String
        '        query_result = sql_result("MAIL")

        '        UserId = sql_result("ID")


        '        Loginok = 1

        '    Loop

        'Else
        '    Loginok = 0


        'End If

        'sql_connection.Close()
        'If Loginok = 0 Then
        '    Guarda_Log("RECOVERYPW_TRY", 20)
        '    Response.Redirect("Login.aspx")
        'Else

        sql_query.CommandText = "EXEC.SP_RECOVERYPW'" & TextBox1.Text & "'"

        sql_connection.Open()
            sql_query.ExecuteNonQuery()
            sql_connection.Close()
            Guarda_Log("RECOVERYPW_OK", 10)
            ' Response.Redirect("Login.aspx")

        ' End If


    End Sub

    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        TextBox1.Focus()
        TextBox1.Attributes.Add("onfocusin", " select();")



        'SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString



    End Sub

End Class