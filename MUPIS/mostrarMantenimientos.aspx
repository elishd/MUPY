<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="mostrarMantenimientos.aspx.vb" Inherits="MUPIS.mostrarMantenimientos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <br />
     <label  aria-label="center">MANTENIMIENTO DEL MUPI </label>
        <br />
       
        <div class="row">
            <div class="col-lg-2" style="text-align: left">
                <label>Fecha Inicio: </label>
                <br />
                <br />
                <br />
                <label>Fecha Fin: </label>
                
            </div>
            <div class="col-lg-6">
                 <div class="row"> 
                <div class="col-md-6">
                    <asp:TextBox ID="fecha_mantenimiento" runat="server" name="Fecha_entrega" class="form-control" type="text" value=""></asp:TextBox>
                    <br />
                    <asp:TextBox ID="fechaFin" runat="server" name="Fecha" class="form-control" type="text" value=""></asp:TextBox>

                </div>
                <div class="col-md-6 pull-rigth">
                    <asp:Button ID="Button1" runat="server" class="btn bg-green" Text ="ver mantenimiento" />
                   <%-- <asp:Button ID="btnfecha" runat="server" class="btn bg-green" Text="Ver mantenimientos" />--%>
                </div>
              </div>
                
            </div>

        </div>
        <br />
    <label>Ubicacion: </label>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
