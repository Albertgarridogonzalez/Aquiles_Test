Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader



Public Class NewHotel_Cobros

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

        SqlTest.SelectCommand = "SELECT * FROM HOTEL_DATOS_COBRO WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'ORDER BY CODIGO  "
        SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_COBRO SET CODIGO= @CODIGO,TIPO =@TIPO, DESCRIPCION = @DESCRIPCION , CUENTA_CONTABLE =@CUENTA_CONTABLE ,CREDITO = @CREDITO, ACTIVO_CREDITO = @ACTIVO_CREDITO ,ACTIVO_COBRO = @ACTIVO_COBRO     WHERE [ID] = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_COBRO WHERE  FK_ID_HOTEL = '" & Session("NewHotelID") & "' and codigo ='' )INSERT INTO 
            HOTEL_DATOS_COBRO VALUES ( '" & Session("NewHotelID") & "','','',0,0,0,0,'')           "
        SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_COBRO WHERE ID = 0"


        'Dt.
        'DropDownList1.DataSource = Dt
        'DropDownList1.DataTextField = "Name";
        'DropDownList1.DataValueField = "ID";
        'DropDownList1.DataBind(); `

    End Sub


    Public Sub CARGADBF()

        ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        'If IsPostBack Then
        Dim path As String = Server.MapPath("~/DBF/")
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
                        Cmd.CommandText = "insert into hotel_datos_COBRO values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(0).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "',CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "' = 'C' THEN 1 ELSE 0 END,'" & dbfreader.GetString(dbfreader.Table.Columns.Item(3).Name.ToString) & "',CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "' = 'C' THEN 1 ELSE 0 END,CASE WHEN '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(10).Name.ToString) & "' in ('FALSE','')  THEN 1 ELSE 0 END,CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "' = '' THEN 'O' ELSE '" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "' END )"
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


    Public Sub CARGADBFOLD()

        ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        'If IsPostBack Then
        Dim path As String = Server.MapPath("~/DBF/")
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
                        Cmd.CommandText = "insert into hotel_datos_COBRO values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(0).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "',CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "' = 'C' THEN 1 ELSE 0 END,'" & dbfreader.GetString(dbfreader.Table.Columns.Item(3).Name.ToString) & "',CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "' = 'C' THEN 1 ELSE 0 END, CASE WHEN '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(10).Name.ToString) & "' = 0 THEN 1 ELSE 0 END,CASE WHEN '" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "' = '' THEN 'O' ELSE '" & dbfreader.GetString(dbfreader.Table.Columns.Item(6).Name.ToString) & "' END )"
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





    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_COBRO WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub
End Class