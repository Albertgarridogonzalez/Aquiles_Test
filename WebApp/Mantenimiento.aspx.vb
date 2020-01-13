Imports System.Data.SqlClient
Imports System.Net
Imports System.Text
Public Class Mantenimiento

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




    ' *****************FUNCIONES****************** 

    Public Function Conexion_Tesipro()
        'If Session("Tesipro") = 1 Then

        '    Return ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
        'Else



        ' Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
        'End If

    End Function

    Public Sub Guarda_Log(PROCESO, CATEGORIA)


        Cmd.Connection = Cn
        Cmd.CommandText = "insert into LOG_USUARIO Values ('" & Session("Username") & "','" & PROCESO & "', GETDATE(),(select hotel from hoteles where id = '" & Session("Hotel_Id") & "')," & CATEGORIA & ")"
        Cmd.CommandTimeout = 300
        Cn.Open()
        Cmd.ExecuteNonQuery()
        Cn.Close()


    End Sub




    '   ***********CARGA DATOS PAGINA ********


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("TECNICO") = False Then
            Response.Redirect("/Login")
        End If

        If Session("ADMIN") = True Then
            Button7.Visible = True
            Button8.Visible = True
            Button10.Visible = True
        Else
            Button7.Visible = False
            Button8.Visible = False
            Button10.Visible = False
        End If

        TextBox1.Focus()



    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        Busca_Hotel()
    End Sub


    Public Sub Busca_Hotel()


        Try


            With Cmd
                .CommandType = CommandType.Text
                .CommandText = "SELECT * FROM HOTELES WHERE GRUPO LIKE '%" & TextBox1.Text & "%' OR ZONA
                           LIKE '%" & TextBox1.Text & "%' OR HOTEL LIKE '%" & TextBox1.Text & "%' OR PAIS 
                           LIKE '%" & TextBox1.Text & "%' OR CIUDAD LIKE '%" & TextBox1.Text & "%' ORDER BY HOTEL"
                .Connection = Cn
            End With
            Da.SelectCommand = Cmd
            Dt = New DataTable
            Da.Fill(Dt)
            With DropDownList1
                .DataSource = Dt
                DropDownList1.DataTextField = "HOTEL"
                DropDownList1.DataValueField = "HOTEL"
                DropDownList1.DataBind()

            End With


        Catch ex As Exception

        End Try
        Dim Dt2 As DataTable
        Dim Da2 As New SqlDataAdapter
        Dim Cmd2 As New SqlCommand

        With Cmd2
            .CommandType = CommandType.Text
            .CommandText = "SELECT * FROM MANTENIMIENTO_PROCESOS ORDER BY COD_PROCESO"
            .Connection = Cn
        End With
        Da2.SelectCommand = Cmd2
        Dt2 = New DataTable
        Da2.Fill(Dt2)
        With DropDownList2
            .DataSource = Dt2
            DropDownList2.DataTextField = "nom_proceso"
            DropDownList2.DataValueField = "nom_proceso"
            DropDownList2.DataBind()

        End With
        Cn.Close()

        'Dim sql_connection2 As New SqlConnection
        Dim sql_query2 As New SqlCommand


        'sql_connection2.ConnectionString = Conexion_Tesipro()
        sql_query2.Connection = Cn
        Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
        sql_result = sql_query2.ExecuteReader
        If sql_result.HasRows Then
            sql_result.Read()
            Id_Hotel = sql_result("id")
            servidor = sql_result("servidor")
            database = sql_result("db")
            usuario = sql_result("usuario")
            password = sql_result("pw")
            Grupo = sql_result("grupo")
            Hotel = sql_result("hotel")
            Codigohot = sql_result("codigohot")
            Status = sql_result("e_2")
            If sql_result("last_cierre") Is DBNull.Value Then
                Last_Cierre = Today
            Else
                Last_Cierre = sql_result("last_cierre")
            End If


            If sql_result("e_2") = False Then
                Image1.Visible = False
                Image2.Visible = True
                ALERT_TEST.Style.Add("visibility", "VISIBLE")
            Else
                Image1.Visible = True
                Image2.Visible = False
                ALERT_TEST.Style.Add("visibility", "HIDDEN")

            End If
        End If
        sql_result.Close()
        Cn.Close()

        Label1.Text = "Group : " & Grupo
        Label2.Text = "Hotel : " & Hotel
        Label3.Text = database


        If Last_Cierre < "1/1/2018" Then
            Last_Cierre = Today
        End If



        TextBox2.Text = Last_Cierre
        Session("Parametro") = 0
        Button5.Visible = False
        TextBox10.Visible = False
        TextBox11.Visible = False
        TextBox12.Visible = False
        TextBox13.Visible = False
        Label10.Visible = False
        Label11.Visible = False
        Label12.Visible = False
        Label13.Visible = False
        Label15.Visible = False
        Button9.Visible = False
    End Sub

    Private Sub Check_Status(Hotel)
        'Dim sql_connection2 As New SqlConnection
        Dim sql_query2 As New SqlCommand
        Dim sql_result As SqlDataReader

        'sql_connection2.ConnectionString = Conexion_Tesipro()
        sql_query2.Connection = Cn
        Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
        sql_result = sql_query2.ExecuteReader
        If sql_result.HasRows Then
            sql_result.Read()
            Id_Hotel = sql_result("id")
            servidor = sql_result("servidor")
            database = sql_result("db")
            usuario = sql_result("usuario")
            password = sql_result("pw")
            Grupo = sql_result("grupo")
            Hotel = sql_result("hotel")
            Codigohot = sql_result("codigohot")
            Status = sql_result("e_2")
            If sql_result("last_cierre") Is DBNull.Value Then
                Last_Cierre = Today
            Else
                Last_Cierre = sql_result("last_cierre")
            End If


            If sql_result("e_2") = False Then
                Image1.Visible = False
                Image2.Visible = True
                ALERT_TEST.Style.Add("visibility", "VISIBLE")
            Else
                Image1.Visible = True
                Image2.Visible = False
                ALERT_TEST.Style.Add("visibility", "HIDDEN")
            End If
            Cn.Close()

        End If



        Dim Dt2 As DataTable
        Dim Da2 As New SqlDataAdapter
        Dim Cmd2 As New SqlCommand

        With Cmd2
            .CommandType = CommandType.Text
            .CommandText = "SELECT * FROM MANTENIMIENTO_PROCESOS ORDER BY COD_PROCESO"
            .Connection = Cn
        End With
        Da2.SelectCommand = Cmd2
        Dt2 = New DataTable
        Da2.Fill(Dt2)
        With DropDownList2
            .DataSource = Dt2
            DropDownList2.DataTextField = "nom_proceso"
            DropDownList2.DataValueField = "nom_proceso"
            DropDownList2.DataBind()

        End With
        Cn.Close()


        sql_result.Close()


        Label1.Text = "Group : " & Grupo
        Label2.Text = "Hotel : " & Hotel
        Label3.Text = database

        If Last_Cierre < "1/1/2018" Then
            Last_Cierre = Today
        End If
        't
        TextBox2.Text = Last_Cierre
        Session("Parametro") = 0
        Button5.Visible = False
        TextBox10.Visible = False
        TextBox11.Visible = False
        TextBox12.Visible = False
        TextBox13.Visible = False
        Label10.Visible = False
        Label11.Visible = False
        Label12.Visible = False
        Label13.Visible = False
        Label15.Visible = False
        Button9.Visible = False

    End Sub


    ' *******ACCIONES BOTONES ********

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Check_Status(DropDownList1.SelectedValue)

    End Sub

    Protected Sub Check_Btn(sender As Object, e As EventArgs) Handles Button1.Click
        Busca_Hotel()
        Check_Status(DropDownList1.SelectedValue)
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        TextBox1.Text = DropDownList1.SelectedValue.ToString
        Busca_Hotel()
    End Sub

    Protected Sub Button4_Click() Handles Button4.Click
        Session("Hotel_Id") = Get_Datos(DropDownList1.SelectedValue.ToString)

        Label15.Visible = True
        If Session("Parametro") = "1" Then
            Label15.Text = "Esta opción reconstruye la producción del día , informe de producción y estadísticas.Por ejemplo si no aparece el día en la consulta de ocupación , eso lo restaura, o si aparecenmal los datos en el Informe de producción también lo restaura"
        End If

        If Session("Parametro") = "2" Then
            Label15.Text = "Esta opción Revisa los errores de cierre y vuelve a lanzar los procedimientos que quedan por terminar , también activa el semáforo de bajada de reservas , se recomienda recalcular el informe de producción después de este procedimiento"
        End If

        If Session("Parametro") = "3" Then
            Label15.Text = "ANTIGUO REVISAR HABITACIONES Y MODULOS ,En ocasiones hay reservas que quedan con número de habitación en la reserva pero no en el planning , si no está en CKI y esa habitación no está asignada a otra reserva , esto reconstruye el planning y rack"
        End If
        If Session("Parametro") = "4" Then
            Label15.Text = "Reconstuye los cargos de Fof_Folio desde los datos de Crs_Dreserva_Detalle solo reservas a futuro que no están en checkin"
        End If
        If Session("Parametro") = "5" Then
            Label15.Text = "OJO PELIGROSO , NO USAR! Reconstuye los cargos de Fof_Folio desde los datos de Crs_Dreserva_Detalle para una reserva en Checkin"
        End If

        If Session("Parametro") = "6" Then
            Label15.Text = "Indica si un folio es cerrable o no cerrable"
        End If


        If Session("Parametro") = "7" Then
            Label15.Text = "Cargos qeu desaparecen al hacer cargos automáticos (realmente están en la primera factura cerrada y esto lo mueve a la actual)"
        End If

        If Session("Parametro") = "8" Then
            Label15.Text = "OJO PELIGRO solo usar si el grupo esta totalmente pickupeado, Esto elimina los bloqueos que se quedan bloqueados y falsean las proformas "
        End If
        If Session("Parametro") = "9" Then
            Label15.Text = "Cambiar comisionista del Folio para poder traspasar cargos (no es lo más correcto pero a veces hay que hacerlo porque el cliente lo pide'"
        End If
        If Session("Parametro") = "10" Then
            Label15.Text = "Cuando una factrua no se cierra ni genera número de factura (normalmente es una recuperada)"
        End If
        If Session("Parametro") = "11" Then
            Label15.Text = "Insertar la diferencia del cuadre día del informe de producción para que cuadre"
        End If
        If Session("Parametro") = "12" Then
            Label15.Text = "Inserta un codigo de folio en una folio que ha perdido el código"
        End If
        If Session("Parametro") = "13" Then
            Label15.Text = "No se puede abrir una estancia y se queda buggeada"
        End If
        If Session("Parametro") = "14" Then
            Label15.Text = "Las reservas modificadas desde STMD a veces pierden la vinculación con el depósito , este procedimiento lo vuelve a vincular"
        End If
        If Session("Parametro") = "15" Then
            Label15.Text = "Forzar cierre de folio"
        End If
        If Session("Parametro") = "16" Then
            Label15.Text = "Desact Control Cierre Fact"
        End If


        If TextBox14.Text = "" Then
            TextBox14.Text = "0"
        End If
        Session("Decimal1") = TextBox14.Text

    End Sub


    Protected Sub Button3_Click() Handles Button3.Click
        Button3.Visible = False
    End Sub




    '************  PARAMETROS  **************


    Public Function Get_Datos(Hotel)
        'Dim sql_connection2 As New SqlConnection
        Dim sql_query2 As New SqlCommand
        Dim sql_result As SqlDataReader

        'sql_connection2.ConnectionString = Conexion_Tesipro()
        sql_query2.Connection = Cn
        Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
        sql_result = sql_query2.ExecuteReader
        If sql_result.HasRows Then
            sql_result.Read()
            Id_Hotel = sql_result("ID")

        End If
        Cn.Close()
        Return Id_Hotel
    End Function





    ' ************** CARGA PARAMETROS  ******************

    Protected Sub Busca_procesos(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        'Dim sql_connection3 As New SqlConnection
        Dim sql_query3 As New SqlCommand
        Dim sql_result3 As SqlDataReader

        'sql_connection3.ConnectionString = Conexion_Tesipro()
        sql_query3.Connection = Cn
        Cn.Open()
        sql_query3.CommandText = "SELECT * FROM MANTENIMIENTO_PROCESOS WHERE NOM_PROCESO = '" & DropDownList2.SelectedValue.ToString & "'"
        sql_result3 = sql_query3.ExecuteReader
        If sql_result3.HasRows Then
            sql_result3.Read()
            Session("Parametro") = sql_result3("cod_proceso")
        End If
        Cn.Close()

        TextBox10.Visible = False
        TextBox11.Visible = False
        TextBox12.Visible = False
        TextBox13.Visible = False
        TextBox14.Visible = False

        CheckBox2.Visible = False
        CheckBox3.Visible = False

        Label10.Visible = False
        Label11.Visible = False
        Label12.Visible = False
        Label13.Visible = False

        Button5.Visible = True

        If Session("Parametro") = "1" Then
            Session("CATEGORIA") = 60

            TextBox12.Visible = True
            TextBox13.Visible = True
            Label12.Visible = True
            Label13.Visible = True
            TextBox12.Text = Last_Cierre
            TextBox13.Text = Last_Cierre


            TextBox14.Text = "0"

            Label12.Text = "DESDE"
            Label13.Text = "HASTA"
        End If


        If Session("Parametro") = "2" Then
            Session("CATEGORIA") = 60

            TextBox12.Visible = True

            Label12.Visible = True
            Button9.Visible = True

            TextBox12.Text = Last_Cierre

            Label12.Text = "FECHA"
            TextBox14.Text = "0"

        End If

        If Session("Parametro") = "3" Then
            Session("CATEGORIA") = 40
            TextBox14.Text = "0"

        End If

        If Session("Parametro") = "4" Then
            Session("CATEGORIA") = 50

            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox14.Text = "0"


            Label10.Text = "NUMERO RESERVA"

        End If

        If Session("Parametro") = "5" Then
            Session("CATEGORIA") = 90
            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "NUMERO RESERVA"

        End If


        If Session("Parametro") = "6" Then
            Session("CATEGORIA") = 40

            CheckBox2.Visible = True
            CheckBox3.Visible = True

            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "ID FOLIO"


        End If

        If Session("Parametro") = "7" Then
            Session("CATEGORIA") = 60
            TextBox10.Visible = True
            TextBox11.Visible = True

            Label10.Visible = True
            Label11.Visible = True

            TextBox10.Text = "0"
            TextBox10.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "ID ESTANCIA"
            Label11.Text = "FOLIO DESTINO"

        End If

        If Session("Parametro") = "8" Then
            Session("CATEGORIA") = 50
            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox10.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "NUMERO RESERVA"


        End If

        If Session("Parametro") = "9" Then
                Session("CATEGORIA") = 60
            TextBox10.Visible = True
            TextBox11.Visible = True

            Label10.Visible = True
            Label11.Visible = True

            TextBox10.Text = "0"
            TextBox10.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "ID FOLIO ORIGEN"
            Label11.Text = "ID FOLIO DESTINO"


        End If



        If Session("Parametro") = "10" Then
            Session("CATEGORIA") = 40
            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox10.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "ID FOLIO"


        End If

        If Session("Parametro") = "11" Then
            Session("CATEGORIA") = 40
            TextBox14.Visible = True
            TextBox12.Visible = True
            TextBox14.TextMode = TextBoxMode.SingleLine

            Label10.Visible = True
            Label12.Visible = True

            TextBox14.Text = "0"
            TextBox14.Text = "0"

            Label10.Text = "DIFERENCIA"
            Label12.Text = "DESDE"



        End If


        If Session("Parametro") = "12" Then
            Session("CATEGORIA") = 40

            'CheckBox2.Visible = True

            TextBox10.Visible = True
            TextBox11.Visible = True
            Label10.Visible = True
            Label11.Visible = True

            TextBox10.Text = "0"
            TextBox11.Text = "0"
            TextBox11.TextMode = TextBoxMode.SingleLine

            Label10.Text = "ID FOLIO"
            Label11.Text = "CODIGO FOLIO"

        End If

        If Session("Parametro") = "13" Then
            Session("CATEGORIA") = 40

            'CheckBox2.Visible = True

            TextBox10.Visible = True
            TextBox11.Visible = False
            Label10.Visible = True
            Label11.Visible = False

            TextBox10.Text = "0"
            TextBox11.Text = "0"

            Label10.Text = "ID DRESERVA"
            Label11.Text = "CODIGO FOLIO"

        End If

        If Session("Parametro") = "14" Then
            Session("CATEGORIA") = 50

            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox14.Text = "0"


            Label10.Text = "NUMERO RESERVA"

        End If
        If Session("Parametro") = "15" Then
            Session("CATEGORIA") = 50

            TextBox10.Visible = True

            Label10.Visible = True

            TextBox10.Text = "0"
            TextBox14.Text = "0"


            Label10.Text = "ID FOLIO"

        End If


        If Session("Parametro") = "16" Then
            Session("CATEGORIA") = 50

            TextBox10.Visible = False

            Label10.Visible = False

            TextBox10.Text = "0"
            TextBox14.Text = "0"


            Label10.Text = ""

        End If


    End Sub


    ' ****LANZA A SQL **********

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click

        Session("PParametro1") = TextBox10.Text
        Session("PParametro2") = TextBox11.Text
        Session("Decimal1") = TextBox14.Text



        If TextBox12.Text = "" Then
            TextBox12.Text = "01/01/2018"
        End If

        Dim desde As Date
        desde = Convert.ToDateTime(TextBox12.Text)
        ' desde = desde.ToString("dd/MM/yyyy")
        'Format(desde, "dd-mm-yyyy")
        Session("Desde") = desde


        'dy = Day(Date())
        'mth = Month(Date())
        'yr = Year(Date())
        'Response.Write(dy&"/"&mth&"/"&yr)

        'Label12.Text = desde
        'Label13.Text = Session("Desde")


        If TextBox13.Text = "" Then
            TextBox13.Text = "01/01/2018"
        End If

        Dim hasta As Date
        hasta = Convert.ToDateTime(TextBox13.Text)
        ' hasta = hasta.ToString("dd/MM/yyyy")
        'Format(hasta, "dd-mm-yyyy")
        Session("Hasta") = hasta

        If CheckBox2.Checked Then
            Session("Pbit") = 1
        Else
            Session("Pbit") = 0
        End If

        If CheckBox3.Checked Then
            Session("PParametro2") = 1
        Else
            Session("PParametro2") = 0
        End If

        If Session("Parametro") = "12" Then
            Session("PVarchar") = TextBox11.Text

        End If




        Try


            Mantenimiento_Hotel(Session("Hotel_Id"), Session("Desde"), Session("Hasta"), Session("PVarchar"), Session("PDatetime"), Session("PParametro1"), Session("PParametro2"), Session("Pbit"), Session("Decimal1"), Session("Parametro"))
            Guarda_Log(Session("Parametro"), Session("CATEGORIA"))


        Catch ex As Exception

            Label15.Visible = True
            Label15.Text = "ERROR CONEXION ! CONTACTA CON EL ADMINISTRADOR  :  " & ex.Message
            Cn.Close()



        End Try

        Session("PVarchar") = ""
        Session("PDatetime") = ""
        Session("PParametro1") = ""
        Session("PParametro2") = ""
        Session("Pbit") = ""
        Session("Decimal1") = "0"

    End Sub

    Protected Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click

        Session("PParametro1") = TextBox10.Text
        Session("PParametro2") = TextBox11.Text
        Session("Decimal1") = TextBox14.Text



        If TextBox12.Text = "" Then
            TextBox12.Text = "01/01/2018"
        End If

        Dim desde As Date
        desde = Convert.ToDateTime(TextBox12.Text)
        ' desde = desde.ToString("dd/MM/yyyy")
        'Format(desde, "dd-mm-yyyy")
        Session("Desde") = desde


        'dy = Day(Date())
        'mth = Month(Date())
        'yr = Year(Date())
        'Response.Write(dy&"/"&mth&"/"&yr)

        'Label12.Text = desde
        'Label13.Text = Session("Desde")


        If TextBox13.Text = "" Then
            TextBox13.Text = "01/01/2018"
        End If

        Dim hasta As Date
        hasta = Convert.ToDateTime(TextBox13.Text)
        ' hasta = hasta.ToString("dd/MM/yyyy")
        'Format(hasta, "dd-mm-yyyy")
        Session("Hasta") = hasta

        If CheckBox2.Checked Then
            Session("Pbit") = 1
        Else
            Session("Pbit") = 0
        End If

        If CheckBox3.Checked Then
            Session("PParametro2") = 1
        Else
            Session("PParametro2") = 0
        End If

        Try


            Mantenimiento_Hotel(Session("Hotel_Id"), Session("Desde"), Session("Hasta"), Session("PVarchar"), Session("PDatetime"), Session("PParametro1"), Session("PParametro2"), 1, Session("Decimal1"), Session("Parametro"))
            Guarda_Log(Session("Parametro"), Session("CATEGORIA"))


        Catch ex As Exception

            Label15.Visible = True
            Label15.Text = "ERROR CONEXION ! CONTACTA CON EL ADMINISTRADOR  :  " & ex.Message
            Cn.Close()



        End Try

        Session("PVarchar") = ""
        Session("PDatetime") = ""
        Session("PParametro1") = ""
        Session("PParametro2") = ""
        Session("Pbit") = ""
        Session("Decimal1") = "0"

    End Sub

    Public Sub Mantenimiento_Hotel(Hotel_Id, DESDE, HASTA, PVarchar, PDatetime, PParametro1, PParametro2, Pbit, Decimal1, PARAM)
        Cmd.Connection = Cn
        Cmd.CommandText = "SET LANGUAGE SPANISH INSERT INTO TAREA VALUES ('" & PARAM & "'
            ,''
            ,''
            ,''
            ,''
            ,'" & Session("Username") & "'
            ,''
            ,'" & Hotel_Id & "'
            ,'" & DESDE & "'
            ,'" & HASTA & "'
            ,'" & PVarchar & "'
            ,'" & PDatetime & "'
            ,'" & PParametro1 & "'
            ,'" & PParametro2 & "'
            ,'" & Pbit & "'
            ,'" & Decimal1 & "'            
            ,'" & PARAM & "')"
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
    End Sub

















    '************PARAMETROS BASE **********************

    Protected Sub Page_Load_Params(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label14.Text = Session("Parametro")

        If Session("Parametro") = 0 Then
            TextBox10.Visible = False
            TextBox11.Visible = False
            TextBox12.Visible = False
            TextBox13.Visible = False
            TextBox14.Visible = False





            Label10.Visible = False
            Label11.Visible = False
            Label12.Visible = False
            Label13.Visible = False
            Label15.Visible = False

            TextBox10.Text = ""
            TextBox11.Text = ""
            TextBox12.Text = ""
            TextBox13.Text = ""
            TextBox14.Text = ""


            Label10.Text = ""
            Label11.Text = ""
            Label12.Text = ""
            Label13.Text = ""



        End If


    End Sub



    ' ********************GRAFICA *************
    Private Sub Chart1_Click() Handles MyBase.Load
        Dim x As String
        'Dim Dt2 As DataTable
        'Dim Cn2 As New SqlConnection(Conexion_Tesipro())
        Dim Cmd2 As New SqlCommand

        'Cn2.ConnectionString = Conexion_Tesipro()
        Cmd2.Connection = Cn
        Cn.Open()
        'Cn2.Open()
        If CheckBox1.Checked Then
            Cmd2.CommandText = " SELECT top 5 COUNT (HOTEL) AS CANTIDAD , HOTEL FROM  [LOG_USUARIO] WHERE CATEGORIA > 30 GROUP BY HOTEL order by Hotel"
            x = "hotel"
            CheckBox1.Text = "Por Hotel"
            Button6.Text = "By Hotel"
        Else
            Cmd2.CommandText = " SELECT top 5 COUNT (PROCESO) AS CANTIDAD , PROCESO FROM  [LOG_USUARIO] WHERE CATEGORIA > 30 GROUP BY PROCESO order by Proceso"
            x = "PROCESO"
            CheckBox1.Text = "Por Proceso"
            Button6.Text = "By Process"
        End If


        sql_result = Cmd2.ExecuteReader
        If Sql_Result.HasRows Then

            Do While Sql_Result.Read()

                Chart1.Series("Series1").Points.AddXY(Sql_Result(x), Sql_Result("CANTIDAD"))

            Loop


        End If
        Cn.Close()
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        Chart1.Series.Clear()
        Chart1.Series.Add("Series1")
        Chart1_Click()
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        If CheckBox1.Checked = True Then
            'Button6.Text = "By Hotel"
            CheckBox1.Checked = False
        Else
            'Button6.Text = "By Process"
            CheckBox1.Checked = True
        End If


    End Sub

    Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click

        Response.Redirect("traspaso.aspx")

    End Sub
    Protected Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click


        ' CONEXIÓN

        'sql_query2.Connection = Cn
        'Cn.Open()
        'sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
        'sql_result = sql_query2.ExecuteReader
        'If sql_result.HasRows Then
        '    sql_result.Read()

        'Cn.ConnectionString = "Server=149.202.72.170;Database=MANTENIMIENTO;Uid=tesipro;Pwd=uly24401;"
        Cmd.Connection = Cn
        Cn.Open()
        Cmd.CommandText = "SELECT servidor, db,usuario,pw, GRUPO FROM HOTELES where ID = '" & Session("Hotel_Id") & "'
                             
                            GROUP BY servidor, db,usuario,pw,GRUPO  ORDER BY GRUPO"
        'GRUPO <> 'DERBY' AND CODIGOHOT <> '' AND SERVIDOR <> ''
        'Dim fileReader2 As String
        'fileReader2 = My.Computer.FileSystem.ReadAllText("C:\TESIPRO\A.GARRIDO\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\Mantenimiento_Hotel.sql")
        Dim fileReader As String
        fileReader = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\1_CHECK TABLAS.sql")
        Dim fileReader2 As String
        fileReader2 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\2_Config_log.sql")
        Dim fileReader3 As String
        fileReader3 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\3_Revisa _Cierre.sql")
        Dim fileReader33 As String
        fileReader33 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\3_Revisa _Cierre_2.sql")


        Dim fileReader4 As String
        fileReader4 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\4_Mantenimiento_Hotel.sql")
        Dim fileReader5 As String
        fileReader5 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\5_SP_INSTALACION_CARACTERISTICA.sql")
        Dim fileReader6 As String
        fileReader6 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\6_SP_INSTALACION_COPIAR_HOTEL.sql")
        Dim fileReader7 As String
        fileReader7 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\7_SP_INSTALACION_HOTEL_TIPOHAB.sql")
        Dim fileReader8 As String
        fileReader8 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\8_SP_INSTALACION_NEW_HOTEL.sql")
        Dim fileReader9 As String
        fileReader9 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\9_SP_INSTALACION_RACK.sql")
        Dim fileReader10 As String
        fileReader10 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\10_SP_INSTALACION_RACK_NULL.sql")
        Dim fileReader11 As String
        fileReader11 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\11_SP_INSTALACION_RUTAS.sql")
        Dim fileReader12 As String
        fileReader12 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\12_SP_INSTALACION_SEGMENTOS_ORIGENES.sql")
        Dim fileReader13 As String
        fileReader13 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\13_SP_INSTALACION_TIPOSHAB.sql")
        Dim fileReader14 As String
        fileReader14 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\14_SP_CREAR_CONCEPTO.sql")
        Dim fileReader15 As String
        fileReader15 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\15_SP_CREAR_CONCEPTO_CONCSPRODUC.sql")
        Dim fileReader16 As String
        fileReader16 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\16_SP_CREAR_CONCEPTO_RELCONCSPRODUC.sql")
        Dim fileReader17 As String
        fileReader17 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\17_SP_INSTALACION_COBRO.sql")
        Dim fileReader18 As String
        fileReader18 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\18_SP_INSTALACION_TRASPASOSOFT.sql")
        Dim fileReader19 As String
        fileReader19 = My.Computer.FileSystem.ReadAllText("D:\TESIPRO\ADMIN BACKUP\VISUAL_STUDIO\ManteWeb\WebApp\WebApp\SQL\19_SP_INSTALACION_CHECKIN.sql")


        sql_result = Cmd.ExecuteReader
        If sql_result.HasRows Then




            Do While sql_result.Read()

                servidor = sql_result("servidor")
                database = sql_result("db")
                usuario = sql_result("usuario")
                password = sql_result("pw")
                ' Codigohot = sql_result("CODIGOHOT")
                'ID = sql_result("id")

                Dim sql_connection2 As New SqlConnection

                Dim sql_check As New SqlCommand

                Try
                    sql_connection2.ConnectionString = "Server=" & servidor & ";Database=" & database & ";Uid=" & usuario & ";Pwd=" & password & ";"
                    sql_check.Connection = sql_connection2
                    sql_connection2.Open()
                    sql_check.CommandText = "IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_HOTEL')DROP PROCEDURE [dbo].[SP_MANTENIMIENTO_HOTEL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_CARACTERISTICA')DROP PROCEDURE [dbo].[SP_INSTALACION_CARACTERISTICA]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_COPIAR_HOTEL')DROP PROCEDURE [dbo].[SP_INSTALACION_COPIAR_HOTEL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_HOTEL_TIPOHAB')DROP PROCEDURE [dbo].[SP_INSTALACION_HOTEL_TIPOHAB]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_NEW_HOTEL')DROP PROCEDURE [dbo].[SP_INSTALACION_NEW_HOTEL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_RACK')DROP PROCEDURE [dbo].[SP_INSTALACION_RACK]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_RACK_NULL')DROP PROCEDURE [dbo].[SP_INSTALACION_RACK_NULL]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_RUTAS')DROP PROCEDURE [dbo].[SP_INSTALACION_RUTAS]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_SEGMENTOS_ORIGENES')DROP PROCEDURE [dbo].[SP_INSTALACION_SEGMENTOS_ORIGENES]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_TIPOSHAB')DROP PROCEDURE [dbo].[SP_INSTALACION_TIPOSHAB]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_MANTENIMIENTO_REVISA_CIERRE')DROP PROCEDURE [dbo].[SP_MANTENIMIENTO_REVISA_CIERRE]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CREAR_CONCEPTO')DROP PROCEDURE [dbo].[SP_CREAR_CONCEPTO]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CREAR_CONCEPTO_CONCSPRODUC')DROP PROCEDURE [dbo].[SP_CREAR_CONCEPTO_CONCSPRODUC]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CREAR_CONCEPTO_RELCONCSPRODUC')DROP PROCEDURE [dbo].[SP_CREAR_CONCEPTO_RELCONCSPRODUC]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_COBRO')DROP PROCEDURE [dbo].[SP_INSTALACION_COBRO]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_CHECKIN')DROP PROCEDURE [dbo].[SP_INSTALACION_CHECKIN]
                                            IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_INSTALACION_TRASPASOSOFT')DROP PROCEDURE [dbo].[SP_INSTALACION_TRASPASOSOFT]
                                            "

                    '[SP_MANTENIMIENTO_HOTEL]
                    Try

                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                        Session("SQL_ERROR") = "DROP_TABLAS"
                        ALERT.Style.Add("visibility", "VISIBLE")
                    End Try
                    Try
                        sql_check.CommandText = (fileReader)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "1_CHECK TABLAS"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader2)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "2"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader3)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Console.WriteLine(ex.ToString)
                        Try
                            sql_check.CommandText = (fileReader33)
                            sql_check.ExecuteNonQuery()
                        Catch ex2 As Exception


                            Session("SQL_ERROR") = "3 NI 3.2"
                            ALERT.Style.Add("visibility", "VISIBLE")
                            Console.WriteLine(ex.ToString)
                        End Try


                    End Try
                    Try
                        sql_check.CommandText = (fileReader4)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "4"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader5)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception

                        Session("SQL_ERROR") = "5"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader6)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "6"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader7)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "7"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader8)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "8"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader9)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "9"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader10)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "10"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader11)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "11"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader12)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "12"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader13)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "13"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader14)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "14"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader15)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "15"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader16)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "16"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader17)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "17"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader18)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "18"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try
                    Try
                        sql_check.CommandText = (fileReader19)
                        sql_check.ExecuteNonQuery()
                    Catch ex As Exception
                        Session("SQL_ERROR") = "19"
                        ALERT.Style.Add("visibility", "VISIBLE")
                        Console.WriteLine(ex.ToString)
                    End Try



                    sql_connection2.Close()

                Catch ex As Exception
                    Console.WriteLine(ex.ToString)
                End Try




            Loop

        End If

        sql_result.Close()
        Cn.Close()
        'MsgBox("PROCESO FINALIZADO")


    End Sub

    Protected Sub Button10_Click(sender As Object, e As EventArgs) Handles Button10.Click
        Cmd.Connection = Cn
        Cmd.CommandText = "exec.CHECK_LINKED_SERVER '" & Session("Hotel_Id") & "'"
        Cmd.CommandTimeout = 3000
        Try
            Cn.Open()
            Cmd.ExecuteNonQuery()
            Cn.Close()
        Catch ex As Exception
            Session("SQL_ERROR") = "ERROR LINKED SERVER"
            ALERT.Style.Add("visibility", "VISIBLE")
        End Try
        Cn.Close()


    End Sub
End Class