
Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class verPantalla
    Inherits System.Web.UI.Page
    Public MysqlConnString As String = "server=localhost; user id= root ; password=root"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


            Dim ubicacion As String = Request.QueryString("ubi")
            Label1.Text = ubicacion
            Dim acti As String = "Activo"
            Dim ide As String = Request.QueryString("id")

            Dim connectio As MySqlConnection = New MySqlConnection(MysqlConnString)
            connectio.Open()
            Dim cmd = New MySqlCommand
            cmd = connectio.CreateCommand()
            cmd.CommandText = "select idpantalla as id,cli.nombre as cliente, cli.telefono as telefono_cliente, " +
                                "con.fecha_inicio as fecha_Inicial_contrato, " +
                                "con.fecha_final as fecha_Final_contrato, " +
                                "l.disponibilida,l.estado,l.horasFuncionales, " +
                                "f.repeticiones, f.duracion, f.vigencia " +
                                "from sql3221722.cliente as cli  " +
                                "inner join sql3221722.contrato as con on con.cliente_idcliente = cli.idCliente " +
                                "inner join sql3221722.medio as m on m.idMedio = con.medio_idMedio " +
                                "inner join sql3221722.pantalla as l on l.medio_idMedio= m.idMedio " +
                                "inner join sql3221722.pantalla_funcional as f on f.pantalla_idpantalla=l.idpantalla " +
                                "where m.idMedio = '" + ide + "' and con.estado='" + acti + "' "
            cmd.CommandType = System.Data.CommandType.Text
            GridMupis.DataSource = cmd.ExecuteReader()
            GridMupis.DataBind()
            connectio.Close()


        End If
    End Sub



    '    select cli.nombre as cliente, cli.telefono as telefono_cliente, con.fecha_inicio as fecha_Inicial_contrato,
    ' con.fecha_final as fecha_Final_contrato,
    ' l.disponibilida,l.estado,l.horasFuncionales,
    ' f.repeticiones, f.duracion, f.vigencia
    'from cliente as cli
    'inner join contrato as con on con.cliente_idcliente = cli.idCliente
    'inner join medio as m on m.idMedio = con.medio_idMedio
    'inner join pantalla as l on l.medio_idMedio= m.idMedio
    'inner join pantalla_funcional as f on f.pantalla_idpantalla=l.idpantalla 
    'where m.idMedio = 1 and con.estado='" + acti + "'
End Class