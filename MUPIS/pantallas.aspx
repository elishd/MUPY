<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="pantallas.aspx.vb" Inherits="MUPIS.pantallas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel-body">

        <label class="btn btn-primary mb1 bg-green btn-block btn-flat" aria-label="center">PANTALLA</label>
        <br />


        <div class="row">
            <div class="col-lg-3">
                <label class="control-label">Repeticiones</label>

            </div>
            <div class="col-lg-6">
                <asp:TextBox ID="nombre_tecnico" runat="server" name="Fecha_entrega_pedido" class="form-control" placeholder="Repeticiones en horas o minutos"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-3">
                <label class="control-label">Segundos</label>

            </div>
            <div class="col-lg-6">
                <asp:TextBox ID="costo" runat="server" name="Fecha_entrega_pedido" class="form-control" placeholder="Ej: 30"></asp:TextBox>
            </div>
        </div>
        <br />

        <div class="">
            <div class="col-lg-3">
                <asp:Button ID="Button1" type="submit" class="btn btn-primary btn-block" runat="server" Text="Aceptar" />

            </div>

        </div>

    </div>



</asp:Content>
