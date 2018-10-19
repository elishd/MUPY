Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class mostrarMedioPantalla
    Inherits System.Web.UI.Page
    Public markers As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Function map() As String
        Dim id As String
        Dim horas As String
        Dim markers As String = "["
        Dim strConn As String = "server=localhost; user id=root ;database=sql3221722; password=root"
        Dim cmd As New MySqlCommand("SELECT * FROM medio where tipo='Pantalla'")
        Using conn As New MySqlConnection(strConn)
            cmd.Connection = conn
            conn.Open()
            Using reader As MySqlDataReader = cmd.ExecuteReader()
                While reader.Read()
                        markers += "{"
                        markers += String.Format("'title': '{0}',", reader("ubicacion"))
                        markers += String.Format("'lat': '{0}',", reader("latitud"))
                        markers += String.Format("'lng': '{0}',", reader("longitud"))
                        id = reader("idMedio")

                        horas = calcularSegundos(id)
                    markers += String.Format("'description': '{0}'", " <label>Ubicación:" + reader("ubicacion") + " </label>" +
                            " <br />   " +
                            "<label>segundos disponibles:" + horas + " </label>" +
                            " <br />   " +
                            "<a href=""/mostrarMantenimientos.aspx?id=" + id + "&ubi=" + reader("ubicacion") + " "" class=""btn btn-primary"" >Ver mantenimiento</a> " +
                            "<a href=""/verPantalla.aspx?id=" + id + "&ubi=" + reader("ubicacion") + " "" class=""btn btn-primary"" >Ver clientes</a>")
                        markers += "},"


                End While
            End Using
            conn.Close()
        End Using
        markers += "];"

        Return markers
    End Function

    Public Function calcularSegundos(ByRef idmedio As String)

        Dim costo As Double = 0

        Dim id As String = ""
        Dim MysqlConnString As String = "server=localhost; user id= root ; password=root"
        Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
        connection.Open()
        Dim consu As String = "SELECT horasFuncionales as horas FROM sql3221722.pantalla where medio_idMedio='" + idmedio + "';"
        Dim cmd = New MySqlCommand(consu, connection)
        Dim dr As MySqlDataReader
        dr = cmd.ExecuteReader()
        If dr.Read() Then
            costo = Convert.ToDouble(dr("horas"))
        End If

        Return costo
    End Function
End Class