Imports System.Net
Imports System.Text


Public Class Ayuda
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = "1 : RECONSTRUIR INFORME PRODUCCION : Esta opción reconstruye la producción del día , informe de producción y estadísticas.Por ejemplo si no aparece el día en la consulta de ocupación , eso lo restaura, o si aparecenmal los datos en el Informe de producción también lo restaura"
        Label2.Text = "2 : REVISAR CIERRE DIARIO : Esta opción Revisa los errores de cierre y vuelve a lanzar los procedimientos que quedan por terminar , también activa el semáforo de bajada de reservas , se recomienda recalcular el informe de producción después de este procedimiento"

    End Sub

End Class