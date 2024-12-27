<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="AltaMedico.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.AltaMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="Css/masterPage.css" />
    
    <style type="text/css">
        .auto-style20 {
            width: 100%;
        }
        .auto-style21 {
            width: 283px;
        }
        .auto-style24 {
            text-align: center;
        }
        .auto-style27 {
            text-align: right;
            height: 30px;
            width: 134px;
        }
        .auto-style28 {
            width: 388px;
            height: 30px;
        }
        .auto-style30 {
            width: 322px;
            height: 30px;
        }
        .auto-style33 {
            width: 388px;
        }
        .auto-style34 {
            width: 119px;
            text-align: justify;
        height: 56px;
    }
        .auto-style37 {
            width: 283px;
            height: 60px;
        }
        .auto-style38 {
            height: 60px;
            width: 134px;
        }
        .auto-style41 {
            width: 283px;
            height: 30px;
            text-align: justify;
        }
        .auto-style44 {
            width: 28px;
            text-align: justify;
        height: 56px;
    }
        .auto-style50 {
            width: 388px;
            height: 60px;
        }
        .auto-style51 {
            text-align: center;
            width: 388px;
        }
        .auto-style52 {
        width: 18px;
        height: 60px;
    }
        .auto-style54 {
            width: 18px;
            height: 30px;
        }
        .auto-style55 {
            width: 18px;
        }
        .auto-style56 {
        height: 60px;
        width: 19px;
    }
        .auto-style57 {
            width: 19px;
        }
        .auto-style58 {
            height: 30px;
            width: 19px;
        }
        .auto-style59 {
            width: 139px;
            text-align: justify;
        height: 56px;
    }
    .auto-style60 {
        width: 18px;
        height: 56px;
    }
    .auto-style61 {
        width: 322px;
        height: 56px;
    }
    .auto-style62 {
        text-align: right;
        height: 56px;
            width: 134px;
        }
    .auto-style63 {
        width: 388px;
        height: 56px;
    }
    .auto-style64 {
        width: 19px;
        height: 56px;
    }
        .auto-style65 {
            width: 322px;
            height: 60px;
        }
        .auto-style66 {
            width: 322px;
        }
        .auto-style68 {
            text-align: center;
            width: 134px;
        }
        .auto-style69 {
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style20">
        <tr>
            <td class="auto-style52"></td>
            <td class="auto-style52"></td>
            <td class="auto-style65">
                <asp:HyperLink ID="Hplvolver" runat="server" NavigateUrl="~/ABMLmedico.aspx">Volver</asp:HyperLink>
            </td>
            <td class="auto-style38"></td>
            <td class="auto-style37" colspan="3"></td>
            <td class="auto-style50"></td>
            <td class="auto-style56"></td>
            <td class="auto-style56"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Legajo: </td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtLegajo" runat="server" Width="136px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvlegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Nombre:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtNombre" runat="server" Width="136px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvnombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28">
                    <asp:RegularExpressionValidator ID="revnom" runat="server" ControlToValidate="txtNombre" ErrorMessage="*El nombre debe contener solo letras." ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Apellido:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtApellido" runat="server" Width="136px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvapellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28">
                    <asp:RegularExpressionValidator ID="revApe" runat="server" ControlToValidate="TxtApellido" ErrorMessage="*El apellido debe contener solo letras." ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Dni:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtDni" runat="server" Width="207px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvdni" runat="server" ControlToValidate="txtDni" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28">
                    <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ErrorMessage="*El dni debe contener solo numeros" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style60"></td>
            <td class="auto-style60"></td>
            <td class="auto-style61"></td>
            <td class="auto-style62">Sexo:</td>
            <td class="auto-style44">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style34">
                        <asp:RadioButtonList ID="rbsexo" runat="server" ValidationGroup="1" OnSelectedIndexChanged="rbsexo_SelectedIndexChanged" CssClass="radiobt">
                            <asp:ListItem Value="M">Masculino</asp:ListItem>
                            <asp:ListItem Value="F">Femenino</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
            <td class="auto-style59">
                        <asp:RequiredFieldValidator ID="rfvsexo" runat="server" ControlToValidate="rbsexo" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style63"></td>
            <td class="auto-style64"></td>
            <td class="auto-style64"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Telefono:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtTelefono" runat="server" Width="207px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
            <td class="auto-style28">
                    <asp:RegularExpressionValidator ID="revtel" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*El telefono debe contener solo numeros" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Correo Electronico:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtCorreoElectronico" runat="server" Width="207px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvcorreoE" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Direccion:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtDireccion" runat="server" Width="136px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Nacionalidad:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="135px" CssClass="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="*" ForeColor="#CC0000" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28">
                    <asp:RegularExpressionValidator ID="revdire" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="*El nombre debe contener solo letras." ValidationExpression="^[a-zA-Z]+$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Provincia:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" ValidationGroup="1" CssClass="custom-select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ErrorMessage="*" ForeColor="#CC0000" InitialValue="--------------Seleccionar--------------" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Localidad:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlLocalidad" runat="server" AutoPostBack="True" CssClass="custom-select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvlocalidad" runat="server" ControlToValidate="ddlLocalidad" ErrorMessage="*" ForeColor="#CC0000" InitialValue="--------------Seleccionar--------------" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Especialidad:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEspecialidad" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" CssClass="custom-select">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvespecialidad" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="*" ForeColor="#CC0000" InitialValue="--------------Seleccionar--------------" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style54"></td>
            <td class="auto-style54"></td>
            <td class="auto-style30"></td>
            <td class="auto-style27">Fecha de Nacimiento:</td>
            <td class="auto-style41" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" Width="207px" CssClass="auto-style69" Height="20px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvnacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style28"></td>
            <td class="auto-style58"></td>
            <td class="auto-style58"></td>
        </tr>
        <tr>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style66">&nbsp;</td>
            <td class="auto-style68">&nbsp;</td>
            <td class="auto-style21" colspan="3">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style57">&nbsp;</td>
            <td class="auto-style57">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style66">&nbsp;</td>
            <td class="auto-style24" colspan="4"><asp:Button  ID ="BtnAceptaAlta" runat="server" Text="Aceptar" ForeColor="Black" ValidationGroup="1" Height="42px" Width="156px" OnClick="BtnAceptaAlta_Click" CssClass="my-button" />
                    </td>
            <td class="auto-style51">&nbsp;</td>
            <td class="auto-style57">&nbsp;</td>
            <td class="auto-style57">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style55">&nbsp;</td>
            <td class="auto-style66">&nbsp;</td>
            <td class="auto-style24" colspan="4">
                <asp:Label ID="LblConfirmaAlta" runat="server" ForeColor="Red"></asp:Label>
                    </td>
            <td class="auto-style51">&nbsp;</td>
            <td class="auto-style57">&nbsp;</td>
            <td class="auto-style57">&nbsp;</td>
        </tr>
    </table>
    
</asp:Content>
