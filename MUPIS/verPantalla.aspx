<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="verPantalla.aspx.vb" Inherits="MUPIS.verPantalla" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <label  aria-label="center">CLIENTES DE LAS PANTALLAS </label>
        <br />
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
            <asp:TemplateField HeaderText="Cliente" ItemStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                    <asp:Label ID="Cliente" runat="server" Text='<%# Eval("cliente")%>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Telefono" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Telefono" runat="server" Text='<%# Eval("telefono_cliente")%>' />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Vencimiento" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Vencimiento" runat="server" Text='<%# Eval("fecha_Final_contrato")%>' />
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Disponibilidad" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Disponibilidad" runat="server" Text='<%# Eval("disponibilida")%>' />
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Estado" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Estado" runat="server" Text='<%# Eval("estado")%>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="segundos Funcionales" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="segundos" runat="server" Text='<%# Eval("horasFuncionales")%>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Repeticiones" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Repeticiones" runat="server" Text='<%# Eval("repeticiones")%>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Duracion" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Duracion" runat="server" Text='<%# Eval("duracion")%>' />
                </ItemTemplate>
            </asp:TemplateField>


<%--
            <asp:ButtonField ButtonType="Image" Text="Actualizar" CommandName="Update" HeaderText="Editar" ShowHeader="True" ImageUrl="~/Content/Imagenes/update.png" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Height="20px" Width="25px" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:ButtonField>

            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Content/Imagenes/Elimin.png" ShowDeleteButton="True" HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Height="20px" Width="25px" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:CommandField>--%>

        </Columns>
    </asp:GridView>




</asp:Content>
