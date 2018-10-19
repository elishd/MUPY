Imports MySql.Data
Imports MySql.Data.MySqlClient
Imports System.Data.OleDb
Imports System.Runtime.CompilerServices

Public Class modificaMantenimiento
    Inherits System.Web.UI.Page
    Public MysqlConnString As String = "server=localhost; user id= root ; password=root"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim datos As DataTable

        If Not IsPostBack Then

            Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
            connection.Open()
            Dim consu2 As String = "SELECT * FROM sql3221722.usuario;"
            Dim cm = New MySqlDataAdapter(consu2, connection)
            Dim data2 As DataSet = New DataSet
            cm.Fill(data2)
            DropDownList2.DataSource = data2
            DropDownList2.DataTextField = "nombre"
            DropDownList2.DataValueField = "nombre"
            DropDownList2.DataBind()
            connection.Close()
            Dim consu3 As String
            Dim idsProdustos As List(Of String) = obtenerIdsProductos(Request.QueryString("id"))
            If (idsProdustos.Count.ToString = "0") Then
                consu3 = "SELECT idproducto,Nombre FROM sql3221722.producto  where Existencia>0;"
            Else
                consu3 = "SELECT idproducto,Nombre FROM sql3221722.producto " +
                "where existencia > 0 or idproducto in(" + String.Join(",", idsProdustos) + ");"

            End If

            Dim cmd3 = New MySqlDataAdapter(consu3, connection)
            Dim data3 As DataSet = New DataSet
            cmd3.Fill(data3)
            ckblist_productos.DataSource = data3
            ckblist_productos.DataTextField = "Nombre"
            ckblist_productos.DataValueField = "idproducto"
            ckblist_productos.DataBind()
            connection.Close()

            SelectProduct(idsProdustos)
            datos = cargarDatos(Request.QueryString("id"))

            For Each r As DataRow In datos.Rows
                DropDownList1.SelectedValue = Convert.ToString(r.Item("estado"))
                Dim fechaMant As Date = Convert.ToDateTime(r.Item("fecha_mantenimiento"))
                fecha_mantenimiento.Text = String.Format("{0:yyyy-MM-dd}", fechaMant)
                observacion.Text = Convert.ToString(r.Item("observacion"))
                DropDownList2.SelectedValue = Convert.ToString(r.Item("nombre_tecnico"))
            Next

        End If
    End Sub

    Public Function cargarDatos(ByVal id As String)
        Dim dt As DataTable = New DataTable()


        Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
        connection.Open()
        Dim consu As String = "SELECT * FROM sql3221722.mantenimiento where idmantenimiento='" + id + "'"
        Dim cmd = New MySqlCommand(consu, connection)
        Dim adap As MySqlDataAdapter = New MySqlDataAdapter(cmd)
        adap.Fill(dt)
        connection.Close()

        Return dt
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'boton actualizar
        'este boton  sirve para actualizar la existencia de los productos e insertar nuevos eliminanod los anterios
        Dim MysqlConnString As String = "server=localhost; user id= root ; password=root"
        Dim id As String = Request.QueryString("id")
        Dim base As New conexionBD
        Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
        Dim listIdProduct As List(Of String) = obtenerIdsProductos(id)
        'aqui  se aumenta la existencia  de los productos seleccionados  anteriormente para luego ser eliminado del registro
        For Each lispro In listIdProduct
            base.Consulta("UPDATE `sql3221722`.`producto` SET Existencia=Existencia+1  WHERE `idProducto`='" + lispro + "';")
        Next
        'aqui se eliminan los productos selecionados anteriormente en el mantenimiento
        base.Consulta("DELETE FROM `sql3221722`.`mantenimiento_producto` WHERE `idmantenimiento`='" + id + "' ")

        'aqui se insertan los nuevos o existentes productos que se selecionaron
        Dim listaProductos = From li As ListItem In ckblist_productos.Items Where li.Selected Select li.Value
        For Each l In listaProductos
            base.Consulta("INSERT INTO `sql3221722`.`mantenimiento_producto` (`idmantenimiento`, `idProducto`)  values('" + id + "','" + l.ToString + "')")
            base.Consulta("UPDATE `sql3221722`.`producto` SET Existencia=Existencia-1  WHERE `idProducto`='" + l.ToString + "';")
        Next

        Dim costo As Double
        costo = calcularcosto()

        Try
            base.Consulta("UPDATE `sql3221722`.`mantenimiento` SET `fecha_mantenimiento`='" + fecha_mantenimiento.Text + "'," +
                      "`observacion`='" + observacion.Text + "', `nombre_tecnico`='" + DropDownList2.SelectedValue + "', `estado`='" + DropDownList1.SelectedValue + "', " +
                      "`costo`='" + costo.ToString + "' WHERE `idmantenimiento`='" + id + "';")

            Page.ClientScript.RegisterStartupScript(Me.GetType(),
        "MyScript",
        "$(document).ready(function () {" &
        "$().toastmessage('showSuccessToast', 'Transacción  exitosa')" &
        "});", True)
            Response.Redirect("home.aspx")
        Catch ex As Exception
            Page.ClientScript.RegisterStartupScript(Me.GetType(),
            "MyScript",
            "$(document).ready(function () {" &
            "$().toastmessage('showErrorToast', 'Error de transacción')" &
            "});", True)
        End Try



    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'boton cancelar
        Response.Redirect("Registrar%20Medio.aspx")
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
            Dim consu As String = "SELECT ifnull(sum(Precio),0) as precio FROM sql3221722.producto where idproducto in(" + productos + ");"
            Dim cmd = New MySqlCommand(consu, connection)
            Dim dr As MySqlDataReader
            dr = cmd.ExecuteReader()
            If dr.Read() Then
                costo = Convert.ToDouble(dr("precio"))
            End If
            connection.Close()
        End If
        Return costo
    End Function

    Public Function obtenerIdsProductos(ByVal idmantenimiento As String)
        Dim listaProductos As New List(Of String)

        Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
        connection.Open()
        Dim consu As String = "SELECT idProducto FROM sql3221722.mantenimiento_producto where idmantenimiento = " + idmantenimiento + ";"
        Dim cmd = New MySqlCommand(consu, connection)
        Dim dr As MySqlDataReader
        dr = cmd.ExecuteReader()
        While dr.Read
            listaProductos.Add(Convert.ToString(dr("idProducto")))
        End While
     
        connection.Close()
        Return listaProductos
    End Function

    Public Sub SelectProduct(ByVal idsProduct As List(Of String))
        Dim checked As Boolean = True
        For Each pro In idsProduct
            Me.ckblist_productos.Items.FindByValue(pro).Selected = True
        Next
    End Sub


    Protected Sub btncosto_Click(sender As Object, e As EventArgs) Handles btncosto.Click
        txtcosto.Text = String.Format("{0:C2}", calcularcosto())
    End Sub
End Class