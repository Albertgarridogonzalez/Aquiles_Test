Imports System.Data.SqlClient
Imports System.Net
Imports System.Text


Public Class NewHotel_Crea

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




        If Session("ADMIN") = False Then
            Button9.Enabled = False
        Else
            Button9.Enabled = True

        End If


        'If Not IsPostBack Then

        '    Dim sql_query2 As New SqlCommand


        '    'sql_connection2.ConnectionString = Conexion_Tesipro()
        '    sql_query2.Connection = Cn
        '    Cn.Open()
        '    sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS HD JOIN HOTELES H ON H.ID = HD.FK_ID_HOTEL   WHERE fk_id_HOTEL = '" & Session("NewHotelID") & "'"
        '    sql_result = sql_query2.ExecuteReader
        '    If sql_result.HasRows Then
        '        sql_result.Read()

        '        Session("NEW_CODIGOHOT") = isnull(sql_result("CODIGOHOT"))
        '        Session("NEW_NOMBRE") = isnull(sql_result("NOMBRE"))
        '        Session("NEW_TELEFONO") = isnull(sql_result("TELEFONO"))
        '        Session("NEW_DIRECCION") = isnull(sql_result("DIRECCION"))
        '        Session("NEW_POBLACION") = isnull(sql_result("POBLACION"))
        '        Session("NEW_CODPOSTAL") = isnull(sql_result("CODPOSTAL"))
        '        Session("NEW_CIF") = isnull(sql_result("CIF"))
        '        Session("NEW_NUMHABITACIONES") = isnull(sql_result("NUMHABITACIONES"))
        '        Session("NEW_NOMBRE_FISCAL") = isnull(sql_result("NOMBRE_FISCAL"))
        '        Session("NEW_ID_POLICIA") = isnull(sql_result("ID_POLICIA"))
        '        Session("NEW_SECUENCIA_POLICIA") = isnull(sql_result("SECUENCIA_POLICIA"))
        '        Session("NEW_RUTA_POLICIA") = isnull(sql_result("RUTA_POLICIA"))
        '        Session("NEW_CAMBIO_SABANA") = isnull(sql_result("CAMBIO_SABANA"))
        '        Session("NEW_ULTIMNUMFACT") = isnull(sql_result("ULTIMNUMFACT"))
        '        Session("NEW_ULTIMNUMAB") = isnull(sql_result("ULTIMNUMAB"))
        '        Session("NEW_TIPOLOGIASAL") = isnull(sql_result("TIPOLOGIASAL"))
        '        Session("NEW_E_MAIL") = isnull(sql_result("E_MAIL"))
        '        Session("NEW_CAMAS") = isnull(sql_result("CAMAS"))
        '        Session("NEW_CAMASEXT") = isnull(sql_result("CAMASEXT"))
        '        Session("NEW_CUNAS") = isnull(sql_result("CUNAS"))
        '        Session("NEW_SEGMENTOCASA") = isnull(sql_result("SEGMENTOCASA"))
        '        Session("NEW_CATEGORIAHOTEL") = isnull(sql_result("CATEGORIAHOTEL"))
        '        Session("NEW_Web") = isnull(sql_result("Web"))
        '        Session("NEW_IMPTASATURI") = sql_result("IMPTASATURI")
        '        Session("NEW_TASATURISITICA") = isnullchecked(sql_result("TASATURISITICA"))
        '        Session("NEW_CIERREAUT") = isnullchecked(sql_result("CIERREAUT"))
        '        Session("NEW_IMPUESTOINCL") = isnullchecked(sql_result("IMPUESTOINCL"))
        '        Session("NEW_REGBB") = isnullchecked(sql_result("REGBB"))
        '        Session("NEW_REGMP") = isnullchecked(sql_result("REGMP"))
        '        Session("NEW_REGPC") = isnullchecked(sql_result("REGPC"))



        '    End If

        '    sql_result.Close()
        '    Cn.Close()





        'End If


        If Session("NewHotelID") = "" Then
            Label30.Text = "CREANDO HOTEL NUEVO"
        Else
            Label30.Text = "MODIFICANDO HOTEL : " + Session("NEW_NOMBRE")

        End If







    End Sub

    Public Function isnull(dato)

        If dato Is DBNull.Value Then
            dato = ""
        Else
            dato = dato
        End If
        Return dato


    End Function


    Public Function isnullchecked(dato)

        If dato Is DBNull.Value Then
            dato = False
        Else
            If dato = False Then
                dato = False
            Else
                dato = True
            End If


        End If
        Return dato


    End Function



    Public Function isnulldecimal(dato)


        If dato Is DBNull.Value Then
            dato = "0.00"
        Else
            dato = dato
        End If
        Return dato


    End Function

    Protected Sub Button12_Click(sender As Object, e As EventArgs) Handles Button12.Click

        Tareas()
        Timer1.Enabled = True

    End Sub

    Public Sub Tareas()

        ' If CheckBox1.Checked = True Or CheckBox2.Checked = True Or CheckBox3.Checked = True Or CheckBox4.Checked = True Or CheckBox5.Checked = True Or CheckBox6.Checked = True Or CheckBox10.Checked = True Then


        Session("C1") = CheckBox1.Checked
        Session("C2") = CheckBox2.Checked
            Session("C3") = CheckBox3.Checked
            Session("C4") = CheckBox4.Checked
            Session("C5") = CheckBox5.Checked
            Session("C6") = CheckBox6.Checked
        Session("C7") = CheckBox7.Checked
        Session("C8") = CheckBox8.Checked
        Session("C9") = CheckBox9.Checked
        Session("C10") = CheckBox10.Checked
        Session("C11") = CheckBox11.Checked





        'If CheckBox1.Checked = True Then
        Cmd.Connection = Cn
        Cmd.CommandText = "EXEC.[SP_INSERT_PROCESOS]'" & Session("NewHotelID") & "','" & Session("C1") & "','" & Session("C2") & "','" & Session("C3") & "','" & Session("C4") & "','" & Session("C5") & "','" & Session("C6") & "','" & Session("C7") & "','" & Session("C8") & "','" & Session("C9") & "','" & Session("C10") & "','" & Session("C11") & "'"
        Cmd.CommandTimeout = 3000
                'Try
                Cn.Open()
                Cmd.ExecuteNonQuery()
                Cn.Close()
                'Catch ex As Exception
                '    If ex.Message <> "" Then
                '    End If
                'End Try
                Cn.Close()
        'End If

        'End If
    End Sub



    'Private Sub TXTOrderNum_keypress(KeyAscii As Integer)
    '    If KeyAscii = 13 Then
    '        Button12_Click("", System.EventArgs.Empty)

    '    End If

    'End Sub


    Public Sub porcentage()

        ' Dim ESTADO As Integer
        Dim ESTADO_OK As Integer
        Dim sql_query As New SqlCommand
        sql_query.Connection = Cn
        Cn.Open()
        sql_query.CommandText = "SELECT TOP 1 ESTADO_OK FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'INSTALANDO' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "' ORDER BY  ESTADO_OK DESC"
        sql_result = sql_query.ExecuteReader
        If sql_result.HasRows Then
            sql_result.Read()
            ESTADO_OK = sql_result("ESTADO_OK")
            If ESTADO_OK = 1 Then
                Session("progressbar") = 1

            Else
                If ESTADO_OK = 2 Then
                    Session("progressbar") = 2

                    ProgressBar1.Style.Add("Width", "100%")
                    ProgressBar2.Style.Add("Width", "100%")
                    ProgressBar3.Style.Add("Width", "100%")
                    ProgressBar4.Style.Add("Width", "100%")
                    ProgressBar5.Style.Add("Width", "100%")
                    ProgressBar6.Style.Add("Width", "100%")
                    ProgressBar7.Style.Add("Width", "100%")
                    ProgressBar8.Style.Add("Width", "100%")
                    ProgressBar9.Style.Add("Width", "100%")
                    ProgressBar11.Style.Add("Width", "100%")
                    ProgressBar10.Style.Add("Width", "100%")

                Else



                    Session("progressbar") = 0
                    ProgressBar1.Style.Add("Width", "0%")
                    ProgressBar2.Style.Add("Width", "0%")
                    ProgressBar3.Style.Add("Width", "0%")
                    ProgressBar4.Style.Add("Width", "0%")
                    ProgressBar5.Style.Add("Width", "0%")
                    ProgressBar6.Style.Add("Width", "0%")
                    ProgressBar7.Style.Add("Width", "0%")
                    ProgressBar8.Style.Add("Width", "0%")
                    ProgressBar9.Style.Add("Width", "0%")
                    ProgressBar11.Style.Add("Width", "0%")
                    ProgressBar10.Style.Add("Width", "0%")
                    'Label1.Text = "100%"

                    'Timer1.Enabled = False
                    'ProgressBar1.Visible = False
                    'ProgressBar1.Style.Add("Width", "100%")
                End If

            End If
            'If sql_result("ESTADO_OK") = 1 Then
            '    Session("progressbar") = IsDBNull(sql_result("ESTADO_OK"))



        End If
        sql_result.Close()
        Cn.Close()


        If Session("progressbar") = 1 Then



            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CREARHOTEL' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()


                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox1.Checked = True Then
                        ProgressBar1.Style.Add("Width", "100%")
                    Else
                        ProgressBar1.Style.Add("Width", "0%")
                    End If
                Else
                        If CheckBox1.Checked = True Then

                        ProgressBar1.Style.Add("Width", "10%")
                    Else
                        ProgressBar1.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()



            ' CHECKBOX 5
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'HOTELCONFIG' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox5.Checked = True Then
                        ProgressBar5.Style.Add("Width", "100%")
                    Else
                        ProgressBar5.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox5.Checked = True Then

                        ProgressBar5.Style.Add("Width", "10%")
                    Else
                        ProgressBar5.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()


            ' CHECKBOX 9
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'REGIMEN' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox9.Checked = True Then
                        ProgressBar9.Style.Add("Width", "100%")
                    Else
                        ProgressBar9.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox9.Checked = True Then

                        ProgressBar9.Style.Add("Width", "10%")
                    Else
                        ProgressBar9.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()


            ' CHECKBOX 2
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CREARTIPOHAB' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox2.Checked = True Then
                        ProgressBar2.Style.Add("Width", "100%")
                    Else
                        ProgressBar2.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox2.Checked = True Then

                        ProgressBar2.Style.Add("Width", "10%")
                    Else
                        ProgressBar2.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()


            ' CHECKBOX 3
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'ORIGENSEG' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox3.Checked = True Then
                        ProgressBar3.Style.Add("Width", "100%")
                    Else
                        ProgressBar3.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox3.Checked = True Then

                        ProgressBar3.Style.Add("Width", "10%")
                    Else
                        ProgressBar3.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()


            ' CHECKBOX 4
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'RACK' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox4.Checked = True Then
                        ProgressBar4.Style.Add("Width", "100%")
                    Else
                        ProgressBar4.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox4.Checked = True Then

                        ProgressBar4.Style.Add("Width", "10%")
                    Else
                        ProgressBar4.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()



            ' CHECKBOX 6
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'OCUP' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox6.Checked = True Then
                        ProgressBar6.Style.Add("Width", "100%")
                    Else
                        ProgressBar6.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox6.Checked = True Then

                        ProgressBar6.Style.Add("Width", "10%")
                    Else
                        ProgressBar6.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()


            ' CHECKBOX 7
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CONCEPTO' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox7.Checked = True Then
                        ProgressBar7.Style.Add("Width", "100%")
                    Else
                        ProgressBar7.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox7.Checked = True Then

                        ProgressBar7.Style.Add("Width", "10%")
                    Else
                        ProgressBar7.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()





            ' CHECKBOX 8
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'COBROS' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox8.Checked = True Then
                        ProgressBar8.Style.Add("Width", "100%")
                    Else
                        ProgressBar8.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox8.Checked = True Then

                        ProgressBar8.Style.Add("Width", "10%")
                    Else
                        ProgressBar8.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()










            ' CHECKBOX 10
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'TRASPASO_MAESTRO' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox10.Checked = True Then
                        ProgressBar10.Style.Add("Width", "100%")

                    Else
                        ProgressBar10.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox10.Checked = True Then

                        ProgressBar10.Style.Add("Width", "10%")
                    Else
                        ProgressBar10.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()






            ' CHECKBOX 11
            sql_query.Connection = Cn
            Cn.Open()
            sql_query.CommandText = "SELECT top 1 * FROM HOTEL_REG_PROCESOS WHERE PROCESO = 'CARACT' AND FK_ID_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()
                ESTADO_OK = sql_result("ESTADO_OK")

                If ESTADO_OK = 1 Then
                    If CheckBox11.Checked = True Then
                        ProgressBar11.Style.Add("Width", "100%")

                    Else
                        ProgressBar11.Style.Add("Width", "0%")
                    End If
                Else
                    If CheckBox11.Checked = True Then

                        ProgressBar11.Style.Add("Width", "10%")
                    Else
                        ProgressBar11.Style.Add("Width", "0%")
                    End If
                End If

            End If
            sql_result.Close()
            Cn.Close()

        End If




    End Sub

    Protected Sub Timer1_Tick1(sender As Object, e As EventArgs) Handles Timer1.Tick
        'Label1.Text = "12"

        porcentage()
        UpdatePanel1.Update()

        UpdatePanel5.Update()
        UpdatePanel9.Update()
        UpdatePanel2.Update()
        UpdatePanel3.Update()
        UpdatePanel4.Update()

        UpdatePanel6.Update()
        UpdatePanel7.Update()
        UpdatePanel8.Update()

        UpdatePanel10.Update()
        UpdatePanel11.Update()

    End Sub

    Protected Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click
        Timer1.Enabled = True
    End Sub

    Protected Sub Button21_Click(sender As Object, e As EventArgs) Handles Button21.Click
        If CheckBox1.Checked = False Then


            CheckBox1.Checked = True
            CheckBox2.Checked = True
            CheckBox3.Checked = True
            CheckBox4.Checked = True
            CheckBox5.Checked = True
            CheckBox6.Checked = True
            CheckBox7.Checked = True
            CheckBox8.Checked = True
            CheckBox9.Checked = True
            CheckBox10.Checked = True
            CheckBox11.Checked = True
        Else
            CheckBox1.Checked = False
            CheckBox2.Checked = False
            CheckBox3.Checked = False
            CheckBox4.Checked = False
            CheckBox5.Checked = False
            CheckBox6.Checked = False
            CheckBox7.Checked = False
            CheckBox8.Checked = False
            CheckBox9.Checked = False
            CheckBox10.Checked = False
            CheckBox11.Checked = False
        End If


    End Sub

    'Protected Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
    '    porcentage()
    '    UpdatePanel1.Update()
    '    UpdatePanel2.Update()
    '    Timer2.Enabled = False
    'End Sub
End Class