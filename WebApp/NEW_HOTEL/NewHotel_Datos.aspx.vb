Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Text
Imports NDbfReader

Public Class NewHotel_Datos

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


        'Button3.CssClass.


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


        If Not IsPostBack Then

            Dim sql_query2 As New SqlCommand


            'sql_connection2.ConnectionString = Conexion_Tesipro()
            sql_query2.Connection = Cn
            Cn.Open()
            If Session("HotelDatos") = True Then
                sql_query2.CommandText = "exec.SP_CHECK_MANTENIMIENTO_DATOS  '" & Session("NewHotelID") & "'"
            Else

                sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS HD JOIN HOTELES H ON H.ID = HD.FK_ID_HOTEL   WHERE fk_id_HOTEL = '" & Session("NewHotelID") & "'"
            End If
            'sql_query2.CommandText = "SELECT * FROM HOTEL_DATOS HD JOIN HOTELES H ON H.ID = HD.FK_ID_HOTEL   WHERE fk_id_HOTEL = '" & Session("NewHotelID") & "'"
            sql_result = sql_query2.ExecuteReader
            If sql_result.HasRows Then
                sql_result.Read()

                Session("NEW_CODIGOHOT") = isnull(sql_result("CODIGOHOT"))
                Session("GRUPO") = isnull(sql_result("GRUPO"))
                Session("NEW_NOMBRE") = isnull(sql_result("NOMBRE"))
                Session("NEW_TELEFONO") = isnull(sql_result("TELEFONO"))
                Session("NEW_DIRECCION") = isnull(sql_result("DIRECCION"))
                Session("NEW_POBLACION") = isnull(sql_result("POBLACION"))
                Session("NEW_CODPOSTAL") = isnull(sql_result("CODPOSTAL"))
                Session("NEW_CIF") = isnull(sql_result("CIF"))
                Session("NEW_NUMHABITACIONES") = isnull(sql_result("NUMHABITACIONES"))
                Session("NEW_NOMBRE_FISCAL") = isnull(sql_result("NOMBRE_FISCAL"))
                Session("NEW_ID_POLICIA") = isnull(sql_result("ID_POLICIA"))
                Session("NEW_SECUENCIA_POLICIA") = isnull(sql_result("SECUENCIA_POLICIA"))
                Session("NEW_RUTA_POLICIA") = isnull(sql_result("RUTA_POLICIA"))
                Session("NEW_CAMBIO_SABANA") = isnull(sql_result("CAMBIO_SABANA"))
                Session("NEW_ULTIMNUMFACT") = isnull(sql_result("ULTIMNUMFACT"))
                Session("NEW_ULTIMNUMAB") = isnull(sql_result("ULTIMNUMAB"))
                Session("NEW_TIPOLOGIASAL") = isnull(sql_result("TIPOLOGIASAL"))
                Session("NEW_E_MAIL") = isnull(sql_result("E_MAIL"))
                Session("NEW_CAMAS") = isnull(sql_result("CAMAS"))
                Session("NEW_CAMASEXT") = isnull(sql_result("CAMASEXT"))
                Session("NEW_CUNAS") = isnull(sql_result("CUNAS"))
                Session("NEW_SEGMENTOCASA") = isnull(sql_result("SEGMENTOCASA"))
                Session("NEW_CATEGORIAHOTEL") = isnull(sql_result("CATEGORIAHOTEL"))
                Session("NEW_Web") = isnull(sql_result("Web"))
                Session("NEW_IMPTASATURI") = sql_result("IMPTASATURI")
                Session("NEW_TASATURISITICA") = isnullchecked(sql_result("TASATURISITICA"))
                Session("NEW_CIERREAUT") = isnullchecked(sql_result("CIERREAUT"))
                Session("NEW_IMPUESTOINCL") = isnullchecked(sql_result("IMPUESTOINCL"))
                Session("NEW_REGBB") = isnullchecked(sql_result("REGBB"))
                Session("NEW_REGMP") = isnullchecked(sql_result("REGMP"))
                Session("NEW_REGPC") = isnullchecked(sql_result("REGPC"))

                'isnull(Session("NEW_DIRECCION"))
                TextBox100.Text = Session("NEW_CODIGOHOT")
                TextBox1.Text = Session("NEW_NOMBRE")
                TextBox24.Text = Session("GRUPO")
                TextBox2.Text = Session("NEW_TELEFONO")
                TextBox3.Text = Session("NEW_DIRECCION")
                TextBox4.Text = Session("NEW_POBLACION")
                TextBox5.Text = Session("NEW_CODPOSTAL")
                TextBox6.Text = Session("NEW_CIF")
                TextBox7.Text = Session("NEW_NUMHABITACIONES")
                TextBox8.Text = Session("NEW_NOMBRE_FISCAL")
                TextBox9.Text = Session("NEW_ID_POLICIA")
                TextBox10.Text = Session("NEW_SECUENCIA_POLICIA")
                TextBox11.Text = Session("NEW_RUTA_POLICIA")
                TextBox12.Text = Session("NEW_CAMBIO_SABANA")
                TextBox13.Text = Session("NEW_ULTIMNUMFACT")
                TextBox14.Text = Session("NEW_ULTIMNUMAB")
                TextBox15.Text = Session("NEW_TIPOLOGIASAL")
                TextBox16.Text = Session("NEW_E_MAIL")
                TextBox17.Text = Session("NEW_CAMAS")
                TextBox18.Text = Session("NEW_CAMASEXT")
                TextBox19.Text = Session("NEW_CUNAS")
                TextBox20.Text = Session("NEW_SEGMENTOCASA")
                TextBox21.Text = Session("NEW_CATEGORIAHOTEL")
                TextBox22.Text = Session("NEW_Web")
                TextBox23.Text = Session("NEW_IMPTASATURI").ToString
                CheckBox1.Checked = Session("NEW_TASATURISITICA")
                CheckBox2.Checked = Session("NEW_CIERREAUT")
                CheckBox3.Checked = Session("NEW_IMPUESTOINCL")
                CheckBox4.Checked = Session("NEW_REGBB")
                CheckBox5.Checked = Session("NEW_REGMP")
                CheckBox6.Checked = Session("NEW_REGPC")

            End If

            sql_result.Close()
            Cn.Close()





        End If


        If Session("NewHotelID") = "" Then
            Label30.Text = "CREANDO HOTEL NUEVO"
        Else
            Label30.Text = "MODIFICANDO HOTEL : " + Session("NEW_NOMBRE") + Session("NewHotelID")

        End If




        If TextBox1.Text = "" Then

            TextBox1.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox1.BackColor = Color.DarkSeaGreen
        End If

        If TextBox24.Text = "" Then

            TextBox24.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox24.BackColor = Color.DarkSeaGreen
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

        If TextBox14.Text = "" Then

            TextBox14.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox14.BackColor = Color.DarkSeaGreen
        End If


        If TextBox15.Text = "" Then

            TextBox15.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox15.BackColor = Color.DarkSeaGreen
        End If

        If TextBox16.Text = "" Then

            TextBox16.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox16.BackColor = Color.DarkSeaGreen
        End If

        If TextBox17.Text = "" Then

            TextBox17.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox17.BackColor = Color.DarkSeaGreen
        End If

        If TextBox18.Text = "" Then

            TextBox18.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox18.BackColor = Color.DarkSeaGreen
        End If

        If TextBox19.Text = "" Then

            TextBox19.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox19.BackColor = Color.DarkSeaGreen
        End If

        If TextBox20.Text = "" Then

            TextBox20.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox20.BackColor = Color.DarkSeaGreen
        End If

        If TextBox21.Text = "" Then

            TextBox21.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox21.BackColor = Color.DarkSeaGreen
        End If
        If TextBox22.Text = "" Then

            TextBox22.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox22.BackColor = Color.DarkSeaGreen
        End If

        If TextBox23.Text = "" Then

            TextBox23.BackColor = Color.LightCoral     'PeachPuff          '#CADDBD
        Else
            TextBox23.BackColor = Color.DarkSeaGreen
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

        Session("NEW_CODIGOHOT") = TextBox100.Text
        Session("GRUPO") = TextBox24.Text
        Session("NEW_NOMBRE") = TextBox1.Text
        Session("NEW_TELEFONO") = TextBox2.Text
        Session("NEW_DIRECCION") = TextBox3.Text
        Session("NEW_POBLACION") = TextBox4.Text
        Session("NEW_CODPOSTAL") = TextBox5.Text
        Session("NEW_CIF") = TextBox6.Text
        Session("NEW_NUMHABITACIONES") = TextBox7.Text
        Session("NEW_NOMBRE_FISCAL") = TextBox8.Text
        Session("NEW_ID_POLICIA") = TextBox9.Text
        Session("NEW_SECUENCIA_POLICIA") = TextBox10.Text
        Session("NEW_RUTA_POLICIA") = TextBox11.Text
        Session("NEW_CAMBIO_SABANA") = TextBox12.Text
        Session("NEW_ULTIMNUMFACT") = TextBox13.Text
        Session("NEW_ULTIMNUMAB") = TextBox14.Text
        Session("NEW_TIPOLOGIASAL") = TextBox15.Text
        Session("NEW_E_MAIL") = TextBox16.Text
        Session("NEW_CAMAS") = TextBox17.Text
        Session("NEW_CAMASEXT") = TextBox18.Text
        Session("NEW_CUNAS") = TextBox19.Text
        Session("NEW_SEGMENTOCASA") = TextBox20.Text
        Session("NEW_CATEGORIAHOTEL") = TextBox21.Text
        Session("NEW_Web") = TextBox22.Text
        Session("NEW_IMPTASATURI") = TextBox23.Text
        Session("NEW_TASATURISITICA") = CheckBox1.Checked
        Session("NEW_CIERREAUT") = CheckBox2.Checked
        Session("NEW_IMPUESTOINCL") = CheckBox3.Checked
        Session("NEW_REGBB") = CheckBox4.Checked
        Session("NEW_REGMP") = CheckBox5.Checked
        Session("NEW_REGPC") = CheckBox6.Checked






        Cmd.Connection = Cn

        If Session("HotelDatos") = True Then

            Cmd.CommandText = "SET LANGUAGE SPANISH EXEC.SP_UPDATE_MANTENIMIENTO_DATOS 
             '" & Session("NewHotelID") & "'
             ,'" & Session("NEW_CODIGOHOT") & "'
             ,'" & Session("NEW_NOMBRE") & "'
             ,'" & Session("NEW_TELEFONO") & "' 
             ,'" & Session("NEW_DIRECCION") & "'
             ,'" & Session("NEW_POBLACION") & "'
             ,'" & Session("NEW_CODPOSTAL") & "'
             ,'" & Session("NEW_CIF") & "'
             ,'" & Session("NEW_NUMHABITACIONES") & "' 
             ,'" & Session("NEW_NOMBRE_FISCAL") & "'
             ,'" & Session("NEW_ID_POLICIA") & "'
             ,'" & Session("NEW_SECUENCIA_POLICIA") & "'
             ,'" & Session("NEW_RUTA_POLICIA") & "'
             ,'" & Session("NEW_CAMBIO_SABANA") & "'
             ,'" & Session("NEW_ULTIMNUMFACT") & "'
             ,'" & Session("NEW_ULTIMNUMAB") & "'
             ,'" & Session("NEW_TIPOLOGIASAL") & "'
             ,'" & Session("NEW_E_MAIL") & "'
             ,'" & Session("NEW_CAMAS") & "'
             ,'" & Session("NEW_CAMASEXT") & "' 
             ,'" & Session("NEW_CUNAS") & "'
             ,'" & Session("NEW_SEGMENTOCASA") & "'
             ,'" & Session("NEW_CATEGORIAHOTEL") & "' 
             ,'" & Session("NEW_Web") & "'
             ,'" & Replace(Session("NEW_IMPTASATURI"), ",", ".") & "'  
             ,'" & Session("NEW_TASATURISITICA") & "'
             ,'" & Session("NEW_CIERREAUT") & "'
             ,'" & Session("NEW_IMPUESTOINCL") & "'
             ,'" & Session("NEW_REGBB") & "'
             ,'" & Session("NEW_REGMP") & "'
             ,'" & Session("NEW_REGPC") & "'
             ,'" & Session("GRUPO") & "'
             ,'0'
               "
        Else

            Cmd.CommandText = "SET LANGUAGE SPANISH EXEC.SP_NEW_HOTEL 
             '" & Session("NewHotelID") & "'
             ,'" & Session("NEW_CODIGOHOT") & "'
             ,'" & Session("NEW_NOMBRE") & "'
             ,'" & Session("NEW_TELEFONO") & "' 
             ,'" & Session("NEW_DIRECCION") & "'
             ,'" & Session("NEW_POBLACION") & "'
             ,'" & Session("NEW_CODPOSTAL") & "'
             ,'" & Session("NEW_CIF") & "'
             ,'" & Session("NEW_NUMHABITACIONES") & "' 
             ,'" & Session("NEW_NOMBRE_FISCAL") & "'
             ,'" & Session("NEW_ID_POLICIA") & "'
             ,'" & Session("NEW_SECUENCIA_POLICIA") & "'
             ,'" & Session("NEW_RUTA_POLICIA") & "'
             ,'" & Session("NEW_CAMBIO_SABANA") & "'
             ,'" & Session("NEW_ULTIMNUMFACT") & "'
             ,'" & Session("NEW_ULTIMNUMAB") & "'
             ,'" & Session("NEW_TIPOLOGIASAL") & "'
             ,'" & Session("NEW_E_MAIL") & "'
             ,'" & Session("NEW_CAMAS") & "'
             ,'" & Session("NEW_CAMASEXT") & "' 
             ,'" & Session("NEW_CUNAS") & "'
             ,'" & Session("NEW_SEGMENTOCASA") & "'
             ,'" & Session("NEW_CATEGORIAHOTEL") & "' 
             ,'" & Session("NEW_Web") & "'
             ,'" & Replace(Session("NEW_IMPTASATURI"), ",", ".") & "'  
             ,'" & Session("NEW_TASATURISITICA") & "'
             ,'" & Session("NEW_CIERREAUT") & "'
             ,'" & Session("NEW_IMPUESTOINCL") & "'
             ,'" & Session("NEW_REGBB") & "'
             ,'" & Session("NEW_REGMP") & "'
             ,'" & Session("NEW_REGPC") & "'
             ,'" & Session("GRUPO") & "'
             ,'" & Session("id_usuario") & "'
             ,'0'
              
 
              "

        End If




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

        Label100.Text = "testaceptar"



    End Sub

    Protected Sub Button13_Click(sender As Object, e As EventArgs) Handles Button13.Click
        Label100.Text = "testcancelar"

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
                        Cmd.CommandText = "UPDATE hotel_datos 
                                        SET NOMBRE = '" & dbfreader.GetString(dbfreader.Table.Columns.Item(43).Name.ToString) & "' 
                                        ,   ULTIMNUMFACT = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(0).Name.ToString) & "' 
                                        ,   ULTIMNUMAB = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(55).Name.ToString) & "' 
                                        ,   CIF = '" & dbfreader.GetString(dbfreader.Table.Columns.Item(63).Name.ToString) & "' 
                                        ,   CAMASEXT = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(163).Name.ToString) & "' 
                                        ,   CUNAS = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(164).Name.ToString) & "' 
                                        ,   CAMAS = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(4).Name.ToString) & "' 
                                        ,   NUMHABITACIONES = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(3).Name.ToString) & "' 
                                        ,   NOMBRE_FISCAL = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(43).Name.ToString) & "'

                                        WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' "
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


    Public Sub CARGADBF2()

        ' Cmd.CommandText = "insert into hotel_datos_rack values ('" & Session("NewHotelID") & "','" & dbfreader.GetString("HABITACIO") & "','" & dbfreader.GetString("TIPUS") & "','" & dbfreader.GetString("MODULO1") & "','" & dbfreader.GetString("MODULO2") & "','" & dbfreader.GetString("MODULO3") & "','" & dbfreader.GetString("MODULO4") & "',SUBSTRING ('" & dbfreader.GetString("HABITACIO") & "' ,1,1))"



        'If IsPostBack Then
        Dim path As String = Server.MapPath("~/DBF/")
        Dim fileOK As Boolean = False
        If FileUpload2.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.
                    GetExtension(FileUpload2.FileName).ToLower()
            Dim allowedExtensions As String() =
                    {".DBF", ".dbf"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next
            If fileOK Then
                Try
                    FileUpload2.PostedFile.SaveAs(path &
                             FileUpload2.FileName)



                    Dim ruta As Stream = File.Open(path & FileUpload2.FileName, FileMode.Open, FileAccess.Read)
                    '   Dim ruta As Stream = File.Open("~/DBF/TIPOHAB.DBF", FileMode.Open, FileAccess.Read)
                    Dim dbftable As Table = NDbfReader.Table.Open(ruta)
                    Dim dbfreader As Reader = dbftable.OpenReader(Encoding.ASCII)


                    'MsgBox(FileUpload1.PostedFile.InputStream.ToString)

                    While (dbfreader.Read())


                        'MsgBox(dbfreader.Table.Columns.Count.ToString)
                        Cmd.Connection = Cn
                        Cmd.CommandText = "UPDATE hotel_datos 
                                        SET TELEFONO = '" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "' 
                                        ,   DIRECCION = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(0).Name.ToString) & "' 
                                        ,   POBLACION = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(3).Name.ToString) & "' 
                                        ,   ID_POLICIA = '" & dbfreader.GetString(dbfreader.Table.Columns.Item(19).Name.ToString) & "' 
                                        ,   SECUENCIA_POLICIA = '" & dbfreader.GetValue(dbfreader.Table.Columns.Item(40).Name.ToString) & "' 
                                        

                                        WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' "
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

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        CARGADBF()

    End Sub
    Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
        CARGADBF2()

    End Sub


End Class