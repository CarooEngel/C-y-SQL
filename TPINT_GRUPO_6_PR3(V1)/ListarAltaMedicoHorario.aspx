<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ListarAltaMedicoHorario.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ListarAltaMedicoHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style20 {
            width: 100%;
        }
        .auto-style22 {
            width: 341px;
        }
        .auto-style23 {
            text-align: left;
        }
        .auto-style24 {
            height: 53px;
        }
        .auto-style25 {
            width: 100%;
        }
        .auto-style26 {
            width: 208px;
        }
        .auto-style27 {
            width: 341px;
            height: 50px;
        }
        .auto-style28 {
            width: 275px;
            height: 50px;
            text-align: right;
        }
        .auto-style29 {
            width: 208px;
            height: 50px;
            text-align: left;
        }
        .auto-style30 {
            height: 50px;
            text-align: left;
        }
        .auto-style31 {
            width: 275px;
        }
        .auto-style32 {
            width: 617px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style23">
                <asp:HyperLink ID="hplVolver" runat="server" NavigateUrl="~/ABMLmedico.aspx">Volver</asp:HyperLink>
            </p>
    <table class="auto-style20">
        <tr>
            <td class="auto-style22">
                &nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td  style="font-size: 24px; color:#808083; font-family: Arial, Helvetica, sans-serif;" colspan="4" class="auto-style24" >Listado Horario dados de alta a partir de la fecha actual y el horario actual.</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style31" style="font-family: Arial, Helvetica, sans-serif;">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style28" style="font-family: Arial, Helvetica, sans-serif;">Legajo medico :</td>
            <td class="auto-style29">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Txt_LegajoM" runat="server" CssClass="textbox"></asp:TextBox>
            </td>
            <td class="auto-style30">&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_buscar" runat="server" Text="Filtrar" OnClick="btn_buscar_Click"  CssClass="my-buttonC"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td> 
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style26"><asp:Button ID="btn_limpiat" runat="server" OnClick="btn_limpiat_Click" Text="Limpiar filtro"  CssClass="my-buttonC"/>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td> 
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td> 
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style26">
                <asp:Label ID="lbl_error" runat="server" ForeColor="#FF33CC"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style25">
        <tr>
            <td class="auto-style32">&nbsp;</td>
            <td>
                <asp:GridView ID="Grid_ListarHSMedico" runat="server" AllowPaging="True" OnPageIndexChanging="Grid_ListarHSMedico_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" >
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
    <p>
        &nbsp;</p>
</asp:Content>
