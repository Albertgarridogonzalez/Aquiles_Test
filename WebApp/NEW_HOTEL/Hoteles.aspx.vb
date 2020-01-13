Imports System.Data.SqlClient
Imports System.Net
Imports System.Text


Public Class Hoteles

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
    Protected test As String = "test"


    'Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)

    'End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '   <%=Me.test%>
        'ProgressBar.Style.Add("width", Session.Item("width") + "px ")
        'Session.Item("width") = (Session.Item("QuestionIDCounter") / Session.Item("QuestionsTaken")) * 100 ' get the percent to show
        '(520 / 100) * Session.Item("width")




        'Try
        '    If Session("Tesipro") = 1 Then
        '        SingletonDb.GetInstance().ChangeConnectionString(1)

        '    Else
        '        Session("Tesipro") = 0
        '        SingletonDb.GetInstance().ChangeConnectionString(0)
        '    End If


        '    SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString

        'Catch ex As Exception
        '    Console.WriteLine(ex.ToString)

        'End Try



        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("TECNICO") = False Then
            If Session("INSTALACION") = False Then
                Response.Redirect("/Login")
            End If

        End If


        ' porcentage()

        'ProgressBar1.Style.Add("Width", "50%")
        Session("NewHotelID") = "0"

        'UpdatePanel1.Visible = False
        ' ProgressBar1.Visible = False
        'If Session("TECNICO") = True Then
        '    SqlTest.SelectCommand = "SELECT [ID],[GRUPO], [NOMBRE_CORTO], NEW_HOTEL FROM HOTELES  where new_hotel = 'true'   ORDER BY [GRUPO]"
        'Else
        '    If Session("INSTALACION") = True Then
        '        SqlTest.SelectCommand = "SELECT [ID],[GRUPO], [NOMBRE_CORTO], NEW_HOTEL FROM HOTELES H LEFT JOIN HOTEL_PERMISO HP ON H.ID = HP.FK_ID_HOTEL  where new_hotel = 'true' AND HP.FK_ID_USUARIO = '" & Session("id_usuario") & "'  ORDER BY [GRUPO]"
        '        Button1.Visible = False
        '    End If
        'End If

        'If Session("ADMIN") = True Then
        '    SqlTest.SelectCommand = "SELECT [ID],[GRUPO], [NOMBRE_CORTO], NEW_HOTEL FROM HOTELES  where new_hotel = 'true'   ORDER BY [GRUPO]"
        'End If




    End Sub
    'Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

    '    ' MsgBox(GridView1.Rows(e.RowIndex).Cells(0).Text)
    '    Dim Id As Integer = GridView1.Rows(e.RowIndex).Cells(0).Text                       'Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
    '    Dim constr As String = SingletonDb.GetInstance.GetConnectionString
    '    'ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New SqlConnection(constr)
    '        Using cmd As New SqlCommand("UPDATE HOTELES SET NEW_HOTEL = 0 WHERE ID = " & Id & "")
    '            ' cmd.Parameters.AddWithValue("@ID", Id)
    '            cmd.Connection = con
    '            con.Open()
    '            cmd.ExecuteNonQuery()
    '            con.Close()
    '        End Using
    '    End Using

    'End Sub


    'Public Sub porcentage()

    '    Dim ESTADO As Integer
    '    Dim ESTADO_OK As Integer
    '    Dim sql_query As New SqlCommand
    '    sql_query.Connection = Cn
    '    Cn.Open()
    '    sql_query.CommandText = "SELECT TOP 1 ESTADO_OK FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'INSTALANDO' ORDER BY  ESTADO_OK DESC"
    '    sql_result = sql_query.ExecuteReader
    '    If sql_result.HasRows Then
    '        sql_result.Read()
    '        ESTADO_OK = sql_result("ESTADO_OK")
    '        If ESTADO_OK = 1 Then
    '            Session("progressbar") = 1
    '        Else

    '            Session("progressbar") = 0
    '            ProgressBar1.Style.Add("Width", "100%")
    '            Label1.Text = "100%"

    '            'Timer1.Enabled = False
    '            'ProgressBar1.Visible = False
    '            'ProgressBar1.Style.Add("Width", "100%")


    '        End If
    '        'If sql_result("ESTADO_OK") = 1 Then
    '        '    Session("progressbar") = IsDBNull(sql_result("ESTADO_OK"))



    '    End If
    '    sql_result.Close()
    '    Cn.Close()


    '    If Session("progressbar") = 1 Then


    '        'sql_connection2.ConnectionString = Conexion_Tesipro()
    '        sql_query.Connection = Cn
    '        Cn.Open()
    '        sql_query.CommandText = "SELECT SUM(ESTADO) As SUMESTADO, SUM(ESTADO_OK) As SUMESTADO_OK FROM HOTEL_REG_PROCESOS WHERE PROCESO <> 'INSTALANDO'"
    '        sql_result = sql_query.ExecuteReader
    '        sql_result.Close()
    '        Cn.Close()

    '        If sql_result.HasRows Then
    '            sql_result.Read()



    '            ESTADO = sql_result("SUMESTADO")
    '            ESTADO_OK = sql_result("SUMESTADO_OK")

    '            If sql_result("SUMESTADO") = sql_result("SUMESTADO_OK") Then
    '                'Session("width") = 0 + "%"
    '                'UpdatePanel1.Visible = False
    '                'ProgressBar1.Visible = False
    '                Timer1.Enabled = False
    '                'sql_result.Close()
    '                'Cn.Close()
    '                ProgressBar1.Style.Add("Width", "100%")
    '                Label1.Text = "100%"
    '                'Session("progressbar") = 1
    '                'ProgressBar1.InnerText = "Test"
    '            Else
    '                Timer1.Enabled = True
    '                'UpdatePanel1.Visible = True
    '                'ProgressBar1.Visible = True
    '                Session("width") = (sql_result("SUMESTADO_OK") / sql_result("SUMESTADO")) * 100
    '                Session("widthString") = Session("width").ToString
    '                Session("width%") = Session("widthString")
    '                If Session("width%").Length > 2 Then
    '                    Session("width%") = Session("width%").Substring(0, 2)
    '                    Session("width%") = Session("width%") & "%"
    '                Else
    '                    Session("width%") = Session("width%") & "%"
    '                End If
    '                ProgressBar1.Style.Add("Width", Session("width%"))
    '                'ProgressBar1.InnerText = "Test"
    '                Label1.Text = Session("width%")
    '                'ProgressBar1.Style.
    '            End If


    '        End If



    '    Else
    '        'UpdatePanel1.Visible = False

    '    End If
    '    ' style="width: 70%;"
    '    ' Session("width") = 70 + "%"



    'End Sub

    'Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
    '    Dim Index As Integer
    '    Dim GridView1 As GridView
    '    Session("test1") = sender
    '    Session("test2") = e
    '    GridView1 = CType(sender, GridView)
    '    'MsgBox(GridView1.Rows(GridView1.SelectedIndex).Cells(1).Text)


    '    Session("NewHotelID") = (GridView1.Rows(GridView1.SelectedIndex).Cells(1).Text)
    '    ' MsgBox(Session("test"))
    '    Session("test") = Index

    '    Response.Redirect("/NEW_HOTEL/NewHotel_datos.aspx")


    '    'CircularProgressBar.CircularProgressBar.

    'End Sub

    'Protected Sub Timer1_Tick1(sender As Object, e As EventArgs) Handles Timer1.Tick
    '    'Label1.Text = "12"

    '    porcentage()
    '    UpdatePanel1.Update()

    'End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Session("NewHotelID") = "0"
        Response.Redirect("/NEW_HOTEL/NewHotel.aspx")

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session("NewHotelID") = "0"
        Response.Redirect("/NEW_HOTEL/Hotel_.aspx")

    End Sub
End Class