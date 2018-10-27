Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class todosLosMantenimiento
    Inherits System.Web.UI.Page
    Public MysqlConnString As String = "server=localhost;user id=root;database=mupy; password=root;"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.fecha_mantenimiento.Text = Date.Today.ToString("yyyy-MM-dd")
            Me.fechaFin.Text = Date.Today.AddDays(29).ToString("yyyy-MM-dd")


            Dim connectio As MySqlConnection = New MySqlConnection(MysqlConnString)
            connectio.Open()
            Dim cmd = New MySqlCommand
            cmd = connectio.CreateCommand()
            cmd.CommandText = "SELECT man.idmantenimiento as id,DATE_FORMAT(man.fecha_mantenimiento , '%d/%m/%Y') as fecha,man.nombre_tecnico as tecnico,man.costo,man.tipo," +
                       " man.estado,medi.ubicacion as ubicacionmedio,medi.tipo as tipomedio, " +
                       "(SELECT  GROUP_CONCAT(p.nombre) FROM mupy.mantenimiento_producto as mp " +
                      " inner join mupy.producto as p on p.idProducto= mp.idProducto " +
                      "where mp.idmantenimiento = man.idmantenimiento) as productos " +
                      " FROM mupy.mantenimiento as man " +
                      "inner join mupy.medio  as medi on medi.idMedio = man.medio_idmedio " +
                      "where man.tipo= '" + DropDownList3.SelectedValue + "'  and man.estado= '" + estado.SelectedValue + "' " +
                      "and (man.fecha_mantenimiento>= '" + fecha_mantenimiento.Text + "' and man.fecha_mantenimiento<= '" + fechaFin.Text + "');"
            cmd.CommandType = System.Data.CommandType.Text
            GridMupis.DataSource = cmd.ExecuteReader()
            GridMupis.DataBind()
            connectio.Close()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim idm As String = Request.QueryString("id")

        Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
        connection.Open()
        Dim cmd = New MySqlCommand
        cmd = connection.CreateCommand()
        cmd.CommandText = "SELECT idmantenimiento as id,DATE_FORMAT(fecha_mantenimiento , '%d-%m-%Y') as fecha,nombre_tecnico as tecnico, costo,tipo,estado, " +
                  " (SELECT  GROUP_CONCAT(p.nombre) FROM mupy.mantenimiento_producto as mp " +
                  " inner join mupy.producto as p on p.idProducto= mp.idProducto " +
                  " where mp.idmantenimiento = mantenimiento.idmantenimiento) as productos " +
                  " FROM mupy.mantenimiento where tipo= '" + DropDownList3.SelectedValue + "' and estado= '" + estado.SelectedValue + "' and (fecha_mantenimiento>= '" +
                  fecha_mantenimiento.Text + "' and fecha_mantenimiento<= '" + fechaFin.Text + "');"
        cmd.CommandType = System.Data.CommandType.Text
        GridMupis.DataSource = cmd.ExecuteReader()
        GridMupis.DataBind()
        connection.Close()
    End Sub
    Protected Sub GridMupis_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridMupis.RowUpdating
        Dim Ids As Integer = GridMupis.DataKeys(e.RowIndex).Value.ToString
        Response.Redirect("/modificaMantenimiento.aspx?id=" & Ids)
    End Sub
End Class