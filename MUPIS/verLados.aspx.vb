Imports System.Web.Configuration
Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class verLados
    Inherits System.Web.UI.Page

    Public listClientes As DataTable = New DataTable()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        listClientes = cargarDatos(Request.QueryString("id"))


        Dim ubicacion As String = Request.QueryString("ubi")
        Label1.Text = ubicacion
    End Sub

    Public Function cargarDatos(ByVal id As String)
        Try

            Dim dt As DataTable = New DataTable()
            Dim MysqlConnString As String = ConfigurationManager.AppSettings("conexion")
            Dim ide As String = Request.QueryString("id")
            Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
            connection.Open()

            Dim acti As String = "Activo"
            Dim consu As String = "select cli.nombre, cli.telefono, con.fecha_inicio," +
            "con.fecha_final, m.ubicacion, m.tipo, mup.estado, mup.disponibilida," +
            "l.posicion, l.lados_usados, l.vencimiento " +
            "from sql3221722.cliente as cli " +
            "inner join sql3221722.contrato as con on con.cliente_idcliente = cli.idCliente " +
            "inner join sql3221722.medio as m on m.idMedio = con.medio_idMedio " +
            "inner join sql3221722.mupy as mup on mup.medio_idMedio = m.idMedio " +
            "inner join sql3221722.lados as l on l.mupy_idMupy = mup.idMupy " +
            "where m.idMedio = '" + ide + "'  and  con.estado='" + acti + "' order by l.posicion "
            Dim cmd = New MySqlCommand(consu, connection)
            Dim adap As MySqlDataAdapter = New MySqlDataAdapter(cmd)
            adap.Fill(dt)
            connection.Close()

            Return dt

        Catch ex As Exception
            Return 0
        End Try
    End Function

End Class