Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Text
Imports NDbfReader

Public Class URBAN_ICON_PROMO

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
    Dim sql_connection As New SqlConnection
    Dim sql_query As New SqlCommand





    'Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        SingletonDb.GetInstance().ChangeConnectionString(1)



        If Session("Username") = "" Then

            Response.Redirect("/RB/URBAN_ICON_LOGIN")
        End If

        If Session("TECNICO") = False Then
            Response.Redirect("/RB/URBAN_ICON_LOGIN")
        End If

    End Sub
    Protected Sub Upload(sender As Object, e As EventArgs) Handles Button1.Click

        Dim desde As Date
        desde = Convert.ToDateTime(TextBox8.Text)


        Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Dim contentType As String = FileUpload1.PostedFile.ContentType
        Using fs As Stream = FileUpload1.PostedFile.InputStream
            Using br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                Dim constr As String = SingletonDb.GetInstance.GetConnectionString
                Using con As New SqlConnection(constr)
                    Dim query As String = " INSERT INTO PAGOS_PROMO VALUES (@NOMBRE , @CONCEPTO , @FECHA , @PRECIO , @Data, @ContentType , @PAGADO, 0 , @MAIL)"

                    'Dim bs64OfBytes As String
                    ' bs64OfBytes = Convert.ToBase64String(contentType)


                    'Dim newHeight As Integer = 200
                    'Dim newWidth As Integer = 200
                    'Dim newImage As Bitmap
                    ''Dim postedFile As Bitmap

                    'bytes = CreateThumbNail(fs, newWidth, newHeight)




                    Using cmd As New SqlCommand(query)
                        cmd.Connection = con
                        'cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename
                        cmd.Parameters.Add("@NOMBRE", SqlDbType.VarChar).Value = TextBox1.Text
                        cmd.Parameters.Add("@CONCEPTO", SqlDbType.VarChar).Value = TextBox3.Text
                        cmd.Parameters.Add("@FECHA", SqlDbType.VarChar).Value = desde
                        cmd.Parameters.Add("@PRECIO", SqlDbType.VarChar).Value = TextBox2.Text
                        cmd.Parameters.Add("@PAGADO", SqlDbType.VarChar).Value = CheckBox1.Checked
                        cmd.Parameters.Add("@MAIL", SqlDbType.VarChar).Value = TextBox9.Text
                        cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contentType
                        cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                    End Using
                End Using
            End Using
        End Using

        'lblMessage.Text = "File uploaded successfully."
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


End Class