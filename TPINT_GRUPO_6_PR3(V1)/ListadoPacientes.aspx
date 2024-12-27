<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="ListadoPacientes.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.ListadoPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style25 {
            margin-top: 3px;
        }
        .auto-style26 {
            width: 176px;
        }
        .auto-style27 {
            text-align: right;
            width: 674px;
        }
        .auto-style30 {
            height: 23px;
        }
        .auto-style31 {
            width: 191px;
            height: 23px;
        }
        .auto-style33 {
            height: 23px;
            width: 674px;
        }
        .auto-style34 {
            width: 333px;
        }
        .auto-style35 {
            height: 23px;
            width: 333px;
        }
        .auto-style36 {
            width: 59px;
        }
        .auto-style37 {
            width: 191px;
        }
        .auto-style38 {
            text-align: right;
            width: 674px;
            height: 23px;
        }
        .auto-style39 {
            text-align: left;
            width: 191px;
            height: 23px;
        }
        .auto-style43 {
            height: 37px;
        }
        .auto-style44 {
            text-align: right;
            width: 674px;
            height: 37px;
        }
        .auto-style45 {
            text-align: left;
            width: 191px;
            height: 37px;
        }
        .auto-style47 {
            text-align: right;
            width: 674px;
            height: 32px;
        }
        .auto-style48 {
            text-align: left;
            width: 191px;
            height: 32px;
        }
        .auto-style50 {
            height: 53px;
            width: 674px;
        }
        .auto-style51 {
            width: 191px;
            height: 53px;
        }
        .auto-style52 {
            height: 53px;
            width: 333px;
        }
        .auto-style53 {
            height: 53px;
        }
        .auto-style54 {
            width: 674px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Listado De Pacientes y Modificar<br />
        <table class="auto-style21">
            <tr>
                <td class="auto-style53">
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/ABMLpacientes.aspx">Volver</asp:HyperLink>
                </td>
                <td class="auto-style50"></td>
                <td class="auto-style51"></td>
                <td class="auto-style52"></td>
                <td class="auto-style53"></td>
            </tr>
            <tr>
                <td class="auto-style43"></td>
                <td class="auto-style44">Filtrar por DNI:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txt_FiltrarPacientexDNI" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp; </td>
                <td class="auto-style45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_Filtrar" runat="server" CssClass="my-button" OnClick="btn_Filtrar_Click" Text="Filtrar" ValidationGroup="1" />
                </td>
                <td class="auto-style34" rowspan="3">
                    <asp:Button ID="btn_LimpiarTabla" runat="server" CssClass="my-button" Text="Limpiar Filtros" OnClick="btn_LimpiarTabla_Click" />
                </td>
                <td rowspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30"></td>
                <td class="auto-style38"></td>
                <td class="auto-style39"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style47">Buscar por Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txt_BuscarxNomApe" runat="server" CssClass="textbox"></asp:TextBox>
                </td>
                <td class="auto-style48">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_Buscar" runat="server" CssClass="my-button" OnClick="btn_Buscar_Click" Text="Buscar" ValidationGroup="2" />
                </td>
            </tr>
            <tr>
                <td class="auto-style30"></td>
                <td class="auto-style33"></td>
                <td class="auto-style31"></td>
                <td class="auto-style35"></td>
                <td class="auto-style30">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style27">
                    <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style37">&nbsp;</td>
                <td class="auto-style34">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style54">&nbsp;</td>
                <td class="auto-style37">&nbsp;</td>
                <td class="auto-style34">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style21">
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style36">&nbsp;</td>
                <td>
            <asp:GridView ID="grdPaciente" runat="server" Width="894px" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style25" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="grdPaciente_RowCancelingEdit" OnRowDataBound="grdPaciente_RowDataBound" OnRowUpdating="grdPaciente_RowUpdating" OnRowEditing="grdPaciente_RowEditing" AllowPaging="True" OnPageIndexChanging="grdPaciente_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField DeleteText="" EditText="Modificar" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="DNI">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_edt_DNI" runat="server" Text='<%# Bind("DniPaciente_Pa") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_DNI" runat="server" Text='<%# Bind("DniPaciente_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Apellido" runat="server" Text='<%# Bind("Apellido_Pa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Bind("Apellido_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Nombre" runat="server" Text='<%# Bind("Nombre_Pa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("Nombre_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <EditItemTemplate>
                            <asp:CheckBoxList ID="chkbx_eit_Sexo" runat="server" Height="33px" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Sexo_Pa") %>'>
                                <asp:ListItem>F</asp:ListItem>
                                <asp:ListItem>M</asp:ListItem>
                            </asp:CheckBoxList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Sexo" runat="server" Text='<%# Bind("Sexo_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Edad" runat="server" Text='<%# Bind("Edad_Pa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Edad" runat="server" Text='<%# Bind("Edad_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Teléfono">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Telefono" runat="server" Text='<%# Bind("Telefono_Pa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Telefono" runat="server" Text='<%# Bind("Telefono_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dirección">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Direccion" runat="server" Text='<%# Bind("Direccion_Pa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Direccion" runat="server" Text='<%# Bind("Direccion_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Pa") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Nacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_eit_provincia" runat="server" AutoPostBack="True" DataTextField="descripcionProvincia_Pr" DataValueField="IdProvincias_Pr">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Provincias" runat="server" ConnectionString="<%$ ConnectionStrings:BDGrupo6_Provincias %>" SelectCommand="SELECT [IdProvincias_Pr], [descripcionProvincia_Pr] FROM [Provincias]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Provincia" runat="server" Text='<%# Bind("IdProvincia_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_eit_Localidad" runat="server" AutoPostBack="True" DataTextField="descripcionLocalidad_Loc" DataValueField="IdLocalidad_Loc">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Localidades" runat="server" ConnectionString="<%$ ConnectionStrings:BDGrupo6Localidad %>" SelectCommand="SELECT [descripcionLocalidad_Loc], [IdLocalidad_Loc], [IdProvincia_Loc] FROM [Localidades]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_IdLocalidad" runat="server" Text='<%# Bind("IdLocalidad_Pa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emial">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_eit_Email" runat="server" Text='<%# Bind("CorreoElectronico_Me") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_it_Email" runat="server" Text='<%# Bind("CorreoElectronico_Me") %>'></asp:Label>
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
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
