<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Productos.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Gestión de Productos</h5>
                <a href="Form.aspx" class="btn btn-light btn-sm">+ Nuevo Producto</a>
            </div>

            <div class="card-body">

                <div class="row mb-4">
                    <div class="col-md-4">
                        <label for="ddlEstado" class="form-label fw-bold">Mostrar:</label>
                        <asp:DropDownList ID="ddlEstado" runat="server" AutoPostBack="true" CssClass="form-select" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged">
                            <asp:ListItem Text="Activos" Value="0" />
                            <asp:ListItem Text="Dados de Baja" Value="1" />
                            <asp:ListItem Text="Todos" Value="2" />
                        </asp:DropDownList>
                    </div>
                </div>


                <div class="table-responsive">
                    <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped align-middle" OnRowCommand="gvProductos_RowCommand" DataKeyNames="ID">
                        <Columns>
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <%# Eval("FechaBaja") == DBNull.Value || Eval("FechaBaja") == null
                                        ? "<span class='badge bg-success'>Activo</span>"
                                        : "<span class='badge bg-secondary'>Baja</span>" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="Marca.Nombre" HeaderText="Marca" />
                            <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoría" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <div class="d-flex gap-1">
                                        <asp:Button runat="server" CommandName="Editar" CommandArgument='<%# Container.DataItemIndex %>'
                                            Text="Editar" CssClass="btn btn-sm btn-outline-warning" />

                                        <asp:Button runat="server" CommandName="Eliminar" CommandArgument='<%# Container.DataItemIndex %>'
                                            Text="Dar de baja" CssClass="btn btn-sm btn-outline-danger"
                                            Visible='<%# Eval("FechaBaja") == DBNull.Value || Eval("FechaBaja") == null %>' />

                                        <asp:Button runat="server" CommandName="Alta" CommandArgument='<%# Container.DataItemIndex %>'
                                            Text="Dar de alta" CssClass="btn btn-sm btn-outline-success"
                                            Visible='<%# Eval("FechaBaja") != DBNull.Value && Eval("FechaBaja") != null %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
