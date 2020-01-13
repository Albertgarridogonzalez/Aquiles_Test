Imports System.IO
Imports ExcelDataReader
Imports ExcelDataReader.ExcelDataTableConfiguration
Imports table


Public Class Contact


    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load





    End Sub

    Protected Sub AceptarCarga_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles aceptarCarga.Click
        'Stream del archivo seleccionado
        Dim excelStream As Stream = excel_selected.PostedFile.InputStream
        'Objeto para la lectura *xlsx
        Dim excelReader As IExcelDataReader = ExcelReaderFactory.CreateReader(excelStream)
        'Configura que el DataSet tenga como primera fila el nombre de las columnas
        Dim excel_config As ExcelDataSetConfiguration = New ExcelDataSetConfiguration()
        excel_config.ConfigureDataTable = Function(tableReader) New ExcelDataTableConfiguration() With {.UseHeaderRow = True}
        'Conversion a DataSet para poder manejar los datos
        Dim excelDataset As DataSet = excelReader.AsDataSet(excel_config)
        Dim columna As Integer = 0
        While excelReader.Read()
            MsgBox(excelReader.GetValue(columna).ToString())
        End While
        excelReader.Close()

    End Sub


End Class