<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="Registrar Medio.aspx.vb" Inherits="MUPIS.Registrar_Medio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
         
             // Solo permite ingresar numeros.
             function soloNumeros(e) {
                 var key = window.Event ? e.which : e.keyCode
                 return ((key >= 48 && key <= 57) || (key == 46) || (key == 45))
             }


</script>
    <script type="text/javascript"> 

        function isNumberOrLetter(evt) {

            var charCode = (evt.which) ? evt.which : event.keyCode;

            if ((charCode > 65 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode > 47 && charCode < 58) || (charCode == 32))
                return true;

            return false;
        }

    </script>
    <div class="panel-body">

        <label  aria-label="center">REGISTRAR MEDIO </label>
        <br />
         <div class="row">
                    <div class="col-lg-3" style="text-align: left">
                        <label class="control-label">Ubicación:</label>

                    </div>
                    <div class="col-lg-6">
                        <asp:TextBox ID="ubicacion" runat="server" type="text" name="Fecha_entrega_pedido" class="form-control" placeholder="Ej: calle principal el  7" onKeyPress="return isNumberOrLetter(event)" ></asp:TextBox>
                      <%--  <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                           ControlToValidate="ubicacion"
                           ErrorMessage="Last name is a required field."
                           ForeColor="Red">
                       </asp:RequiredFieldValidator>--%>
                    </div>
                </div>
               
                <br />
                <div class="row">
                    <div class="col-lg-3" style="text-align: left">
                        <label class="control-label">Latitud:</label>

                    </div>
                    <div class="col-lg-6">
                        <asp:TextBox ID="latitud" type="text" runat="server" name="Fecha_entrega_pedido" class="form-control" placeholder="Ej: 13°41′21″" onKeyPress="return soloNumeros(event)"></asp:TextBox>
                    </div>
                </div>
                <br />
         
                <div class="row">
                    <div class="col-lg-3" style="text-align: left">
                        <label class="control-label">Longitud:</label>

                    </div>
                    <div class="col-lg-6">
                        <asp:TextBox ID="longitud" type="text" runat="server" name="Fecha_entrega_pedido" class="form-control" placeholder="Ej:  89°11′13″"  onKeyPress="return soloNumeros(event)"></asp:TextBox>
                    </div>
                </div>
        <br />
         <div class="row">
                    <div class="col-lg-3" style="text-align: left">
                        <label class="control-label"  >Tipo:</label>

                    </div>
                    <div class="col-lg-6">
                          <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="true">
                              <asp:ListItem>Selecionar</asp:ListItem>
                              <asp:ListItem>Mupy</asp:ListItem>
                              <asp:ListItem>Pantalla</asp:ListItem>
                            
                          </asp:DropDownList>
                                             
                    </div>
                </div>
        <br />
        <div class="row">
        <div class="col-lg-3" style="text-align: left">
                        <asp:Label iD="ladoslabel" runat="server"  class="control-label" Visible="False" >Cantidad de lados:</asp:Label>
            
                    </div>
                    <div class="col-lg-6">
                        <asp:DropDownList ID="lados" class="form-control" runat="server" Visible="False">
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
                        <%--<asp:TextBox ID="lado" runat="server" type="text" name="Fecha_entrega_pedido" class="form-control" placeholder="Ej: calle principal el  7" onKeyPress="return soloNumeros(event)" Visible="False" ></asp:TextBox>--%>
                    </div>
                </div>
               
                <br />
         <div class="row">
             <div class="col-lg-3"  style="text-align: left">
                        <asp:label  iD="horalabel" runat="server"  class="control-label" Visible="False">Horas funcionales:</asp:label>

                    </div>
                    <div class="col-lg-6">
                        <asp:TextBox ID="horas" runat="server" type="text" name="Fecha_entrega_pedido" class="form-control" placeholder="Ej: 7" onKeyPress="return soloNumeros(event)" Visible="False" ></asp:TextBox>
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

   
  
</asp:Content>
