Public Class Manual_Recepcion

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
                iframeDrive.Src = "https://drive.google.com/file/d/1O8j2w7YiuNjEQXCV0dnBvscqcxzjQxnC/preview"
            Case 2
                iframeDrive.Src = "https://drive.google.com/file/d/1VkQ-YlRmD9UlHNDYz1MaIOVZOop08qL6/preview"
            Case 3
                iframeDrive.Src = "https://drive.google.com/file/d/1YzrV_HvHrBF5DJsZL3XCLkCCfaULt4RG/preview"
            Case 4
                iframeDrive.Src = "https://drive.google.com/file/d/1dueu7NWI2zJFGebWqvdnR9haG2MFQUJb/preview"
            Case 5
                iframeDrive.Src = "https://drive.google.com/file/d/1PAP6futzwgeblzeNZtDln2dHbJightl4/preview"
            Case 6
                iframeDrive.Src = "https://drive.google.com/file/d/1kcMPdm7XjdTXFV_jTgedK8ZktH0ExUuT/preview"
            Case Else
                iframeDrive.Src = ""
        End Select


    End Sub
End Class