<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--Titulo-->
    <link rel="stylesheet" href="Css/masterPage.css" />
    <title>Clinica Medica</title>
    <!--Hojas de estilo-->
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 179px;
        }
        .auto-style2 {
            width: 474px;
        }
        .auto-style3 {
            width: 474px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            width: 474px;
            height: 31px;
        }
        .auto-style6 {
            height: 31px;
        }
        .auto-style8 {
            text-align: right;
            width: 202px;
        }
        .auto-style9 {
            width: 474px;
            height: 30px;
        }
        .auto-style10 {
            text-align: right;
            height: 30px;
            width: 202px;
        }
        .auto-style11 {
            height: 30px;
        }
        .auto-style12 {
            width: 166px;
        }
        .auto-style13 {
            height: 31px;
            width: 166px;
        }
        .auto-style14 {
            height: 26px;
            width: 166px;
        }
        .auto-style15 {
            text-align: center;
            height: 96px;
        }
        .auto-style16 {
            height: 96px;
        }
        .auto-style19 {
            height: 96px;
            text-align: center;
        }
        .auto-style20 {
            height: 32px;
            width: 202px;
        }
        .auto-style21 {
            width: 202px;
            height: 31px;
            margin-left: 120px;
        }
        .auto-style22 {
            width: 202px;
            height: 26px;
        }
        .auto-style23 {
            color: #FF0000;
        }
        .auto-style24 {
            width: 474px;
            height: 23px;
        }
        .auto-style25 {
            text-align: right;
            width: 202px;
            height: 23px;
        }
        .auto-style26 {
            height: 23px;
        }
        .auto-style27 {
            width: 171px;
            height: 163px;
        }
        .auto-style28 {
            height: 146px;
            text-align: center;
        }
        .auto-style29 {
            height: 31px;
            text-align: left;
        }
    </style>
    </head>
    <body>    
        <form id="form1" runat="server">
            <div class="login-box">     
                <div class="login-header">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style19" colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style28" colspan="4">
                            <img src="/Imagenes/login.jpg" alt="Mi imagen" class="auto-style27" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19" colspan="4">
                <h1 style="font-size: 24px; font-family: Arial, Helvetica, sans-serif; color:#808083;">LOGIN</h1>
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style8" style="font-family: Arial, Helvetica, sans-serif;">Usuario: </td>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtUsuario" CssClass="textbox" ValidationGroup="grupo3" Height="25px" Width="159px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsuario" ForeColor="Red" ValidationGroup="grupo3" CssClass="auto-style23">*Ingrese ususario</asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style24"></td>
                        <td class="auto-style25"></td>
                        <td class="auto-style26"></td>
                        <td class="auto-style26"></td>
                    </tr>
                    <tr>
                        <td class="auto-style9"></td>
                        <td class="auto-style10"  style="font-family: Arial, Helvetica, sans-serif;">Contraseña:</td>
                        <td class="auto-style11"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtContrasena" TextMode="Password" CssClass="textbox" ValidationGroup="grupo3" Height="25px" Width="159px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContrasena" ForeColor="Red" ValidationGroup="grupo3" CssClass="auto-style23">* ingrese Contraseña</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style11"></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style20">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style20">&nbsp;</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button runat="server" Text="Ingresar" ID="btnIngresar" CssClass="my-button" style="margin-bottom: 17px; left: 0px; top: 0px;" OnClick="btnIngresar_Click" ValidationGroup="grupo3"></asp:Button>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style21">&nbsp;</td>
                        <td class="auto-style29">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label runat="server" ID="lbl_usuario" CssClass="sumbit" style="color: #FF0000"></asp:Label></td>
                        <td class="auto-style6"></td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style22"></td>
                        <td class="auto-style4"></td>
                        <td class="auto-style4"></td>
                    </tr>
                </table>
            </div>
      </div>
    </form>
</body>
</html>
