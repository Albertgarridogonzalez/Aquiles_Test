Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader
Imports System.Data.OleDb



Public Class NewHotel_Caracteristica

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

        SqlTest.SelectCommand = "SELECT * FROM [HOTEL_DATOS_CARACT_HAB] WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND CODHAB <> 0 ORDER BY CODHAB ASC "
        SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_CARACT_HAB SET CARACT1 = @CARACT1 ,CARACT2 = @CARACT2,CARACT3 = @CARACT3,CARACT4 = @CARACT4,CARACT5 = @CARACT5,CARACT6 = @CARACT6
                                ,CARACT7 = @CARACT7,CARACT8 = @CARACT8,CARACT9 = @CARACT9,CARACT10 = @CARACT10,CARACT11 = @CARACT11,CARACT12 = @CARACT12,CARACT13= @CARACT13,CARACT14 = @CARACT14
                                ,CARACT15 = @CARACT15  WHERE [ID] = @ID "
        SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_RACK WHERE ID = 0"


        'Dt.
        'DropDownList1.DataSource = Dt
        'DropDownList1.DataTextField = "Name";
        'DropDownList1.DataValueField = "ID";
        'DropDownList1.DataBind(); `

        'Dim sql_query2 As New SqlCommand
        'Dim ErrorHAB As String
        'Dim error1 As Boolean = True
        'sql_query2.Connection = Cn
        'Cn.Open()
        'sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO NOT IN (SELECT CODIGO FROM HOTEL_DATOS_TIPOHAB WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "') AND HAB <>''"
        'sql_result = sql_query2.ExecuteReader
        'Session("id_error_hotel3") = 0
        'If sql_result.HasRows Then
        '    sql_result.Read()
        '    ErrorHAB = sql_result("HAB")


        '    Session("ErrorHAB") = ErrorHAB

        '    If ErrorHAB <> "" Then
        '        ALERT.Visible = True
        '    Else
        '        ALERT.Visible = False
        '    End If


        'End If
        'Cn.Close()


        If Not IsPostBack Then

            Dim sql_query2 As New SqlCommand


            'sql_connection2.ConnectionString = Conexion_Tesipro()
            sql_query2.Connection = Cn
            Cn.Open()

            sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS_CARACT WHERE fk_id_HOTEL = '" & Session("NewHotelID") & "'"

            'sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS HD JOIN HOTELES H ON H.ID = HD.FK_ID_HOTEL   WHERE fk_id_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query2.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()

                Session("CARACT1") = isnull(sql_result("CARACT1"))
                Session("CARACT2") = isnull(sql_result("CARACT2"))
                Session("CARACT3") = isnull(sql_result("CARACT3"))
                Session("CARACT4") = isnull(sql_result("CARACT4"))
                Session("CARACT5") = isnull(sql_result("CARACT5"))
                Session("CARACT6") = isnull(sql_result("CARACT6"))
                Session("CARACT7") = isnull(sql_result("CARACT7"))
                Session("CARACT8") = isnull(sql_result("CARACT8"))
                Session("CARACT9") = isnull(sql_result("CARACT9"))
                Session("CARACT10") = isnull(sql_result("CARACT10"))
                Session("CARACT11") = isnull(sql_result("CARACT11"))
                Session("CARACT12") = isnull(sql_result("CARACT12"))
                Session("CARACT13") = isnull(sql_result("CARACT13"))
                Session("CARACT14") = isnull(sql_result("CARACT14"))
                Session("CARACT15") = isnull(sql_result("CARACT15"))

                'isnull(Session("NEW_DIRECCION"))
                TextBox1.Text = Session("CARACT1")
                TextBox2.Text = Session("CARACT2")
                TextBox3.Text = Session("CARACT3")
                TextBox4.Text = Session("CARACT4")
                TextBox5.Text = Session("CARACT5")
                TextBox6.Text = Session("CARACT6")
                TextBox7.Text = Session("CARACT7")
                TextBox8.Text = Session("CARACT8")
                TextBox9.Text = Session("CARACT9")
                TextBox10.Text = Session("CARACT10")
                TextBox11.Text = Session("CARACT11")
                TextBox12.Text = Session("CARACT12")
                TextBox13.Text = Session("CARACT13")
                TextBox14.Text = Session("CARACT14")
                TextBox15.Text = Session("CARACT15")


            End If

            sql_result.Close()
            Cn.Close()

        End If

    End Sub
    Public Function isnull(dato)

        If dato Is DBNull.Value Then
            dato = ""
        Else
            dato = dato
        End If
        Return dato


    End Function

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click


        Session("CARACT1") = TextBox1.Text
        Session("CARACT2") = TextBox2.Text
        Session("CARACT3") = TextBox3.Text
        Session("CARACT4") = TextBox4.Text
        Session("CARACT5") = TextBox5.Text
        Session("CARACT6") = TextBox6.Text
        Session("CARACT7") = TextBox7.Text
        Session("CARACT8") = TextBox8.Text
        Session("CARACT9") = TextBox9.Text
        Session("CARACT10") = TextBox10.Text
        Session("CARACT11") = TextBox11.Text
        Session("CARACT12") = TextBox12.Text
        Session("CARACT13") = TextBox13.Text
        Session("CARACT14") = TextBox14.Text
        Session("CARACT15") = TextBox15.Text


        Cmd.Connection = Cn

        Cmd.CommandText = "SET LANGUAGE SPANISH UPDATE  HOTEL_DATOS_CARACT
             SET CARACT1 ='" & Session("CARACT1") & "',
               CARACT2 =             '" & Session("CARACT2") & "',
               CARACT3 =             '" & Session("CARACT3") & "',
               CARACT4 =             '" & Session("CARACT4") & "',
               CARACT5 =             '" & Session("CARACT5") & "',
               CARACT6 =             '" & Session("CARACT6") & "',
               CARACT7 =             '" & Session("CARACT7") & "',
               CARACT8 =             '" & Session("CARACT8") & "',
               CARACT9 =             '" & Session("CARACT9") & "',
               CARACT10 =             '" & Session("CARACT10") & "',
               CARACT11 =             '" & Session("CARACT11") & "',
               CARACT12 =             '" & Session("CARACT12") & "',
               CARACT13 =             '" & Session("CARACT13") & "',
               CARACT14 =             '" & Session("CARACT14") & "',
               CARACT15 =             '" & Session("CARACT15") & "'
               where fk_id_hotel = '" & Session("NewHotelID") & "'"

        Cmd.CommandTimeout = 3000
        Try
            Cn.Open()
            Cmd.ExecuteNonQuery()
            Cn.Close()

        Catch ex As Exception
            Cn.Close()
            If ex.Message <> "" Then
            End If
        End Try





    End Sub

    'Private Function GetData(ByVal query As String) As DataSet

    '    'Dim SqlCommand As New SqlCommand

    '    ' Dim conString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    '    'Dim cmd As New SqlCommand
    '    'cmd.CommandText = (query)
    '    'Dim con As SqlConnection = Cn
    '    'Dim sda As SqlDataAdapter
    '    'cmd.Connection = con
    '    'sda.SelectCommand = cmd
    '    'Dim ds As DataSet = New DataSet()
    '    'sda.Fill(ds)
    '    'Return ds


    '    With cmd
    '        .CommandType = CommandType.Text
    '        .CommandText = query
    '        '"SELECT DISTINCT (TIPO) FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        .Connection = Cn
    '    End With
    '    Da.SelectCommand = cmd
    '    Dim ds As New DataSet
    '    Dt = New DataTable
    '    Da.Fill(ds)
    '    Return ds
    '    'With DropDownList1
    '    '    .DataSource = Dt
    '    '    DropDownList1.DataTextField = "TIPO"
    '    '    DropDownList1.DataValueField = "TIPO"
    '    '    DropDownList1.DataBind()
    '    'End With

    'End Function

    'Protected Sub OnRowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)

    '    If (e.Row.RowType = DataControlRowType.DataRow) Then
    '        'Find the DropDownList in the Row
    '        Dim ddlCountries As DropDownList = CType(e.Row.FindControl("ddlcodigo"), DropDownList)
    '        ddlCountries.DataSource = GetData("SELECT DISTINCT codigo from HOTEL_DATOS_TIPOHAB")
    '        ddlCountries.DataTextField = "codigo"
    '        ddlCountries.DataValueField = "codigo"
    '        ddlCountries.DataBind()
    '        'Add Default Item in the DropDownList
    '        ddlCountries.Items.Insert(0, New ListItem("--Please Select--"))
    '        'Select the Country of Customer in DropDownList
    '        Dim country As String = CType(e.Row.FindControl("lblcodigo"), Label).Text
    '        ddlCountries.Items.FindByValue(country).Selected = True
    '    End If

    'End Sub



    'Private Sub DropDownList1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
    '    DropDownList2.Items.Clear()
    '    Dim a As Integer
    '    a = DropDownList1.SelectedIndex
    '    If a = 0 Then
    '        DropDownList2.Items.Add("selected a")
    '    Else
    '        DropDownList2.Items.Add("selected b")

    '    End If
    'End Sub



    'Public Sub CARGADBF()

    '    ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



    '    'If IsPostBack Then

    '    'My.Computer.FileSystem.CreateDirectory(My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/")

    '    'Dim path As String = My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/"
    '    Dim path As String = Server.MapPath("~/DBF/")
    '    Label51.Text = path
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

    'Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
    '    CARGADBF()

    'End Sub

    'Protected Sub Button21_Click(sender As Object, e As EventArgs) Handles Button21.Click





    '    With Cmd
    '        .CommandType = CommandType.Text
    '        .CommandText = "SELECT DISTINCT (TIPO) FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        .Connection = Cn
    '    End With
    '    Da.SelectCommand = Cmd
    '    Dt = New DataTable
    '    Da.Fill(Dt)
    '    With DropDownList1
    '        .DataSource = Dt
    '        DropDownList1.DataTextField = "TIPO"
    '        DropDownList1.DataValueField = "TIPO"
    '        DropDownList1.DataBind()
    '    End With

    '    With Cmd
    '        .CommandType = CommandType.Text
    '        .CommandText = "SELECT DISTINCT (CODIGO) FROM HOTEL_DATOS_TIPOHAB WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '        .Connection = Cn
    '    End With
    '    Da.SelectCommand = Cmd
    '    Dt = New DataTable
    '    Da.Fill(Dt)
    '    With DropDownList2
    '        .DataSource = Dt
    '        DropDownList2.DataTextField = "CODIGO"
    '        DropDownList2.DataValueField = "CODIGO"
    '        DropDownList2.DataBind()
    '    End With

    '    Button21.Visible = False
    '    DropDownList1.Visible = True
    '    DropDownList2.Visible = True
    '    Button22.Visible = True

    'End Sub

    'Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

    'End Sub

    'Protected Sub Button22_Click(sender As Object, e As EventArgs) Handles Button22.Click
    '    Session("TIPO_DESTINO") = DropDownList2.SelectedValue
    '    Session("TIPO_ORIGEN") = DropDownList1.SelectedValue.ToString
    '    Cmd.Connection = Cn
    '    Cmd.CommandText = "UPDATE HOTEL_DATOS_RACK SET TIPO = '" & Session("TIPO_DESTINO") & "'  WHERE TIPO = '" & Session("TIPO_ORIGEN") & "' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
    '    Cmd.CommandTimeout = 3000
    '    Try
    '        Cn.Open()
    '        Cmd.ExecuteNonQuery()
    '        Cn.Close()
    '    Catch ex As Exception
    '        If ex.Message <> "" Then
    '            Cn.Close()
    '        End If
    '    End Try
    '    Cn.Close()

    '    Response.Redirect("/NEW_HOTEL/NewHotel_Rack")
    'End Sub
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

    'Protected Sub OnRowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        e.Row.Attributes("ondblclick") = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Edit$" & e.Row.RowIndex)
    '        e.Row.Attributes("style") = "cursor:pointer"
    '    End If

    'End Sub

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

                            Cmd.Connection = Cn
                            Cmd.CommandText = "
                            IF EXISTS (SELECT CODHAB FROM HOTEL_DATOS_CARACT_HAB WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND CODHAB = '" & excelReader2.GetDouble(0).ToString & "')
                             DELETE FROM HOTEL_DATOS_CARACT_HAB WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND CODHAB = '" & excelReader2.GetDouble(0).ToString & "'
                             insert into HOTEL_DATOS_CARACT_HAB values  ('" & Session("NewHotelID") & "','" & excelReader2.GetDouble(0).ToString & "','" & excelReader2.GetValue(1).ToString & "',
                            '" & excelReader2.GetDouble(2).ToString & "','" & excelReader2.GetDouble(3).ToString & "','" & excelReader2.GetDouble(4).ToString & "','" & excelReader2.GetDouble(5).ToString & "',
                            '" & excelReader2.GetDouble(6).ToString & "','" & excelReader2.GetDouble(7).ToString & "','" & excelReader2.GetDouble(8).ToString & "','" & excelReader2.GetDouble(9).ToString & "',
                            '" & excelReader2.GetDouble(10).ToString & "','" & excelReader2.GetDouble(11).ToString & "','" & excelReader2.GetDouble(12).ToString & "','" & excelReader2.GetDouble(13).ToString & "',
                            '" & excelReader2.GetDouble(14).ToString & "','" & excelReader2.GetDouble(15).ToString & "','" & excelReader2.GetDouble(16).ToString & "'  )"
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
































        '    Dim SQLconn As New SqlConnection()
        '    Dim ConnString As String = SingletonDb.GetInstance.GetConnectionString
        '    SQLconn.ConnectionString = ConnString
        '    SQLconn.Open()


        '    Dim path As String = Server.MapPath("~/DBF/")

        '    Dim fileOK As Boolean = False
        '    If FileUpload2.HasFile Then
        '        Dim fileExtension As String
        '        fileExtension = System.IO.Path.
        '                GetExtension(FileUpload2.FileName).ToLower()
        '        Dim allowedExtensions As String() =
        '                {".XLSX", ".xlsx"}
        '        For i As Integer = 0 To allowedExtensions.Length - 1
        '            If fileExtension = allowedExtensions(i) Then
        '                fileOK = True
        '            End If
        '        Next
        '        If fileOK Then
        '            Try

        '                FileUpload2.PostedFile.SaveAs(path &
        '                         FileUpload2.FileName)

        '                Dim ExcelConnection As New System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & path & FileUpload2.FileName & ";Extended Properties=""Excel 12.0 Xml;HDR=Yes""")
        '                ExcelConnection.Open()

        '                Dim expr As String = "SELECT " & Session("NewHotelID") & ",* FROM [Hoja1$]"

        '                Dim objCmdSelect As OleDbCommand = New OleDbCommand(expr, ExcelConnection)
        '                Dim objDR As OleDbDataReader


        '                Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(SQLconn)
        '                    bulkCopy.DestinationTableName = "dbo.HOTEL_DATOS_CARACT_HAB_EXCEL"

        '                    Try
        '                        objDR = objCmdSelect.ExecuteReader
        '                        bulkCopy.WriteToServer(objDR)
        '                        objDR.Close()
        '                        SQLconn.Close()



        '                        Cmd.Connection = Cn
        '                        Cmd.CommandText = "insert into HOTEL_DATOS_CARACT_HAB select * from HOTEL_DATOS_CARACT_HAB_EXCEL WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "' AND CODHAB NOT IN (SELECT CODHAB FROM HOTEL_DATOS_CARACT_HAB WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'  )
        '                                           DELETE FROM HOTEL_DATOS_CARACT_HAB_EXCEL WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'"


        '                        'UPDATE HOTEL_DATOS_RACK SET TIPO = '" & Session("TIPO_DESTINO") & "'  WHERE TIPO = '" & Session("TIPO_ORIGEN") & "' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
        '                        Cmd.CommandTimeout = 3000
        '                        Try
        '                            Cn.Open()
        '                            Cmd.ExecuteNonQuery()
        '                            Cn.Close()
        '                        Catch ex As Exception
        '                            If ex.Message <> "" Then
        '                                Cn.Close()
        '                            End If
        '                        End Try
        '                        Cn.Close()


        '                    Catch ex As Exception
        '                        MsgBox(ex.ToString)
        '                    End Try
        '                End Using


        '            Catch ex As Exception
        '                MsgBox(ex.ToString)
        '            End Try
        '        End If
        '    End If

        '    Response.Redirect(Request.Url.AbsoluteUri)
        'End Sub
        'Protected Sub OnUpdate(sender As Object, e As EventArgs)
        '    Dim row As GridViewRow = TryCast(TryCast(sender, LinkButton).NamingContainer, GridViewRow)
        '    Dim name As String = TryCast(row.Cells(0).Controls(0), TextBox).Text
        '    Dim country As String = TryCast(row.Cells(1).Controls(0), TextBox).Text
        '    Dim dt As DataTable = TryCast(ViewState("dt"), DataTable)
        '    dt.Rows(row.RowIndex)("Name") = name
        '    dt.Rows(row.RowIndex)("Country") = country
        '    ViewState("dt") = dt
        '    GridView1.EditIndex = -1
        '    'BindGrid()
        'End Sub

        'Protected Sub OnCancel(sender As Object, e As EventArgs)
        '    GridView1.EditIndex = -1
        '    'Me.BindGrid()
        'End Sub

        'Protected Sub Button23_Click(sender As Object, e As EventArgs) Handles Button23.Click
        '    Cmd.Connection = Cn
        '    Cmd.CommandText = "DELETE FROM HOTEL_DATOS_RACK WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'"
        '    Cmd.CommandTimeout = 3000
        '    Try
        '        Cn.Open()
        '        Cmd.ExecuteNonQuery()
        '        Cn.Close()
        '    Catch ex As Exception
        '        If ex.Message <> "" Then
        '            Cn.Close()
        '        End If
        '    End Try
        '    Cn.Close()
        'End Sub

        'Protected Sub DropDown_SelectedIndexChanged(sender As Object, e As EventArgs)
        '    'Session("caracteristica") = 
        '    ' Dim row As Strin
        '    MsgBox(sender.GetType.ToString())
        '    MsgBox(e.GetType.ToString())


        'End Sub

        'Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        '    If e.Row.RowType = DataControlRowType.DataRow Then
        '        Dim ddl11 As DropDownList = CType(e.Row.FindControl("ddl1"), DropDownList)
        '    End If
    End Sub

    Protected Sub Button15_Click(sender As Object, e As EventArgs) Handles Button15.Click
        Response.Redirect("/DBF/CARACT_AQUILES.xlsx")
    End Sub
End Class