<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Productos.Marcas.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Gestión de Categorías</h5>
                <a href="Form.aspx" class="btn btn-light btn-sm">+ Nueva Categoría</a>
            </div>

            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="ddlEstado" class="form-label">Mostrar:</label>
                        <asp:DropDownList ID="ddlEstado" runat="server" AutoPostBack="true" CssClass="form-select" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged">
                            <asp:ListItem Text="Activos" Value="0" />
                            <asp:ListItem Text="Dados de Baja" Value="1" />
                            <asp:ListItem Text="Todos" Value="2" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptMarcas" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ID") %></td>
                                        <td><%# Eval("Nombre").ToString() %></td>
                                        <td>
                                            <a href='Form.aspx?id={Eval("ID")}' class='btn btn-sm btn-warning me-1'>Editar</a>
                                            <asp:Button runat="server" ID="btnEliminar" CommandArgument='<%# Eval("ID") %>' Text="Eliminar" CssClass="btn btn-sm btn-danger me-1" OnClick="btnEliminar_Click" Visible='<%# Eval("FechaBaja") == DBNull.Value || Eval("FechaBaja") == null %>' />
                                            <asp:Button runat="server" ID="btnRestaurar" CommandArgument='<%# Eval("ID") %>' Text="Dar de Alta" CssClass="btn btn-sm btn-success" OnClick="btnRestaurar_Click" Visible='<%# Eval("FechaBaja") != DBNull.Value && Eval("FechaBaja") != null %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
