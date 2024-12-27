<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="bajaLogicaPacientes.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.bajaLogicaPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style20 {
        width: 100%;
    }
        .auto-style21 {
            height: 30px;
        }
        .auto-style23 {
            height: 30px;
            width: 734px;
            text-align: right;
        }
        .auto-style24 {
            width: 734px;
        }
        .auto-style25 {
            height: 30px;
            text-align: left;
        }
        .auto-style26 {
            text-align: left;
        }
        .auto-style27 {
            height: 116px;
        }
        .auto-style28 {
            width: 734px;
            height: 50px;
        }
        .auto-style29 {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style26">
        <asp:HyperLink ID="hplvolver" runat="server" NavigateUrl="~/ABMLpacientes.aspx">Volver</asp:HyperLink>
    </p>
<table class="auto-style20">
    <tr>
        <td class="auto-style27"  style="font-size: 24px; color:#808083; font-family: Arial, Helvetica, sans-serif;" colspan="2" >BAJA LOGICA PACIENTE</td>
        <td class="auto-style27"></td>
    </tr>
    <tr>
        <td class="auto-style24">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style23" style="font-family: Arial, Helvetica, sans-serif;">Ingrese DNI paciente:</td>
        <td class="auto-style25">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_DNI" runat="server" ValidationGroup="grupo2" CssClass="textbox"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_DNI" ForeColor="#FF33CC" ValidationGroup="grupo2">*</asp:RequiredFieldValidator>
        &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ClientIDMode="AutoID" ControlToValidate="txt_DNI" ForeColor="#FF33CC" ValidationExpression="^\d+$" ValidationGroup="grupo2">*Solo ingrese NUMEROS</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style21"></td>
    </tr>
    <tr>
        <td class="auto-style28"></td>
        <td class="auto-style29">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        <td class="auto-style29"></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btn_Baja" runat="server" OnClick="btn_Baja_Click" Text="Dar de Baja" ValidationGroup="grupo2"  OnClientClick="return validarCondicion();" CssClass="my-buttonC" />
            <asp:Label 
    ID="Label1" 
    runat="server" 
    ForeColor="Red">
</asp:Label> 
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
<asp:Label ID="lbl_bajaPaciente" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
<p>
    &nbsp;</p>

    <script type="text/javascript">
        function validarCondicion() {
          
            // Obtener el valor del campo de texto
            var dni = document.getElementById('<%= txt_DNI.ClientID %>').value.trim();

            // Verificar si el campo está vacío
            if (dni == "" || isNaN(dni)) {
                alert("El campo DNI está  incorrecto.");
         

                return false; // Detiene la ejecución del OnClick
            }

            // Si el campo tiene información, mostrar el mensaje de confirmación
            return confirm("¿Estás seguro de dar de baja lógica al paciente?");
        }
    </script>

  
</asp:Content>
