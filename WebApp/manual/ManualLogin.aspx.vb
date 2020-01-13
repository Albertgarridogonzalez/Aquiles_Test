Imports System.Data.SqlClient
Imports System.Net
Imports System.Text


Public Class ManualLogin
    Inherits Page

    Dim Singleton As SingletonDb = SingletonDb.GetInstance
    Dim Cn As SqlConnection = Singleton.GetConnection
    Dim sql_connection As SqlConnection = Singleton.GetConnection
    Dim sql_query As New SqlCommand
    Dim sql_result As SqlDataReader
    Dim sql_connection2 As SqlConnection = Singleton.GetConnection
    Dim sql_query2 As New SqlCommand
    Dim sql_result2 As SqlDataReader
    Dim LoginREG As String
    Dim Loginok As Boolean




    'Public Function Conexion_Tesipro()

    '    ''If Session("Tesipro") = 1 Then

    '    ''    Return ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
    '    ''Else
    '    'Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
    '    ''End If


    'End Function



    Public Sub Guarda_Log(PROCESO, CATEGORIA)
        'sql_connection.ConnectionString = SingletonDb.GetConnectionString
        sql_query.Connection = Cn
        sql_query.CommandText = "insert into LOG_USUARIO_MANUAL Values ('" & TextBox1.Text & "','" & PROCESO & "', GETDATE(),''," & CATEGORIA & ")"
        sql_query.CommandTimeout = 300
        Cn.Open()
        sql_query.ExecuteNonQuery()
        Cn.Close()


    End Sub



    Public Sub login(sender As Object, e As EventArgs) Handles Button1.Click

        If CheckBox1.Checked = True Then

            Session("Tesipro") = 1
            SingletonDb.GetInstance().ChangeConnectionString(1)

        Else
            Session("Tesipro") = 0
            SingletonDb.GetInstance().ChangeConnectionString(0)
        End If

        Try
            'sql_connection.ConnectionString = SingletonDb.GetConnectionString
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT * FROM MANTENIMIENTO_USUARIO WHERE USUARIO = '" & TextBox1.Text & "'"
            sql_result = sql_query.ExecuteReader

            If sql_result.HasRows Then

                Do While sql_result.Read()
                    Dim query_result As String
                    Dim ADMIN As String
                    Dim TECNICO As String
                    Dim MANUAL As String
                    query_result = sql_result("PW")
                    ADMIN = sql_result("ADMIN")
                    TECNICO = sql_result("TECNICO")
                    MANUAL = sql_result("MANUAL")

                    'MsgBox(query_result)
                    If (TextBox2.Text = query_result) Then
                        Session("Username") = TextBox1.Text.ToUpper()
                        Session("PW") = TextBox2.Text
                        Session("ADMIN") = ADMIN
                        Session("TECNICO") = TECNICO
                        Session("MANUAL") = MANUAL

                        Loginok = 1
                        'MsgBox(Session("PW"))
                        'Button1.ResolveClientUrl("http://mantenimientowebtesipro.azurewebsites.net/Mantenimiento")

                        'Response.Redirect("Mantenimiento.aspx")

                    Else
                        Loginok = 0


                    End If
                Loop

            Else



            End If

            Cn.Close()

        Catch ex As Exception
            Console.WriteLine("ERROR EN LOGIN.ASPX.VB: " + ex.Message)
        End Try

        'sql_connection.ConnectionString = "Server=192.168.60.183\sql2014;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly24401;"
        'sql_connection.ConnectionString = "Server=149.202.72.170;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly2440;"
        't



        If Loginok = 0 Then
            Guarda_Log("LOGIN_TRY", 20)
            Response.Redirect("Login.aspx")
        Else

            Guarda_Log("LOGIN_OK", 10)

            Response.Redirect("~/manual/Manual.aspx")
        End If


    End Sub

    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load


        TextBox1.Focus()
        TextBox1.Attributes.Add("onfocusin", " select();")
        'TextBox2.Attributes.Add("onfocusin", TextBox2.TextMode = "Password")
        TextBox2.Attributes.Add("onfocusin", " select();")
        Session("Username") = ""
        Session("ADMIN") = 0
        Session("TECNICO") = 0
        Session("MANUAL") = 0

        'Session("Tesipro") = 0
        'If Session("Username") = "" Then
        '    Response.Redirect("/ManualLogin")
        'End If
        'If Session("Manual") = False Then
        '    Response.Redirect("/ManualLogin")
        'End If


    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("../ChangePw.aspx")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("../RecoveryPw.aspx")
    End Sub

    Public Sub test(sender As Object, e As EventArgs) Handles LabelTest.Click

        If CheckBox1.Checked = True Then

            Session("Tesipro") = 1
            SingletonDb.GetInstance().ChangeConnectionString(1)

        Else
            Session("Tesipro") = 0
            SingletonDb.GetInstance().ChangeConnectionString(0)
        End If
        LabelTest2.Text = SingletonDb.GetConnectionString.ToString()
    End Sub

End Class