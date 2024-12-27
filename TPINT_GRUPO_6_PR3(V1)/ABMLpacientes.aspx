<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ABMLpacientes.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ABMLpacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style22 {
            height: 56px;
        }
        .auto-style23 {
            height: 60px;
        }
        .auto-style24 {
            text-align: center;
            height: 60px;
        }
        .auto-style25 {
            height: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link rel="stylesheet" href="Css/masterPage.css" />
    <div class="container">
    <table class="auto-style20">
    <tr>
        <td  style="font-size: 24px; color:#808083; font-family: Arial, Helvetica, sans-serif;" class="auto-style22">GESTION PACIENTES</td>
        <td class="auto-style22"></td>
    </tr>
    <tr>
        <td class="auto-style23">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ALTA PACIENTE" CssClass="my-buttonC" />
        </td>
        <td class="auto-style23"></td>
    </tr>
    <tr>
        <td class="auto-style24">
            <asp:Button ID="Button4" runat="server" Text="BAJA LOGICA PACIENTE" OnClick="Button4_Click" CssClass="my-buttonC" />
        </td>
        <td class="auto-style24"></td>
    </tr>
    <tr>
        <td class="auto-style25">
            <asp:Button ID="Button3" runat="server" Text="LISTAR Y MODIFICAR PACIENTE" OnClick="Button3_Click" CssClass="my-buttonC"/>
        </td>
        <td class="auto-style25"></td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
       </div>
</asp:Content>
