﻿Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Text
Imports NDbfReader

Public Class URBAN_ICON_PAGOS

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
    Dim sql_connection As New SqlConnection
    Dim sql_query As New SqlCommand





    'Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'Button3.CssClass.


        Try

            SingletonDb.GetInstance().ChangeConnectionString(1)



            EVENTO.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            PAGOS.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            '  SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString

        Catch ex As Exception
            Console.WriteLine(ex.ToString)

        End Try


        'If Session("Username") = "" Then

        '    Response.Redirect("/RB/URBAN_ICON_LOGIN")
        'End If

        'If Session("TECNICO") = False Then
        '    Response.Redirect("/RB/URBAN_ICON_LOGIN")
        'End If



        '  If Session("Username") = "" Then
        '   Response.Redirect("/RB/URBAN_ICON_LOGIN")
        '   End If


        If Session("INSC_EVENTO") = "" Then
            Session("INSC_EVENTO") = "1"
        End If
        EVENTO.SelectCommand = "SELECT *  FROM EVENTOS ORDER BY FECHA, NOMBRE"
        EVENTO.UpdateCommand = "UPDATE EVENTOS SET NOMBRE = @NOMBRE , FECHA = @FECHA , LUGAR =@LUGAR WHERE [ID] = @ID 
                                    IF NOT EXISTS (SELECT * FROM EVENTOS WHERE NOMBRE = '') INSERT INTO 
                                    EVENTOS VALUES ( '','01/01/2000','')"
        EVENTO.DeleteCommand = "DELETE FROM EVENTOS WHERE ID = 0"


        PAGOS.SelectCommand = "SELECT E.ID, CONCAT (U.NOMBRE, ' ' , U.APELLIDO1) AS NOMBRE, PRECIO, CARGO, HORAS, PAGADO,ACEPTA   FROM EVENTOS_USUARIOS E
                               LEFT JOIN USUARIOS U
                               ON E.ID_USUARIO = U.ID
                               WHERE ID_EVENTO =  " & Session("INSC_EVENTO") & " ORDER BY U.NOMBRE "
        PAGOS.UpdateCommand = "UPDATE EVENTOS_USUARIOS SET HORAS = @HORAS , PRECIO = @PRECIO , CARGO =@CARGO  WHERE [ID] = @ID 
                                    "
        PAGOS.DeleteCommand = "DELETE FROM EVENTOS_USUARIOS WHERE ID = 0"






        If IsPostBack Then


            Session("INSC_EVENTO") = DropDownList1.SelectedValue.ToString

            Session("INSC_PERSONA") = DropDownList2.SelectedValue.ToString




            'Try
            '    'sql_connection.ConnectionString = SingletonDb.GetConnectionString
            '    sql_query.Connection = Cn
            '    Cn.Open()
            '    sql_query.CommandText = "
            '      if not exists (select id_usuario from EVENTOS_USUARIOS where id_usuario = " & Session("INSC_PERSONA") & ")
            '      select top 1 id_usuario from EVENTOS_USUARIOS where id_evento  = " & Session("INSC_EVENTO") & "
            '      else
            '      select id_usuario from EVENTOS_USUARIOS where id_usuario = " & Session("INSC_PERSONA") & ""
            '    sql_result = sql_query.ExecuteReader

            '    If sql_result.HasRows Then

            '        Do While sql_result.Read()
            '            Dim Nuevoid As String

            '            Nuevoid = sql_result("id_usuario")
            '            Session("INSC_PERSONA") = Nuevoid



            '        Loop

            '    Else



            '    End If

            '    Cn.Close()

            'Catch ex As Exception
            '    Console.WriteLine("ERROR EN LOGIN.ASPX.VB: " + ex.Message)
            'End Try





            Dim Dt2 As DataTable
            Dim Da2 As New SqlDataAdapter
            Dim Cmd2 As New SqlCommand



            With Cmd
                .CommandType = CommandType.Text
                '.CommandText = "SET LANGUAGE SPANISH SELECT * FROM EVENTOS where fecha =" + Session("INSC_EVENTO") + " ORDER BY ID "
                .CommandText = "SELECT * FROM EVENTOS ORDER BY ID "
                .Connection = Cn
            End With
            Da.SelectCommand = Cmd
            Dt = New DataTable
            Da.Fill(Dt)
            With DropDownList1
                .DataSource = Dt
                DropDownList1.DataTextField = "NOMBRE"
                DropDownList1.DataValueField = "ID"
                DropDownList1.SelectedValue = Session("INSC_EVENTO")
                DropDownList1.DataBind()

            End With




            'With Cmd2
            '    .CommandType = CommandType.Text
            '    .CommandText = "SELECT * FROM USUARIOS WHERE ID IN (SELECT ID_USUARIO FROM EVENTOS_USUARIOS WHERE ID_EVENTO = " & Session("INSC_EVENTO") & ")  ORDER BY NOMBRE"
            '    .Connection = Cn
            'End With
            'Da2.SelectCommand = Cmd2
            'Dt2 = New DataTable
            'Da2.Fill(Dt2)
            'With DropDownList2
            '    .DataSource = Dt2
            '    DropDownList2.DataTextField = "NOMBRE"
            '    DropDownList2.DataValueField = "ID"
            '    DropDownList1.SelectedValue = Session("INSC_PERSONA")
            '    DropDownList2.DataBind()

            'End With
            'Cn.Close()




        Else


            Session("FECHAEVENTO") = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
            Try
                sql_query.Connection = Cn
                Cn.Open()
                sql_query.CommandText = "if exists (select * from eventos where fecha = convert (date ,getdate ()))
                                         begin
                                         select * from eventos where fecha = convert (date ,getdate ())
                                         end
                                         else 
                                         select top 1 * from eventos order by fecha desc"
                sql_result = sql_query.ExecuteReader
                ' Session("INSC_EVENTO")

                If sql_result.HasRows Then

                    Do While sql_result.Read()
                        Dim idevento As String

                        idevento = sql_result("id")
                        Session("INSC_EVENTO") = idevento
                        ' Session("FECHAEVENTO") = FECHAEVENTO



                    Loop

                Else



                End If

                Cn.Close()

            Catch ex As Exception

            End Try


            With Cmd
                .CommandType = CommandType.Text
                .CommandText = "SELECT * FROM EVENTOS ORDER BY ID "
                .Connection = Cn
            End With
            Da.SelectCommand = Cmd
            Dt = New DataTable
            Da.Fill(Dt)
            With DropDownList1
                .DataSource = Dt
                DropDownList1.DataTextField = "NOMBRE"
                DropDownList1.DataValueField = "ID"
                DropDownList1.SelectedValue = Session("INSC_EVENTO")
                DropDownList1.DataBind()

            End With

            Dim Dt2 As DataTable
            Dim Da2 As New SqlDataAdapter
            Dim Cmd2 As New SqlCommand

            With Cmd2
                .CommandType = CommandType.Text
                .CommandText = "SELECT * FROM USUARIOS WHERE ID IN (SELECT ID_USUARIO FROM EVENTOS_USUARIOS WHERE ID_EVENTO = " & Session("INSC_EVENTO") & ") AND ID NOT IN (SELECT ID_USUARIO FROM EVENTOS_USUARIOS WHERE ID_EVENTO = " & Session("INSC_EVENTO") & " and pagado = 1) ORDER BY NOMBRE"
                .Connection = Cn
            End With
            Da2.SelectCommand = Cmd2
            Dt2 = New DataTable
            Da2.Fill(Dt2)
            With DropDownList2
                .DataSource = Dt2
                DropDownList2.DataTextField = "NOMBRE"
                DropDownList2.DataValueField = "ID"
                DropDownList2.DataBind()

            End With
            Cn.Close()





        End If




    End Sub
    Protected Sub Upload(sender As Object, e As EventArgs) Handles Button5.Click


        sql_query.Connection = Cn
        Cn.Open()
        sql_query.CommandText = "SELECT * FROM EVENTOS_USUARIOS WHERE ID_EVENTO = '" & Session("INSC_EVENTO") & "' AND ID_USUARIO = '" & Session("INSC_PERSONA") & "'"
        sql_result = sql_query.ExecuteReader

        If sql_result.HasRows Then

            Do While sql_result.Read()
                Dim query_result As String

                'query_result = sql_result("DNI")
                query_result = sql_result("ID")
                Session("ID_EVENTO_USUARIO") = query_result
            Loop
        End If

        Cn.Close()





        Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Dim contentType As String = FileUpload1.PostedFile.ContentType
        Using fs As Stream = FileUpload1.PostedFile.InputStream
            Using br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                Dim constr As String = SingletonDb.GetInstance.GetConnectionString
                Using con As New SqlConnection(constr)
                    Dim query As String = "UPDATE EVENTOS_USUARIOS SET FIRMA =  @Data , FIRMA_TYPE = @ContentType , pagado = 1  WHERE ID = " & Session("ID_EVENTO_USUARIO") & ""
                    'Dim bs64OfBytes As String
                    ' bs64OfBytes = Convert.ToBase64String(contentType)


                    'Dim newHeight As Integer = 200
                    'Dim newWidth As Integer = 200
                    'Dim newImage As Bitmap
                    ''Dim postedFile As Bitmap

                    'bytes = CreateThumbNail(fs, newWidth, newHeight)




                    Using cmd As New SqlCommand(query)
                        cmd.Connection = con
                        'cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename

                        cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contentType
                        cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                    End Using
                End Using
            End Using
        End Using

        'lblMessage.Text = "File uploaded successfully."
    End Sub
    Public Sub SChanged()
        Session("INSC_EVENTO") = DropDownList1.SelectedValue.ToString

        Dim Dt2 As DataTable
        Dim Da2 As New SqlDataAdapter
        Dim Cmd2 As New SqlCommand

        With Cmd2
            .CommandType = CommandType.Text
            .CommandText = "SELECT * FROM USUARIOS U LEFT JOIN EVENTOS_USUARIOS EU ON EU.ID_USUARIO = U.ID AND EU.ID_EVENTO = '" & Session("INSC_EVENTO") & "'"
            .Connection = Cn
        End With
        Da2.SelectCommand = Cmd2
        Dt2 = New DataTable
        Da2.Fill(Dt2)
        With DropDownList2
            .DataSource = Dt2
            DropDownList2.DataTextField = "NOMBRE"
            DropDownList2.DataValueField = "ID"
            DropDownList2.DataBind()

        End With
        Cn.Close()

        Response.Redirect("Pagos_Rb.aspx")

    End Sub
    Public Function isnull(dato)

        If dato Is DBNull.Value Then
            dato = ""
        Else
            dato = dato
        End If
        Return dato


    End Function



    Public Function isnullchecked(dato)

        If dato Is DBNull.Value Then
            dato = False
        Else
            If dato = False Then
                dato = False
            Else
                dato = True
            End If


        End If
        Return dato


    End Function



    Public Function isnulldecimal(dato)


        If dato Is DBNull.Value Then
            dato = "0.00"
        Else
            dato = dato
        End If
        Return dato


    End Function



    'Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

    '    ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
    '    Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
    '    Dim constr As String = SingletonDb.GetInstance.GetConnectionString
    '    'ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New SqlConnection(constr)
    '        Using cmd As New SqlCommand("DELETE FROM EVENTOS WHERE ID = " & Id & "")
    '            ' cmd.Parameters.AddWithValue("@ID", Id)
    '            cmd.Connection = con
    '            con.Open()
    '            cmd.ExecuteNonQuery()
    '            con.Close()
    '        End Using
    '    End Using

    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'Session("INSC_EVENTO") = DropDownList1.SelectedValue.ToString
        'Session("INSC_PERSONA") = DropDownList2.SelectedValue.ToString
        'Session("INSC_HORAS") = TextBox1.Text
        'Session("INSC_PRECIO") = TextBox2.Text
        'Session("INSC_CARGO") = TextBox3.Text
        'Session("FECHAEVENTO") = ""

        'Try
        '    'sql_connection.ConnectionString = SingletonDb.GetConnectionString
        '    sql_query.Connection = Cn
        '    Cn.Open()
        '    sql_query.CommandText = "SELECT * FROM EVENTOS WHERE ID = '" & Session("INSC_EVENTO") & "'"
        '    sql_result = sql_query.ExecuteReader

        '    If sql_result.HasRows Then

        '        Do While sql_result.Read()
        '            Dim FECHAEVENTO As String

        '            FECHAEVENTO = sql_result("FECHA")
        '            Session("FECHAEVENTO") = FECHAEVENTO



        '        Loop

        '    Else



        '    End If

        '    Cn.Close()

        'Catch ex As Exception
        '    Console.WriteLine("ERROR EN LOGIN.ASPX.VB: " + ex.Message)
        'End Try





        'Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        ''ConfigurationManager.ConnectionStrings("constr").ConnectionString
        'Using con As New SqlConnection(constr)
        '    Using cmd As New SqlCommand("update EVENTOS_USUARIOS set pagado = 1 where id_usuario = " & Session("INSC_PERSONA") & " and id_evento  = " & Session("INSC_EVENTO") & "")
        '        ' cmd.Parameters.AddWithValue("@ID", Id)
        '        ' MsgBox("INSERT INTO EVENTOS_USUARIOS VALUES ( " & Session("INSC_PERSONA") & " ,  " & Session("INSC_EVENTO") & " ,GETDATE() ,  " & Session("INSC_HORAS") & "  ,  " & Session("INSC_PRECIO") & " , '" & Session("INSC_CARGO") & "'   ,0,NULL)")
        '        cmd.Connection = con
        '        con.Open()
        '        cmd.ExecuteNonQuery()
        '        con.Close()
        '    End Using
        'End Using
        'Response.Redirect("Pagos_Rb.aspx")


        Session("INSC_EVENTO") = DropDownList1.SelectedValue.ToString
        Session("INSC_PERSONA") = DropDownList2.SelectedValue.ToString
        Session("INSC_HORAS") = TextBox1.Text
        Session("INSC_PRECIO") = TextBox2.Text
        Session("INSC_CARGO") = TextBox3.Text



        Try



            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT * FROM USUARIOS U LEFT JOIN EVENTOS_USUARIOS EU ON EU.ID_USUARIO = U.ID AND EU.ID_EVENTO = '" & Session("INSC_EVENTO") & "' WHERE U.ID = '" & Session("INSC_PERSONA") & "'"
            sql_result = sql_query.ExecuteReader

            If sql_result.HasRows Then

                Do While sql_result.Read()
                    Dim query_result As String
                    Dim NIE As String
                    Dim Nombre As String
                    Dim Apellido1 As String
                    Dim Apellido2 As String
                    Dim Cargo As String
                    Dim PRecio As String
                    Dim Horas As String
                    Dim FechaEvento As String
                    'query_result = sql_result("DNI")
                    NIE = sql_result("DNI")
                    Nombre = sql_result("nombre")
                    Apellido1 = sql_result("Apellido1")
                    Apellido2 = sql_result("Apellido2")
                    Cargo = sql_result("Cargo")
                    PRecio = sql_result("Precio")
                    Horas = sql_result("Horas")
                    FechaEvento = sql_result("fecha")


                    'MsgBox(query_result)


                    TextBox4.Text = Nombre & "  " & Apellido1 & "  " & Apellido2

                    TextBox5.Text = NIE


                    TextBox6.Text = Cargo
                    TextBox7.Text = PRecio
                    TextBox8.Text = Nombre
                Loop

            Else



            End If

            Cn.Close()

        Catch ex As Exception
            'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
            Cn.Close()
        End Try

    End Sub

    'Protected Sub SChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
    '    'onselectedindexchanged="SChanged"
    '    'AutoPostBack = "true" >
    'End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click


        Dim Dt2 As DataTable
        Dim Da2 As New SqlDataAdapter
        Dim Cmd2 As New SqlCommand

        With Cmd2
            .CommandType = CommandType.Text
            '.CommandText = "SELECT * FROM USUARIOS WHERE ID IN (SELECT ID_USUARIO FROM EVENTOS_USUARIOS WHERE ID_EVENTO = " & Session("INSC_EVENTO") & ")  ORDER BY NOMBRE"
            .CommandText = "SELECT * FROM USUARIOS WHERE ID IN (SELECT ID_USUARIO FROM EVENTOS_USUARIOS WHERE ID_EVENTO = " & Session("INSC_EVENTO") & ") AND ID NOT IN (SELECT ID_USUARIO FROM EVENTOS_USUARIOS WHERE ID_EVENTO = " & Session("INSC_EVENTO") & " and pagado = 1) ORDER BY NOMBRE"
            .Connection = Cn
        End With
        Da2.SelectCommand = Cmd2
        Dt2 = New DataTable
        Da2.Fill(Dt2)
        With DropDownList2
            .DataSource = Dt2
            DropDownList2.DataTextField = "NOMBRE"
            DropDownList2.DataValueField = "ID"
            'DropDownList2.SelectedValue = Session("INSC_PERSONA")
            DropDownList2.DataBind()

        End With
        Cn.Close()
    End Sub
End Class