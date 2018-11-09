<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="todosLosMantenimiento.aspx.vb" Inherits="MUPIS.todosLosMantenimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />

    <label aria-label="center"> MANTENIMIENTOS GENERALES </label>
        <br />
    <br />
    <br />
       
    <div class="row text-left">
        <div class="col-md-6">
            <div class="col-md-4">
                 <label>Fecha Inicio: </label>
                 <br />
                <br />
                <br />
                <label class="control-label">Tipo:</label>
                 <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" class="btn bg-green" Text ="ver mantenimiento" />
           </div>
           <div class="col-md-6">
                <asp:TextBox ID="fecha_mantenimiento" runat="server" name="Fecha_entrega" class="form-control" type="text" value=""></asp:TextBox>
                <br />                  
                <asp:DropDownList ID="DropDownList3" class="form-control" runat="server">
                    <asp:ListItem>Preventivo</asp:ListItem>
                    <asp:ListItem>Correctivo</asp:ListItem>
                </asp:DropDownList>
                
           </div>
        </div>
        <div class="col-md-6">
             <div class="col-md-4">
                 <label>Fecha Fin: </label>
                  <br />
                <br />
                <br />
                  <label>Estado: </label>
           </div>
             <div class="col-md-6">
                <asp:TextBox ID="fechaFin" runat="server" name="Fecha" class="form-control" type="text" value=""></asp:TextBox>
                  <br />
                 <asp:DropDownList ID="estado" class="form-control" runat="server">
                    <asp:ListItem>Pendiente</asp:ListItem>
                    <asp:ListItem>Finalizado</asp:ListItem>
                </asp:DropDownList>
           </div>
        </div>
    </div>

 
        <br />
   
    <asp:GridView ID="GridMupis" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" ForeColor="Black" GridLines="Vertical" Width="100%" Font-Size="Large">

        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageImageUrl="~/Content/Imagenes/Primero.png" FirstPageText="" LastPageImageUrl="~/Content/Imagenes/Ultimo.png" LastPageText="" Mode="NextPreviousFirstLast" NextPageImageUrl="~/Content/Imagenes/Siguiente.png" NextPageText="" PreviousPageImageUrl="~/Content/Imagenes/Atras.png" PreviousPageText="" />
        <PagerStyle BackColor="#58B8C9" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#91a4c7" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        <Columns>
            <asp:TemplateField HeaderText="Fecha" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                    <asp:Label ID="fecha" runat="server" Text='<%# Eval("fecha")%>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Tecnico" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="tecnico" runat="server" Text='<%# Eval("tecnico")%>' />
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Costo" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="costo" runat="server" Text='<%# Eval("costo")%>' />
                </ItemTemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Estado" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="estado" runat="server" Text='<%# Eval("estado")%>' />
                </ItemTemplate>
            </asp:TemplateField>  
            
             <asp:TemplateField HeaderText="Recursos" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="productos" runat="server" Text='<%# Eval("productos")%>' />
                </ItemTemplate>
            </asp:TemplateField>   

            <asp:TemplateField HeaderText="Tipo" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="tipo" runat="server" Text='<%# Eval("tipo")%>' />
                </ItemTemplate>
            </asp:TemplateField>

             <%--<asp:TemplateField HeaderText="Ubicacion" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="ubicacion" runat="server" Text='<%# Eval("ubicacionmedio")%>' />
                </ItemTemplate>
            </asp:TemplateField>--%>

            <%-- <asp:TemplateField HeaderText="Tipo de medio" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="tipoMedio" runat="server" Text='<%# Eval("tipomedio")%>' />
                </ItemTemplate>
            </asp:TemplateField>--%>

            <asp:ButtonField ButtonType="Image" Text="Actualizar" CommandName="Update" HeaderText="Editar" ShowHeader="True" ImageUrl="~/Content/Imagenes/update.png" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Height="20px" Width="25px" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:ButtonField>

        </Columns>
    </asp:GridView>

   
      <script>
        $(document).ready(function () {
            var hoy = new Date();

            $('#ContentPlaceHolder1_fecha_mantenimiento').datetimepicker({
                timepicker: false,
                format: 'Y-m-d',
              
            });


        });
    </script>
     <script>
         $(document).ready(function () {
             var hoy = new Date();
             
             $('#ContentPlaceHolder1_fechaFin').datetimepicker({
                 timepicker: false,
                 format: 'Y-m-d',
                 
             });


         });
    </script>
</asp:Content>
