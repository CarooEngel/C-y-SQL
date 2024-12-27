<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="altaMedicoHorario.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.altaMedicoHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            height: 23px;
        }
        .auto-style23 {
            height: 23px;
            width: 341px;
            text-align: right;
        }
        .auto-style25 {
            height: 23px;
            width: 149px;
        }
        .auto-style26 {
            width: 149px;
        }
        .auto-style27 {
            height: 23px;
            width: 107px;
        }
        .auto-style28 {
            width: 107px;
        }
        .auto-style29 {
            width: 341px;
        }
        .auto-style30 {
            height: 23px;
            width: 435px;
            text-align: left;
        }
        .auto-style31 {
            width: 435px;
        }
        .auto-style33 {
            width: 171px;
        }
        .auto-style35 {
            width: 72px;
        }
        .auto-style36 {
            width: 107px;
            height: 26px;
        }
        .auto-style37 {
            width: 341px;
            height: 26px;
            text-align: right;
        }
        .auto-style38 {
            width: 149px;
            height: 26px;
        }
        .auto-style39 {
            width: 72px;
            height: 26px;
            text-align: right;
        }
        .auto-style40 {
            width: 171px;
            height: 26px;
        }
        .auto-style41 {
            width: 435px;
            height: 26px;
        }
        .auto-style42 {
            height: 26px;
        }
        .auto-style43 {
            width: 296px;
        }
        .auto-style44 {
            width: 341px;
            text-align: right;
        }
        .auto-style45 {
            width: 72px;
            text-align: right;
        }
        .auto-style46 {
            text-align: left;
        }
        .auto-style47 {
            height: 23px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <table class="auto-style21">
            <tr>
                <td class="auto-style46">
                    <asp:HyperLink ID="HypVolver" runat="server" NavigateUrl="~/ABMLmedico.aspx">Volver</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        ALTA HORARIO MEDICO</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table class="auto-style21">
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style43" rowspan="9">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                    <DayStyle BackColor="#CCCCCC" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                </asp:Calendar>
            </td>
            <td class="auto-style23">Ingrese Legajo Medico: </td>
            <td class="auto-style25">
                <asp:TextBox ID="Text_Legajo" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="Text_Legajo" ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style47" colspan="2">
                <asp:Button ID="btnValidar" runat="server" CssClass="my-button" OnClick="btnValidar_Click" Text="Validar" ValidationGroup="1" />
            </td>
            <td class="auto-style30">
                <asp:Label ID="lblExiste" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style22">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style36"></td>
            <td class="auto-style37">Dia Semana:</td>
            <td class="auto-style38">
                <asp:DropDownList ID="DropSemana" runat="server" CssClass="custom-select" AutoPostBack="True" ValidationGroup="2">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDia" runat="server" ControlToValidate="DropSemana" ErrorMessage="*" ForeColor="Red" InitialValue="Seleccione Semana" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style39">Mes: </td>
            <td class="auto-style40">
                <asp:DropDownList ID="DropMES" runat="server" CssClass="custom-select" AutoPostBack="True" ValidationGroup="2">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvMes" runat="server" ControlToValidate="DropMES" ErrorMessage="*" ForeColor="Red" InitialValue="Seleccione Mes" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style41"></td>
            <td class="auto-style42"></td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style44">Desde: </td>
            <td class="auto-style26">
                <asp:TextBox ID="Text_Desdes" runat="server" TextMode="Time" CssClass="textbox" min="09:00" max="17:00" ValidationGroup="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDesde" runat="server" ControlToValidate="Text_Desdes" ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style45">Hasta:</td>
            <td class="auto-style33">
                <asp:TextBox ID="Text_Hasta" runat="server" TextMode="Time" CssClass="textbox" ValidationGroup="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHasta" runat="server" ControlToValidate="Text_Hasta" ErrorMessage="*" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style26">
                <asp:Button ID="btn_AgregarHs" runat="server" CssClass="my-button" OnClick="btn_AgregarHs_Click" Text="Agregar Horario" ValidationGroup="2" />
            </td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style22" colspan="5">
                <asp:Label ID="lbl_altaHorariomedica_msn" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style22"></td>
        </tr>
    </table>
</asp:Content>
