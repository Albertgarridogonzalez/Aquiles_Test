Imports System.Data.SqlClient
Imports System.Net
Imports System.Text

Public Class URBAN_ICON_DASHBOARD

    Inherits Page
    Dim Dt As DataTable
    Dim Singleton As SingletonDb = SingletonDb.GetInstance
    Dim Cn As SqlConnection = Singleton.GetConnection
    ' Dim Cn As New SqlConnection(Conexion_Tesipro())
    Dim Da As New SqlDataAdapter
    Dim Cmd As New SqlCommand
    Dim sql_result As SqlDataReader
    Dim New_Conexion As String
    Dim sql_connection As New SqlConnection
    Dim sql_query As New SqlCommand
    'Dim sql_result As SqlDataReader



    'Public Function Conexion_Tesipro()
    ''If Session("Tesipro") = 1 Then

    ''    Return ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
    ''Else
    'Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
    ''End If

    'End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim searchQuery As String = "SELECT [GRUPO], [NOMBRE_CORTO], [COD], [1] AS column1, [2] AS column2, [3] AS column3, [4] AS column4, [5] AS column5, [6] AS column6, [7] AS column7, [8] AS column8, [9] AS column9, [10] AS column10, [E_11], [E_12], [E_13], [E_14], [E_15], [E_16], [E_17], [E_18], [E_19], [E_20], [LAST_CIERRE], [FECHAHORA_FIN], [LAST_UPDATE] FROM [Test_Dashboard]   where hotel like '" & TextBox1.Text & "' ORDER BY [GRUPO]"

        'Dim command As New SqlCommand(searchQuery, Conexion_Tesipro())
        'Dim adapter As New SqlDataAdapter(command)
        'Dim table As New DataTable()

        'adapter.Fill(table)
        'Conexion_Tesipro()

        'GridView1.DataSource = table


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

            Response.Redirect("/RB/URBAN_ICON_LOGIN")
        End If

        If Session("TECNICO") = False Then
            Response.Redirect("/RB/URBAN_ICON_LOGIN")
        End If



        If Session("ADMIN") = True Then
            Button1.Visible = False


        Else
            Button1.Visible = False

        End If

        Check_Status()
        'SqlTest.SelectCommand = "SELECT [GRUPO], [NOMBRE_CORTO], [COD], [1] AS column1, [2] AS column2, [3] AS column3, [4] AS column4, [5] AS column5, [6] AS column6, [7] AS column7, [8] AS column8, [9] AS column9, [10] AS column10, [E_11], [E_12], [E_13], [E_14], [E_15], [E_16], [E_17], [E_18], [E_19], [E_20], [LAST_CIERRE], [FECHAHORA_FIN], [LAST_UPDATE] FROM [Dashboard] D JOIN HOTELES H ON D.FK_ID = H.ID WHERE H. ORDER BY [GRUPO]"


    End Sub



    Private Sub Check_Status()
        'Dim sql_connection2 As New SqlConnection
        Dim sql_query2 As New SqlCommand
        Dim sql_result As SqlDataReader
        Dim Nombre As String
        Dim error1 As Boolean = True
        Dim error2 As Boolean = True
        Dim error3 As Boolean = True
        Dim error4 As Boolean = True
        Dim error5 As Boolean = True
        Dim error6 As Boolean = True

        Try

            'sql_connection2.ConnectionString = Conexion_Tesipro()
            sql_query2.Connection = Cn
            Cn.Open()
            sql_query2.CommandText = "SELECT top 1 * FROM EVENTOS_USUARIOS eu  LEFT Join usuarios u on eu.id_usuario = u.id where firma is null and fecha = convert (date,getdate())"
            sql_result = sql_query2.ExecuteReader
            Session("id_error_hotel") = 0
            If sql_result.HasRows Then
                sql_result.Read()

                Nombre = sql_result("nombre")
                Session("Nombre_") = Nombre



                If Nombre <> "" Then
                    ALERT.Visible = True
                Else
                    ALERT.Visible = False
                End If


            End If

            Cn.Close()


            sql_query2.Connection = Cn
            Cn.Open()
            sql_query2.CommandText = "SELECT top 1 * FROM EVENTOS_USUARIOS eu  LEFT Join usuarios u on eu.id_usuario = u.id where firma is null and fecha = convert (date,getdate())and u.nombre <> '" & Session("Nombre_") & "'"
            sql_result = sql_query2.ExecuteReader
            Session("id_error_hotel2") = 0
            If sql_result.HasRows Then
                sql_result.Read()
                'Nombre = sql_result("nombre")
                Session("id_error_hotel2") = sql_result("id")

                Nombre = sql_result("nombre")
                Session("Nombre_1") = Nombre

                If error2 = False Then
                    ALERT2.Visible = True
                Else
                    ALERT2.Visible = False
                End If


            End If
            Cn.Close()

            sql_query2.Connection = Cn
            Cn.Open()
            sql_query2.CommandText = "SELECT top 1 * FROM EVENTOS_USUARIOS eu  LEFT Join usuarios u on eu.id_usuario = u.id where firma is null and fecha = convert (date,getdate())and u.nombre <> '" & Session("Nombre_") & "' and u.nombre <>'" & Session("Nombre_1") & "'"
            sql_result = sql_query2.ExecuteReader
            Session("id_error_hotel3") = 0
            If sql_result.HasRows Then
                sql_result.Read()
                'Nombre = sql_result("hotel")
                Session("id_error_hotel3") = sql_result("id")

                Nombre = sql_result("nombre")
                Session("Nombre_2") = Nombre

                If error3 = False Then
                    ALERT3.Visible = True
                Else
                    ALERT3.Visible = False
                End If


            End If
            Cn.Close()

            If Session("id_error_hotel") = 0 Then
                ALERTok.Visible = True
            Else
                ALERTok.Visible = False
            End If





            'sql_query2.Connection = Cn
            'Cn.Open()
            'sql_query2.CommandText = "SELECT top 1 * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE e_1 = 0 and id not in (2,1104,49,20,1090,63)and activo = 1 and new_hotel = 0"
            'sql_result = sql_query2.ExecuteReader
            'Session("id_error_informe") = 0
            'If sql_result.HasRows Then
            '    sql_result.Read()
            '    Nombre_hotel = sql_result("hotel")
            '    Session("id_error_informe") = sql_result("id")

            '    error4 = sql_result("e_1")
            '    Nombre_hotel = sql_result("hotel")
            '    Session("Nombre_hotel4") = Nombre_hotel

            '    If error4 = False Then
            '        INFORME1.Visible = True
            '    Else
            '        INFORME1.Visible = False
            '    End If


            'End If
            'Cn.Close()




            'sql_query2.Connection = Cn
            'Cn.Open()
            'sql_query2.CommandText = "SELECT top 1 * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE e_1 = 0 and id not in (2,1104,49,20,1090,63," & Session("id_error_informe") & ")and activo = 1 and new_hotel = 0"
            'sql_result = sql_query2.ExecuteReader
            'Session("id_error_informe2") = 0
            'If sql_result.HasRows Then
            '    sql_result.Read()
            '    Nombre_hotel = sql_result("hotel")
            '    Session("id_error_informe2") = sql_result("id")

            '    error5 = sql_result("e_1")
            '    Nombre_hotel = sql_result("hotel")
            '    Session("Nombre_hotel5") = Nombre_hotel

            '    If error5 = False Then
            '        INFORME2.Visible = True
            '    Else
            '        INFORME2.Visible = False
            '    End If


            'End If
            'Cn.Close()



            'sql_query2.Connection = Cn
            'Cn.Open()
            'sql_query2.CommandText = "SELECT top 1 * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE e_1 = 0 and id not in (2,1104,49,20,1090,63," & Session("id_error_informe") & "," & Session("id_error_informe2") & ")and activo = 1 and new_hotel = 0"
            'sql_result = sql_query2.ExecuteReader
            'Session("id_error_informe3") = 0
            'If sql_result.HasRows Then
            '    sql_result.Read()
            '    Nombre_hotel = sql_result("hotel")
            '    Session("id_error_informe3") = sql_result("id")

            '    error6 = sql_result("e_1")
            '    Nombre_hotel = sql_result("hotel")
            '    Session("Nombre_hotel6") = Nombre_hotel

            '    If error6 = False Then
            '        iNFORME3.Visible = True
            '    Else
            '        iNFORME3.Visible = False
            '    End If


            'End If
            'Cn.Close()

            'If Session("id_error_informe") = 0 Then
            '    INFORMEOK.Visible = True
            'Else
            '    INFORMEOK.Visible = False
            'End If
        Catch ex As Exception
            'LabelTest2.Text = "ERROR AL CONECTAR CON EL SERVIDOR"
            Cn.Close()
        End Try



    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("/NEW_HOTEL/NewHotel_OCUP.aspx")
    End Sub
End Class

