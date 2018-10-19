Imports MySql.Data
Imports MySql.Data.MySqlClient
Imports System.Data.OleDb
Imports System.Runtime.CompilerServices

Public Class mantenimiento
    Inherits System.Web.UI.Page
    Public MysqlConnString As String = "Hostname=localhost; user id= root ; password=root"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Me.fecha_mantenimiento.Text = Date.Today.ToString("yyyy-MM-dd")
            Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)

            connection.Open()
            Dim consu As String = "select * from mupy.medio"
            Dim cmd = New MySqlDataAdapter(consu, connection)
            Dim data1 As DataSet = New DataSet
            cmd.Fill(data1)
            DropDownList1.DataSource = data1
            DropDownList1.DataTextField = "ubicacion"
            DropDownList1.DataValueField = "idMedio"
            DropDownList1.DataBind()
            connection.Close()

            connection.Open()
            Dim consu2 As String = "SELECT * FROM mupy.usuario;"
            Dim cm = New MySqlDataAdapter(consu2, connection)
            Dim data2 As DataSet = New DataSet
            cm.Fill(data2)
            DropDownList2.DataSource = data2
            DropDownList2.DataTextField = "nombre"
            DropDownList2.DataValueField = "nombre"
            DropDownList2.DataBind()
            connection.Close()
            connection.Open()
            Dim consu3 As String = "SELECT idproducto,Nombre FROM mupy.producto  where Existencia>0;"
            Dim cmd3 = New MySqlDataAdapter(consu3, connection)
            Dim data3 As DataSet = New DataSet
            cmd3.Fill(data3)
            ckblist_productos.DataSource = data3
            ckblist_productos.DataTextField = "Nombre"
            ckblist_productos.DataValueField = "idproducto"
            ckblist_productos.DataBind()
            connection.Close()

        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (observacion.Text = Nothing Or fecha_mantenimiento.Text = Nothing) Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(),
            "MyScript",
            "$(document).ready(function () {" &
            "$().toastmessage('showErrorToast', 'Verifique que ningun campo no este vacio')" &
            "});", True)
        Else

            Dim base As New conexionBD
            Dim costo As Double
            Dim id As String = ""


            'Dim fechaMantenimiento As String = String.Format("{0:yyyy-MM-dd}", Date.Parse(fecha_mantenimiento.Text))
            Dim listaProductos = From li As ListItem In ckblist_productos.Items Where li.Selected Select li.Value
            'productos = String.Join(",", listaProductos)

            Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
            'connection.Open()
            'Dim consu As String = "SELECT ifnull(sum(Precio),0) as precio FROM sql3221722.producto where idproducto in(" + productos + ");"
            'Dim cmd = New MySqlCommand(consu, connection)
            'Dim dr As MySqlDataReader
            'dr = cmd.ExecuteReader()
            'If dr.Read() Then
            '    costo = Convert.ToDouble(dr("precio"))
            'End If
            costo = calcularcosto()
            'connection.Close()

            Dim con As String = "INSERT INTO `mupy`.`mantenimiento` (`fecha_mantenimiento`, `observacion`, `nombre_tecnico`,`costo`, `tipo`, `estado`, `medio_idmedio`) VALUES ('" + fecha_mantenimiento.Text + "' , '" +
                           observacion.Text + "', '" + DropDownList2.SelectedValue + " ', '" +
                           costo.ToString + "', '" + DropDownList3.SelectedValue + "','Pendiente', '" + DropDownList1.SelectedValue + "');"

            If base.Consulta(con) Then


                connection.Open()
                Dim consu2 As String = "SELECT max(idmantenimiento) as id FROM mupy.mantenimiento;"
                Dim cmd2 = New MySqlCommand(consu2, connection)
                Dim dr2 As MySqlDataReader
                dr2 = cmd2.ExecuteReader()
                If dr2.Read() Then
                    id = Convert.ToDouble(dr2("id"))
                End If

                connection.Close()


                For Each l In listaProductos
                    base.Consulta("INSERT INTO `mupy`.`mantenimiento_producto` (`idmantenimiento`, `idProducto`)  values('" + id + "','" + l.ToString + "')")
                    base.Consulta("UPDATE `mupy`.`producto` SET Existencia=Existencia-1  WHERE `idProducto`='" + l.ToString + "';")
                Next


                Page.ClientScript.RegisterStartupScript(Me.GetType(),
           "MyScript",
           "$(document).ready(function () {" &
           "$().toastmessage('showSuccessToast', 'Transacción  exitosa')" &
           "});", True)

            Else
                Page.ClientScript.RegisterStartupScript(Me.GetType(),
            "MyScript",
            "$(document).ready(function () {" &
            "$().toastmessage('showErrorToast', 'Error de transacción')" &
            "});", True)
            End If
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            observacion.Text = ""

            fecha_mantenimiento.Text = ""
            DropDownList1.SelectedIndex = 0
            DropDownList2.SelectedIndex = 0

        Catch ex As Exception
            Page.ClientScript.RegisterStartupScript(Me.GetType(),
            "MyScript",
            "$(document).ready(function () {" &
            "$().toastmessage('showSuccessToast', 'Error de transacción')" &
            "});", True)
        End Try
    End Sub

    Public Function calcularcosto()

        Dim costo As Double = 0
        Dim productos As String
        Dim id As String = ""
        'Dim fechaMantenimiento As String = String.Format("{0:yyyy-MM-dd}", Date.Parse(fecha_mantenimiento.Text))
        Dim listaProductos = From li As ListItem In ckblist_productos.Items Where li.Selected Select li.Value
        If (listaProductos.Any) Then
            productos = String.Join(",", listaProductos)

            Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
            connection.Open()
            Dim consu As String = "SELECT ifnull(sum(Precio),0) as precio FROM mupy.producto where idproducto in(" + productos + ");"
            Dim cmd = New MySqlCommand(consu, connection)
            Dim dr As MySqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                costo = Convert.ToDouble(dr("precio"))
            End If
        End If
        Return costo
    End Function


    Protected Sub btncosto_Click(sender As Object, e As EventArgs) Handles btncosto.Click
        txtcosto.Text = String.Format("{0:C2}", calcularcosto())
    End Sub
End Class