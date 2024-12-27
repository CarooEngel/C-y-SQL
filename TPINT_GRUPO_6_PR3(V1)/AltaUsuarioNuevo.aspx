<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="AltaUsuarioNuevo.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.AltaUsuarioNuevo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style25 {
            text-align: right;
            height: 41px;
            width: 689px;
        }
        .auto-style26 {
            text-align: left;
            height: 41px;
        }
        .auto-style27 {
            height: 41px;
        }
        .auto-style28 {
            width: 689px;
        }
        .auto-style30 {
            width: 689px;
            height: 121px;
        }
        .auto-style32 {
            height: 65px;
        }
        .auto-style33 {
            height: 70px;
        }
        .auto-style34 {
            height: 121px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        ALTA USUARIO<table class="auto-style21">
            <tr>
                <td class="auto-style34"></td>
                <td class="auto-style30"></td>
                <td class="auto-style34"></td>
                <td class="auto-style34"></td>
            </tr>
            <tr>
                <td class="auto-style27">
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ABMLmedico.aspx">Volver</asp:HyperLink>
                </td>
                <td class="auto-style25">Legajo:</td>
                <td class="auto-style26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtLegajo" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style27"></td>
            </tr>
            <tr>
                <td class="auto-style27"></td>
                <td class="auto-style25">Nombre Usuario:</td>
                <td class="auto-style26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style27"></td>
            </tr>
            <tr>
                <td class="auto-style27"></td>
                <td class="auto-style25">Contraseña:</td>
                <td class="auto-style26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtContra" runat="server" CssClass="textbox" TextMode="Password" MaxLength="8"></asp:TextBox>
                    <asp:CustomValidator ID="cmContra" runat="server" ControlToValidate="txtContra" ErrorMessage="*Solo hasta 8 Caracteres" ForeColor="Red" OnServerValidate="cmContra_ServerValidate" ValidationGroup="1"></asp:CustomValidator>
                </td>
                <td class="auto-style27"></td>
            </tr>
            <tr>
                <td class="auto-style27"></td>
                <td class="auto-style25">Repetir Contraseña:</td>
                <td class="auto-style26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtRepContra" runat="server" CssClass="textbox" TextMode="Password" MaxLength="8"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvrepcontra" runat="server" ControlToValidate="txtRepContra" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style27"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33"></td>
                <td class="auto-style33" colspan="2">
                    <asp:Button ID="btnNuevoUsuario" runat="server" CssClass="my-button" OnClick="btnNuevoUsuario_Click" Text="Crear Nuevo Usuario" ValidationGroup="1" />
                </td>
                <td class="auto-style33"></td>
            </tr>
            <tr>
                <td class="auto-style32"></td>
                <td class="auto-style32" colspan="2">
                    <asp:Label ID="lbl_mensaje" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style32"></td>
            </tr>
        </table>
    </p>
</asp:Content>
