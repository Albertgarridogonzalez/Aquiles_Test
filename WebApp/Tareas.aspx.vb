Public Class Tareas
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("TECNICO") = False Then
            Response.Redirect("/Login")
        End If

        SqlTest.ConnectionString = SingletonDb.GetInstance.GetConnectionString

    End Sub

End Class