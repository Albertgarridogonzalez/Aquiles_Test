Imports System.Data.SqlClient
Imports System.Net
Imports System.Text

Public Class Parametros
    Inherits System.Web.UI.Page

    Dim sql_connectioN As New SqlConnection
    Dim sql_query As New SqlCommand
    Dim sql_result As SqlDataReader


    Public Function Conexion_Tesipro()
        'If Session("Tesipro") = 1 Then

        '    Return ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
        'Else
        Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
        'End If

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Parametro") = "1" Then
            TextBox1.Visible = False
            TextBox2.Visible = False
            TextBox3.Visible = True
            TextBox4.Visible = True

            Label1.Visible = False
            Label2.Visible = False
            Label3.Visible = True
            Label4.Visible = True

            TextBox1.Text = ""
            TextBox2.Text = ""
            TextBox3.Text = Today()
            TextBox4.Text = Today()


            Label1.Text = ""
            Label2.Text = ""
            Label3.Text = "DESDE"
            Label4.Text = "HASTA"



        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session("PParametro1") = TextBox1.Text
        Session("PParametro2") = TextBox2.Text
        Session("Desde") = TextBox3.Text
        Session("Hasta") = TextBox4.Text


        Mantenimiento_Hotel(Session("Hotel_Id"), Session("Desde"), Session("Hasta"), Session("PVarchar"), Session("PDatetime"), Session("PParametro1"), Session("PParametro2"), Session("Pbit"), Session("Parametro"))
        'Label1.Text = Session("Id_Hotel") & Session("Desde") & Session("Hasta") & Session("PVarchar") & Session("PDatetime") & TextBox1.Text & TextBox2.Text & Session("Pbit") & Session("Parametro")

        'MsgBox(Session("Id_Hotel") & Session("Desde") & Session("Hasta") & Session("PVarchar") & Session("PDatetime") & TextBox1.Text & TextBox2.Text & Session("Pbit") & Session("Parametro"))

        'Session("Hotel_Id") = Get_Datos(DropDownList1.SelectedValue.ToString)
        'Session("Desde") = TextBox2
        'Session("Hasta") = TextBox2
        'Session("PVarchar") = ""
        'Session("PDatetime") = ""
        'Session("PParametro1") = ""
        'Session("PParametro2") = ""
        'Session("Pbit") = ""
        'Session("Parametro") = "1"

    End Sub

    Public Sub Mantenimiento_Hotel(Hotel_Id, DESDE, HASTA, PVarchar, PDatetime, PParametro1, PParametro2, Pbit, PARAM)

        sql_connectioN.ConnectionString = Conexion_Tesipro()
        sql_query.Connection = sql_connectioN
        'MsgBox("EXEC.SP_MANTENIMIENTO_HOTEL_MASTER'" & Hotel_Id & "','" & DESDE & "','" & HASTA & "','" & PVarchar & "','" & PDatetime & "','" & PParametro1 & "','" & PParametro2 & "','" & Pbit & "','" & PARAM & "'")
        sql_query.CommandText = "EXEC.SP_MANTENIMIENTO_HOTEL_MASTER'" & Hotel_Id & "','" & DESDE & "','" & HASTA & "','" & PVarchar & "','" & PDatetime & "','" & PParametro1 & "','" & PParametro2 & "','" & Pbit & "','" & PARAM & "'"
        sql_query.CommandTimeout = 3000
        Try
            sql_connectioN.Open()
            sql_query.ExecuteNonQuery()
            sql_connectioN.Close()
            MsgBox("Procedimiento Finalizado")

        Catch ex As Exception
            If ex.Message <> "" Then
                MsgBox("Sentencia con errores , no se ha podido finalizar el proceso")
            End If
        End Try

    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub
End Class