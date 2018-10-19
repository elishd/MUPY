<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="verLados.aspx.vb" Inherits="MUPIS.verLados" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <label  aria-label="center">CLIENTES DEL MEDIO </label>
        <br />
          <br />
    <label>Ubicacion: </label>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
       <br />
    <div class="row">

        <% Dim html As StringBuilder = New StringBuilder()
            For Each cliente As DataRow In listClientes.Rows
                html.Append("<div class='col-md-6'>")
                html.Append("<div class='box box-success'>")
                html.Append("<div class='box-header with-border'>")
                html.Append("<h3 class='box-title'>Lado   " & cliente.Item("posicion") & "</h3>")
                html.Append("</div>")
               
                html.Append("<div class='box-body text-left'>")
                html.Append(" <div class='row'>")
                html.Append(" <div class='col-lg-6' style='text-align: left'>")
                html.Append("<label class='control-label'>Cliente:</label> <br />")
                html.Append("<label class='control-label'>Telefono:</label> <br />")
                'html.Append("<label class='control-label'>Fecha inicio:</label> <br />")
                'html.Append("<label class='control-label'>Fecha fin:</label> <br />")
                html.Append("<label class='control-label'>Ubicacion:</label> <br />")
                html.Append("<label class='control-label'>Tipo:</label> <br />")
                html.Append("<label class='control-label'>Estado:</label>  <br />")
                'html.Append("<label class='control-label'>Lados usados:</label> <br />")
                html.Append("<label class='control-label'>Vencimiento:</label> <br />")
                html.Append(" </div>")
                html.Append("<div class='col-lg-6'>")
                html.Append("<label class='control-label'>" & cliente.Item("nombre") & " </label> <br />")
                html.Append("<label class='control-label'>" & cliente.Item("telefono") & " </label> <br /> ")
                'html.Append("<label class='control-label'>" & cliente.Item("fecha_inicio") & " </label> <br />")
                'html.Append("<label class='control-label'>" & cliente.Item("fecha_final") & " </label> <br />")
                html.Append("<label class='control-label'>" & cliente.Item("ubicacion") & " </label> <br />")
                html.Append("<label class='control-label'>" & cliente.Item("tipo") & "</label> <br /> ")
                html.Append("<label class='control-label'>" & cliente.Item("disponibilida") & " </label> <br /> ")
                'html.Append("<label class='control-label'>" & cliente.Item("lados_usados") & " </label> <br /> ")
                html.Append("<label class='control-label'>" & cliente.Item("fecha_final") & " </label> <br /> ")
                html.Append("  </div>")
                html.Append("  </div>")
                
                
                'html.Append("<label>Telefono:</label>" & cliente.Item("telefono") & "<br />")
                'html.Append("<label>Fecha inicio:</label>" & cliente.Item("fecha_inicio") & "<br />")
                'html.Append("<label>Fecha fin:</label>" & cliente.Item("fecha_final") & "<br />")
                'html.Append("<label>Ubicacion:</label>" & cliente.Item("ubicacion") & "<br />")
                'html.Append("<label>Tipo:</label>" & cliente.Item("tipo") & "<br />")
                'html.Append("<label>Estado:</label>" & cliente.Item("estado") & "<br />")
                'html.Append("<label>Disponibilida:</label>" & cliente.Item("disponibilida") & "<br />")
                'html.Append("<label>Lados usados:</label>" & cliente.Item("lados_usados") & "<br />")
                'html.Append("<label>Vencimiento:</label>" & cliente.Item("vencimiento") & "<br />")
                html.Append("</div>")
              
                html.Append("</div>")
                html.Append("</div>")
            Next%>
        <%=html%>

    </div>
    
</asp:Content>
