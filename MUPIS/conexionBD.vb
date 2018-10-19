
Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class conexionBD

    Private MysqlCommand As New MySqlCommand

    Dim MysqlConnString As String = "Hostname=localhost; user id=root ;database=mupy; password=root"
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

    'Function obtener(ByRef consul As String) As Boolean
    '    Dim consu As String = "select * from sql3221722.medio"
    '    Dim MysqlCommand As New MySqlCommand
    '    Dim connection As MySqlConnection
    '    Dim MysqlConnString As String = "server=localhost; user id= root ; password=root"
    '    connection = New MySqlConnection(MysqlConnString)

    '    connection.Open()
    '    Dim cmd = New MySqlDataAdapter(consu, connection)

    '    cmd.SelectCommand.CommandType = CommandType.TableDirect
    '    Dim ase As DataSet = New DataSet
    '    ase.Tables.Add("medio")
    '    cmd.Fill(ase)
    '    DropDownList1.DataSource = ase
    '    DropDownList1.DataTextField = "ubicacion"
    '    DropDownList1.DataValueField = "idMedio"
    '    DropDownList1.DataBind()

    '    Return
    'End Function


End Class
