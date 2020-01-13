Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader



Public Class USUARIOS

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

    'Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            If Session("Tesipro") = 1 Then
                SingletonDb.GetInstance().ChangeConnectionString(1)

            Else
                Session("Tesipro") = 0
                SingletonDb.GetInstance().ChangeConnectionString(0)
            End If


            SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            SqlError.ConnectionString = SingletonDb.GetInstance.GetConnectionString

        Catch ex As Exception
            Console.WriteLine(ex.ToString)

        End Try

        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("ADMIN") = False Then

            Response.Redirect("/Login")


        End If


        SqlTest.SelectCommand = "SELECT * FROM MANTENIMIENTO_USUARIO ORDER BY USUARIO "
        SqlTest.UpdateCommand = "UPDATE MANTENIMIENTO_USUARIO SET USUARIO= @USUARIO, NOMBRE = @NOMBRE , PW =@PW ,MAIL = @MAIL, ADMIN = @ADMIN ,TECNICO = @TECNICO, MANUAL = @MANUAL  , INSTALACION = @INSTALACION   WHERE [ID] = @ID 
            IF NOT EXISTS (SELECT * FROM MANTENIMIENTO_USUARIO WHERE nombre = 'NEW' )INSERT INTO 
            MANTENIMIENTO_USUARIO VALUES ( '','NEW','********','','','','','')           "
        SqlError.SelectCommand = "SELECT HOTEL, ERROR FROM INSTALACION_LOG_ERROR WHERE PROCESO = 'FALTA PROC' GROUP BY HOTEL, ERROR"


        'Dt.
        'DropDownList1.DataSource = Dt
        'DropDownList1.DataTextField = "Name";
        'DropDownList1.DataValueField = "ID";
        'DropDownList1.DataBind(); `

        If IsPostBack Then
            Session("nada") = 0

        Else

            With Cmd
                .CommandType = CommandType.Text
                .CommandText = "SELECT * FROM HOTELES WHERE ACTIVO = 'TRUE'"
                .Connection = Cn
            End With
            Da.SelectCommand = Cmd
            Dt = New DataTable
            Da.Fill(Dt)
            With DropDownList1
                .DataSource = Dt
                DropDownList1.DataTextField = "HOTEL"
                DropDownList1.DataValueField = "HOTEL"
                DropDownList1.DataBind()

            End With
        End If
    End Sub

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        ' CONEXIÓN

        'sql_query2.Connection = Cn
        'Cn.Open()
        'sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
        'sql_result = sql_query2.ExecuteReader
        'If sql_result.HasRows Then
        '    sql_result.Read()

        'Cn.ConnectionString = "Server=149.202.72.170;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly24401;"
        Cmd.Connection = Cn
        Cn.Open()
        Cmd.CommandText = "SELECT servidor, db,usuario,pw, GRUPO FROM HOTELES where servidor <>''
                             
                            GROUP BY servidor, db,usuario,pw,GRUPO  ORDER BY GRUPO"
        'GRUPO <> 'DERBY' AND CODIGOHOT <> '' AND SERVIDOR <> ''
        'Dim fileReader2 As String
        'fileReader2 = My.Computer.FileSystem.ReadAllText("C:\TESIPRO\A.GARRIDO\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\Mantenimiento_Hotel.sql")
        Dim fileReader As String
        fileReader = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\1_CHECK TABLAS.sql")
        Dim fileReader2 As String
        fileReader2 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\2_Config_log.sql")
        'Dim fileReader3 As String
        'fileReader3 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\3_Revisa _Cierre.sql")
        'Dim fileReader33 As String
        'fileReader33 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\3_Revisa _Cierre_2.sql")
        Dim fileReader3 As String
        fileReader3 = "~/SQL_SCRIPTS/3_Revisa _Cierre.sql"
        Dim fileReader33 As String
        fileReader33 = "~/SQL_SCRIPTS/3_Revisa _Cierre_2.sql"

        Dim fileReader4 As String
        fileReader4 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\4_Mantenimiento_Hotel.sql")
        Dim fileReader5 As String
        fileReader5 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\5_SP_INSTALACION_CARACTERISTICA.sql")
        Dim fileReader6 As String
        fileReader6 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\6_SP_INSTALACION_COPIAR_HOTEL.sql")
        Dim fileReader7 As String
        fileReader7 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\7_SP_INSTALACION_HOTEL_TIPOHAB.sql")
        Dim fileReader8 As String
        fileReader8 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\8_SP_INSTALACION_NEW_HOTEL.sql")
        Dim fileReader9 As String
        fileReader9 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\9_SP_INSTALACION_RACK.sql")
        Dim fileReader10 As String
        fileReader10 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\10_SP_INSTALACION_RACK_NULL.sql")
        Dim fileReader11 As String
        fileReader11 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\11_SP_INSTALACION_RUTAS.sql")
        Dim fileReader12 As String
        fileReader12 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\12_SP_INSTALACION_SEGMENTOS_ORIGENES.sql")
        Dim fileReader13 As String
        fileReader13 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\13_SP_INSTALACION_TIPOSHAB.sql")
        Dim fileReader14 As String
        fileReader14 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\14_SP_CREAR_CONCEPTO.sql")
        Dim fileReader15 As String
        fileReader15 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\15_SP_CREAR_CONCEPTO_CONCSPRODUC.sql")
        Dim fileReader16 As String
        fileReader16 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\16_SP_CREAR_CONCEPTO_RELCONCSPRODUC.sql")
        Dim fileReader17 As String
        fileReader17 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\17_SP_INSTALACION_COBRO.sql")
        Dim fileReader18 As String
        fileReader18 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\18_SP_INSTALACION_TRASPASOSOFT.sql")
        Dim fileReader19 As String
        fileReader19 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\19_SP_INSTALACION_CHECKIN.sql")


        sql_result = Cmd.ExecuteReader
        If sql_result.HasRows Then




            Do While sql_result.Read()

                servidor = sql_result("servidor")
                database = sql_result("db")
                usuario = sql_result("usuario")
                password = sql_result("pw")
                ' Codigohot = sql_result("CODIGOHOT")
                'ID = sql_result("id")

                Dim sql_connection2 As New SqlConnection

                Dim sql_check As New SqlCommand

                Try
                    sql_connection2.ConnectionString = "Server=" & servidor & ";Database=" & database & ";Uid=" & usuario & ";Pwd=" & password & ";"
                    sql_check.Connection = sql_connection2
                    sql_connection2.Open()
                    sql_check.CommandText = "IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_HOTEL')DROP PROCEDURE [dbo].[SP_MANTENIMIENTO_HOTEL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_CARACTERISTICA')DROP PROCEDURE [dbo].[SP_INSTALACION_CARACTERISTICA]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_COPIAR_HOTEL')DROP PROCEDURE [dbo].[SP_INSTALACION_COPIAR_HOTEL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_HOTEL_TIPOHAB')DROP PROCEDURE [dbo].[SP_INSTALACION_HOTEL_TIPOHAB]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_NEW_HOTEL')DROP PROCEDURE [dbo].[SP_INSTALACION_NEW_HOTEL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_RACK')DROP PROCEDURE [dbo].[SP_INSTALACION_RACK]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_RACK_NULL')DROP PROCEDURE [dbo].[SP_INSTALACION_RACK_NULL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_RUTAS')DROP PROCEDURE [dbo].[SP_INSTALACION_RUTAS]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_SEGMENTOS_ORIGENES')DROP PROCEDURE [dbo].[SP_INSTALACION_SEGMENTOS_ORIGENES]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_TIPOSHAB')DROP PROCEDURE [dbo].[SP_INSTALACION_TIPOSHAB]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_REVISA_CIERRE')DROP PROCEDURE [dbo].[SP_MANTENIMIENTO_REVISA_CIERRE]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CREAR_CONCEPTO')DROP PROCEDURE [dbo].[SP_CREAR_CONCEPTO]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CREAR_CONCEPTO_CONCSPRODUC')DROP PROCEDURE [dbo].[SP_CREAR_CONCEPTO_CONCSPRODUC]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CREAR_CONCEPTO_RELCONCSPRODUC')DROP PROCEDURE [dbo].[SP_CREAR_CONCEPTO_RELCONCSPRODUC]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_COBRO')DROP PROCEDURE [dbo].[SP_INSTALACION_COBRO]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_CHECKIN')DROP PROCEDURE [dbo].[SP_INSTALACION_CHECKIN]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_TRASPASOSOFT')DROP PROCEDURE [dbo].[SP_INSTALACION_TRASPASOSOFT]
                                            "

                    '[SP_MANTENIMIENTO_HOTEL]
                    Try

                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader)
                        Session("TEST") = fileReader
                        Session("TEST2") = sql_check
                        sql_check.ExecuteNonQuery()
                        Session("TEST2") = sql_check
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader2)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader3)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                        Try
                            sql_check.CommandText = (fileReader33)
                            sql_check.ExecuteNonQuery()
                        Catch ex2 As Exception
                            Console.WriteLine(ex.ToString)
                        End Try


                    End Try
                    Try
                        sql_check.CommandText = (fileReader4)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader5)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader6)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader7)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader8)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader9)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader10)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader11)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader12)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader13)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader14)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader15)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader16)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader17)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader18)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader19)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                    End Try



                    sql_connection2.Close()

                Catch ex As Exception
                    Console.WriteLine(ex.ToString)
                End Try




            Loop

        End If

        sql_result.Close()
        Cn.Close()
        'MsgBox("PROCESO FINALIZADO")
    End Sub



    Public Sub CARGASQL()

        ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        'If IsPostBack Then
        Dim path As String = Server.MapPath("~/SQL_SCRIPTS/")
        Dim fileOK As Boolean = False
        If FileUpload1.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.
                    GetExtension(FileUpload1.FileName).ToLower()
            Dim allowedExtensions As String() =
                    {".SQL", ".sql"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next
            If fileOK Then
                Try
                    FileUpload1.PostedFile.SaveAs(path &
                                 FileUpload1.FileName)



                    'Dim ruta As Stream = File.Open(path & FileUpload1.FileName, FileMode.Open, FileAccess.Read)
                    '    '   Dim ruta As Stream = File.Open("~/DBF/TIPOHAB.DBF", FileMode.Open, FileAccess.Read)
                    '    Dim dbftable As Table = NDbfReader.Table.Open(ruta)
                    '    Dim dbfreader As Reader = dbftable.OpenReader(Encoding.ASCII)


                    '    'MsgBox(FileUpload1.PostedFile.InputStream.ToString)

                    '    While (dbfreader.Read())


                    '        'MsgBox(dbfreader.Table.Columns.Count.ToString)
                    '        Cmd.Connection = Cn
                    '        Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(7).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(8).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(9).Name.ToString) & "',SUBSTRING ('" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "' ,1,1),'" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "')"
                    '        Cmd.CommandTimeout = 3000
                    '        Try
                    '            Cn.Open()
                    '            Cmd.ExecuteNonQuery()
                    '            Cn.Close()
                    '        Catch ex As Exception
                    '            If ex.Message <> "" Then
                    '                Cn.Close()
                    '            End If
                    '        End Try
                    '        Cn.Close()




                    '    End While
                    '    dbftable.Dispose()
                    '    Label50.Text = "DATOS CARGADOS CORRECTAMENTE"

                    'Catch ex As Exception
                    '    Label50.Text = "ERROR AL CARGAR" & ex.Message


                Catch ex As Exception
                End Try
            Else
                Label50.Text = "ERROR TIPO FICHERO"
            End If

        End If
        'End If
        'Dim pathAPP As String = Server.MapPath("~/DBF/" & FileUpload1.FileName)

        'File.Delete(pathAPP)


        Response.Redirect(Request.Url.AbsoluteUri)



    End Sub

    Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
        CARGASQL()
    End Sub

    Protected Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click

        Cmd.Connection = Cn
        Cmd.CommandText = "EXEC.CHECK_LINKED_SERVERS       "
        Cmd.CommandTimeout = 3000
        Try
            Cn.Open()
            Cmd.ExecuteNonQuery()
            Cn.Close()
        Catch ex As Exception
            If ex.Message <> "" Then
                Cn.Close()
            End If
        End Try
        Cn.Close()
    End Sub

    Protected Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click

        Cmd.Connection = Cn
        Cmd.CommandText = " EXEC.CHECK_SQL_SERVERS  "
        Cmd.CommandTimeout = 9000
        Try
            Cn.Open()
            Cmd.ExecuteNonQuery()
            Cn.Close()
        Catch ex As Exception
            If ex.Message <> "" Then
                Cn.Close()
            End If
        End Try
        Cn.Close()
    End Sub


    Protected Sub Button14_Click(sender As Object, e As EventArgs) Handles Button14.Click
        Check_Status(DropDownList1.SelectedValue)

    End Sub

    'Protected Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click
    '    ' CONEXIÓN

    '    'sql_query2.Connection = Cn
    '    'Cn.Open()
    '    'sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
    '    'sql_result = sql_query2.ExecuteReader
    '    'If sql_result.HasRows Then
    '    '    sql_result.Read()

    '    'Cn.ConnectionString = "Server=149.202.72.170;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly24401;"
    '    Dim path As String = Server.MapPath("~/SQL_SCRIPTS/")
    '    Dim ruta As Stream
    '    Cmd.Connection = Cn
    '    Cn.Open()
    '    Cmd.CommandText = "SELECT servidor, db,usuario,pw, GRUPO FROM HOTELES where servidor <>'' AND ID = 1105

    '                        GROUP BY servidor, db,usuario,pw,GRUPO  ORDER BY GRUPO"
    '    Dim fileReader3 As String
    '    fileReader3 = "3_Revisa _Cierre.sql"
    '    Dim fileReader33 As String
    '    fileReader33 = "~/SQL_SCRIPTS/3_Revisa _Cierre_2.sql"


    '    sql_result = Cmd.ExecuteReader
    '    If sql_result.HasRows Then




    '        Do While sql_result.Read()

    '            servidor = sql_result("servidor")
    '            database = sql_result("db")
    '            usuario = sql_result("usuario")
    '            password = sql_result("pw")
    '            ' Codigohot = sql_result("CODIGOHOT")
    '            'ID = sql_result("id")

    '            Dim sql_connection2 As New SqlConnection

    '            Dim sql_check As New SqlCommand

    '            Try
    '                sql_connection2.ConnectionString = "Server=" & servidor & ";Database=" & database & ";Uid=" & usuario & ";Pwd=" & password & ";"
    '                sql_check.Connection = sql_connection2
    '                sql_connection2.Open()
    '                sql_check.CommandText = "
    '                                        IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_REVISA_CIERRE')DROP PROCEDURE [dbo].[SP_MANTENIMIENTO_REVISA_CIERRE]

    '                                        "

    '                '[SP_MANTENIMIENTO_HOTEL]
    '                Try

    '                    sql_check.ExecuteNonQuery()
    '                Catch ex As Exception
    '                    Console.WriteLine(ex.ToString)
    '                End Try


    '                ruta = File.Open(path & fileReader3, FileMode.Open, FileAccess.Read)
    '                Session("test") = (ruta)
    '                Try

    '                    sql_check.CommandText = (ruta)
    '                    sql_check.ExecuteNonQuery()
    '                Catch ex As Exception
    '                    Console.WriteLine(ex.ToString)
    '                    Session("test") = (ex.ToString)
    '                    Try
    '                        sql_check.CommandText = (fileReader33)
    '                        sql_check.ExecuteNonQuery()
    '                    Catch ex2 As Exception
    '                        Console.WriteLine(ex.ToString)
    '                        Session("test") = (ex.ToString)
    '                    End Try


    '                End Try


    '                Dim fileReader As String
    '                fileReader = My.Computer.FileSystem.ReadAllText("C:\test.txt")
    '                MsgBox(fileReader)


    '                sql_connection2.Close()

    '            Catch ex As Exception
    '                Console.WriteLine(ex.ToString)
    '                Session("test") = (ex.ToString)
    '            End Try




    '        Loop

    '    End If

    '    sql_result.Close()
    '    Cn.Close()
    '    'MsgBox("PROCESO FINALIZADO")
    'End Sub

    Private Sub Check_Status(Hotel)
        'Dim sql_connection2 As New SqlConnection
        Dim sql_query2 As New SqlCommand
        Dim sql_result As SqlDataReader

        'sql_connection2.ConnectionString = Conexion_Tesipro()
        sql_query2.Connection = Cn
        Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "' order by grupo, hotel"
        sql_result = sql_query2.ExecuteReader
        If sql_result.HasRows Then
            sql_result.Read()
            Id_Hotel = sql_result("id")
            servidor = sql_result("servidor")
            database = sql_result("db")
            Session("SERV") = servidor
            Session("DTB") = database


            If sql_result("last_cierre") Is DBNull.Value Then
                Last_Cierre = Today
            Else
                Last_Cierre = sql_result("last_cierre")
            End If



            Cn.Close()

        End If




        Cn.Close()


        sql_result.Close()


        Cmd.Connection = Cn
        Cmd.CommandText = " EXEC.CHECK_SQL_SERVER '" & Session("SERV") & "' , '" & Session("DTB") & "'"
        Cmd.CommandTimeout = 9000
        Try
            Cn.Open()
            Cmd.ExecuteNonQuery()
            Cn.Close()
        Catch ex As Exception
            If ex.Message <> "" Then
                Cn.Close()
            End If
        End Try
        Cn.Close()

    End Sub


End Class