<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="BajaLogicaTurno.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.BajaLogicaTurno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style20 {
        width: 100%;
    }
    .auto-style21 {
        height: 26px;
    }
    .auto-style22 {
        width: 255px;
    }
    .auto-style23 {
        height: 26px;
        width: 255px;
    }
    .auto-style26 {
        width: 255px;
        height: 33px;
    }
    .auto-style28 {
        height: 33px;
    }
        .auto-style29 {
            width: 270px;
            text-align: right;
        }
        .auto-style30 {
            width: 384px;
        }
        .auto-style31 {
            height: 26px;
            width: 384px;
        }
        .auto-style32 {
            height: 33px;
            width: 384px;
        }
        .auto-style33 {
            width: 270px;
        }
        .auto-style34 {
            height: 26px;
            width: 270px;
        }
        .auto-style35 {
            width: 270px;
            height: 33px;
        }
        .auto-style37 {
            width: 252px;
        }
        .auto-style39 {
            text-align: center;
        }
        .auto-style40 {
            width: 384px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style20">
    <tr>
        <td class="auto-style22">
            <asp:HyperLink ID="HplVolver" runat="server" NavigateUrl="~/ABMLturnos.aspx">Volver</asp:HyperLink>
        </td>
        <td class="auto-style33">&nbsp;</td>
        <td class="auto-style30">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style22">&nbsp;</td>
        <td class="auto-style39" colspan="2">BAJA LÓGICA TURNO</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style23"></td>
        <td class="auto-style34"></td>
        <td class="auto-style31"></td>
        <td class="auto-style21">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style22">&nbsp;</td>
        <td class="auto-style29">
            Ingrese el numero de turno asignado:</td>
        <td class="auto-style30">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtBajaLogicaTurno" runat="server" Width="306px" CssClass="textbox"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btn_ver" runat="server" CssClass="my-button" OnClick="btn_ver_Click" Text="Ver" />
        </td>
    </tr>
    <tr>
        <td class="auto-style26"></td>
        <td class="auto-style35">
            &nbsp;</td>
        <td class="auto-style32"></td>
        <td class="auto-style28">&nbsp;</td>
    </tr>
    </table>
    <table class="auto-style20">
    <tr>
        <td class="auto-style37">
            &nbsp;</td>
        <td class="auto-style33">&nbsp;</td>
        <td class="auto-style40">
            <asp:GridView ID="grdMedico" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Legajo">
                        <ItemTemplate>
                            <asp:Label ID="lbllegajo" runat="server" Text='<%# Bind("Legajo_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre Medico">
                        <ItemTemplate>
                            <asp:Label ID="lblDni" runat="server" Text='<%# Bind("NombreMedico") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dni Paciente">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("DNIpaciente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <ItemTemplate>
                            <asp:Label ID="lblEspecialidad" runat="server" Text='<%# Bind("descripcion_Esp") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
            <br />
            <asp:Button ID="btnBaja" runat="server" CssClass="my-button" Text="Dar de Baja" Visible="False" OnClick="btnBaja_Click" OnClientClick="return validarCondicion();" />
            <br />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style37">
            &nbsp;</td>
        <td class="auto-style33">&nbsp;</td>
        <td class="auto-style40">
            <asp:Label ID="lblmensaje" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
     <script type="text/javascript">
    function validarCondicion() {
      
        // Obtener el valor del campo de texto
        var turno = document.getElementById('<%= txtBajaLogicaTurno.ClientID %>').value.trim();

        // Verificar si el campo está vacío
        if (turno == "" ) {
            alert("El campo TURNO está  incorrecto.");
     

            return false; // Detiene la ejecución del OnClick
        }

        // Si el campo tiene información, mostrar el mensaje de confirmación
        return confirm("¿Estás seguro de dar de baja lógica al TURNO?");
    }
     </script>
</asp:Content>
