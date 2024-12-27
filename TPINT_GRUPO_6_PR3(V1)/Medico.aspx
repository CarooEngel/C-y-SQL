<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMedicos.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.Medico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/masterPage.css" />
    <style type="text/css">
        .auto-style21 {
            width: 446px;
            height: 50px;
            margin-left: 120px;
        }
        .auto-style24 {
            width: 64px;
        }
        .auto-style25 {
            width: 64px;
            height: 32px;
        }
        .auto-style28 {
            width: 464px;
            height: 28px;
            text-align: center;
            margin-left: 120px;
        }
        .auto-style30 {
            width: 748px;
        }
        .auto-style34 {
            width: 903px;
            height: 47px;
            margin-left: 120px;
        }
        .auto-style40 {
            width: 871px;
            height: 32px;
        }
        .auto-style41 {
            width: 648px;
            height: 28px;
            text-align: left;
            margin-left: 120px;
        }
        .auto-style45 {
            width: 903px;
            text-align: center;
            margin-left: 120px;
            height: 49px;
        }
        .auto-style46 {
            width: 185px;
            height: 59px;
            margin-left: 120px;
            text-align: left;
        }
        .auto-style47 {
            width: 648px;
            margin-left: 120px;
        }
        .auto-style48 {
            width: 185px;
            height: 50px;
            margin-left: 120px;
        }
        .auto-style49 {
            width: 903px;
            height: 28px;
            text-align: right;
            margin-left: 120px;
        }
        .auto-style50 {
            width: 871px;
            margin-left: 120px;
        }
        .auto-style53 {
            border-radius: 5px;
        }
        .auto-style59 {
            width: 1365px;
            height: 295px;
        }
        .auto-style60 {
            width: 78px;
            height: 41px;
        }
        .auto-style61 {
            width: 64px;
            height: 41px;
        }
        .auto-style62 {
            width: 871px;
            margin-left: 120px;
            height: 41px;
        }
        .auto-style63 {
            width: 748px;
            height: 41px;
        }
        .auto-style64 {
            width: 648px;
            height: 41px;
        }
        .auto-style65 {
            height: 41px;
        }
        .auto-style68 {
            width: 871px;
            margin-left: 120px;
            height: 225px;
        }
        .auto-style69 {
            width: 648px;
            height: 225px;
            margin-left: 120px;
        }
        .auto-style70 {
            height: 225px;
            width: 748px;
            text-align: center;
        }
        .auto-style71 {
            width: 648px;
            height: 225px;
            text-align: center;
            margin-left: 120px;
        }
        .auto-style96 {
            width: 1365px;
            height: 254px;
        }
        .auto-style97 {
            width: 78px;
            height: 28px;
        }
        .auto-style98 {
            width: 64px;
            height: 28px;
        }
        .auto-style99 {
            height: 28px;
        }
        .auto-style113 {
            width: 446px;
            height: 49px;
            margin-left: 120px;
            text-align: center;
        }
        .auto-style114 {
            width: 78px;
            height: 49px;
        }
        .auto-style115 {
            width: 64px;
            height: 49px;
        }
        .auto-style116 {
            height: 49px;
        }
        .auto-style119 {
            width: 903px;
            height: 50px;
            text-align: right;
            margin-left: 120px;
        }
        .auto-style124 {
            width: 446px;
            height: 47px;
            margin-left: 120px;
            text-align: center;
        }
        .auto-style125 {
            width: 78px;
            height: 47px;
        }
        .auto-style126 {
            width: 64px;
            height: 47px;
        }
        .auto-style127 {
            height: 47px;
        }
        .auto-style128 {
            width: 903px;
            height: 59px;
            text-align: right;
            margin-left: 120px;
        }
        .auto-style129 {
            width: 78px;
            height: 59px;
        }
        .auto-style130 {
            width: 64px;
            height: 59px;
        }
        .auto-style131 {
            width: 446px;
            height: 59px;
            margin-left: 120px;
            text-align: center;
        }
        .auto-style132 {
            height: 59px;
        }
        .auto-style133 {
            width: 78px;
            height: 50px;
        }
        .auto-style134 {
            width: 64px;
            height: 50px;
        }
        .auto-style135 {
            width: 446px;
            height: 50px;
            margin-left: 120px;
            text-align: center;
        }
        .auto-style136 {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
       <div>
           <table class="auto-style59">
    <tr>
        <td class="auto-style114"></td>
        <td class="auto-style115"></td>
        <td class="auto-style45"></td>
        <td class="auto-style113" colspan="3"></td>
        <td class="auto-style113"></td>
        <td class="auto-style116"></td>
    </tr>
    <tr>
        <td class="auto-style97"></td>
        <td class="auto-style98"></td>
        <td class="auto-style49">Buscar&nbsp; paciente por DNI</td>
        <td class="auto-style28">
            <br />
            <asp:TextBox ID="txt_buscar_DNI" runat="server" Width="250px" CssClass="auto-style53" Height="25px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_buscar_DNI" ForeColor="Fuchsia" ValidationExpression="^\d+$">*</asp:RegularExpressionValidator>
        </td>
        <td class="auto-style41" colspan="2">
            <asp:Button ID="btn_buscar_DNI" runat="server" Text="Buscar " OnClick="btn_buscar_DNI_Click"  CssClass="my-button" />
        </td>
        <td class="auto-style47" rowspan="2">
            <asp:Button ID="btnMostrarTodo" runat="server" OnClick="btnMostrarTodo_Click" Text="Mostrar Todo" CssClass="my-button" />
        </td>
        <td class="auto-style99"></td>
    </tr>
    <tr>
        <td class="auto-style129"></td>
        <td class="auto-style130"></td>
        <td class="auto-style128">Buscar por Inicial de Nombre</td>
        <td class="auto-style131" colspan="2">
            <br />
            <asp:TextBox ID="txt_buscar_bomApe_ME" runat="server" Width="250px" CssClass="auto-style53" Height="25px"></asp:TextBox>
        </td>
        <td class="auto-style46">
            <asp:Button ID="btn_buscra_nomAPe_ME" runat="server" Text="Buscar " OnClick="btn_buscra_nomAPe_ME_Click"  CssClass="my-button" />
        </td>
        <td class="auto-style132"></td>
    </tr>
    <tr>
        <td class="auto-style133"></td>
        <td class="auto-style134"></td>
        <td class="auto-style119">Buscar Por Fecha:</td>
        <td class="auto-style135" colspan="2">
            <asp:TextBox ID="txt_buscar_fecha" runat="server" Width="250px" CssClass="auto-style53" Height="25px" TextMode="Date"></asp:TextBox>
        </td>
        <td class="auto-style48">
            <asp:Button ID="btn_buscarFecha" runat="server" Text="Buscar " OnClick="btn_buscarFecha_Click" CssClass="my-button" />
        </td>
        <td class="auto-style21">
            </td>
        <td class="auto-style136"></td>
    </tr>
    <tr>
        <td class="auto-style125"></td>
        <td class="auto-style126"></td>
        <td class="auto-style34">
            </td>
        <td class="auto-style124" colspan="3">
        </td>


        <td class="auto-style124" id="GridMedico_turno">
            </td>
        <td class="auto-style127"></td>
    </tr>
    </table>
           <table class="auto-style96">
    <tr>
        <td class="auto-style68"></td>
        <td class="auto-style71">
            &nbsp;</td>
        <td class="auto-style69">
            &nbsp;</td>
        <td class="auto-style70">
            <asp:GridView ID="GridMedico_turno" runat="server" AutoGenerateColumns="False"     AllowPaging="True"  OnPageIndexChanging="GridMedico_turno_PageIndexChanging"  OnRowEditing="GridMedico_turno_RowEditing"   OnRowCancelingEdit="GridMedico_turno_RowCancelingEdit"   OnRowUpdating="GridMedico_turno_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" Width="903px">
            
            
                <AlternatingRowStyle BackColor="White" />
            
            
           <Columns>
      
       
        <asp:TemplateField HeaderText="ID Turno">
            <ItemTemplate>
                <asp:Label ID="lbl_it_IdTurno" runat="server" Text='<%# Eval("ID") %>' />
            </ItemTemplate>
        </asp:TemplateField>

  <asp:TemplateField HeaderText="Fecha Turno">
            <ItemTemplate>
                <asp:Label ID="lbl_it_FechaTurno" runat="server" Text='<%# Eval("Fecha") %>' />
            </ItemTemplate>
        </asp:TemplateField>
                  <asp:TemplateField HeaderText="Hora">
       <ItemTemplate>
           <asp:Label ID="lbl_it_horario" runat="server" Text='<%# Eval("Horario") %>' />
       </ItemTemplate>
   </asp:TemplateField>
                <asp:TemplateField HeaderText="DNI">
    <ItemTemplate>
        <asp:Label ID="lbl_it_dni" runat="server" Text='<%# Eval("DNI") %>' />
    </ItemTemplate>
</asp:TemplateField>
        <asp:TemplateField HeaderText="Nombre Paciente">
            <ItemTemplate>
                <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Eval("Nombre") %>' />
            </ItemTemplate>
        </asp:TemplateField>
  

     
        <asp:TemplateField HeaderText="Apellido Paciente">
            <ItemTemplate>
                <asp:Label ID="lbl_it_Apellido" runat="server" Text='<%# Eval("Apellido") %>' />
            </ItemTemplate>
        </asp:TemplateField>
              
        
      
        <asp:TemplateField HeaderText="Asistencia">
            <ItemTemplate>
                <asp:Label   ID="lbl_it_Asistencia" runat="server" Text='<%# Eval("Asistencia") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox ID="chkbx_Et_Asistencia" runat="server"  ext="Presente (P)"   Checked="true"/>
             
            
            </EditItemTemplate>
        </asp:TemplateField>

  
        <asp:TemplateField HeaderText="Observación">
            <ItemTemplate>
                <asp:Label ID="lbl_it_Observacion" runat="server" Text='<%# Eval("Observacion") %>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txt_Et_Observacion" runat="server" Text='<%# Eval("Observacion") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

  
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Editar" CssClass="my-buttonC" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Actualizar"  CssClass="my-buttonC"/>
                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancelar"  CssClass="my-buttonC"/>
            </EditItemTemplate>
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
    </tr>
    <tr>
        <td class="auto-style60"></td>
        <td class="auto-style61"></td>
        <td class="auto-style62"></td>
        <td class="auto-style63">
            </td>
        <td class="auto-style64">
            </td>
        <td class="auto-style64">
            </td>
        <td class="auto-style65"></td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style24">&nbsp;</td>
        <td class="auto-style50">&nbsp;<td class="auto-style30">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style24">&nbsp;</td>
        <td class="auto-style50">&nbsp;</td>
        <td class="auto-style5" colspan="2">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style24">&nbsp;</td>
        <td class="auto-style50">&nbsp;</td>
        <td class="auto-style5" colspan="2">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style25"></td>
        <td class="auto-style40"></td>
        <td class="auto-style9" colspan="2"></td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style11"></td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style24">&nbsp;</td>
        <td class="auto-style50">&nbsp;</td>
        <td class="auto-style5" colspan="2">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td class="auto-style24">&nbsp;</td>
        <td class="auto-style50">&nbsp;</td>
        <td class="auto-style5" colspan="2">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
       </div>

 



</asp:Content>

