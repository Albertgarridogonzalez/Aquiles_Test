Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader



Public Class NewHotel_Regimen

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



        SqlTest.SelectCommand = "SELECT ID,FK_CODREGIMEN, FK_CODIGOCP, FIJO, PORC,ORDEN,EntradaPorDefecto  FROM [HOTEL_DATOS_REGIMEN] WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "'ORDER BY FK_CODREGIMEN, ORDEN ASC "
        SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_REGIMEN SET FK_CODREGIMEN= @FK_CODREGIMEN, FK_CODIGOCP = @FK_CODIGOCP , FIJO =@FIJO ,PORC = @PORC, ORDEN = @ORDEN ,EntradaPorDefecto = @EntradaPorDefecto     WHERE [ID] = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_REGIMEN WHERE FK_CODREGIMEN = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_REGIMEN VALUES ( '" & Session("NewHotelID") & "', '' , '',0,0,1,0)           "
        SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_REGIMEN WHERE ID = 0"


        'Dt.
        'DropDownList1.DataSource = Dt
        'DropDownList1.DataTextField = "Name";
        'DropDownList1.DataValueField = "ID";
        'DropDownList1.DataBind(); `

    End Sub


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
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_REGIMEN WHERE ID = " & Id & "")
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
    'Protected Sub OnRowEditing(sender As Object, e As GridViewEditEventArgs)
    '    GridView1.EditIndex = e.NewEditIndex
    '    'Me.BindGrid()
    '    GridView1.Rows(e.NewEditIndex).Attributes.Remove("ondblclick")
    '    'GridView1.Columns(2).Visible = True
    '    GridView1.UpdateRow(GridView1.EditIndex, True)
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
End Class