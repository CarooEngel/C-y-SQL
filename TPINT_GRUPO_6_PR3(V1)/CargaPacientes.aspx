<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="CargaPacientes.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.CargaPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: right;
        }
        .auto-style23 {
            text-align: left;
            width: 276px;
        }
        .auto-style27 {
            width: 364px;
        }
        .auto-style32 {
            height: 46px;
        }
        .auto-style33 {
            text-align: center;
            height: 46px;
        }
        .auto-style35 {
            width: 364px;
            height: 46px;
        }
        .auto-style38 {
            height: 46px;
            width: 310px;
        }
        .auto-style39 {
            width: 276px;
        }
        .auto-style40 {
            text-align: left;
        }
        .auto-style42 {
            height: 41px;
            width: 310px;
        }
        .auto-style43 {
            text-align: right;
            height: 41px;
        }
        .auto-style44 {
            height: 41px;
            width: 276px;
            text-align: left;
        }
        .auto-style45 {
            height: 41px;
            width: 364px;
            text-align: left;
        }
        .auto-style46 {
            height: 41px;
        }
        .auto-style47 {
            height: 40px;
            width: 310px;
        }
        .auto-style48 {
            text-align: right;
            height: 40px;
        }
        .auto-style49 {
            height: 40px;
            width: 276px;
            text-align: left;
        }
        .auto-style50 {
            height: 40px;
            width: 364px;
            text-align: left;
        }
        .auto-style51 {
            height: 40px;
        }
        .auto-style52 {
            height: 42px;
            width: 310px;
        }
        .auto-style53 {
            text-align: right;
            height: 42px;
        }
        .auto-style54 {
            height: 42px;
            width: 276px;
            text-align: left;
        }
        .auto-style55 {
            height: 42px;
            width: 364px;
            text-align: left;
        }
        .auto-style56 {
            height: 42px;
        }
        .auto-style57 {
            height: 41px;
            width: 458px;
            text-align: right;
        }
        .auto-style58 {
            width: 310px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        CARGA PACIENTE<table class="auto-style21">
            <tr>
                <td class="auto-style58">
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ABMLpacientes.aspx">Volver</asp:HyperLink>
                </td>
                <td colspan="2">&nbsp;</td>
                <td class="auto-style39">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43" colspan="2">Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtNombre" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*El nombre debe contener solo letras." ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style45">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="TxtNombre" ErrorMessage="*Ingrese su nombre" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style47"></td>
                <td class="auto-style48" colspan="2">&nbsp;Apellido:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtApellido" runat="server" CssClass="textbox"></asp:TextBox>

                </td>
                <td class="auto-style49">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="TxtApellido" ErrorMessage="*Ingrese su apellido" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style50">
                    <asp:RegularExpressionValidator ID="revApe" runat="server" ControlToValidate="TxtApellido" ErrorMessage="*El nombre debe contener solo letras." ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style51"></td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43" colspan="2">Edad:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtEdadPaciente" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:RangeValidator ID="rgedad" runat="server" ControlToValidate="txtEdadPaciente" ErrorMessage="*Ingrese una edad correcta" ForeColor="Red" MaximumValue="110" MinimumValue="1" Type="Integer" ValidationGroup="grupo1"></asp:RangeValidator>
                </td>
                <td class="auto-style45"></td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style52"></td>
                <td class="auto-style53" colspan="2">Dni:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtDni" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style54">
                    <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="TxtDni" ErrorMessage="*Error solo ingrese numeros" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style55">
                    <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="TxtDni" ErrorMessage="*El nombre debe contener solo numeros" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style56"></td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style57">Sexo: </td>
                <td class="auto-style43">
                 <asp:RadioButtonList ID="Rbsexo" runat="server" ValidationGroup="grupo1" RepeatDirection="Horizontal" AutoPostBack="True">
                     <asp:ListItem>F</asp:ListItem>
                     <asp:ListItem>M</asp:ListItem>
                 </asp:RadioButtonList>
                </td>
                <td class="auto-style44">
                    <div class="auto-style40">
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="Rbsexo" ErrorMessage="*seleccione el sexo" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                    </div>
                </td>
                <td class="auto-style45"></td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43" colspan="2">Nacionalidad:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtNacionalidad" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="TxtNacionalidad" ErrorMessage="*Ingrese Nacionalidad" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style45">
                    <asp:RegularExpressionValidator ID="revNac" runat="server" ControlToValidate="TxtNacionalidad" ErrorMessage="*El nombre debe contener solo letras." ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style47"></td>
                <td class="auto-style48" colspan="2">Fecha de Nacimiento:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtFechaNac" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style49">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style50"></td>
                <td class="auto-style51"></td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43" colspan="2">Provincia:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DdlProvincia" runat="server" CssClass="custom-select" OnSelectedIndexChanged="DdlProvincia_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
                    <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="DdlProvincia" ErrorMessage="*Debe elegir una Provincia" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style45"></td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43" colspan="2">Localidad:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DdlLocalidad" runat="server" CssClass="custom-select" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
                    <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="DdlLocalidad" ErrorMessage="*Debe elegir una Localidad" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style45"></td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style42"></td>
                <td class="auto-style43" colspan="2">Direccion:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtDireccion" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="TxtDireccion" ErrorMessage="*Debe elegir su Direccion" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style45">&nbsp;</td>
                <td class="auto-style46"></td>
            </tr>
            <tr>
                <td class="auto-style52"></td>
                <td class="auto-style53" colspan="2">Correo Electronico:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtCorreo" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style54">
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="TxtCorreo" ErrorMessage="*Debe Ingresar su Correo Electronico" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style55"></td>
                <td class="auto-style56"></td>
            </tr>
            <tr>
                <td class="auto-style47"></td>
                <td class="auto-style48" colspan="2">Telefono:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TxtTelefono" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style49">
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="TxtTelefono" ErrorMessage="*Ingrese su numero de telefono" ForeColor="Red" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style50"></td>
                <td class="auto-style51"></td>
            </tr>
            <tr>
                <td class="auto-style58">&nbsp;</td>
                <td class="auto-style22" colspan="2">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38"></td>
                <td class="auto-style33" colspan="3">
                    <asp:Button ID="btnAceptar" runat="server" CssClass="my-button" OnClick="btnAceptar_Click" Text="Aceptar" ValidationGroup="grupo1" />
                </td>
                <td class="auto-style35"></td>
                <td class="auto-style32"></td>
            </tr>
            <tr>
                <td class="auto-style58">&nbsp;</td>
                <td class="auto-style20" colspan="3">
                    <asp:Label ID="lbl_falla" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style27">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
