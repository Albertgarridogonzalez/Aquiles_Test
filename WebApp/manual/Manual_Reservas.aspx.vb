Public Class Manual_Reservas
    Inherits Page
    Dim myIFrame As HtmlIframe



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") = "" Then
            Response.Redirect("/Manual/ManualLogin")
        End If
        If Session("Manual") = False Then
            Response.Redirect("/Manual/ManualLogin")
        End If

    End Sub

    'Public Function EmbedString2(str)
    'Return str
    'End Function



    Public Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        'Dim EmbedString As String

        ' Page_Load()
        Select Case DropDownList1.SelectedIndex
            Case 0
                iframeDrive.Src = ""
            Case 1
                iframeDrive.Src = "https://drive.google.com/file/d/11IajnbwLO1JJCiB631E1rjfMrTmAjxmd/preview"
            Case 2
                iframeDrive.Src = "https://drive.google.com/file/d/1dueu7NWI2zJFGebWqvdnR9haG2MFQUJb/preview"
            Case 3
                iframeDrive.Src = ""

            Case Else
                iframeDrive.Src = ""
        End Select


    End Sub
End Class