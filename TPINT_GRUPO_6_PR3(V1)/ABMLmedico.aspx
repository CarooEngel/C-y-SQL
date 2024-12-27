<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ABMLmedico.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ABMLmedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style20 {
        height: 23px;
    }
        .auto-style22 {
            height: 59px;
        }
        .auto-style23 {
            height: 59px;
            text-align: center;
        }
        .auto-style24 {
            height: 59px;
            width: 317px;
        }
        .auto-style25 {
            height: 59px;
            text-align: center;
            width: 317px;
        }
        .auto-style26 {
            width: 317px;
        }
        .auto-style27 {
            height: 60px;
            width: 317px;
        }
        .auto-style28 {
            height: 60px;
        }
        .auto-style29 {
            height: 66px;
            width: 317px;
        }
        .auto-style30 {
            height: 66px;
        }
        .auto-style31 {
            height: 61px;
            width: 317px;
        }
        .auto-style32 {
            height: 61px;
        }
    </style>
</asp:Content>
 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Css/masterPage.css" />
<div class="container">
    <table class="auto-style20">
    <tr>
        <td  style="font-size: 24px; color:#808083; font-family: Arial, Helvetica, sans-serif;" class="auto-style31">GESTION MEDICOS</td>
        <td class="auto-style32"></td>
    </tr>
    <tr>
        <td class="auto-style24">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ALTA MEDICO" CssClass="my-buttonC"/>
        </td>
        <td class="auto-style22"></td>
    </tr>
    <tr>
        <td class="auto-style25">
            <asp:Button ID="Button4" runat="server" Text="BAJA LOGICA MEDICO" OnClick="Button4_Click" CssClass="my-buttonC" />
        </td>
        <td class="auto-style23"></td>
    </tr>
    <tr>
        <td class="auto-style27">
            <asp:Button ID="Button3" runat="server" Text="LISTAR Y MODIFICAR MEDICO" OnClick="Button3_Click" CssClass="my-buttonC"/>
        </td>
        <td class="auto-style28"></td>
    </tr>
    <tr>
        <td class="auto-style24">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="ALTA HORARIO MEDICO" CssClass="my-buttonC" />
        </td>
        <td class="auto-style22"></td>
    </tr>
    <tr>
        <td class="auto-style29">
            <asp:Button ID="Button6" runat="server" Text="LISTAR HORARIOS" OnClick="Button6_Click" CssClass="my-buttonC" />
        </td>
        <td class="auto-style30"></td>
    </tr>
    <tr>
        <td class="auto-style27">
            <asp:Button ID="Button7" runat="server" Text="ALTA USUARIO NUEVO" OnClick="Button7_Click"  CssClass="my-buttonC"/>
        </td>
        <td class="auto-style28"></td>
    </tr>
    <tr>
        <td class="auto-style26">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
    </div>
</asp:Content>
