Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader



Public Class Gober_Block

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
            Response.Redirect("/GOBERNANTA/GOBERLogin")
        End If
        If Session("GOBER") = False Then
            If Session("ADMIN") = False Then
                Response.Redirect("/GOBERNANTA/GOBERLogin")
            End If

        End If



        Session("HotelID") = 1090
        If Session("HAB_BLOQ") = True Then
            DropDownList1.SelectedValue = 3
        Else
            DropDownList1.SelectedValue = 1
        End If


        'isnull(Session("NEW_DIRECCION"))
        TextBox1.Text = Session("DESCHAB")
        TextBox2.Text = Session("DESCHAB")



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




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session("DESCHAB") = TextBox1.Text
        Session("DESCHAB2") = TextBox2.Text
        Session("DESDE") = TextBox3.Text
        Session("HASTA") = TextBox4.Text
        Session("MOTIVO") = TextBox5.Text
        Session("TIPOBLOCK") = DropDownList1.SelectedValue


        Cmd.Connection = Cn
        Cmd.CommandText = "SET LANGUAGE SPANISH EXEC.SP_BLOQUEA_HAB '" & Session("HotelID") & "' , '" & Session("DESCHAB") & "' ,'" & Session("DESCHAB2") & "' ,'" & Session("DESDE") & "','" & Session("HASTA") & "','" & Session("MOTIVO") & "','" & Session("TIPOBLOCK") & "','" & Session("USERNAME") & "'"
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

    End Sub

End Class