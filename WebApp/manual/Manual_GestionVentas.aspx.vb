Public Class Manual_GestionVentas
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
                iframeDrive.Src = "https://drive.google.com/file/d/1ec3Ah2qDa5ADZbpQ72jYHxgoxr4GNvrR/preview"
            Case 2
                iframeDrive.Src = "https://drive.google.com/file/d/1TMg1g18486HBjvumE3jtk009g_bvvNtJ/preview"
            Case 3
                iframeDrive.Src = "https://drive.google.com/file/d/1ggWAAxJKp-BKLSMPryl3MXHNJLNYsJK1/preview"
            Case 4
                iframeDrive.Src = "https://drive.google.com/file/d/1UHxOElryNKgwOVnUgNA-iGWf8gYVcdUl/preview"
            Case 5
                iframeDrive.Src = "https://drive.google.com/file/d/1mm_3nK1PeQszat7A95hRjvPt4R3ryVO2/preview"
            Case 6
                iframeDrive.Src = "https://drive.google.com/file/d/1s9k1hif1FWoMHDrI3p83QTxGw41j4xfz/preview"
            Case 7
                iframeDrive.Src = "https://drive.google.com/file/d/1TZWtw3kMvbpDnLnMSKNIT81GyIalY4n9/preview"
            Case 8
                iframeDrive.Src = "https://drive.google.com/file/d/1FCVMMNw44cLO317yERMgXTBfiDxxnRJ4/preview"
            Case 9
                iframeDrive.Src = "https://drive.google.com/file/d/1m9d3kDvd-EFM7lXvs58fFy3yzwcDuAF9/preview"
            Case 10
                iframeDrive.Src = ""
            Case 11
                iframeDrive.Src = ""






            Case Else
                iframeDrive.Src = ""
        End Select


    End Sub
End Class