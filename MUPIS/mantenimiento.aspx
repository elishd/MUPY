<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="mantenimiento.aspx.vb" Inherits="MUPIS.mantenimiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function isNumberOrLetter(evt) {

            var charCode = (evt.which) ? evt.which : event.keyCode;

            if ((charCode >= 65 && charCode < 91) || (charCode >= 97 && charCode < 123) || (charCode > 47 && charCode < 58) || (charCode == 32))
                return true;

            return false;
        }

    </script><div class="panel-body">

        <label aria-label="center"> REGISTRAR MANTENIMIENTO </label>
        <br />
        <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label>Medio: </label>
            </div>
            <div class="col-lg-6">
                <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
              
            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label>Fecha: </label>
            </div>
            <div class="col-lg-6">
                <asp:TextBox ID="fecha_mantenimiento" runat="server" name="Fecha_entrega" class="form-control" type="text" value=""></asp:TextBox>
            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label>Obsevación: </label>
            </div>
            <div class="col-lg-6">
                <asp:TextBox ID="observacion" class="form-control" lines="10" Rows="2" cols="10" Wrap="true" TextMode="MultiLine" placeholder="ej:Nombre" runat="server" onKeyPress="return isNumberOrLetter(event)" />

            </div>
        </div>
        
       
        <br />
        <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label class="control-label">Técnico:</label>

            </div>
            <div class="col-lg-6">

                <asp:DropDownList ID="DropDownList2" class="form-control" runat="server">
                </asp:DropDownList>

            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label class="control-label">Productos:</label>
            </div>
            <div class="col-lg-6 text-left" style="height:100px; overflow:auto">
                <asp:CheckBoxList ID="ckblist_productos" runat="server"></asp:CheckBoxList>
            </div>
        </div>
        <br />
         <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label>Costo: </label>
            </div>
            <div class="col-lg-6">
                <div class="row"> 
                <div class="col-md-6">
                    <asp:TextBox ID="txtcosto" class="form-control" runat="server" disabled="true" value="0.00"/>

                </div>
                <div class="col-md-6 pull-rigth">
                    <asp:Button ID="btncosto" runat="server" class="btn bg-green" Text="Calcular"  />
                </div>
              </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-lg-3" style="text-align: left">
                <label class="control-label">Tipo:</label>

            </div>
            <div class="col-lg-6">
                <asp:DropDownList ID="DropDownList3" class="form-control" runat="server">
                    <asp:ListItem>Preventivo</asp:ListItem>
                    <asp:ListItem>Correctivo</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col-lg-3">
                <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary mb1 bg-green btn-block btn-flat" Text="Agregar" />
            </div>
            <div class="col-lg-3">
                <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary mb1 bg-green btn-block btn-flat" Text="Cancelar" />
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function () {
            var hoy = new Date();

            $('#ContentPlaceHolder1_fecha_mantenimiento').datetimepicker({
                timepicker: false,
                format: 'Y-m-d',
                minDate: hoy
            });


        });
    </script>


</asp:Content>
