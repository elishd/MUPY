Imports MySql.Data
Imports MySql.Data.MySqlClient

Public Class Registrar_Medio
    Inherits System.Web.UI.Page
    Public segundos As Integer
    Public MysqlConnString As String = "server=localhost;user id=root;database=mupy; password=root;"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (DropDownList1.SelectedValue = "Mupy") Then
            lados.Visible = True
            ladoslabel.Visible = True
            horas.Visible = False
            horalabel.Visible = False
        ElseIf ((DropDownList1.SelectedValue = "Pantalla") Or (DropDownList1.SelectedValue = "Acroly")) Then

            lados.Visible = False
            ladoslabel.Visible = False
            horas.Visible = True
            horalabel.Visible = True

        Else
            lados.Visible = False
            ladoslabel.Visible = False
            horas.Visible = False
            horalabel.Visible = False
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'If Me.IsValid Then
        If (longitud.Text = Nothing Or ubicacion.Text = Nothing Or latitud.Text = Nothing Or DropDownList1.SelectedValue = "Selecionar") Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(),
            "MyScript",
            "$(document).ready(function () {" &
            "$().toastmessage('showErrorToast', 'Verifique que ningun campo este vacio')" &
            "});", True)
        Else
            Dim id As String = ""

            Dim base As New conexionBD
            If base.Consulta("INSERT INTO `mupy`.`medio` (`ubicacion`, `longitud`, `latitud`,`tipo`)" +
                             "VALUES ('" + ubicacion.Text + "', '" + longitud.Text + "', '" + latitud.Text + "', '" + DropDownList1.SelectedValue + "');") Then

                Dim connection As MySqlConnection = New MySqlConnection(MysqlConnString)
                connection.Open()
                Dim consu2 As String = "SELECT max(idmedio) as id FROM mupy.medio;"
                Dim cmd2 = New MySqlCommand(consu2, connection)
                Dim dr2 As MySqlDataReader
                dr2 = cmd2.ExecuteReader()
                If dr2.Read() Then
                    id = Convert.ToDouble(dr2("id"))
                End If
                connection.Close()


                If (DropDownList1.SelectedValue = "Mupy") Then
                    base.Consulta("INSERT INTO `mupy`.`mupy` (`disponibilida`, `estado`, `cantidad_lado`, ` `cantidad_lado`,`," +
                     "`medio_idMedio`) VALUES ('Activo', 'Disponible', '" + lados.SelectedValue + "','" + lados.SelectedValue + "', '" + id + "');")
                    Response.Redirect("home.aspx")
                ElseIf ((DropDownList1.SelectedValue = "Pantalla") Or (DropDownList1.SelectedValue = "Acroly")) Then
                    segundos = (Integer.Parse(horas.Text)) * 3600
                    Dim estado As String = "Disponible"
                    Dim dispo As String = "Activo"
                    base.Consulta("INSERT INTO `mupy`.`pantalla` (`estado`, `disponibilida`, `horasFuncionales`," +
                                 " `medio_idMedio`) VALUES ('" + estado + "', '" + dispo + "', " + segundos.ToString + ", '" + id + "');")
                    Response.Redirect("mostrarMedioPantalla.aspx")
                End If

            End If
            Page.ClientScript.RegisterStartupScript(Me.GetType(),
         "MyScript",
         "$(document).ready(function () {" &
         "$().toastmessage('showSuccessToast', 'Transacción  exitosa')" &
         "});", True)

        End If


    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            ubicacion.Text = ""
            longitud.Text = ""
            latitud.Text = ""
            DropDownList1.SelectedIndex = 0
            lados.SelectedIndex = 0
            horas.Text = ""
        Catch ex As Exception
            Page.ClientScript.RegisterStartupScript(Me.GetType(),
            "MyScript",
            "$(document).ready(function () {" &
            "$().toastmessage('showSuccessToast', 'Error de transacción')" &
            "});", True)
        End Try
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged


    End Sub
End Class