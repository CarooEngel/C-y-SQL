<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ListarMedico.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ListarMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style20 {
            width: 100%;
        }
        .auto-style53 {
            border-radius: 30px;
        }
        .auto-style54 {
            text-align: right;
            width: 485px;
        }
        .auto-style55 {
            width: 485px;
        }
        .auto-style57 {
            width: 341px;
            text-align: center;
        }
        .auto-style58 {
            width: 100%;
            height: 377px;
        }
        .auto-style59 {
            text-align: left;
            width: 303px;
        }
        .auto-style60 {
            width: 303px;
        }
        .auto-style61 {
            width: 123px;
            text-align: center;
        }
        .auto-style62 {
            width: 118px;
        }
        .auto-style63 {
            height: 50px;
        }
        .auto-style64 {
            text-align: right;
            width: 485px;
            height: 50px;
        }
        .auto-style65 {
            text-align: left;
            width: 303px;
            height: 50px;
        }
        .auto-style66 {
            width: 123px;
            text-align: center;
            height: 50px;
        }
        .auto-style67 {
            text-align: left;
        }
        .auto-style68 {
            height: 26px;
        }
        .auto-style69 {
            width: 485px;
            height: 26px;
        }
        .auto-style70 {
            width: 303px;
            height: 26px;
        }
        .auto-style71 {
            width: 123px;
            text-align: center;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style20">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style55">
                <asp:HyperLink ID="hplvolver" runat="server" NavigateUrl="~/ABMLmedico.aspx">volver</asp:HyperLink>
            </td>
            <td class="auto-style60">&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style63"></td>
            <td class="auto-style64">Buscar&nbsp; medico por DNI</td>
            <td class="auto-style65">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_buscar_DNI_ME" runat="server" Width="250px" CssClass="auto-style53" Height="25px"></asp:TextBox>
            </td>
            <td class="auto-style66">
            <asp:Button ID="btn_buscar_HC_ME" runat="server" Text="Buscar " OnClick="btn_buscar_HC_ME_Click" ValidationGroup="1" CssClass="my-button" />
            </td>
            <td rowspan="2">
            &nbsp;&nbsp;
            <asp:Button ID="btnMostrarTodo" runat="server" OnClick="btnMostrarTodo_Click" Text="Mostrar Todo" CssClass="my-button" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style54">Buscar por Inicial de Nombre</td>
            <td class="auto-style59">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_buscar_bomApe_ME" runat="server" Width="250px" CssClass="auto-style53" Height="25px"></asp:TextBox>
            </td>
            <td class="auto-style61">
            <asp:Button ID="btn_buscra_nomAPe_ME" runat="server" Text="Buscar " OnClick="btn_buscra_nomAPe_ME_Click" ValidationGroup="2" CssClass="my-button" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style54">Buscar Por Fecha de Nacimiento</td>
            <td class="auto-style60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFechaNac" runat="server" AutoPostBack="True" CssClass="grid" Height="25px" Width="250px" TextMode="Date"></asp:TextBox>
            </td>
            <td class="auto-style61">
                <asp:DropDownList ID="ddlFiltroDni" runat="server" AutoPostBack="True" CssClass="custom-select" ValidationGroup="3" OnSelectedIndexChanged="ddlFiltroDni_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="auto-style67">&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style54">Buscar Por Provincia</td>
            <td class="auto-style60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlProvinciasFiltro" runat="server" CssClass="custom-select" Height="25px" ValidationGroup="4" Width="250px">
                </asp:DropDownList>
&nbsp;</td>
            <td class="auto-style61">
            <asp:Button ID="btnBuscarProv" runat="server" Text="Buscar " OnClick="btnBuscarProv_Click" CssClass="my-button" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style68"></td>
            <td class="auto-style69"></td>
            <td class="auto-style70"></td>
            <td class="auto-style71"></td>
            <td class="auto-style68">
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style55">
                <asp:Label ID="lblModificar" runat="server"></asp:Label>
            </td>
            <td class="auto-style60">&nbsp;</td>
            <td class="auto-style61">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style58">
        <tr>
            <td class="auto-style62" rowspan="4">&nbsp;</td>
            <td rowspan="4">&nbsp;</td>
            <td class="auto-style57" rowspan="4">
                <asp:GridView ID="grdMedico" runat="server" Width="509px" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="grdMedico_PageIndexChanging" CellPadding="4" CssClass="grid" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="grdMedico_RowCancelingEdit" OnRowEditing="grdMedico_RowEditing" OnRowUpdating="grdMedico_RowUpdating" PageSize="5" OnRowDataBound="grdMedico_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField DeleteText="" EditText="Modificar" ShowEditButton="True" ValidationGroup="5" />
                    <asp:TemplateField HeaderText="Legajo">
                        <EditItemTemplate>
                            <asp:Label ID="lblLegajoE" runat="server" Text='<%# Bind("Legajo_Me") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblLegajo" runat="server" Text='<%# Bind("Legajo_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_eit_especialidad" runat="server" AutoPostBack="True" CssClass="custom-select" DataTextField="descripcion_Esp" DataValueField="IdEspecialidad_Esp">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIdEspecialidad" runat="server" Text='<%# Bind("descripcion_Esp") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombreE" runat="server" Text='<%# Bind("Nombre_Me") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtApellido" runat="server" Text='<%# Bind("Apellido_Me") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblApellido" runat="server" Text='<%# Bind("Apellido_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dni">
                        <EditItemTemplate>
                            <asp:Label ID="txtDniE" runat="server" Text='<%# Bind("Dni_Me") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDni" runat="server" Text='<%# Bind("Dni_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de Nacimiento">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNacimientoE" runat="server" Text='<%# Bind("FechaNacimiento_Me") %>' TextMode="Date" ValidationGroup="5"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvfechana" runat="server" ControlToValidate="txtNacimientoE" ErrorMessage="*" ForeColor="Red" ValidationGroup="5"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNacimiento" runat="server" Text='<%# Bind("FechaNacimiento_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDirecionE" runat="server" Text='<%# Bind("Direccion_Me") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCorreroEE" runat="server" Text='<%# Bind("CorreoElectronico_Me") %>' TextMode="Email"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCorreo" runat="server" Text='<%# Bind("CorreoElectronico_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTelefonoE" runat="server" Text='<%# Bind("Telefono_Me") %>' TextMode="Phone"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <EditItemTemplate>
                            <asp:RadioButtonList ID="rbsexo" runat="server" AutoPostBack="True" CssClass="radiobt" RepeatDirection="Horizontal" ValidationGroup="5">
                                <asp:ListItem Value="M">M</asp:ListItem>
                                <asp:ListItem Value="F">F</asp:ListItem>
                            </asp:RadioButtonList>
                            <div class="auto-style67">
                                <asp:RequiredFieldValidator ID="rfvsexo" runat="server" ControlToValidate="rbsexo" ErrorMessage="*" ForeColor="Red" ValidationGroup="5"></asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("Sexo_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNacionalidadE" runat="server" Text='<%# Bind("Nacionalidad_Me") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Me") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_eit_provincia" runat="server" AutoPostBack="True" DataTextField="descripcionProvincia_Pr" DataValueField="IdProvincias_Pr">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblProv" runat="server" Text='<%# Bind("descripcionProvincia_Pr") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_eit_Localidad" runat="server" DataTextField="descripcionLocalidad_Loc" DataValueField="IdLocalidad_Loc">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblLoc" runat="server" Text='<%# Bind("descripcionLocalidad_Loc") %>'></asp:Label>
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
            </td>
            <td rowspan="4">
                <br />
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>



