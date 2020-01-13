Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.OleDb
Imports ExcelDataReader
Imports System.IO
Imports System.Net
Imports System.Text
Imports NDbfReader
Imports System.Drawing
Imports System.Data.OleD


Public Class TEST2
    Inherits System.Web.UI.Page

    Dim Dt As DataTable
    Dim Singleton As SingletonDb = SingletonDb.GetInstance
    Dim Cn As SqlConnection = Singleton.GetConnection
    Dim Da As New SqlDataAdapter
    Dim Cmd As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("TECNICO") = False Then
            Response.Redirect("/Login")
        End If

        SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString

    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim SQLconn As New SqlConnection()
        Dim ConnString As String = SingletonDb.GetInstance.GetConnectionString
        SQLconn.ConnectionString = ConnString
        SQLconn.Open()


        Dim path As String = Server.MapPath("~/DBF/")
        'Label51.Text = path
        Dim fileOK As Boolean = False
        If FileUpload1.HasFile Then
            Dim fileExtension As String
            fileExtension = System.IO.Path.
                    GetExtension(FileUpload1.FileName).ToLower()
            Dim allowedExtensions As String() =
                    {".XLSX", ".xlsx"}
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                End If
            Next
            If fileOK Then
                Try

                    FileUpload1.PostedFile.SaveAs(path &
                             FileUpload1.FileName)

                    Dim stream As FileStream = File.Open(path & FileUpload1.FileName, FileMode.Open, FileAccess.Read)

                    '1. Reading from a binary Excel file ('97-2003 format; *.xls)
                    'Dim excelReader As IExcelDataReader = ExcelReaderFactory.CreateBinaryReader(stream)
                    '...
                    '2. Reading from a OpenXml Excel file (2007 format; *.xlsx)
                    Dim excelReader2 As IExcelDataReader = ExcelReaderFactory.CreateOpenXmlReader(stream)
                    '...
                    '3. DataSet - The result of each spreadsheet will be created in the result.Tables
                    Dim result As DataSet = excelReader2.AsDataSet()

                    'excelReader2.NextResult()

                    '4. DataSet - Create column names from first row
                    'excelReader2.IsFirstRowAsColumnNames = True
                    'Dim result As DataSet = excelReader2.AsDataSet()

                    '5. Data Reader methods
                    While excelReader2.Read()
                        If excelReader2.Depth = 0 Then

                        Else

                            Cmd.Connection = Cn
                            Cmd.CommandText = "insert into hotel_datos_rack values  ('" & Session("NewHotelID") & "','" & excelReader2.GetString(0) & "'"
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
                        End If


                    End While

                    '6. Free resources (IExcelDataReader is IDisposable)
                    excelReader2.Close()

                Catch ex As Exception
                    MsgBox(ex.ToString)
                End Try
            End If
        End If

        Response.Redirect(Request.Url.AbsoluteUri)


    End Sub

End Class