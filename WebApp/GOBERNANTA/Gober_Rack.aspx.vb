Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader



Public Class Gober_Rack

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
        GridView1.RowStyle.Height = 20

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
            Response.Redirect("/GOBERNANTA/GOBERLogin")
        End If
        If Session("GOBER") = False Then
            If Session("ADMIN") = False Then
                Response.Redirect("/GOBERNANTA/GOBERLogin")
            End If

        End If



        Session("HotelID") = 1090

        SqlTest.SelectCommand = "SP_CHECK_RACK " & Session("HotelID")
        'SqlTest.SelectCommand = "

        'Select Case TR.DESCHAB, TR.TIPOHAB , 
        '       TR.SITUACION ,
        '       TR.ESTADO,
        '       TR.PLANTA,
        '       TR.ID_DRESERVA_ACTUAL,
        '       TR.PAX As PAX,  
        '       TR.ID_DRESERVA_ENTRADA,
        '       TR.ID_DRESERVA_SALIDA,
        '       TR.ID_DRESERVA_PREASIGNADA,
        '       TR.ID_BLOQUEO
        '  From dbo.FN_TABLA_RACK_HAB_HOTEL ('004', '17/02/2019', 1, 1,1,0) TR Left Join CRS_DRESERVA DR (NOLOCK)  
        '  On (DR.ID = TR.ID_DRESERVA_ACTUAL)  
        '  Order by TR.CODIGOHOT, TR.PLANTA, TR.ORDEN 

        '"
        SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_RACK SET CODHAB= @CODHAB, HAB = @HAB , TIPO =@TIPO ,MODULO1 = @MODULO1, MODULO2 = @MODULO2 ,PLANTA = @PLANTA     WHERE [ID] = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_RACK WHERE CODhab = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_RACK VALUES ( '" & Session("NewHotelID") & "','','','','','','','0','')           "
            SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_RACK WHERE ID = 0"


        'Dt.
        'DropDownList1.DataSource = Dt
        'DropDownList1.DataTextField = "Name";
        'DropDownList1.DataValueField = "ID";
        'DropDownList1.DataBind(); `



    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim urlimg As String

        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(3).Text = "L" Then
                ' e.Row.Cells(0).BackColor = Drawing.Color.LightGreen
                e.Row.BackColor = System.Drawing.Color.LightGreen
            Else
                e.Row.BackColor = System.Drawing.Color.Tomato
                'e.Row.Cells(0).BackColor = Drawing.Color.Tomato
            End If
        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(4).Text = "LI" Then
                ' e.Row.Cells(1).BackColor = Drawing.Color.LightGreen
                urlimg = ""
                Session("ImgUrl") = ""
                e.Row.Cells(7).Text = "LIBRE"
                'e.Row.Cells(7).BackColor = Drawing.Color.Black
            End If
            If e.Row.Cells(4).Text = "PA" Then
                e.Row.Cells(7).BackColor = Drawing.Color.Yellow
                e.Row.Cells(7).Text = "ASIGNADA"
            End If
            If e.Row.Cells(4).Text = "O" Then
                ' e.Row.Cells(1).BackColor = Drawing.Color.Tomato
                e.Row.Cells(7).Visible = True


            End If

            If e.Row.Cells(4).Text = "B" Then
                e.Row.Cells(7).BackColor = Drawing.Color.Orange
                e.Row.Cells(7).Text = "BLOQUEADA"


            End If

        End If
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







    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "Select" Then
            'Determine the RowIndex of the Row whose Button was clicked.
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

            'Reference the GridView Row.
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            'Dim Codhab As String = GridView1.SelectedRow.Cells.ToString
            ' Dim country As String = row.Cells(1).Text

            Session("DESCHAB") = row.Cells(1).Text
            Session("ESTADO") = row.Cells(3).Text
            Cmd.Connection = Cn
            Cmd.CommandText = "EXEC.SP_ESTADO_RACK '" & Session("HotelID") & "' , '" & Session("ESTADO") & "' ,'" & Session("DESCHAB") & "' "
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
            'UpdatePanel4.Update()
            Response.Redirect("/GOBERNANTA/GOBER_RACK")

        End If

        If e.CommandName = "block" Then
            'Determine the RowIndex of the Row whose Button was clicked.
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

            'Reference the GridView Row.
            Dim row As GridViewRow = GridView1.Rows(rowIndex)
            'Dim Codhab As String = GridView1.SelectedRow.Cells.ToString
            ' Dim country As String = row.Cells(1).Text

            Session("DESCHAB") = row.Cells(1).Text
            Session("ESTADO") = row.Cells(3).Text
            If row.Cells(6).Text <> "" Then
                Session("HAB_BLOQ") = True
            Else
                Session("HAB_BLOQ") = False
            End If
            'UpdatePanel4.Update()
            Response.Redirect("/GOBERNANTA/GOBER_BLOCK")

            End If
    End Sub


    'Private Sub FormatGrid()
    '    Dim j As Integer = -1
    '    Dim Colr As String
    '    'Here I assume that HouseNumber available in Cell (0) (i.e., First Column)
    '    For i = 0 To GridView1.Rowc - 1
    '        If DataGridView1.Rows(i).Cells(0).Value <> j Then
    '            j = DataGridView1.Rows(i).Cells(0).Value
    '            Select Case Colr
    '                Case Gray : Colr = LightBlue
    '                Case LightBlue : Colr = Gray
    '            End Select
    '        End If
    '        DataGridView1.Rows(i).DefaultCellStyle.BackColor = Color
    '    Next
    'End Sub



    Protected Sub CambiaEstado()

        '  Session("ROW") = GridView1.Rows(rowIndex)
    End Sub


End Class