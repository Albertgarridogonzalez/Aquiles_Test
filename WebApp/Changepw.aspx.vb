Imports System.Data.SqlClient
Imports System.Net
Imports System.Text

Public Class ChangePW
    Inherits Page
    Dim sql_connection As New SqlConnection
    Dim sql_query As New SqlCommand
    Dim sql_result As SqlDataReader
    Dim sql_connection2 As New SqlConnection
    Dim sql_query2 As New SqlCommand
    Dim sql_result2 As SqlDataReader
    Dim LoginREG As String
    Dim Loginok As Boolean

    Public Function Conexion_Tesipro()
        Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
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
        sql_connection.Open()
        sql_query.CommandText = "SELECT PW FROM MANTENIMIENTO_USUARIO WHERE USUARIO = '" & TextBox1.Text & "'"
        sql_result = sql_query.ExecuteReader
        If sql_result.HasRows Then

            Do While sql_result.Read()
                Dim query_result As String
                query_result = sql_result("PW")

                'MsgBox(query_result)
                If (TextBox2.Text = query_result) Then
                    If (TextBox3.Text = TextBox4.Text) Then

                        Loginok = 1

                    End If
                Else
                        Loginok = 0


                End If
            Loop

        Else



        End If

        sql_connection.Close()
        If Loginok = 0 Then
            Guarda_Log("CHANGEPASS_TRY", 20)
            Response.Redirect("Login.aspx")
        Else

            sql_query.CommandText = "update MANTENIMIENTO_USUARIO set PW ='" & TextBox3.Text & "' where usuario ='" & TextBox1.Text & "'"
            sql_connection.Open()
            sql_query.ExecuteNonQuery()
            sql_connection.Close()

            Session("Username") = TextBox1.Text.ToUpper()
            Session("PW") = TextBox3.Text
            Guarda_Log("CHANGEPASS_OK", 10)
            Response.Redirect("Mantenimiento.aspx")
        End If


    End Sub

    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        TextBox1.Focus()
        TextBox1.Attributes.Add("onfocusin", " select();")
        'TextBox2.Attributes.Add("onfocusin", TextBox2.TextMode = "Password")
        TextBox2.Attributes.Add("onfocusin", " select();")




        'SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString



    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub
End Class