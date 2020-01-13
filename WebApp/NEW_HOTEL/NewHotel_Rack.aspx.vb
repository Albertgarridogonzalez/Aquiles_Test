Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader
Imports System.Drawing
Imports System.Data.OleDb



Public Class NewHotel_Rack

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

        SqlTest.SelectCommand = "SELECT ID,CODHAB, HAB, TIPO, MODULO1,MODULO2,MODULO3,MODULO4, PLANTA FROM [HOTEL_DATOS_RACK] WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'ORDER BY PLANTA, HAB ASC "
        SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_RACK SET CODHAB= @CODHAB, HAB = @HAB , TIPO =@TIPO ,MODULO1 = @MODULO1, MODULO2 = @MODULO2 ,PLANTA = @PLANTA     WHERE [ID] = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_RACK WHERE CODhab = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_RACK VALUES ( '" & Session("NewHotelID") & "','','','','','','','0','')           "
        SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_RACK WHERE ID = 0"


        'Dt.
        'DropDownList1.DataSource = Dt
        'DropDownList1.DataTextField = "Name";
        'DropDownList1.DataValueField = "ID";
        'DropDownList1.DataBind(); `

        Dim sql_query2 As New SqlCommand
        Dim ErrorHAB As String
        Dim error1 As Boolean = True
        sql_query2.Connection = Cn
            Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO NOT IN (SELECT CODIGO FROM HOTEL_DATOS_TIPOHAB WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "') AND HAB <>''"
        sql_result = sql_query2.ExecuteReader
            Session("id_error_hotel3") = 0
            If sql_result.HasRows Then
                sql_result.Read()
            ErrorHAB = sql_result("HAB")


            Session("ErrorHAB") = ErrorHAB

            If ErrorHAB <> "" Then
                ALERT.Visible = True
            Else
                ALERT.Visible = False
            End If


            End If
        Cn.Close()



        'Dim sql_query2 As New SqlCommand
        Dim ErrorHAB2 As String
        Dim error2 As Boolean = True
        sql_query2.Connection = Cn
        Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ISNUMERIC(CODHAB ) =0  AND CODHAB <> ''"
        sql_result = sql_query2.ExecuteReader
        Session("ErrorHAB2") = 0
        If sql_result.HasRows Then
            sql_result.Read()
            ErrorHAB2 = sql_result("CODHAB")


            Session("ErrorHAB2") = ErrorHAB2

            If ErrorHAB2 <> "" Then
                ALERT2.Visible = True
            Else
                ALERT2.Visible = False
            End If


        End If
        Cn.Close()



        Label50.Visible = False
        Label51.Visible = False
        If Session("HotelDatos") = True Then
            DropDownList1.Visible = False
            DropDownList2.Visible = False
            Button21.Visible = False
            Button22.Visible = False
            GridView1.Visible = False
            FileUpload1.Visible = False
            Button10.Visible = False
            Button23.Visible = False
        Else
            TextBox1.Visible = False
            TextBox2.Visible = False
            TextBox3.Visible = False
            TextBox4.Visible = False
            TextBox5.Visible = False
            TextBox6.Visible = False
            TextBox7.Visible = False
            TextBox8.Visible = False
            Button24.Visible = False
            Button25.Visible = False
            Button26.Visible = False
            Button27.Visible = False
            CheckBox1.Visible = False


        End If

        TextBox1.BackColor = Color.LightCoral
        TextBox7.BackColor = Color.LightCoral
        TextBox8.BackColor = Color.LightCoral
        TextBox4.BackColor = Color.LightCoral
        TextBox5.BackColor = Color.LightCoral
        TextBox6.BackColor = Color.LightCoral
        TextBox2.BackColor = Color.LightCoral
        TextBox3.BackColor = Color.LightCoral


    End Sub


    Public Sub CARGADBF()

        ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        'If IsPostBack Then

        'My.Computer.FileSystem.CreateDirectory(My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/")

        'Dim path As String = My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/"
        Dim path As String = Server.MapPath("~/DBF/")
        Label51.Text = path
        Dim fileOK As Boolean = False
        If FileUpload1.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.
                    GetExtension(FileUpload1.FileName).ToLower()
            Dim allowedExtensions As String() =
                    {".DBF", ".dbf"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next
            If fileOK Then
                Try

                    FileUpload1.PostedFile.SaveAs(path &
                             FileUpload1.FileName)



                    Dim ruta As Stream = File.Open(path & FileUpload1.FileName, FileMode.Open, FileAccess.Read)
                    '   Dim ruta As Stream = File.Open("~/DBF/TIPOHAB.DBF", FileMode.Open, FileAccess.Read)
                    Dim dbftable As Table = NDbfReader.Table.Open(ruta)
                    Dim dbfreader As Reader = dbftable.OpenReader(Encoding.ASCII)


                    'MsgBox(FileUpload1.PostedFile.InputStream.ToString)

                    While (dbfreader.Read())


                        'MsgBox(dbfreader.Table.Columns.Count.ToString)
                        Cmd.Connection = Cn
                        Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(7).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(8).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(9).Name.ToString) & "',SUBSTRING ('" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "' ,1,1),'" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "')"
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




                    End While
                    dbftable.Dispose()
                    Label50.Text = "DATOS CARGADOS CORRECTAMENTE"

                Catch ex As Exception
                    Label50.Text = "ERROR AL CARGAR" & ex.Message

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

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        CARGADBF()

    End Sub

    Protected Sub Button21_Click(sender As Object, e As EventArgs) Handles Button21.Click





        With Cmd
            .CommandType = CommandType.Text
            .CommandText = "SELECT DISTINCT (TIPO) FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            .Connection = Cn
        End With
        Da.SelectCommand = Cmd
        Dt = New DataTable
        Da.Fill(Dt)
        With DropDownList1
            .DataSource = Dt
            DropDownList1.DataTextField = "TIPO"
            DropDownList1.DataValueField = "TIPO"
            DropDownList1.DataBind()
        End With

        With Cmd
            .CommandType = CommandType.Text
            .CommandText = "SELECT DISTINCT (CODIGO) FROM HOTEL_DATOS_TIPOHAB WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            .Connection = Cn
        End With
        Da.SelectCommand = Cmd
        Dt = New DataTable
        Da.Fill(Dt)
        With DropDownList2
            .DataSource = Dt
            DropDownList2.DataTextField = "CODIGO"
            DropDownList2.DataValueField = "CODIGO"
            DropDownList2.DataBind()
        End With

        Button21.Visible = False
        DropDownList1.Visible = True
        DropDownList2.Visible = True
        Button22.Visible = True

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

    End Sub

    Protected Sub Button22_Click(sender As Object, e As EventArgs) Handles Button22.Click
        Session("TIPO_DESTINO") = DropDownList2.SelectedValue
        Session("TIPO_ORIGEN") = DropDownList1.SelectedValue.ToString
        Cmd.Connection = Cn
        Cmd.CommandText = "UPDATE HOTEL_DATOS_RACK SET TIPO = '" & Session("TIPO_DESTINO") & "'  WHERE TIPO = '" & Session("TIPO_ORIGEN") & "' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
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

        Response.Redirect("/NEW_HOTEL/NewHotel_Rack")
    End Sub
    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_RACK WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Protected Sub OnRowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes("ondblclick") = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Edit$" & e.Row.RowIndex)
            e.Row.Attributes("style") = "cursor:pointer"
        End If

    End Sub

    'Protected Sub OnRowEditing(sender As Object, e As GridViewEditEventArgs)
    '    GridView1.EditIndex = e.NewEditIndex
    '    Me.BindGrid()
    '    GridView1.Rows(e.NewEditIndex).Attributes.Remove("ondblclick")
    '    GridView1.Columns(2).Visible = True
    'End Sub
    Protected Sub OnRowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        'Me.BindGrid()
        GridView1.Rows(e.NewEditIndex).Attributes.Remove("ondblclick")
        'GridView1.Columns(2).Visible = True
        GridView1.UpdateRow(GridView1.EditIndex, True)
    End Sub
    Protected Sub OnUpdate(sender As Object, e As EventArgs)
        Dim row As GridViewRow = TryCast(TryCast(sender, LinkButton).NamingContainer, GridViewRow)
        Dim name As String = TryCast(row.Cells(0).Controls(0), TextBox).Text
        Dim country As String = TryCast(row.Cells(1).Controls(0), TextBox).Text
        Dim dt As DataTable = TryCast(ViewState("dt"), DataTable)
        dt.Rows(row.RowIndex)("Name") = name
        dt.Rows(row.RowIndex)("Country") = country
        ViewState("dt") = dt
        GridView1.EditIndex = -1
        'BindGrid()
    End Sub

    Protected Sub OnCancel(sender As Object, e As EventArgs)
        GridView1.EditIndex = -1
        'Me.BindGrid()
    End Sub

    Protected Sub Button23_Click(sender As Object, e As EventArgs) Handles Button23.Click
        Cmd.Connection = Cn
        Cmd.CommandText = "DELETE FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'"
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

    Protected Sub Button24_Click(sender As Object, e As EventArgs) Handles Button24.Click
        'Cmd.Connection = Cn
        'Cmd.CommandText = "EXEC.SP_MOD_TIPOSHAB '" & Session("NewHotelID") & "','" & TextBox1.Text & "','" & TextBox7.Text & "','" & CheckBox1.Checked & "','" & TextBox8.Text & "',1"
        'Cmd.CommandTimeout = 3000
        'Try
        '    Cn.Open()
        '    Cmd.ExecuteNonQuery()
        '    Cn.Close()
        'Catch ex As Exception
        '    If ex.Message <> "" Then
        '        Cn.Close()
        '    End If
        'End Try
        'Cn.Close()
        Session("ProgressBarLvl") = 1


        TextBox1.BackColor = Color.DarkSeaGreen
        TextBox7.BackColor = Color.DarkSeaGreen
        TextBox8.BackColor = Color.DarkSeaGreen
        Session("C1") = 1
        Session("C2") = 0
        Session("C3") = 0
        Session("C4") = 0
        Session("C5") = 0
        Session("C6") = 0
        Session("C7") = 0
        Session("C8") = 0
        Session("C9") = 0
        Session("C10") = 0
        Session("C11") = 0
        Session("C12") = 0
        Session("C13") = 0
        Session("C14") = 0
        Session("P1") = TextBox1.Text
        Session("P2") = TextBox7.Text
        Session("P3") = TextBox8.Text
        Session("P4") = ""
        Session("P5") = ""

        Session("B1") = CheckBox1.Checked
        Session("B2") = 0
        Session("B3") = 0
        Session("B4") = 0
        Session("B5") = 0

        Timer1.Interval = "500"
        Tareas()
        Timer1.Enabled = True


    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        If TextBox1.Text <> "DVL" Then
            TextBox1.BackColor = Color.DarkSeaGreen
        Else
            TextBox1.BackColor = Color.LightCoral
        End If
    End Sub

    Protected Sub TextBox7_TextChanged(sender As Object, e As EventArgs) Handles TextBox7.TextChanged
        If TextBox7.Text <> "DOVBLE" Then
            TextBox7.BackColor = Color.DarkSeaGreen
        Else
            TextBox7.BackColor = Color.LightCoral
        End If
    End Sub

    Protected Sub TextBox8_TextChanged(sender As Object, e As EventArgs) Handles TextBox8.TextChanged
        If TextBox8.Text <> "ORDEN" Then
            TextBox8.BackColor = Color.DarkSeaGreen
        Else
            TextBox8.BackColor = Color.LightCoral
        End If
    End Sub

    Protected Sub Button27_Click(sender As Object, e As EventArgs) Handles Button27.Click
        'Cmd.Connection = Cn
        'Cmd.CommandText = "EXEC.SP_MOD_TIPOSHAB '" & Session("NewHotelID") & "','" & TextBox6.Text & "','','FALSE',0,0"
        'Cmd.CommandTimeout = 3000
        'Try
        '    Cn.Open()
        '    Cmd.ExecuteNonQuery()
        '    Cn.Close()PARAM
        'Catch ex As Exception
        '    If ex.Message <> "" Then
        '        Cn.Close()
        '    End If
        'End Try
        'Cn.Close()
        Session("ProgressBarLvl") = 1
        TextBox6.BackColor = Color.DarkSeaGreen
        Session("C1") = 0
        Session("C2") = 0
        Session("C3") = 0
        Session("C4") = 1
        Session("C5") = 0
        Session("C6") = 0
        Session("C7") = 0
        Session("C8") = 0
        Session("C9") = 0
        Session("C10") = 0
        Session("C11") = 0
        Session("C12") = 0
        Session("C13") = 0
        Session("C14") = 0
        Session("P1") = TextBox6.Text
        Session("P2") = ""
        Session("P3") = ""
        Session("P4") = ""
        Session("P5") = ""

        Session("B1") = 0
        Session("B2") = 0
        Session("B3") = 0
        Session("B4") = 0
        Session("B5") = 0

        Timer1.Interval = "7000"
        Tareas()
        Timer1.Enabled = True


    End Sub

    Protected Sub Button25_Click(sender As Object, e As EventArgs) Handles Button25.Click
        Session("ProgressBarLvl") = 1


        TextBox1.BackColor = Color.DarkSeaGreen
        TextBox7.BackColor = Color.DarkSeaGreen
        TextBox8.BackColor = Color.DarkSeaGreen
        Session("C1") = 0
        Session("C2") = 1
        Session("C3") = 0
        Session("C4") = 0
        Session("C5") = 0
        Session("C6") = 0
        Session("C7") = 0
        Session("C8") = 0
        Session("C9") = 0
        Session("C10") = 0
        Session("C11") = 0
        Session("C12") = 0
        Session("C13") = 0
        Session("C14") = 0
        Session("P1") = TextBox2.Text
        Session("P2") = TextBox3.Text
        Session("P3") = ""
        Session("P4") = ""
        Session("P5") = ""

        Session("B1") = 0
        Session("B2") = 0
        Session("B3") = 0
        Session("B4") = 0
        Session("B5") = 0

        Timer1.Interval = "500"
        Tareas()
        Timer1.Enabled = True

        'Cmd.Connection = Cn
        'Cmd.CommandText = "EXEC.SP_MOD_CAMBIA_TIPOHAB '" & Session("NewHotelID") & "','" & TextBox3.Text & "','" & TextBox2.Text & "'"
        'Cmd.CommandTimeout = 3000
        'Try
        '    Cn.Open()
        '    Cmd.ExecuteNonQuery()
        '    Cn.Close()
        'Catch ex As Exception
        '    If ex.Message <> "" Then
        '        Cn.Close()
        '    End If
        'End Try
        'Cn.Close()
    End Sub

    Protected Sub Button26_Click(sender As Object, e As EventArgs) Handles Button26.Click

        Session("ProgressBarLvl") = 1


        TextBox4.BackColor = Color.DarkSeaGreen
        TextBox5.BackColor = Color.DarkSeaGreen

        Session("C1") = 0
        Session("C2") = 0
        Session("C3") = 1
        Session("C4") = 0
        Session("C5") = 0
        Session("C6") = 0
        Session("C7") = 0
        Session("C8") = 0
        Session("C9") = 0
        Session("C10") = 0
        Session("C11") = 0
        Session("C12") = 0
        Session("C13") = 0
        Session("C14") = 0
        Session("P1") = TextBox4.Text
        Session("P2") = TextBox5.Text
        Session("P3") = ""
        Session("P4") = ""
        Session("P5") = ""

        Session("B1") = 0
        Session("B2") = 0
        Session("B3") = 0
        Session("B4") = 0
        Session("B5") = 0

        Timer1.Interval = "8000"
        Tareas()
        Timer1.Enabled = True


        'Cmd.Connection = Cn
        'Cmd.CommandText = "EXEC.SP_MOD_CAMBIA_TIPO '" & Session("NewHotelID") & "','" & TextBox4.Text & "','" & TextBox5.Text & "'"
        'Cmd.CommandTimeout = 30000
        'Try
        '    Cn.Open()
        '    Cmd.ExecuteNonQuery()
        '    Cn.Close()
        'Catch ex As Exception
        '    If ex.Message <> "" Then
        '        Cn.Close()
        '    End If
        'End Try
        'Cn.Close()
        'TextBox4.BackColor = Color.DarkSeaGreen
        'TextBox5.BackColor = Color.DarkSeaGreen
    End Sub


    Public Sub Tareas()

        ' If CheckBox1.Checked = True Or CheckBox2.Checked = True Or CheckBox3.Checked = True Or CheckBox4.Checked = True Or CheckBox5.Checked = True Or CheckBox6.Checked = True Or CheckBox10.Checked = True Then

        'If CheckBox1.Checked = True Then
        Cmd.Connection = Cn
        Cmd.CommandText = "EXEC.[SP_INSERT_PROCESOS_2]'" & Session("NewHotelID") & "','" & Session("C1") & "','" & Session("C2") & "','" & Session("C3") & "','" & Session("C4") & "','" & Session("C5") & "','" & Session("C6") & "','" & Session("C7") & "','" & Session("C8") & "','" & Session("C9") & "','" & Session("C10") & "','" & Session("P1") & "','" & Session("P2") & "','" & Session("P3") & "','" & Session("P4") & "','" & Session("P5") & "','" & Session("B1") & "','" & Session("B2") & "','" & Session("B3") & "','" & Session("B4") & "','" & Session("B5") & "'"
        Cmd.CommandTimeout = 3000
        'Try
        Cn.Open()
        Cmd.ExecuteNonQuery()
        Cn.Close()
        'Catch ex As Exception
        '    If ex.Message <> "" Then
        '    End If
        'End Try
        Cn.Close()
        'End If

        'End If
    End Sub


    Public Sub Barra()
        ProgressBar1.Visible = True
        ProgressBar1.Style.Add("Width", Session("ProgressBarLvl") & "%")
        Session("ProgressBarLvl") = Session("ProgressBarLvl") + 0.5
    End Sub





    'Public Sub porcentage()


    '    ProgressBar1.Visible = True
    '    ProgressBar1.Style.Add("Width", "0.5%")


    '    ' Dim ESTADO As Integer
    '    Dim ESTADO_OK As Integer
    '    Dim sql_query As New SqlCommand
    '    sql_query.Connection = Cn
    '    Cn.Open()
    '    sql_query.CommandText = "SELECT TOP 1 ESTADO_OK FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'INSTALANDO' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' ORDER BY  ESTADO_OK DESC"
    '    sql_result = sql_query.ExecuteReader
    '    If sql_result.HasRows Then
    '        sql_result.Read()
    '        ESTADO_OK = sql_result("ESTADO_OK")
    '        If ESTADO_OK = 1 Then
    '            Session("progressbar") = 1

    '        Else
    '            If ESTADO_OK = 2 Then
    '                Session("progressbar") = 2

    '                ProgressBar1.Style.Add("Width", "100%")


    '            Else



    '                Session("progressbar") = 0
    '                ProgressBar1.Style.Add("Width", "0%")

    '                'Label1.Text = "100%"

    '                'Timer1.Enabled = False
    '                'ProgressBar1.Visible = False
    '                'ProgressBar1.Style.Add("Width", "100%")
    '            End If

    '        End If
    '        'If sql_result("ESTADO_OK") = 1 Then
    '        '    Session("progressbar") = IsDBNull(sql_result("ESTADO_OK"))



    '    End If
    '    sql_result.Close()
    '    Cn.Close()


    '    If Session("progressbar") = 1 Then



    '        sql_query.Connection = Cn
    '        Cn.Open()
    '        sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CREARHOTEL' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        sql_result = sql_query.ExecuteReader
    '        If sql_result.HasRows Then
    '            sql_result.Read()


    '            ESTADO_OK = sql_result("ESTADO_OK")

    '            If ESTADO_OK = 1 Then

    '                ProgressBar1.Style.Add("Width", "100%")

    '            Else


    '                ProgressBar1.Style.Add("Width", "10%")
    '                Else
    '                    ProgressBar1.Style.Add("Width", "0%")
    '                End If
    '            End If

    '        End If
    '        sql_result.Close()
    '        Cn.Close()



    '        '' CHECKBOX 5
    '        'sql_query.Connection = Cn
    '        'Cn.Open()
    '        'sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'HOTELCONFIG' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        'sql_result = sql_query.ExecuteReader
    '        'If sql_result.HasRows Then
    '        '    sql_result.Read()
    '        '    ESTADO_OK = sql_result("ESTADO_OK")

    '        '    If ESTADO_OK = 1 Then
    '        '        If CheckBox5.Checked = True Then
    '        '            ProgressBar5.Style.Add("Width", "100%")
    '        '        Else
    '        '            ProgressBar5.Style.Add("Width", "0%")
    '        '        End If
    '        '    Else
    '        '        If CheckBox5.Checked = True Then

    '        '            ProgressBar5.Style.Add("Width", "10%")
    '        '        Else
    '        '            ProgressBar5.Style.Add("Width", "0%")
    '        '        End If
    '        '    End If

    '        'End If
    '        'sql_result.Close()
    '        'Cn.Close()


    '        '' CHECKBOX 9
    '        'sql_query.Connection = Cn
    '        'Cn.Open()
    '        'sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'REGIMEN' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        'sql_result = sql_query.ExecuteReader
    '        'If sql_result.HasRows Then
    '        '    sql_result.Read()
    '        '    ESTADO_OK = sql_result("ESTADO_OK")

    '        '    If ESTADO_OK = 1 Then
    '        '        If CheckBox9.Checked = True Then
    '        '            ProgressBar9.Style.Add("Width", "100%")
    '        '        Else
    '        '            ProgressBar9.Style.Add("Width", "0%")
    '        '        End If
    '        '    Else
    '        '        If CheckBox9.Checked = True Then

    '        '            ProgressBar9.Style.Add("Width", "10%")
    '        '        Else
    '        '            ProgressBar9.Style.Add("Width", "0%")
    '        '        End If
    '        '    End If

    '        'End If
    '        'sql_result.Close()
    '        'Cn.Close()


    '        '' CHECKBOX 2
    '        'sql_query.Connection = Cn
    '        'Cn.Open()
    '        'sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CREARTIPOHAB' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        'sql_result = sql_query.ExecuteReader
    '        'If sql_result.HasRows Then
    '        '    sql_result.Read()
    '        '    ESTADO_OK = sql_result("ESTADO_OK")

    '        '    If ESTADO_OK = 1 Then
    '        '        If CheckBox2.Checked = True Then
    '        '            ProgressBar1.Style.Add("Width", "100%")
    '        '        Else
    '        '            ProgressBar1.Style.Add("Width", "0%")
    '        '        End If
    '        '    Else
    '        '        If CheckBox2.Checked = True Then

    '        '            ProgressBar1.Style.Add("Width", "10%")
    '        '        Else
    '        '            ProgressBar1.Style.Add("Width", "0%")
    '        '        End If
    '        '    End If

    '        'End If
    '        'sql_result.Close()
    '        'Cn.Close()


    '        '' CHECKBOX 3
    '        'sql_query.Connection = Cn
    '        'Cn.Open()
    '        'sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'ORIGENSEG' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        'sql_result = sql_query.ExecuteReader
    '        'If sql_result.HasRows Then
    '        '    sql_result.Read()
    '        '    ESTADO_OK = sql_result("ESTADO_OK")

    '        '    If ESTADO_OK = 1 Then
    '        '        If CheckBox3.Checked = True Then
    '        '            ProgressBar1.Style.Add("Width", "100%")
    '        '        Else
    '        '            ProgressBar1.Style.Add("Width", "0%")
    '        '        End If
    '        '    Else
    '        '        If CheckBox3.Checked = True Then

    '        '            ProgressBar1.Style.Add("Width", "10%")
    '        '        Else
    '        '            ProgressBar1.Style.Add("Width", "0%")
    '        '        End If
    '        '    End If

    '        'End If
    '        'sql_result.Close()
    '        'Cn.Close()


    '        '' CHECKBOX 4
    '        'sql_query.Connection = Cn
    '        'Cn.Open()
    '        'sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'RACK' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        'sql_result = sql_query.ExecuteReader
    '        'If sql_result.HasRows Then
    '        '    sql_result.Read()
    '        '    ESTADO_OK = sql_result("ESTADO_OK")

    '        '    If ESTADO_OK = 1 Then
    '        '        If CheckBox4.Checked = True Then
    '        '            ProgressBar1.Style.Add("Width", "100%")
    '        '        Else
    '        '            ProgressBar1.Style.Add("Width", "0%")
    '        '        End If
    '        '    Else
    '        '        If CheckBox4.Checked = True Then

    '        '            ProgressBar1.Style.Add("Width", "10%")
    '        '        Else
    '        '            ProgressBar1.Style.Add("Width", "0%")
    '        '        End If
    '        '    End If

    '        'End If
    '        'sql_result.Close()
    '        'Cn.Close()



    '        '    ' CHECKBOX 6
    '        '    sql_query.Connection = Cn
    '        '    Cn.Open()
    '        '    sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'OCUP' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        '    sql_result = sql_query.ExecuteReader
    '        '    If sql_result.HasRows Then
    '        '        sql_result.Read()
    '        '        ESTADO_OK = sql_result("ESTADO_OK")

    '        '        If ESTADO_OK = 1 Then
    '        '            If CheckBox6.Checked = True Then
    '        '                ProgressBar6.Style.Add("Width", "100%")
    '        '            Else
    '        '                ProgressBar6.Style.Add("Width", "0%")
    '        '            End If
    '        '        Else
    '        '            If CheckBox6.Checked = True Then

    '        '                ProgressBar6.Style.Add("Width", "10%")
    '        '            Else
    '        '                ProgressBar6.Style.Add("Width", "0%")
    '        '            End If
    '        '        End If

    '        '    End If
    '        '    sql_result.Close()
    '        '    Cn.Close()


    '        '    ' CHECKBOX 7
    '        '    sql_query.Connection = Cn
    '        '    Cn.Open()
    '        '    sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CONCEPTO' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        '    sql_result = sql_query.ExecuteReader
    '        '    If sql_result.HasRows Then
    '        '        sql_result.Read()
    '        '        ESTADO_OK = sql_result("ESTADO_OK")

    '        '        If ESTADO_OK = 1 Then
    '        '            If CheckBox7.Checked = True Then
    '        '                ProgressBar7.Style.Add("Width", "100%")
    '        '            Else
    '        '                ProgressBar7.Style.Add("Width", "0%")
    '        '            End If
    '        '        Else
    '        '            If CheckBox7.Checked = True Then

    '        '                ProgressBar7.Style.Add("Width", "10%")
    '        '            Else
    '        '                ProgressBar7.Style.Add("Width", "0%")
    '        '            End If
    '        '        End If

    '        '    End If
    '        '    sql_result.Close()
    '        '    Cn.Close()





    '        '    ' CHECKBOX 8
    '        '    sql_query.Connection = Cn
    '        '    Cn.Open()
    '        '    sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'COBROS' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        '    sql_result = sql_query.ExecuteReader
    '        '    If sql_result.HasRows Then
    '        '        sql_result.Read()
    '        '        ESTADO_OK = sql_result("ESTADO_OK")

    '        '        If ESTADO_OK = 1 Then
    '        '            If CheckBox8.Checked = True Then
    '        '                ProgressBar8.Style.Add("Width", "100%")
    '        '            Else
    '        '                ProgressBar8.Style.Add("Width", "0%")
    '        '            End If
    '        '        Else
    '        '            If CheckBox8.Checked = True Then

    '        '                ProgressBar8.Style.Add("Width", "10%")
    '        '            Else
    '        '                ProgressBar8.Style.Add("Width", "0%")
    '        '            End If
    '        '        End If

    '        '    End If
    '        '    sql_result.Close()
    '        '    Cn.Close()










    '        '    ' CHECKBOX 10
    '        '    sql_query.Connection = Cn
    '        '    Cn.Open()
    '        '    sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'TRASPASO_MAESTRO' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        '    sql_result = sql_query.ExecuteReader
    '        '    If sql_result.HasRows Then
    '        '        sql_result.Read()
    '        '        ESTADO_OK = sql_result("ESTADO_OK")

    '        '        If ESTADO_OK = 1 Then
    '        '            If CheckBox10.Checked = True Then
    '        '                ProgressBar10.Style.Add("Width", "100%")

    '        '            Else
    '        '                ProgressBar10.Style.Add("Width", "0%")
    '        '            End If
    '        '        Else
    '        '            If CheckBox10.Checked = True Then

    '        '                ProgressBar10.Style.Add("Width", "10%")
    '        '            Else
    '        '                ProgressBar10.Style.Add("Width", "0%")
    '        '            End If
    '        '        End If

    '        '    End If
    '        '    sql_result.Close()
    '        '    Cn.Close()






    '        '    ' CHECKBOX 11
    '        '    sql_query.Connection = Cn
    '        '    Cn.Open()
    '        '    sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CARACT' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        '    sql_result = sql_query.ExecuteReader
    '        '    If sql_result.HasRows Then
    '        '        sql_result.Read()
    '        '        ESTADO_OK = sql_result("ESTADO_OK")

    '        '        If ESTADO_OK = 1 Then
    '        '            If CheckBox11.Checked = True Then
    '        '                ProgressBar11.Style.Add("Width", "100%")

    '        '            Else
    '        '                ProgressBar11.Style.Add("Width", "0%")
    '        '            End If
    '        '        Else
    '        '            If CheckBox11.Checked = True Then

    '        '                ProgressBar11.Style.Add("Width", "10%")
    '        '            Else
    '        '                ProgressBar11.Style.Add("Width", "0%")
    '        '            End If
    '        '        End If

    '        '    End If
    '        '    sql_result.Close()
    '        '    Cn.Close()

    '    End If




    'End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Barra()
    End Sub


    Public Function isnull(dato)

        If dato Is DBNull.Value Then
            dato = ""
        Else
            dato = dato
        End If
        Return dato


    End Function


    Protected Sub Button14_Click(sender As Object, e As EventArgs) Handles Button14.Click




        Dim SQLconn As New SqlConnection()
        Dim ConnString As String = SingletonDb.GetInstance.GetConnectionString
        SQLconn.ConnectionString = ConnString
        SQLconn.Open()


        Dim path As String = Server.MapPath("~/DBF/")
        'Label51.Text = path
        Dim fileOK As Boolean = False
        If FileUpload2.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.
                    GetExtension(FileUpload2.FileName).ToLower()
            Dim allowedExtensions As String() =
                    {".XLSX", ".xlsx"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next
            If fileOK Then
                Try

                    FileUpload2.PostedFile.SaveAs(path &
                             FileUpload2.FileName)

                    Dim stream As FileStream = File.Open(path & FileUpload2.FileName, FileMode.Open, FileAccess.Read)

                    '1. Reading from a binary Excel file ('97-2003 format; *.xls)
                    'Dim excelReader As IExcelDataReader = ExcelReaderFactory.CreateBinaryReader(stream)
                    '...
                    '2. Reading from a OpenXml Excel file (2007 format; *.xlsx)
                    Dim excelReader2 As IExcelDataReader = ExcelReaderFactory.CreateOpenXmlReader(stream)
                    '...
                    '3. DataSet - The result of each spreadsheet will be created in the result.Tables
                    Dim result As DataSet = excelReader2.AsDataSet()

                    'excelReader2.NextResult()

                    '4. DataSet - Create column names from first row
                    'excelReader2.IsFirstRowAsColumnNames = True
                    'Dim result As DataSet = excelReader2.AsDataSet()

                    '5. Data Reader methods
                    While excelReader2.Read()
                        If excelReader2.Depth = 0 Then

                        Else

                            If excelReader2.IsDBNull(3) = True Then
                                Session("RACK3") = ""
                            Else
                                Session("RACK3") = excelReader2.GetValue(3).ToString()
                            End If
                            If excelReader2.IsDBNull(4) = True Then
                                Session("RACK4") = ""
                            Else
                                Session("RACK4") = excelReader2.GetValue(4).ToString()
                            End If
                            If excelReader2.IsDBNull(5) = True Then
                                Session("RACK5") = ""
                            Else
                                Session("RACK5") = excelReader2.GetValue(5).ToString()
                            End If



                            Cmd.Connection = Cn
                            Cmd.CommandText = "insert into hotel_datos_rack values  ('" & Session("NewHotelID") & "','" & excelReader2.GetValue(0).ToString & "','" & excelReader2.GetValue(1).ToString & "','" & excelReader2.GetValue(2).ToString & "','" & Session("RACK3") & "','" & Session("RACK4") & "','" & Session("RACK5") & "','" & excelReader2.GetValue(6).ToString & "','" & excelReader2.GetValue(7).ToString & "') "              ''" & excelReader2.GetDouble(7).ToString & "','" & excelReader2.GetDouble(8).ToString & "')"
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
                        End If


                    End While

                    excelReader2.Close()

                Catch ex As Exception
                    'MsgBox(ex.ToString)
                End Try
            End If
        End If

        Response.Redirect(Request.Url.AbsoluteUri)






        'Dim SQLconn As New SqlConnection()
        'Dim ConnString As String = SingletonDb.GetInstance.GetConnectionString
        'SQLconn.ConnectionString = ConnString
        'SQLconn.Open()


        'Dim path As String = Server.MapPath("~/DBF/")

        'Dim fileOK As Boolean = False
        'If FileUpload2.HasFile Then
        '    Dim fileExtension As String
        '    fileExtension = System.IO.Path.
        '            GetExtension(FileUpload2.FileName).ToLower()
        '    Dim allowedExtensions As String() =
        '            {".XLSX", ".xlsx"}
        '    For i As Integer = 0 To allowedExtensions.Length - 1
        '        If fileExtension = allowedExtensions(i) Then
        '            fileOK = True
        '        End If
        '    Next
        '    If fileOK Then
        '        Try

        '            FileUpload2.PostedFile.SaveAs(path &
        '                     FileUpload2.FileName)






        '            'Dim Excel As String = Server.MapPath("importsfiles\" & savedFiles)


        '            'Dim ExcelConnection As New System.Data.OleDb.OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Excel & ";Extended Properties=Excel 8.0;")

        '            Dim ExcelConnection As New System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & path & FileUpload2.FileName & ";Extended Properties=""Excel 12.0 Xml;HDR=Yes""")
        '            ExcelConnection.Open()

        '            Dim expr As String = "SELECT " & Session("NewHotelID") & ",* FROM [Hoja1$]"

        '            Dim objCmdSelect As OleDbCommand = New OleDbCommand(expr, ExcelConnection)
        '            Dim objDR As OleDbDataReader


        '            Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(SQLconn)
        '                bulkCopy.DestinationTableName = "dbo.HOTEL_DATOS_RACK_EXCEL"

        '                Try
        '                    objDR = objCmdSelect.ExecuteReader
        '                    bulkCopy.WriteToServer(objDR)
        '                    objDR.Close()
        '                    SQLconn.Close()



        '                    Cmd.Connection = Cn
        '                    Cmd.CommandText = "insert into HOTEL_DATOS_RACK select * from HOTEL_DATOS_RACK_EXCEL WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "' AND CODHAB NOT IN (SELECT CODHAB FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'  )
        '                                       DELETE FROM HOTEL_DATOS_RACK_EXCEL WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'"


        '                    'UPDATE HOTEL_DATOS_RACK SET TIPO = '" & Session("TIPO_DESTINO") & "'  WHERE TIPO = '" & Session("TIPO_ORIGEN") & "' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
        '                    Cmd.CommandTimeout = 3000
        '                    Try
        '                        Cn.Open()
        '                        Cmd.ExecuteNonQuery()
        '                        Cn.Close()
        '                    Catch ex As Exception
        '                        Response.Redirect("/Login3")
        '                        If ex.Message <> "" Then
        '                            Cn.Close()
        '                        End If
        '                    End Try
        '                    Cn.Close()


        '                Catch ex As Exception
        '                    Cmd.Connection = Cn
        '                    Cmd.CommandText = "insert into test select '" & ex.ToString & "'"


        '                    'UPDATE HOTEL_DATOS_RACK SET TIPO = '" & Session("TIPO_DESTINO") & "'  WHERE TIPO = '" & Session("TIPO_ORIGEN") & "' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
        '                    Cmd.CommandTimeout = 3000

        '                    Cn.Open()
        '                    Cmd.ExecuteNonQuery()
        '                    Cn.Close()
        '                End Try
        '            End Using


        '        Catch ex As Exception
        '            ' MsgBox(ex.ToString)




        '            Cmd.Connection = Cn
        '            Cmd.CommandText = "insert into test select '" & ex.ToString & "'"


        '            'UPDATE HOTEL_DATOS_RACK SET TIPO = '" & Session("TIPO_DESTINO") & "'  WHERE TIPO = '" & Session("TIPO_ORIGEN") & "' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
        '            Cmd.CommandTimeout = 3000

        '            Cn.Open()
        '            Cmd.ExecuteNonQuery()
        '            Cn.Close()

        '        End Try
        '    End If
        'End If

        'Response.Redirect(Request.Url.AbsoluteUri)
    End Sub

    Protected Sub Button15_Click(sender As Object, e As EventArgs) Handles Button15.Click
        Response.Redirect("/DBF/RACK_AQUILES.xlsx")
    End Sub
End Class