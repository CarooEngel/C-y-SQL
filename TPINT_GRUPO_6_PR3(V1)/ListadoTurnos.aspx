<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ListadoTurnos.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ListadoTurnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style19 {
        width: 100%;
    }
    .auto-style21 {
            width: 532px;
        }
        .auto-style22 {
            width: 703px;
            height: 9px;
            text-align: right;
        }
        .auto-style25 {
            width: 532px;
            text-align: left;
        }
        .auto-style26 {
            width: 391px;
        }
        .auto-style28 {
            height: 9px;
        }
        .auto-style29 {
            width: 703px;
            text-align: right;
            height: 35px;
        }
        .auto-style30 {
            width: 389px;
            height: 9px;
        }
        .auto-style31 {
            width: 389px;
            height: 58px;
        }
        .auto-style32 {
            width: 703px;
            text-align: right;
            height: 58px;
        }
        .auto-style34 {
            height: 58px;
        }
        .auto-style35 {
            width: 118px;
            height: 9px;
            text-align: center;
        }
        .auto-style36 {
            width: 118px;
            height: 58px;
        }
        .auto-style37 {
            width: 703px;
        }
        .auto-style38 {
            width: 532px;
            text-align: left;
            height: 35px;
        }
        .auto-style39 {
            height: 35px;
        }
        .auto-style40 {
            text-align: center;
        }
        .auto-style41 {
            width: 1056px;
            float: left;
            height: 176px;
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
                <asp:HyperLink ID="Hplvolver" runat="server" NavigateUrl="~/ABMLturnos.aspx">Volver</asp:HyperLink>
        <br />
    <table class="auto-style41">
        <tr>
            <td class="auto-style22">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ingrese Legajo Medico:</td>
            <td class="auto-style30">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtLegajo" runat="server" Width="200px" CssClass="textbox"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                </td>
            <td class="auto-style35" colspan="2">
                <asp:Button ID="btnXlegajo" runat="server" Text="Filtrar" Width="111px" OnClick="btnXlegajo_Click" CssClass="my-button" ValidationGroup="1" />
            </td>
            <td class="auto-style25" rowspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnMostrarTodo" runat="server" CssClass="my-button" OnClick="btnMostrarTodo_Click" Text="Mostrar Todo" />
            </td>
            <td class="auto-style28"></td>
        </tr>
        <tr>
            <td class="auto-style32">:</td>
            <td class="auto-style31">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td class="auto-style36" colspan="2">
                <br />
            </td>
            <td class="auto-style34"></td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:Label ID="Label1" runat="server" Text="Ingrese DNI Paciente"></asp:Label>
            </td>
            <td class="auto-style38" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtDniP" runat="server" CssClass="textbox" Width="201px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="auto-style38" colspan="2">
                <asp:Button ID="btnDNIpaciente" runat="server" Text="Filtrar" Width="111px" OnClick="btnFiltrarxDNI_Click" CssClass="my-button" ValidationGroup="1" />
            </td>
            <td class="auto-style39"></td>
        </tr>
        <tr>
            <td class="auto-style37">
                &nbsp;</td>
            <td class="auto-style21" colspan="4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</p>
    <table class="auto-style19">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="auto-style40">
                <asp:GridView ID="grd_ListarTurnos" runat="server" Width="750px" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        </tr>
    </table>
</asp:Content>
