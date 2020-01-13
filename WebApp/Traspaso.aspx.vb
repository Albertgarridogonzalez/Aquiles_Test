
Imports System.Data.SqlClient
    Imports System.Net
Imports System.Text
Imports Newtonsoft.Json
Imports System.IO
Imports System.Collections.Generic
Imports System.Linq
Public Class Traspaso

    Inherits Page
    Private urlToPost As String = ""
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
        If Session("ADMIN") = False Then
            Response.Redirect("/Login")
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


            Cn.Close()

            Dim sql_query2 As New SqlCommand

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
                    Image2.Visible = False
                Else
                    Image1.Visible = False
                    Image2.Visible = False

                End If
            End If
            sql_result.Close()

            Label1.Text = "Group : " & Grupo
            Label2.Text = "Hotel : " & Hotel
            Label3.Text = database
            Session("Server") = servidor
            Session("DDBB") = database

            If Last_Cierre < "1/1/2018" Then
                Last_Cierre = Today
            End If



            TextBox2.Text = Last_Cierre
            Session("Parametro") = 0
            Button5.Visible = False


            Cn.Close()
        Catch ex As Exception
            Console.WriteLine("ERROR EN Busca_Hotel: " + ex.Message)
        End Try
    End Sub

    Private Sub Check_Status(Hotel)
        Try

            Dim sql_query2 As New SqlCommand
            Dim sql_result As SqlDataReader

            Cn.Open()
            sql_query2.Connection = Cn

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
                    Image2.Visible = False
                Else
                    Image1.Visible = False
                    Image2.Visible = False

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
            't
            TextBox2.Text = Last_Cierre
            Session("Parametro") = 0
            Button5.Visible = False

            Cn.Close()

        Catch ex As Exception
            Console.WriteLine("ERROR EN Check_status: " + ex.Message)
        End Try
    End Sub


    ' *******ACCIONES BOTONES ********

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Check_Status(DropDownList1.SelectedValue)

    End Sub


    Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Button5.Visible = True
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
        CheckBox12.Checked = True
        CheckBox13.Checked = True
        CheckBox14.Checked = True



    End Sub

    Protected Sub Check_Btn(sender As Object, e As EventArgs) Handles Button1.Click
        Busca_Hotel()
        Check_Status(DropDownList1.SelectedValue)
        Button7.Visible = True
        Button8.Visible = True
        TextBox5.Visible = True
        TextBox3.Visible = True
        TextBox4.Visible = True
        Label4.Visible = True
        Label5.Visible = True
        Label6.Visible = True
        CheckBox2.Visible = True
        CheckBox3.Visible = True
        CheckBox4.Visible = True
        CheckBox5.Visible = True
        CheckBox6.Visible = True
        CheckBox7.Visible = True
        CheckBox8.Visible = True
        CheckBox9.Visible = True
        CheckBox10.Visible = True
        CheckBox11.Visible = True
        CheckBox12.Visible = True
        CheckBox13.Visible = True
        CheckBox14.Visible = True





    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs)
        TextBox1.Text = DropDownList1.SelectedValue.ToString
        Busca_Hotel()
    End Sub



    Public Function Get_Datos(Hotel)

        Dim sql_query2 As New SqlCommand
        Dim sql_result As SqlDataReader

        sql_query2.Connection = Cn
        Cn.Open()
        sql_query2.CommandText = "SELECT * FROM HOTELES  Join mantenimiento_dashboard on id = fk_id WHERE HOTEL = '" & DropDownList1.SelectedValue.ToString & "'"
        sql_result = sql_query2.ExecuteReader
        If sql_result.HasRows Then
            sql_result.Read()
            Id_Hotel = sql_result("ID")

        End If

        Cn.Close()
        sql_result.Close()

        Return Id_Hotel


    End Function





    Public Function GetJson() As String
        Dim cn2 As SqlConnection = Singleton.GetConnection
        Dim cmd As SqlCommand
        Dim rdr As SqlDataReader
        Dim res As String = String.Empty


        cmd = cn2.CreateCommand()
        If Session("procedimiento") = 2 Then
            cmd.CommandText = "Select CODIGOORR As code, DESCRIORR As name FROM 
            [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[ORISRESERVA] 
            where DESCRIORR <> '< Sin Asignar >' FOR JSON PATH;"



        End If
        If Session("procedimiento") = 3 Then
            cmd.CommandText = "SELECT TOP 10 CODIGOSEG As code, DESCRISEG As name FROM 
            [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[SEGMENTOS] 
	        where CODIGOSEG <> '+ char(39) +''+ char(39) +' FOR JSON PATH;"
        End If
        If Session("procedimiento") = 4 Then
            cmd.CommandText = "SELECT CODSUBCANAL As code, [DESCRIPCION] As name FROM 
            [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[SUBCANAL] 
	         where CODSUBCANAL <> '+ char(39) +''+ char(39) +' FOR JSON PATH;"
        End If
        If Session("procedimiento") = 5 Then
            cmd.CommandText = "SELECT top 10 CODIGO As code, DESCRIPCION As name FROM 
             [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[REQ_ESPECIALES] For JSON AUTO"


        End If
        If Session("procedimiento") = 6 Then
            ' cmd.CommandText = "" & Id_Hotel & "'"
        End If
        If Session("procedimiento") = 7 Then
            cmd.CommandText = "SELECT  ID As code, replace (replace (DESCRIPCION,'\','_'),'/','_') As name, NO_REEMBOLSABLE As nonRefundable , 0 As deadLineDay , 0 As deadLineHour ,  0  As policyChargeTypeCode , 0 As chargeValue , ORDEN_APLICACION As [order],NULL As remarks FROM
	        [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[MPOLITICA] FOR JSON PATH;"
        End If
        If Session("procedimiento") = 8 Then
            cmd.CommandText = "SELECT CODIGOCAR As code, DESCRICAR As name FROM
	        [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[CARACTERISTICAS] 
	        where CODIGOCAR <> '+ char(39) +''+ char(39) +' FOR JSON PATH;"
        End If
        If Session("procedimiento") = 9 Then
            cmd.CommandText = "SELECT CODTIPOHAB As code, DESCRIPCION As name FROM
	        [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[HOTEL_TIPO_HAB] 
	        where FK_CODIGOHOT = ' + @CODIGOHOT +' AND
	        CODTIPOHAB <> '+ char(39) +''+ char(39) +' FOR JSON PATH;"
        End If
        If Session("procedimiento") = 10 Then
            cmd.CommandText = "SELECT HMH.CODMODHAB As code, HMH.DESCRIPCION As name , HMH.PLANTA As floor,
	         CASE WHEN HH.fk_ESTADO = ''S'' THEN ''DIRTY''
	              WHEN HH.fk_ESTADO = ''L'' THEN ''CLEAN''
              END As moduleStatusTypeCode FROM
	         [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[HOTEL_MODULO_HAB] HMH
	         join [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[HOTEL_HABITACION] HH
	         ON HMH.FK_CODIGOHOT = HH.FK_CODIGOHOT
	         AND HMH.CODMODHAB = HH.CODHAB
	         where HMH.FK_CODIGOHOT = ' + @CODIGOHOT +' AND
	         HMH.CODMODHAB <> '+ char(39) +''+ char(39) +' FOR JSON PATH;"
        End If
        If Session("procedimiento") = 11 Then
            cmd.CommandText = "SELECT HH.CODHAB As code, HH.DESCRIPCION As name, HH.FK_TIPOHAB As propertyRoomTypeCode , NULL As remark ,  HH.CODHAB As moduleCode1 , NULL  As moduleCode2, NULL  As moduleCode3 , NULL  As moduleCode4 , NULL  As moduleCode5
            FROM [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[HOTEL_HABITACION] HH
            where HH.FK_CODIGOHOT = ' + @CODIGOHOT +' AND
	        HH.CODHAB <> '+ char(39) +''+ char(39) +' 
	        FOR JSON PATH;"
        End If
        If Session("procedimiento") = 12 Then
            cmd.CommandText = "SELECT CODIGOCP As code, DESCRIPCIONS As name, 
	         CASE WHEN FK_CODTIPO_CONCEPTO = ''P'' THEN ''Board''
	              WHEN FK_CODTIPO_CONCEPTO = ''H'' THEN ''Accommodation''
		         WHEN FK_CODTIPO_CONCEPTO = ''D'' THEN ''Deposit''
	              WHEN TIPO_CARGO  = ''A'' THEN ''Advance''
		         WHEN TIPO_CARGO  = ''T'' THEN ''Tax''
		         WHEN CODIGOCP  IN 
		         (''IVA0'',
                    ''IVA1'',
		          ''IVA2'',
		          ''IVA3'') THEN ''Tax''
		          ELSE ''Service''
		          end As productTypeCode 
            
              FROM [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[RELCONCSPRODUC] 
              where CODIGOHOT = ' + @CODIGOHOT +' AND
	         CODIGOCP <> '+ char(39) +''+ char(39) +' 
	          FOR JSON PATH;"
        End If
        If Session("procedimiento") = 13 Then
            cmd.CommandText = "SELECT CODEMPRESA As code, NOMBRE As name, null As taxid, DIRECCION As street  , POBLACION As city  , PROVINCIA As stateProv , CODPOSTAL As postalCode  , CODPAIS As  countryCode  ,
            TELEF1 As phoneNumber  , TELEF2 As phoneNumber2 , FAX As fax , EMAIL As email  , NULL As sourceCode   
            FROM [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[CLIENTE] 
            WHERE TIPO_EMPRESA <> ''PAR''
            AND CODEMPRESA <> 0
	        FOR JSON PATH;"
        End If
        If Session("procedimiento") = 14 Then
            cmd.CommandText = " SELECT  
             CI.DOC_TIPO As documentTypeCode ,
             CI.DOC_NUM As documentNumber ,
             CI.DOC_NOMBRE As givenName ,
             CI.DOC_APELLIDO1  As middleName ,
             CI.DOC_APELLIDO2 As  surName ,
             CASE WHEN SEXO = ''M'' THEN ''Male''
                  WHEN SEXO = ''F'' THEN ''Female''
             	ELSE ''
             	END As genderTypeCode ,
             CI.DOC_FECHA_NACE As birthDate , 
             C.CODPAIS As  birthCountryCode   ,
             C.POBLACION As birthPlace,
             CI.DOC_FECHA_EXPEDIDO As effectiveDate,
             CI.DOC_FECHA_EXPEDIDO + 3650 As expireDate ,
             C.DIRECCION As street,
             C.POBLACION As city  , 
             C.PROVINCIA As stateProv ,
             C.CODPAIS As  countryCode  ,
             C.CODPOSTAL As postalCode  ,
             C.CODPAIS As  countryCode  ,
             C.TELEF1 As phoneNumber  , 
             C.TELEF2 As phoneNumber2 ,
             FAX As fax ,
             C.EMAIL As email  ,
             NULL As remark 
             FROM  [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[CLIENTE]  C
             JOIN  [" + Session("Server") + "]." + Session("DDBB") + ".[dbo].[CLIENTE_IDENTIF] CI
             ON C.ID = CI.FK_ID_CLIENTE
             WHERE TIPO_EMPRESA = ''PAR''   
             AND C.CODEMPRESA <> 0
	        
	         FOR JSON PATH;"
        End If


        'cmd.CommandText = "exec.SP_TRASPASO_ORIGENES'" & DropDownList1.SelectedValue.ToString & "'FOR JSON auto;"
        '  para cuando es solo uno FOR JSON PATH, WITHOUT_ARRAY_WRAPPER ;"

        cn2.Open()
        Try
            rdr = cmd.ExecuteReader()
            rdr.Read()
            res = rdr(0)

        Catch ex As Exception
        End Try
        cn2.Close()
        rdr.Close()


        Return (res)

    End Function

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click

        Session("Chain_Id") = TextBox3.Text
        Session("Property_Id") = TextBox4.Text
        Session("Conexion_web") = TextBox5.Text


        Session("Hotel_Id") = Get_Datos(DropDownList1.SelectedValue.ToString)


        If CheckBox2.Checked = True Then
            Try
                Session("procedimiento") = 2
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importPropertySource/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())

                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                If ex.Message <> "" Then
                    Image3.Visible = False
                    Image16.Visible = True
                    Label7.Text = "ORIGENES : " + ex.Message

                End If

            End Try
            If Image16.Visible = False Then
                Image3.Visible = True
                Image16.Visible = False
                Label7.Text = "ORIGENES : Finalizado Correctamente!"
            End If
        End If


        If CheckBox3.Checked = True Then
            Try
                Session("procedimiento") = 3
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importPropertySegment/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception

                If ex.Message <> "" Then
                    Image4.Visible = False
                    Image17.Visible = True
                    Label8.Text = ex.Message
                    Label8.Text = "SEGMENTOS : " + ex.Message
                End If

            End Try
            If Image17.Visible = False Then
                Image4.Visible = True
                Image17.Visible = False
                Label8.Text = "SEGMENTOS : Finalizado Correctamente!"
            End If
        End If

        If CheckBox4.Checked = True Then
            Try
                Session("procedimiento") = 4
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importPropertyChannel/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception

                If ex.Message <> "" Then
                    Image5.Visible = False
                    Image18.Visible = True
                    Label9.Text = "CANALES : " + ex.Message
                End If

            End Try
            If Image18.Visible = False Then
                Image5.Visible = True
                Image18.Visible = False
                Label9.Text = "CANALES : Finalizado Correctamente!"
            End If
        End If


        If CheckBox5.Checked = True Then
            Try
                Session("procedimiento") = 5
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importRequirement/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception

                If ex.Message <> "" Then
                    Image6.Visible = False
                    Image19.Visible = True
                    Label10.Text = "REQUERIMIENTOS : " + ex.Message
                End If

            End Try
            If Image19.Visible = False Then
                Image6.Visible = True
                Image19.Visible = False
                Label10.Text = "REQUERIMIENTOS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If


        If CheckBox6.Checked = True Then
            Try
                Session("procedimiento") = 6
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importEvent/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image7.Visible = False
                    Image20.Visible = True
                    Label11.Text = "EVENTOS : " + ex.Message
                End If

            End Try
            If Image20.Visible = False Then
                Image7.Visible = True
                Image20.Visible = False
                Label11.Text = "EVENTOS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If



        If CheckBox7.Checked = True Then
            Try
                Session("procedimiento") = 7
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importPolicy/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image8.Visible = False
                    Image21.Visible = True
                    Label12.Text = "POLITICAS : " + ex.Message
                End If

            End Try
            If Image21.Visible = False Then
                Image8.Visible = True
                Image21.Visible = False
                Label12.Text = "POLITICAS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If



        If CheckBox8.Checked = True Then
            Try
                Session("procedimiento") = 8
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importPropertyRoomFeatureType/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image9.Visible = False
                    Image22.Visible = True
                    Label13.Text = "CARACTERISTICAS : " + ex.Message
                End If

            End Try
            If Image22.Visible = False Then
                Image9.Visible = True
                Image22.Visible = False
                Label13.Text = "CARACTERISTICAS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If



        If CheckBox9.Checked = True Then
            Try
                Session("procedimiento") = 9
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importPropertyRoomType/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image10.Visible = False
                    Image23.Visible = True
                    Label14.Text = "TIPOLOGIAS : " + ex.Message
                End If

            End Try
            If Image23.Visible = False Then
                Image10.Visible = True
                Image23.Visible = False
                Label14.Text = "TIPOLOGIAS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If



        If CheckBox10.Checked = True Then
            Try
                Session("procedimiento") = 10
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importModule/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image11.Visible = False
                    Image24.Visible = True
                    Label15.Text = "MODULOS : " + ex.Message
                End If

            End Try
            If Image24.Visible = False Then
                Image11.Visible = True
                Image24.Visible = False
                Label15.Text = "MODULOS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If


        If CheckBox11.Checked = True Then
            Try
                Session("procedimiento") = 11
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importRoom/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image12.Visible = False
                    Image25.Visible = True
                    Label16.Text = "HABITACIONES : " + ex.Message
                End If

            End Try
            If Image25.Visible = False Then
                Image12.Visible = True
                Image25.Visible = False
                Label16.Text = "HABITACIONES : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If



        If CheckBox12.Checked = True Then
            Try
                Session("procedimiento") = 12
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importProduct/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image13.Visible = False
                    Image26.Visible = True
                    Label17.Text = "CONCEPTOS : " + ex.Message
                End If

            End Try
            If Image26.Visible = False Then
                Image13.Visible = True
                Image26.Visible = False
                Label17.Text = "CONCEPTOS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If


        If CheckBox13.Checked = True Then
            Try
                Session("procedimiento") = 13
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importProfileCompany/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image14.Visible = False
                    Image27.Visible = True
                    Label18.Text = "AGENCIAS : " + ex.Message
                End If

            End Try
            If Image27.Visible = False Then
                Image14.Visible = True
                Image27.Visible = False
                Label18.Text = "AGENCIAS : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If

        If CheckBox14.Checked = True Then
            Try
                Session("procedimiento") = 14
                Dim Uri As New Uri(String.Format(Session("Conexion_web") & Session("Chain_Id") & "/property/" & Session("Property_Id") & "/importProfileCustomer/bulk"))
                Dim data = Encoding.UTF8.GetBytes(GetJson())
                Dim header As New WebHeaderCollection
                Dim result_post = SendRequest(Uri, data, "application/json", "POST", header)

            Catch ex As Exception
                'MsgBox(CheckBox3.Text + " : " + ex.Message)

                If ex.Message <> "" Then
                    Image15.Visible = False
                    Image28.Visible = True
                    Label19.Text = "PARTICULARES : " + ex.Message
                End If

            End Try
            If Image28.Visible = False Then
                Image15.Visible = True
                Image28.Visible = False
                Label19.Text = "PARTICULARES : Finalizado Correctamente!"
            End If
            'MsgBox(Data)
        End If





    End Sub

    Public Function SendRequest(ByVal uri As Uri, ByVal jsonDataBytes As Byte(), ByVal contentType As String, ByVal method As String, ByVal header As WebHeaderCollection) As String

        Try
            Dim req As WebRequest = WebRequest.Create(uri)
            req.Headers = header
            req.ContentType = contentType
            req.Method = method
            req.ContentLength = jsonDataBytes.Length

            Dim svcCredentials = Convert.ToBase64String(ASCIIEncoding.ASCII.GetBytes("c1|tesipro" + ":" + "uly24401"))
            req.Headers.Add("Authorization", "Basic " + svcCredentials)

            Dim stream = req.GetRequestStream()
            stream.Write(jsonDataBytes, 0, jsonDataBytes.Length)
            stream.Close()

            Dim response = req.GetResponse().GetResponseStream()

            Dim reader As New StreamReader(response)
            Dim res = reader.ReadToEnd()
            reader.Close()
            response.Close()
            Return res
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try

    End Function




















    '************PARAMETROS BASE **********************

    Protected Sub Page_Load_Params(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
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
        CheckBox12.Checked = False
        CheckBox13.Checked = False
        CheckBox14.Checked = False
    End Sub



    ' ********************GRAFICA *************


End Class