
Imports System.Data.SqlClient

Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class conexionBD

    Private MysqlCommand As New MySqlCommand

    Dim MysqlConnString As String = "server=localhost;user id=root;database=mupy; password=root;"
    Public Conexion As MySqlConnection = New MySqlConnection(MysqlConnString)

    Function Consulta(ByRef consul As String) As Boolean
        Try
            openConexion()
            MysqlCommand = New MySqlCommand(consul, Conexion)
            MysqlCommand.ExecuteNonQuery()
            closeConexion()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Function idconsulta(ByRef consul As String) As Boolean
        Dim id As Integer = 0
        Try
            openConexion()
            MysqlCommand = New MySqlCommand(consul, Conexion)
            id = MysqlCommand.ExecuteNonQuery()
            closeConexion()
            Return id
        Catch ex As Exception
            Return 0
        End Try
    End Function

    Public Sub openConexion()
        Conexion.Open()
    End Sub

    Public Sub closeConexion()
        Conexion.Close()
    End Sub


End Class
