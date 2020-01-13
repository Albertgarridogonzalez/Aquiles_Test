Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports NDbfReader


Public Class NewHotel_segmentoorigen

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

        Label52.Text = "ORIGEN"
        Label53.Text = "SEGMENTO"

        If Session("NewHotelID") = "" Then
            Label30.Text = "CREANDO HOTEL NUEVO"
        Else
            Label30.Text = "MODIFICANDO HOTEL : " + Session("NEW_NOMBRE")

        End If

        Try
            If Session("Tesipro") = 1 Then
                SingletonDb.GetInstance().ChangeConnectionString(1)

            Else
                Session("Tesipro") = 0
                SingletonDb.GetInstance().ChangeConnectionString(0)
            End If


            SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            SqlDataSource1.ConnectionString = SingletonDb.GetInstance.GetConnectionString

            'GridView1 = CType(sender, GridView)
            'Session("ID_SEGMENTO") = (GridView1.Rows(GridView1.SelectedIndex).Cells(1).Text)


            SqlTest.SelectCommand = "SELECT * FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ESORIGEN = 1  ORDER BY [CODIGO] ASC "
            SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_SEGMENTOORIGEN SET  CODIGO = @CODIGO,DESCRIPCION = @DESCRIPCION , ESORIGEN = @ESORIGEN , CASA = @CASA WHERE ID = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE CODIGO = '' AND ESORIGEN =1 AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_SEGMENTOORIGEN VALUES ( '" & Session("NewHotelID") & "','','',1,0)"

            SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE ID = 0"


            SqlDataSource1.SelectCommand = "SELECT * FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ESORIGEN = 0 ORDER BY [CODIGO] ASC "
            SqlDataSource1.UpdateCommand = "UPDATE HOTEL_DATOS_SEGMENTOORIGEN SET  CODIGO = @CODIGO,DESCRIPCION = @DESCRIPCION , ESORIGEN = @ESORIGEN , CASA = @CASA WHERE ID = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE CODIGO = '' AND ESORIGEN =0 AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_SEGMENTOORIGEN VALUES ( '" & Session("NewHotelID") & "','','',0,0)"

            SqlDataSource1.DeleteCommand = "DELETE FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE ID = 0"






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

    End Sub

    'Protected Sub GridView1_ROWDELETING(sender As Object, e As EventArgs) Handles GridView1.RowDeleting
    '    GridView1 = CType(sender, GridView)
    '    Session("ID_SEGMENTO") = (GridView1.Rows(GridView1.SelectedIndex).Cells(0).Text)

    'End Sub

    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE ID = " & Id & "")
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
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Public Sub CARGADBF()

        'Cmd.CommandText = "insert into HOTEL_DATOS_SEGMENTOORIGEN values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("CODIGO") & "','" & dbfreader.GetString("DESCRIPCIO") & "','" & dbfreader.GetString("ESORIGEN") & "')"



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
                    Try
                        FileUpload1.PostedFile.SaveAs(path &
                                  FileUpload1.FileName)
                    Catch ex As Exception
                        Label51.Text = ex.Message
                    End Try



                    Dim ruta As Stream = File.Open(path & FileUpload1.FileName, FileMode.Open, FileAccess.Read)
                    '   Dim ruta As Stream = File.Open("~/DBF/TIPOHAB.DBF", FileMode.Open, FileAccess.Read)
                    Dim dbftable As Table = NDbfReader.Table.Open(ruta)
                    Dim dbfreader As Reader = dbftable.OpenReader(Encoding.ASCII)


                    'MsgBox(FileUpload1.PostedFile.InputStream.ToString)

                    While (dbfreader.Read())

                        'MsgBox(dbfreader.Table.Columns.Item(0).Name.ToString)
                        'MsgBox(dbfreader.Table.Columns.Item(1).Name.ToString)
                        'MsgBox(dbfreader.Table.Columns.Item(2).Name.ToString)
                        'MsgBox(dbfreader.GetString(dbfreader.Table.Columns.Item(0).Name.ToString))
                        'MsgBox(dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString))
                        'MsgBox(dbfreader.GetValue(dbfreader.Table.Columns.Item(2).Name.ToString))

                        'MsgBox(dbfreader.Table.Columns.Count.ToString)
                        Cmd.Connection = Cn
                        'MsgBox("insert into HOTEL_DATOS_SEGMENTOORIGEN values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(0).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "')")
                        Cmd.CommandText = "insert into HOTEL_DATOS_SEGMENTOORIGEN values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(0).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetValue(dbfreader.Table.Columns.Item(2).Name.ToString) & "','" & dbfreader.GetValue(dbfreader.Table.Columns.Item(3).Name.ToString) & "')"


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



End Class