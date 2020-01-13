Public Class Estadistica
    Inherits System.Web.UI.Page

    '   ***********CARGA DATOS PAGINA ********
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Username") = "" Then
            Response.Redirect("/Login")
        End If
        If Session("TECNICO") = false Then
            Response.Redirect("/Login")
        End If

        'Chart2.ChartAreas(0).AxisY.StripLines.Add(New DataVisualization.Charting.StripLine())
        ''Chart2.ChartAreas(0).AxisY.StripLines(0).BackColor = Color.FromArgb(80, 252, 180, 65)
        'Chart2.ChartAreas(0).AxisY.StripLines(0).StripWidth = 80
        'Chart2.ChartAreas(0).AxisY.StripLines(0).Interval = 100
        'Chart2.ChartAreas(0).AxisY.StripLines(0).IntervalOffset = 10
        Chart2.ChartAreas("ChartArea1").AxisX.LabelStyle.Angle = -90
        Chart1.ChartAreas("ChartArea1").AxisX.LabelStyle.Angle = -90
        Sqltest.ConnectionString = SingletonDb.GetInstance.GetConnectionString
        SqlDataSource2.ConnectionString = SingletonDb.GetInstance.GetConnectionString
    End Sub

End Class