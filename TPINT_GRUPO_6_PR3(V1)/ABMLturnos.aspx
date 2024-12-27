<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ABMLturnos.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ABMLturnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style20 {
            width: 1140px;
        }
        .auto-style22 {
            width: 589px;
            height: 59px;
        }
        .auto-style23 {
            width: 752px;
            text-align: center;
            margin-left: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link rel="stylesheet" href="Css/masterPage.css" />
<div class="container">
    <table class="auto-style23">
    <tr>
        <td  style="font-size: 24px; color:#808083; font-family: Arial, Helvetica, sans-serif;" class="auto-style22">GESTION TURNOS<br />
        </td>
    </tr>
    <tr>
        <td class="auto-style22">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="my-buttonC" Text="ALTA TURNO" />
        </td>
    </tr>
    <tr>
        <td class="auto-style22">
            <asp:Button ID="Button2" runat="server" Text="BAJA LOGICA TURNO" CssClass="my-buttonC" OnClick="Button2_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style22">
            <asp:Button ID="Button3" runat="server" Text="LISTAR TURNO" CssClass="my-buttonC" OnClick="Button3_Click" />
        </td>
    </tr>
         
    </table>
 </div>
</asp:Content>

