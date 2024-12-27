<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="AgregarTurnos.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.AgregarTurnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style38 {
            margin-right: 2px;
        }
        .auto-style39 {
            width: 629px;
        }
        .auto-style40 {
            height: 41px;
        }
        .auto-style41 {
            height: 39px;
        }
        .auto-style42 {
            height: 42px;
        }
        .auto-style44 {
            height: 41px;
            width: 66px;
        }
        .auto-style45 {
            height: 39px;
            width: 66px;
        }
        .auto-style46 {
            height: 42px;
            width: 66px;
        }
        .auto-style48 {
            height: 115px;
        }
        .auto-style49 {
            height: 115px;
            width: 66px;
        }
        .auto-style50 {
            width: 66px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        COMPLETE LOS DATOS REQUERIDOS PARA SACAR TURNO MEDICO</p>
    <table class="auto-style21">
        <tr>
            <td class="auto-style48"></td>
            <td class="auto-style49"></td>
            <td class="auto-style48"></td>
            <td class="auto-style48"></td>
            <td class="auto-style48"></td>
        </tr>
        <tr>
            <td class="auto-style40"></td>
            <td class="auto-style44">
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ABMLturnos.aspx">Volver</asp:HyperLink>
            </td>
            <td class="auto-style40">Dni Paciente:
                <asp:TextBox ID="txtDni" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style40"></td>
            <td class="auto-style40"></td>
        </tr>
        <tr>
            <td class="auto-style41"></td>
            <td class="auto-style45"></td>
            <td class="auto-style41">&nbsp;Especialidad:<asp:DropDownList ID="ddlEspecialidad" runat="server" AutoPostBack="True" CssClass="custom-select" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style41"></td>
            <td class="auto-style41"></td>
        </tr>
        <tr>
            <td class="auto-style42"></td>
            <td class="auto-style46"></td>
            <td class="auto-style42">&nbsp; Medico:
                <asp:DropDownList ID="ddlMedico" runat="server" CssClass="custom-select" AutoPostBack="True">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvMedico" runat="server" ControlToValidate="ddlMedico" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style42"></td>
            <td class="auto-style42"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style50">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style50">&nbsp;</td>
            <td>
                <asp:Button ID="btn_buscarTunoDisponible" runat="server" CssClass="my-button" OnClick="btn_buscarTunoDisponible_Click" Text="Ver Disponibilidad" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style21">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style39">
                <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
            <asp:GridView ID="GridTurnosDisponibles" runat="server" AllowPaging="True" Width="247px" 
    OnPageIndexChanging="GridTurnosDisponibles_PageIndexChanging" AutoGenerateSelectButton="True"  OnSelectedIndexChanged="GridTurnosDisponibles_SelectedIndexChanged" CssClass="auto-style38" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
     
            </asp:GridView>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
