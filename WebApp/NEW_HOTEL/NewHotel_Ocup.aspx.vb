Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader


Public Class NewHotel_Ocup

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
            'GridView1 = CType(sender, GridView)
            'Session("ID_SEGMENTO") = (GridView1.Rows(GridView1.SelectedIndex).Cells(1).Text)

            SqlTest.SelectCommand = "SELECT * FROM HOTEL_DATOS_OCUP WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' ORDER BY [CODIGO], A,N1, N2 ,I , DEFECTO ASC"
            SqlTest.UpdateCommand = "UPDATE HOTEL_DATOS_OCUP SET  CODIGO = @CODIGO,A = @A ,N1 = @N1, N2 = @N2, I = @I , DEFECTO = @DEFECTO WHERE ID = @ID 
            IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_OCUP WHERE CODIGO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            HOTEL_DATOS_OCUP VALUES ( '" & Session("NewHotelID") & "','','','','','','')"
            SqlTest.DeleteCommand = "DELETE FROM HOTEL_DATOS_OCUP WHERE ID = 0"

            'IF NOT EXISTS (SELECT * FROM HOTEL_DATOS_SEGMENTOORIGEN WHERE CODIGO = '' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' )INSERT INTO 
            'HOTEL_DATOS_SEGMENTOORIGEN VALUES ( '" & Session("NewHotelID") & "','','',1)"







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



    Public Sub CARGAEXCEL()


    End Sub

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        CARGAEXCEL()
    End Sub

    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
        Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
        Dim constr As String = SingletonDb.GetInstance.GetConnectionString
        'ConfigurationManager.ConnectionStrings("constr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("DELETE FROM HOTEL_DATOS_OCUP WHERE ID = " & Id & "")
                ' cmd.Parameters.AddWithValue("@ID", Id)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using

    End Sub

    Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click

        Cmd.Connection = Cn
        Cmd.CommandText =
        "INSERT INTO HOTEL_DATOS_OCUP SELECT '" & Session("NewHotelID") & "' , CODIGO, 1,0,0,0,0 FROM HOTEL_DATOS_TIPOHAB WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "' AND CODIGO NOT IN (SELECT CODIGO FROM HOTEL_DATOS_OCUP WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND A = 1) 
         INSERT INTO HOTEL_DATOS_OCUP SELECT '" & Session("NewHotelID") & "' , CODIGO, 2,0,0,0,1 FROM HOTEL_DATOS_TIPOHAB WHERE FK_ID_HOTEL =  '" & Session("NewHotelID") & "' AND CODIGO NOT IN (SELECT CODIGO FROM HOTEL_DATOS_OCUP WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND A = 2)"
        Cmd.CommandTimeout = 3000
        Try
            Cn.Open()
            Cmd.ExecuteNonQuery()
            Cn.Close()
        Catch ex As Exception
            If ex.Message <> "" Then
            End If
        End Try
        Cn.Close()
    End Sub

End Class