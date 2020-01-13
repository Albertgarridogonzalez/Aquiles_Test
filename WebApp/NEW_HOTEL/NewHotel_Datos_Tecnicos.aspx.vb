Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net
Imports System.Text


Public Class NewHotel_Datos_Tecnicos

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


            '  SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString

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


        If Session("TECNICO") = False Then
            Button9.Enabled = False
        Else
            Button9.Enabled = True

        End If


        If Not IsPostBack Then

            Dim sql_query2 As New SqlCommand


            'sql_connection2.ConnectionString = Conexion_Tesipro()
            sql_query2.Connection = Cn
            Cn.Open()
            sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS_TECNICOS HDT JOIN HOTELES H ON H.ID = HDT.FK_ID_HOTEL JOIN HOTEL_DATOS HD ON HD.FK_ID_HOTEL = H.ID  WHERE H.ID = '" & Session("NewHotelID") & "'"
            sql_result = sql_query2.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()

                Session("COD_OLD") = isnull(sql_result("COD_OLD"))
                Session("NOMBRE_CORTO") = isnull(sql_result("NOMBRE_CORTO"))
                Session("CODIGO_VOXEL") = isnull(sql_result("CODIGO_VOXEL"))
                Session("RUTA_VOXEL") = isnull(sql_result("RUTA_VOXEL"))
                Session("EMPRESA_VOXEL") = isnull(sql_result("EMPRESA_VOXEL"))
                Session("CODIGO_TRASCONT") = isnull(sql_result("CODIGO_TRASCONT"))
                Session("RUTA_TRASCONT") = isnull(sql_result("RUTA_TRASCONT"))
                Session("RUTA_LOGO") = isnull(sql_result("RUTA_LOGO"))
                Session("IP") = isnull(sql_result("IP"))
                Session("DB") = isnull(sql_result("DB"))
                Session("COD_CORTO") = isnull(sql_result("COD_CORTO"))
                Session("NEW_USUARIO") = isnull(sql_result("USUARIO"))
                Session("NEW_PW") = isnull(sql_result("PW"))
                Session("NEW_Activar") = isnull(sql_result("Activo"))
                Session("NEW_Borrar") = isnull(sql_result("New_hotel"))
                Session("TIPO_DEFECTO") = isnull(sql_result("TIPO_DEFECTO"))
                Session("CREAR_CONCEPTOS_STANDAR") = isnull(sql_result("CREAR_CONCEPTOS_STANDAR"))
                'isnull(Session("NEW_DIRECCION"))
                TextBox100.Text = Session("COD_OLD")
                TextBox1.Text = Session("NOMBRE_CORTO")
                TextBox2.Text = Session("CODIGO_VOXEL")
                TextBox3.Text = Session("RUTA_VOXEL")
                TextBox4.Text = Session("EMPRESA_VOXEL")
                TextBox5.Text = Session("CODIGO_TRASCONT")
                TextBox6.Text = Session("RUTA_TRASCONT")
                TextBox7.Text = Session("RUTA_LOGO")
                TextBox8.Text = Session("IP")
                TextBox9.Text = Session("DB")
                TextBox10.Text = Session("COD_CORTO")
                TextBox11.Text = Session("NEW_USUARIO")
                TextBox12.Text = Session("NEW_PW")
                TextBox13.Text = Session("TIPO_DEFECTO")
                CheckBox10.Checked = Session("NEW_Activar")
                CheckBox11.Checked = Session("NEW_Borrar")
                CheckBox20.Checked = Session("CREAR_CONCEPTOS_STANDAR")
            End If

            sql_result.Close()
            Cn.Close()





        End If


        If Session("NewHotelID") = "" Then
            Label30.Text = "CREANDO HOTEL NUEVO"
        Else
            Label30.Text = "MODIFICANDO HOTEL : " + Session("NEW_NOMBRE")

        End If



        If TextBox1.Text = "" Then

            TextBox1.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox1.BackColor = Color.DarkSeaGreen
        End If


        If TextBox2.Text = "" Then

            TextBox2.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox2.BackColor = Color.DarkSeaGreen
        End If


        If TextBox3.Text = "" Then

            TextBox3.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox3.BackColor = Color.DarkSeaGreen
        End If


        If TextBox4.Text = "" Then

            TextBox4.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox4.BackColor = Color.DarkSeaGreen
        End If


        If TextBox5.Text = "" Then

            TextBox5.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox5.BackColor = Color.DarkSeaGreen
        End If


        If TextBox6.Text = "" Then

            TextBox6.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox6.BackColor = Color.DarkSeaGreen
        End If


        If TextBox7.Text = "" Then

            TextBox7.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox7.BackColor = Color.DarkSeaGreen
        End If


        If TextBox8.Text = "" Then

            TextBox8.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox8.BackColor = Color.DarkSeaGreen
        End If


        If TextBox9.Text = "" Then

            TextBox9.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox9.BackColor = Color.DarkSeaGreen
        End If


        If TextBox10.Text = "" Then

            TextBox10.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox10.BackColor = Color.DarkSeaGreen
        End If


        If TextBox11.Text = "" Then

            TextBox11.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox11.BackColor = Color.DarkSeaGreen
        End If


        If TextBox12.Text = "" Then

            TextBox12.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox12.BackColor = Color.DarkSeaGreen
        End If


        If TextBox13.Text = "" Then

            TextBox13.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox13.BackColor = Color.DarkSeaGreen
        End If





        If TextBox100.Text = "" Then

            TextBox100.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox100.BackColor = Color.DarkSeaGreen
        End If




        'If sql_result("last_cierre") Is DBNull.Value Then
        '    Last_Cierre = Today
        'Else
        '    Last_Cierre = sql_result("last_cierre")
        'End If






    End Sub

    Public Function isnull(dato)

        If dato Is DBNull.Value Then
            dato = ""
        Else
            dato = dato
        End If
        Return dato


    End Function


    'Public Function isnullchecked(dato)

    '    If dato Is DBNull.Value Then
    '        dato = False
    '    Else
    '        If dato = False Then
    '            dato = False
    '        Else
    '            dato = True
    '        End If


    '    End If
    '    Return dato


    'End Function



    'Public Function isnulldecimal(dato)


    '    If dato Is DBNull.Value Then
    '        dato = "0.00"
    '    Else
    '        dato = dato
    '    End If
    '    Return dato


    'End Function

    Protected Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click
        'Session("COD_OLD") = isnull(sql_result("COD_OLD"))
        'Session("NOMBRE_CORTO") = isnull(sql_result("NOMBRE_CORTO"))
        'Session("CODIGO_VOXEL") = isnull(sql_result("CODIGO_VOXEL"))
        'Session("RUTA_VOXEL") = isnull(sql_result("RUTA_VOXEL"))
        'Session("EMPRESA_VOXEL") = isnull(sql_result("EMPRESA_VOXEL"))
        'Session("CODIGO_TRASCONT") = isnull(sql_result("CODIGO_TRASCONT"))
        'Session("RUTA_TRASCONT") = isnull(sql_result("RUTA_TRASCONT"))
        'Session("RUTA_LOGO") = isnull(sql_result("RUTA_LOGO"))


        Session("COD_OLD") = TextBox100.Text
        Session("NOMBRE_CORTO") = TextBox1.Text
        Session("CODIGO_VOXEL") = TextBox2.Text
        Session("RUTA_VOXEL") = TextBox3.Text
        Session("EMPRESA_VOXEL") = TextBox4.Text
        Session("CODIGO_TRASCONT") = TextBox5.Text
        Session("RUTA_TRASCONT") = TextBox6.Text
        Session("RUTA_LOGO") = TextBox7.Text
        Session("RUTA_TRASCONT") = TextBox6.Text
        Session("RUTA_LOGO") = TextBox7.Text
        Session("IP") = TextBox8.Text
        Session("DB") = TextBox9.Text
        Session("COD_CORTO") = TextBox10.Text
        Session("NEW_USUARIO") = TextBox11.Text
        Session("NEW_PW") = TextBox12.Text
        Session("TIPO_DEFECTO") = TextBox13.Text
        Session("NEW_Activar") = CheckBox10.Checked
        Session("NEW_Borrar") = CheckBox11.Checked
        Session("CREAR_CONCEPTOS_STANDAR") = CheckBox20.Checked



        Cmd.Connection = Cn
        Cmd.CommandText = "SET LANGUAGE SPANISH EXEC.SP_NEW_HOTEL_TECNICOS
             '" & Session("NewHotelID") & "'
             ,'" & Session("COD_OLD") & "'
             ,'" & Session("NOMBRE_CORTO") & "'
             ,'" & Session("CODIGO_VOXEL") & "'
             ,'" & Session("RUTA_VOXEL") & "' 
             ,'" & Session("EMPRESA_VOXEL") & "'
             ,'" & Session("CODIGO_TRASCONT") & "'
             ,'" & Session("RUTA_TRASCONT") & "'
             ,'" & Session("RUTA_LOGO") & "'
             ,'" & Session("IP") & "'
             ,'" & Session("DB") & "'
             ,'" & Session("COD_CORTO") & "'
             ,'" & Session("NEW_USUARIO") & "'
             ,'" & Session("NEW_PW") & "'
              ,'" & Session("CREAR_CONCEPTOS_STANDAR") & "'

"





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



        Cmd.Connection = Cn
        Cmd.CommandText = "SET LANGUAGE SPANISH UPDATE HOTELES SET NEW_HOTEL = '" & Session("NEW_Borrar") & "'  , Activo = '" & Session("NEW_Activar") & "' WHERE ID = '" & Session("NewHotelID") & "'  UPDATE HOTEL_DATOS_TECNICOS SET TIPO_DEFECTO = '" & Session("TIPO_DEFECTO") & "' WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' "







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

    Protected Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click
        Label100.Text = "testcancelar"

    End Sub
    Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
        If KeyCode = 13 Then MsgBox("Has pulsado la tecla intro")
    End Sub

    Private Sub Text1_KeyPress(KeyAscii As Integer)
        If KeyAscii = 13 Then MsgBox("La tecla enter ha sido pulsada")
    End Sub

    'Private Sub TXTOrderNum_keypress(KeyAscii As Integer)
    '    If KeyAscii = 13 Then
    '        Button12_Click("", System.EventArgs.Empty)

    '    End If

    'End Sub



End Class