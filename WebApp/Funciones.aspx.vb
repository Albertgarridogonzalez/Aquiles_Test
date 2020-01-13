Public Class Funciones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Public Function Conexion_Tesipro()
        'If Session("Tesipro") = 1 Then

        '    Return ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
        'Else
        Return ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
        'End If
    End Function


End Class