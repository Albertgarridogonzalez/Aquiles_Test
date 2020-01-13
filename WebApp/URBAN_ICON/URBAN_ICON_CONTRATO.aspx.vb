Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Text
Imports NDbfReader

Public Class URBAN_ICON_CONTRATO

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

    Dim sql_connection As SqlConnection = Singleton.GetConnection
    Dim sql_query As New SqlCommand
    ' Dim sql_result As SqlDataReader






    'Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'Button3.CssClass.


        Try

            SingletonDb.GetInstance().ChangeConnectionString(1)



            EVENTO.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            '  SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString

        Catch ex As Exception
            Console.WriteLine(ex.ToString)

        End Try




        EVENTO.SelectCommand = "SELECT *  FROM EVENTOS ORDER BY FECHA, NOMBRE"
        EVENTO.UpdateCommand = "UPDATE EVENTOS SET NOMBRE = @NOMBRE , FECHA = @FECHA , LUGAR =@LUGAR WHERE [ID] = @ID 
                                    IF NOT EXISTS (SELECT * FROM EVENTOS WHERE NOMBRE = '') INSERT INTO 
                                    EVENTOS VALUES ( '','01/01/2000','')"
        EVENTO.DeleteCommand = "DELETE FROM EVENTOS WHERE ID = 0"





        'If Session("Desd") = "" Then

        '        Session("Desd") = "01/01/2010"
        '        'Session("Desd") = Format(Date.Now(), "ddmmyyyy")



        '        Session("fecha2") = "SELECT * FROM EVENTOS where fecha ='" & Session("Desd") & "' ORDER BY ID "
        '        MsgBox(Session("fecha2"))
        '        With Cmd
        '            .CommandType = CommandType.Text
        '            .CommandText = "SELECT * FROM EVENTOS where fecha = " & Session("Desd") & "  ORDER BY ID "
        '            .Connection = Cn
        '        End With
        '        Da.SelectCommand = Cmd
        '        Dt = New DataTable
        '        Da.Fill(Dt)
        '        With DropDownList1
        '            .DataSource = Dt
        '            DropDownList1.DataTextField = "NOMBRE"
        '            DropDownList1.DataValueField = "ID"
        '            DropDownList1.DataBind()

        '            'Session("fecha2") = "fecha"

        '        End With

        'MsgBox(Session("fecha"))

        'Dim Dt2 As DataTable
        'Dim Da2 As New SqlDataAdapter
        'Dim Cmd2 As New SqlCommand

        'With Cmd2
        '    .CommandType = CommandType.Text
        '    .CommandText = "SELECT U.NOMBRE, U.ID as identif FROM EVENTOS_USUARIOS EU LEFT JOIN USUARIOS U ON U.ID = EU.ID_USUARIO WHERE EU.ID_EVENTO = 1  ORDER BY U.NOMBRE"
        '    .Connection = Cn
        'End With
        'Da2.SelectCommand = Cmd2
        'Dt2 = New DataTable
        'Da2.Fill(Dt2)
        'With DropDownList2
        '    .DataSource = Dt2
        '    DropDownList2.DataTextField = "NOMBRE"
        '    DropDownList2.DataValueField = "identif"
        '    DropDownList2.DataBind()

        'End With
        'Cn.Close()




        'Else


        If IsPostBack Then
            'Dim provider As New Globalization.CultureInfo("fr-FR")
            Try
                Dim fech As Date
                fech = Convert.ToDateTime(TextBox3.Text)
                ' fech = DateTime.ParseExact(fech, "dd-MM-yyyy", Provider)
                ' desde = desde.ToString("dd/MM/yyyy")
                Format(fech, "dd/MM/yyyy")
                Session("Desd") = fech


                buscaevento(Session("Desd"))
            Catch ex As Exception
                'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
                'Cn.Close()
            End Try

            'With Cmd
            '    .CommandType = CommandType.Text
            '    .CommandText = "SET LANGUAGE SPANISH SELECT * FROM EVENTOS where fecha =" & fech & " ORDER BY ID "
            '    .Connection = Cn
            'End With
            'Da.SelectCommand = Cmd
            'Dt = New DataTable
            'Da.Fill(Dt)
            'With DropDownList1
            '    .DataSource = Dt
            '    DropDownList1.DataTextField = "NOMBRE"
            '    DropDownList1.DataValueField = "ID"
            '    DropDownList1.DataBind()

            'End With


        Else


            Try
                Dim fech As Date
                fech = Convert.ToDateTime(Today())
                ' desde = desde.ToString("dd/MM/yyyy")
                'Format(desde, "dd-mm-yyyy")
                Session("Desd") = fech

            Catch ex As Exception
                'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
                'Cn.Close()
            End Try
            Try
                With Cmd
                    .CommandType = CommandType.Text
                    .CommandText = "SET LANGUAGE SPANISH SELECT * FROM EVENTOS where fecha =@FechaInicio ORDER BY ID "
                    .Parameters.AddWithValue("@FechaInicio", Convert.ToDateTime(Today()))
                    .Connection = Cn
                End With
                Da.SelectCommand = Cmd
                Dt = New DataTable
                Da.Fill(Dt)
                With DropDownList1
                    .DataSource = Dt
                    DropDownList1.DataTextField = "NOMBRE"
                    DropDownList1.DataValueField = "ID"
                    DropDownList1.DataBind()

                End With




                ''Session("fecha") = TextBox3.Text

                ''MsgBox(Session("fecha"))
                'Session("fecha2") = "SELECT * FROM EVENTOS where fecha ='" & Session("Desd") & "' ORDER BY ID "
                '    MsgBox(Session("fecha2"))
                '    With Cmd
                '        .CommandType = CommandType.Text
                '        .CommandText = "SELECT * FROM EVENTOS where fecha = " & Session("Desd") & "  ORDER BY ID "
                '        .Connection = Cn
                '    End With
                '    Da.SelectCommand = Cmd
                '    Dt = New DataTable
                '    Da.Fill(Dt)
                '    With DropDownList1
                '        .DataSource = Dt
                '        DropDownList1.DataTextField = "NOMBRE"
                '        DropDownList1.DataValueField = "ID"
                '        DropDownList1.DataBind()

                '        'Session("fecha2") = "fecha"

                '    End With

                'MsgBox(Session("fecha"))

                'Dim Dt2 As DataTable
                'Dim Da2 As New SqlDataAdapter
                'Dim Cmd2 As New SqlCommand

                'With Cmd2
                '    .CommandType = CommandType.Text
                '    .CommandText = "SELECT U.NOMBRE, U.ID as identif FROM EVENTOS_USUARIOS EU LEFT JOIN USUARIOS U ON U.ID = EU.ID_USUARIO WHERE EU.ID_EVENTO = 1  ORDER BY U.NOMBRE"
                '    .Connection = Cn
                'End With
                'Da2.SelectCommand = Cmd2
                'Dt2 = New DataTable
                'Da2.Fill(Dt2)
                'With DropDownList2
                '    .DataSource = Dt2
                '    DropDownList2.DataTextField = "NOMBRE"
                '    DropDownList2.DataValueField = "identif"
                '    DropDownList2.DataBind()

                'End With
                Cn.Close()



            Catch ex As Exception
                'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
                Cn.Close()
            End Try
            'End If


        End If





    End Sub

    Public Sub buscaevento(fech)

        '.CommandType = CommandType.Text
        '.CommandText = "SELECT * FROM Vending.dbo.Eventos WHERE Fecha >= @FechaInicio AND Fecha <= @FechaTermino ORDER BY Fecha ASC"

        '.Parameters.AddWithValue("@FechaInicio", Convert.ToDateTime(txtFechaInicio.Text))
        '.Parameters.AddWithValue("@FechaTermino", Convert.ToDateTime(txtFechaTermino.Text))
        Try

            With Cmd
                .CommandType = CommandType.Text
                .CommandText = "SET LANGUAGE SPANISH SELECT * FROM EVENTOS where fecha =@FechaInicio ORDER BY ID "
                .Parameters.AddWithValue("@FechaInicio", Convert.ToDateTime(TextBox3.Text))
                .Connection = Cn
            End With
            Da.SelectCommand = Cmd
            Dt = New DataTable
            Da.Fill(Dt)
            With DropDownList1
                .DataSource = Dt
                DropDownList1.DataTextField = "NOMBRE"
                DropDownList1.DataValueField = "ID"
                DropDownList1.DataBind()

            End With
        Catch ex As Exception
            'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
            Cn.Close()
        End Try
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


    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM EVENTOS WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub


    'Protected Sub OnRowDeleting2(sender As Object, e As GridViewDeleteEventArgs)

    '    ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
    '    Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
    '    Dim constr As String = SingletonDb.GetInstance.GetConnectionString
    '    'ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New SqlConnection(constr)
    '        Using cmd As New SqlCommand("DELETE FROM USUARIO WHERE ID = " & Id & "")
    '            ' cmd.Parameters.AddWithValue("@ID", Id)
    '            cmd.Connection = con
    '            con.Open()
    '            cmd.ExecuteNonQuery()
    '            con.Close()
    '        End Using
    '    End Using

    'End Sub

    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    '    Session("INSC_EVENTO") = DropDownList1.SelectedValue.ToString
    '    Session("INSC_PERSONA") = DropDownList2.SelectedValue.ToString
    '    Session("INSC_HORAS") = TextBox1.Text
    '    Session("INSC_PRECIO") = TextBox2.Text

    '    Dim constr As String = SingletonDb.GetInstance.GetConnectionString
    '    'ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New SqlConnection(constr)
    '        Using cmd As New SqlCommand("INSERT INTO EVENTOS_USUARIOS VALUES ( " & Session("INSC_PERSONA") & " ,  " & Session("INSC_EVENTO") & " ,GETDATE() ,  " & Session("INSC_HORAS") & "  ,  " & Session("INSC_PRECIO") & " , 0,NULL)")
    '            ' cmd.Parameters.AddWithValue("@ID", Id)
    '            cmd.Connection = con
    '            con.Open()
    '            cmd.ExecuteNonQuery()
    '            con.Close()
    '        End Using
    '    End Using
    '    Response.Redirect("Evento_Rb.aspx")

    'End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        'Dim fech As Date
        'fech = Convert.ToDateTime(TextBox3.Text)
        '' desde = desde.ToString("dd/MM/yyyy")
        ''Format(desde, "dd-mm-yyyy")
        'Session("Desd") = fech

        'Busca_Evento(fech)



    End Sub


    Protected Sub Busca_Evento(Fech)

        'Session("fecha2") = "SELECT * FROM EVENTOS where fecha ='" & Session("Desd") & "' ORDER BY ID "
        'MsgBox(Session("fecha2"))
        'With Cmd
        '    .CommandType = CommandType.Text
        '    .CommandText = "SELECT * FROM EVENTOS where fecha = " & Session("Desd") & "  ORDER BY ID "
        '    .Connection = Cn
        'End With
        'Da.SelectCommand = Cmd
        'Dt = New DataTable
        'Da.Fill(Dt)
        'With DropDownList1
        '    .DataSource = Dt
        '    DropDownList1.DataTextField = "NOMBRE"
        '    DropDownList1.DataValueField = "ID"
        '    DropDownList1.DataBind()

        '    'Session("fecha2") = "fecha"

        'End With

        ''MsgBox(Session("fecha"))

        ''Dim Dt2 As DataTable
        ''Dim Da2 As New SqlDataAdapter
        ''Dim Cmd2 As New SqlCommand

        ''With Cmd2
        ''    .CommandType = CommandType.Text
        ''    .CommandText = "SELECT U.NOMBRE, U.ID as identif FROM EVENTOS_USUARIOS EU LEFT JOIN USUARIOS U ON U.ID = EU.ID_USUARIO WHERE EU.ID_EVENTO = 1  ORDER BY U.NOMBRE"
        ''    .Connection = Cn
        ''End With
        ''Da2.SelectCommand = Cmd2
        ''Dt2 = New DataTable
        ''Da2.Fill(Dt2)
        ''With DropDownList2
        ''    .DataSource = Dt2
        ''    DropDownList2.DataTextField = "NOMBRE"
        ''    DropDownList2.DataValueField = "identif"
        ''    DropDownList2.DataBind()

        ''End With
        'Cn.Close()



    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

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
                    If (TextBox14.Text = NIE) Then

                        TextBox5.Visible = True
                        TextBox6.Visible = True
                        TextBox7.Visible = True
                        TextBox8.Visible = True
                        TextBox9.Visible = True
                        TextBox10.Visible = True
                        TextBox11.Visible = True
                        TextBox12.Visible = True
                        TextBox13.Visible = True

                        TextBox15.Visible = True
                        TextBox16.Visible = True

                        TextBox5.Text = Nombre & "  " & Apellido1 & "  " & Apellido2
                        TextBox6.Text = NIE
                        TextBox7.Text = Nombre & "  " & Apellido1 & "  " & Apellido2
                        TextBox8.Text = Nombre & "  " & Apellido1 & "  " & Apellido2
                        TextBox9.Text = Nombre & "  " & Apellido1 & "  " & Apellido2
                        TextBox10.Text = Cargo
                        TextBox11.Text = PRecio
                        TextBox12.Text = Nombre & "  " & Apellido1 & "  " & Apellido2
                        TextBox13.Text = FechaEvento
                        TextBox15.Text = FechaEvento
                        TextBox16.Text = Nombre & "  " & Apellido1 & "  " & Apellido2



                    Else
                        TextBox5.Visible = False
                        TextBox6.Visible = False
                        TextBox7.Visible = False
                        TextBox8.Visible = False
                        TextBox9.Visible = False
                        TextBox10.Visible = False
                        TextBox11.Visible = False
                        TextBox12.Visible = False
                        TextBox13.Visible = False
                        TextBox15.Visible = False
                        TextBox16.Visible = False

                    End If
                Loop

            Else



            End If

            Cn.Close()

        Catch ex As Exception
            'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
            Cn.Close()
        End Try



    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
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
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click


        '' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        '' Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        'Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        ''ConfigurationManager.ConnectionStrings("constr").ConnectionString
        'Using con As New SqlConnection(constr)
        '    Using cmd As New SqlCommand("UPDATE  EVENTOS_USUARIOS SET ACEPTA = 1 WHERE Id_evento = " & Session("INSC_EVENTO") & "  and id_usuario = " & Session("INSC_PERSONA") & " ")
        '        ' cmd.Parameters.AddWithValue("@ID", Id)                                                
        '        cmd.Connection = con
        '        con.Open()
        '        cmd.ExecuteNonQuery()
        '        con.Close()
        '    End Using
        'End Using


    End Sub





    'Public Sub CARGAFOTO()

    '    ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



    '    'If IsPostBack Then

    '    'My.Computer.FileSystem.CreateDirectory(My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/")

    '    'Dim path As String = My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/"
    '    Dim path As String = Server.MapPath("~/DBF/")
    '    'Label51.Text = path
    '    Dim fileOK As Boolean = False
    '    If FileUpload1.HasFile Then
    '        Dim fileExtension As String
    '        fileExtension = System.IO.Path.
    '                GetExtension(FileUpload1.FileName).ToLower()
    '        Dim allowedExtensions As String() =
    '                {".DBF", ".dbf"}
    '        For i As Integer = 0 To allowedExtensions.Length - 1
    '            If fileExtension = allowedExtensions(i) Then
    '                fileOK = True
    '            End If
    '        Next
    '        If fileOK Then
    '            Try

    '                FileUpload1.PostedFile.SaveAs(path &
    '                         FileUpload1.FileName)



    '                Dim ruta As Stream = File.Open(path & FileUpload1.FileName, FileMode.Open, FileAccess.Read)
    '                '   Dim ruta As Stream = File.Open("~/DBF/TIPOHAB.DBF", FileMode.Open, FileAccess.Read)
    '                Dim dbftable As Table = NDbfReader.Table.Open(ruta)
    '                Dim dbfreader As Reader = dbftable.OpenReader(Encoding.ASCII)


    '                'MsgBox(FileUpload1.PostedFile.InputStream.ToString)

    '                While (dbfreader.Read())


    '                    'MsgBox(dbfreader.Table.Columns.Count.ToString)
    '                    Cmd.Connection = Cn
    '                    Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(7).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(8).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(9).Name.ToString) & "',SUBSTRING ('" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "' ,1,1),'" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "')"
    '                    Cmd.CommandTimeout = 3000
    '                    Try
    '                        Cn.Open()
    '                        Cmd.ExecuteNonQuery()
    '                        Cn.Close()
    '                    Catch ex As Exception
    '                        If ex.Message <> "" Then
    '                            Cn.Close()
    '                        End If
    '                    End Try
    '                    Cn.Close()




    '                End While
    '                dbftable.Dispose()
    '                Label50.Text = "DATOS CARGADOS CORRECTAMENTE"

    '            Catch ex As Exception
    '                Label50.Text = "ERROR AL CARGAR" & ex.Message

    '            End Try

    '        Else
    '            Label50.Text = "ERROR TIPO FICHERO"
    '        End If

    '    End If
    '    'End If
    '    'Dim pathAPP As String = Server.MapPath("~/DBF/" & FileUpload1.FileName)

    '    'File.Delete(pathAPP)


    '    Response.Redirect(Request.Url.AbsoluteUri)



    'End Sub

    'Private Function CreateThumbNail(ByVal postedFile As Bitmap, ByVal width As Integer, ByVal height As Integer) As Bitmap
    '    Dim Format As ImageFormat = postedFile.RawFormat
    '    Dim NewHeight As Single = height
    '    Dim NewWidth As Single = width
    '    Dim bmpOut As System.Drawing.Bitmap
    '    bmpOut = New Bitmap(Convert.ToInt32(NewWidth), Convert.ToInt32(NewHeight))
    '    Dim g As Graphics = Graphics.FromImage(bmpOut)
    '    g.DrawImage(postedFile, 0, 0, NewWidth, NewHeight)
    '    postedFile.Dispose()
    '    Return bmpOut
    'End Function

    Protected Sub Upload(sender As Object, e As EventArgs)


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
                    Dim query As String = "UPDATE EVENTOS_USUARIOS SET ACEPTA = @ACEPTA, FIRMA =  @Data , FIRMA_TYPE = @ContentType  WHERE ID = " & Session("ID_EVENTO_USUARIO") & ""
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
                        cmd.Parameters.Add("@Acepta", SqlDbType.Bit).Value = CheckBox1.Checked
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

    Public Shared Function ResizeImage(ByVal image As Image,
    ByVal size As Size, Optional ByVal preserveAspectRatio As Boolean = True) As Image

    End Function


End Class