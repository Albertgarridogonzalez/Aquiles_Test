Imports System.Data.OleDb
Imports System.Data.SqlClient

Public Class SingletonDb


    Private Shared s_objDBConnect As SingletonDb
    Private Shared s_objConnection As SqlConnection

    Protected Sub New()

        s_objConnection = New SqlConnection
        s_objConnection.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString

    End Sub

    Public Shared Function GetInstance() As SingletonDb

        If s_objDBConnect Is Nothing Then
            s_objDBConnect = New SingletonDb
        End If

        Return s_objDBConnect

    End Function

    Public ReadOnly Property GetConnection() As SqlConnection
        Get
            Return s_objConnection
        End Get
    End Property

    Public Sub ChangeConnectionString(conexion As Integer)
        If conexion = 1 Then
            s_objConnection.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString_tesipro").ConnectionString
            's_objConnection.ConnectionString = ConfigurationManager.ConnectionStrings("teamviewerConnectionString").ConnectionString
        Else
            s_objConnection.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString_mante").ConnectionString
        End If
    End Sub

    Public Shared Function GetConnectionString() As String
        Return s_objConnection.ConnectionString

    End Function


End Class