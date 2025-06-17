<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AgregarModificar.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Productos.Agregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5" style="max-width: 600px;">
        <h3>Agregar Producto</h3>

        <!-- Nombre -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="txtNombre" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        </div>

        <!-- Descripción -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="txtDescripcion" Text="Descripción"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
        </div>

        <!-- Categoría -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="ddlCategoria" Text="Categoría"></asp:Label>
            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control" />
        </div>

        <!-- Marca -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="ddlMarca" Text="Marca"></asp:Label>
            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control" />
        </div>

        <!-- Precio -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="txtPrecio" Text="Precio"></asp:Label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number" />
        </div>

        <!-- Descuento -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="txtDescuento" Text="Descuento (%)"></asp:Label>
            <asp:TextBox ID="txtDescuento" runat="server" CssClass="form-control" TextMode="Number" />
        </div>

        <!-- Destacado -->
        <div class="form-check mb-3">
            <asp:CheckBox ID="chkDestacado" runat="server" CssClass="form-check-input" />
            <asp:Label runat="server" AssociatedControlID="chkDestacado" CssClass="form-check-label" Text="Producto destacado" />
        </div>

        <!-- Subida de múltiples imágenes -->
        <div class="mb-3">
            <asp:Label runat="server" AssociatedControlID="fuImagenes" Text="Imágenes" />
            <asp:FileUpload ID="fuImagenes" runat="server" CssClass="form-control" AllowMultiple="true" />
        </div>

        <asp:Repeater ID="rptImagenes" runat="server">
            <ItemTemplate>
                <div class="imagen-item mb-2">
                    <img src='/Upload/Products/<%# Eval("ImagenUrl") %>' style="width: 100px; height: auto;" />
                    <asp:CheckBox ID="chkEliminar" runat="server" Text="Eliminar" CssClass="ms-2" />
                    <asp:HiddenField ID="hfIdImagen" runat="server" Value='<%# Eval("Id") %>' />
                    <asp:HiddenField ID="hfUrlImagen" runat="server" Value='<%# Eval("ImagenUrl") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Botón Guardar -->
        <div class="d-grid gap-2">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Producto" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
        </div>

        <!-- Mensaje -->
        <div class="mt-3">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" Visible="false" />
        </div>
    </div>
</asp:Content>
