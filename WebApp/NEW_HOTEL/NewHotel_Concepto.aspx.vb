Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader
Imports System.Data.OleDb

Public Class NEWHOTEL_CONCEPTO


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


            HABITACION.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            EXTHABITACION.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            VARIOS.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            REST.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            DEP.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            'TM_REGIMEN.ConnectionString = SingletonDb.GetInstance.GetConnectionString
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


        HABITACION.SelectCommand = "SELECT *  FROM HOTEL_DATOS_CONCEPTO WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 1 ORDER BY CONCEPTO "
        HABITACION.UpdateCommand = "UPDATE HOTEL_DATOS_CONCEPTO SET  CONCEPTO = @CONCEPTO , DESCRIPCION =@DESCRIPCION ,IVA = @IVA  ,tipo =@tipo ,cuenta_contable = @cuenta_contable WHERE [ID] = @ID 
                                    IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_concepto WHERE CONCEPTO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 1)INSERT INTO 
                                    HOTEL_DATOS_concepto VALUES ( '" & Session("NewHotelID") & "','','',1,0,0,0,0,0,0)"
        HABITACION.DeleteCommand = "DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = 0"

        EXTHABITACION.SelectCommand = "SELECT *  FROM HOTEL_DATOS_CONCEPTO WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 2 ORDER BY CONCEPTO"
        EXTHABITACION.UpdateCommand = "UPDATE HOTEL_DATOS_CONCEPTO SET  CONCEPTO = @CONCEPTO , DESCRIPCION =@DESCRIPCION ,IVA = @IVA ,tipo =@tipo ,cuenta_contable = @cuenta_contable  WHERE [ID] = @ID  
                                      IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_concepto WHERE CONCEPTO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'AND TIPO = 2 )INSERT INTO 
                                     HOTEL_DATOS_concepto VALUES ( '" & Session("NewHotelID") & "','','',2,0,0,0,0,0,0)"
        EXTHABITACION.DeleteCommand = "DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = 0"

        VARIOS.SelectCommand = "SELECT *  FROM HOTEL_DATOS_CONCEPTO WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 3 ORDER BY CONCEPTO"
        VARIOS.UpdateCommand = "UPDATE HOTEL_DATOS_CONCEPTO SET  CONCEPTO = @CONCEPTO , DESCRIPCION =@DESCRIPCION ,IVA = @IVA ,tipo =@tipo ,cuenta_contable = @cuenta_contable  WHERE [ID] = @ID 
                                IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_concepto WHERE CONCEPTO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 3)INSERT INTO 
                                     HOTEL_DATOS_concepto VALUES ( '" & Session("NewHotelID") & "','','',3,0,0,0,0,0,0)"
        VARIOS.DeleteCommand = "DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = 0"


        REST.SelectCommand = "SELECT *  FROM HOTEL_DATOS_CONCEPTO WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 4 ORDER BY CONCEPTO"
        REST.UpdateCommand = "UPDATE HOTEL_DATOS_CONCEPTO SET  CONCEPTO = @CONCEPTO , DESCRIPCION =@DESCRIPCION ,IVA = @IVA ,tipo =@tipo ,cuenta_contable = @cuenta_contable  WHERE [ID] = @ID  
                              IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_concepto WHERE CONCEPTO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 4)INSERT INTO 
                                     HOTEL_DATOS_concepto VALUES ( '" & Session("NewHotelID") & "','','',4,0,0,0,0,0,0)"
        REST.DeleteCommand = "DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = 0"


        DEP.SelectCommand = "SELECT *  FROM HOTEL_DATOS_CONCEPTO WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 5 ORDER BY CONCEPTO"
        DEP.UpdateCommand = "UPDATE HOTEL_DATOS_CONCEPTO SET  CONCEPTO = @CONCEPTO , DESCRIPCION =@DESCRIPCION ,IVA = @IVA  , ID_COBRO = @ID_COBRO ,tipo =@tipo ,cuenta_contable = @cuenta_contable WHERE [ID] = @ID  
                              IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_concepto WHERE CONCEPTO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND TIPO = 5)INSERT INTO 
                                     HOTEL_DATOS_concepto VALUES ( '" & Session("NewHotelID") & "','','',5,0,0,0,0,0,0)"
        DEP.DeleteCommand = "DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = 0"


        'TM_REGIMEN.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'REGIMEN' ORDER BY CODIGO_PMS "
        'TM_REGIMEN.UpdateCommand = "UPDATE HOTEL_DATOS_CONCEPTO SET  CONCEPTO = @CONCEPTO , DESCRIPCION =@DESCRIPCION , PARAMETRO1 = @PARAMETRO1, PARAMETRO2 = @PARAMETRO2, PARAMETRO3 = @PARAMETRO3    WHERE [ID] = @ID "



        '       [ID] [Int] IDENTITY(1, 1) Not NULL,
        '[FK_ID_HOTEL] [Int] Not NULL,
        '   [CONCEPTO] [varchar](15) NULL,
        '   [DESCRIPCION] [varchar](50) NULL,
        '   [TIPO] Int NULL,
        '   PARAMETRO1 BIT NULL,
        '   PARAMETRO2 BIT NULL,
        '   PARAMETRO3 BIT NULL,

    End Sub

    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Protected Sub OnRowDeleting2(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView2.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Protected Sub OnRowDeleting3(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView3.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Protected Sub OnRowDeleting4(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView4.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Protected Sub OnRowDeleting5(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView5.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_CONCEPTO WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub



    Public Sub CARGADBF()

        ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        'If IsPostBack Then

        'My.Computer.FileSystem.CreateDirectory(My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/")

        'Dim path As String = My.Computer.FileSystem.SpecialDirectories.MyDocuments + "/AQUILES_DBF/"
        Dim path As String = Server.MapPath("~/DBF/")
        'Label51.Text = path
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
                        Cmd.CommandText = "insert into hotel_datos_CONCEPTO values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(0).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "'
                           
                        ,CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(29).Name.ToString) & "' = 'H' and '" & dbfreader.GetString(dbfreader.Table.Columns.Item(29).Name.ToString) & "' <>''  then 1
                              WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(29).Name.ToString) & "' = 'P' then 4
                              WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(29).Name.ToString) & "' = 'H' and '" & dbfreader.GetString(dbfreader.Table.Columns.Item(29).Name.ToString) & "' =''  then 2
                              WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(29).Name.ToString) & "' = '' then 3
                              END
                              ,0,0,0

                        ,'" & dbfreader.GetValue(dbfreader.Table.Columns.Item(52).Name.ToString) & "',0
                        ,'" & dbfreader.GetString(dbfreader.Table.Columns.Item(36).Name.ToString) & "')"
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
                    'Label50.Text = "DATOS CARGADOS CORRECTAMENTE"

                Catch ex As Exception
                    'Label50.Text = "ERROR AL CARGAR" & ex.Message

                End Try

            Else
                'Label50.Text = "ERROR TIPO FICHERO"
            End If

        End If
        'End If
        'Dim pathAPP As String = Server.MapPath("~/DBF/" & FileUpload1.FileName)

        'File.Delete(pathAPP)


        Response.Redirect(Request.Url.AbsoluteUri)



    End Sub

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button11.Click
        CARGADBF()

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
                            Cmd.CommandText = "insert into HOTEL_DATOS_CONCEPTO values  ('" & Session("NewHotelID") & "','" & excelReader2.GetValue(0).ToString & "','" & excelReader2.GetValue(1).ToString & "',
                            '" & excelReader2.GetValue(2).ToString & "','" & excelReader2.GetValue(3).ToString & "','" & excelReader2.GetValue(4).ToString & "','0','" & excelReader2.GetValue(5).ToString & "',
                            '" & excelReader2.GetValue(6).ToString & "','" & excelReader2.GetValue(7).ToString & "')"
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
                    MsgBox(ex.ToString)
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
        '                    bulkCopy.DestinationTableName = "dbo.HOTEL_DATOS_CONCEPTO_EXCEL"

        '                    Try
        '                        objDR = objCmdSelect.ExecuteReader
        '                        bulkCopy.WriteToServer(objDR)
        '                        objDR.Close()
        '                        SQLconn.Close()



        '                        Cmd.Connection = Cn
        '                        Cmd.CommandText = "insert into HOTEL_DATOS_CONCEPTO select * from HOTEL_DATOS_CONCEPTO_EXCEL WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "' AND CONCEPTO NOT IN (SELECT CONCEPTO FROM HOTEL_DATOS_CONCEPTO WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'  )
        '                                           DELETE FROM HOTEL_DATOS_CONCEPTO_EXCEL WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "'"


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


        'Public Sub CARGADBF()

        '    ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        '    'If IsPostBack Then
        '    Dim path As String = Server.MapPath("~/DBF/")
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
        '                    Cmd.CommandText = "insert into hotel_datos_CONCEPTO values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(3).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(4).Name.ToString) & "')"
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

        'Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
        '    CARGADBF()
    End Sub

    Protected Sub Button15_Click(sender As Object, e As EventArgs) Handles Button15.Click
        Response.Redirect("/DBF/CONCEPTO_AQUILES.xlsx")
    End Sub
End Class