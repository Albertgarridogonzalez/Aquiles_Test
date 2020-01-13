Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Text
Imports ExcelDataReader
Imports NDbfReader

Public Class NEWHOTEL_TM

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





    '   ***********CARGA DATOS PAGINA ********


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load


        Try
            If Session("Tesipro") = 1 Then
                SingletonDb.GetInstance().ChangeConnectionString(1)

            Else
                Session("Tesipro") = 0
                SingletonDb.GetInstance().ChangeConnectionString(0)
            End If

            TM_OFERTA.ConnectionString = SingletonDb.GetInstance.GetConnectionString

            TM_TIPOHAB.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_CONCEPTO.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_TARIFA.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_ORIGEN.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_SEGMENTO.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_REGIMEN.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_CANALES.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_ESTADO.ConnectionString = SingletonDb.GetInstance.GetConnectionString
            TM_TIPOCOBRO.ConnectionString = SingletonDb.GetInstance.GetConnectionString

            'SqlTest7.ConnectionString = SingletonDb.GetInstance.GetConnectionString


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


        TM_TIPOHAB.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'TIPOHAB' ORDER BY CODIGO_PMS "
        TM_TIPOHAB.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "


        TM_OFERTA.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'OFERTA' ORDER BY CODIGO_PMS "
        TM_OFERTA.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "


        TM_CONCEPTO.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'CONCEPTO' AND CODIGO_PMS NOT LIKE '%$%' AND CODIGO_PMS NOT LIKE '%*%' ORDER BY CODIGO_PMS "
        TM_CONCEPTO.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_TARIFA.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'TARIFA' ORDER BY CODIGO_PMS "
        TM_TARIFA.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_ORIGEN.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'ORIGEN' ORDER BY CODIGO_PMS "
        TM_ORIGEN.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_SEGMENTO.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'SEGMENTO' ORDER BY CODIGO_PMS "
        TM_SEGMENTO.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_REGIMEN.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'REGIMEN' ORDER BY CODIGO_PMS "
        TM_REGIMEN.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_CANALES.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'CANAL' ORDER BY CODIGO_PMS "
        TM_CANALES.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_ESTADO.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'ESTADO' ORDER BY CODIGO_PMS "
        TM_ESTADO.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "

        TM_TIPOCOBRO.SelectCommand = "SELECT ID, CODIGO_PMS, CODIGO_CRS, DESCRIPCION   FROM HOTEL_DATOS_TM WHERE FK_ID_HOTEL = '" & Session("NewHotelID") & "' AND ENTIDAD = 'TIPOCOBRO' ORDER BY CODIGO_PMS "
        TM_TIPOCOBRO.UpdateCommand = "UPDATE HOTEL_DATOS_TM SET  CODIGO_PMS = @CODIGO_PMS , CODIGO_CRS =@CODIGO_CRS ,DESCRIPCION = @DESCRIPCION    WHERE [ID] = @ID "




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
                        Cmd.CommandText = "insert into hotel_datos_TM values ('" & Session("NewHotelID") & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(1).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(2).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(3).Name.ToString) & "','" & dbfreader.GetString(dbfreader.Table.Columns.Item(4).Name.ToString) & "')

UPDATE HOTEL_DATOS_TM SET CODIGO_CRS ='RO'

WHERE ENTIDAD = 'REGIMEN' AND CODIGO_PMS NOT LIKE '%+%' AND CODIGO_PMS <> ''

"
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

    Protected Sub Button11_Click(sender As Object, e As EventArgs) Handles Button11.Click
        CARGADBF()
    End Sub
End Class