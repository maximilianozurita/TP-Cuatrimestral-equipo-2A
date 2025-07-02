<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="tp_cuatrimetral_equipo_2A.Admin.Cobros.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center mt-5">
        <div class="w-100" style="max-width: 400px;">
            <!-- Token Mercadopago -->
            <div class="form-floating mb-3">
                <strong>Token Mercadopago</strong>
                <asp:TextBox ID="txtToken" runat="server" CssClass="form-control mt-1" ></asp:TextBox>

            </div>

            <!-- CBU -->
            <div class="form-floating mb-3">
                <strong>CBU</strong>
                <asp:TextBox ID="txtCBU" runat="server" CssClass="form-control mt-1" ></asp:TextBox>

            </div>

            <!-- Alias -->
            <div class="form-floating mb-3">
                <strong>Alias</strong>
                <asp:TextBox ID="txtAlias" runat="server" CssClass="form-control mt-1"  ></asp:TextBox>
            </div>

            <!-- Botón Guardar -->

            <div class="row g-2 mt-4">
                <div class="col">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success w-100" OnClick="btnGuardar_Click" />
                </div>
                <div class="col">
                    <asp:Button Text="Volver" CssClass="btn btn-primary w-100" ID="btnVolver" OnClick="btnVolver_Click" runat="server" />
                </div>
            </div>

            <!-- Mensaje -->
            <div class="mt-3">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" Visible="false" />
            </div>
        </div>
    </div>

</asp:Content>
