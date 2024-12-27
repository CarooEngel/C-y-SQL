<%@ Page Title="" Language="C#" MasterPageFile="~/MaestroMenu.Master" AutoEventWireup="true" CodeBehind="InformesPaciente.aspx.cs" Inherits="TPINT_GRUPO_6_PR3_V1_.InformesPaciente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style28 {
            width: 282px;
            height: 32px;
        }

.auto-style6 {
              width: 1004px;
          }

        .auto-style29 {
            width: 449px;
        }
        .auto-style30 {
            margin-left: 120px;
            width: 449px;
        }
        .auto-style31 {
            width: 266px;
        }
          .auto-style25 {
              width: 1004px;
              height: 44px;
          }
          .auto-style33 {
            background-color: #246EB9;
        }
        .auto-style34 {
            width: 282px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style21">
        <tr>
            <td class="auto-style34">&nbsp;</td>
         <td class="auto-style30" style="font-family: Arial, Helvetica, sans-serif">&nbsp;&nbsp;Asistencia general</td>
            <td class="auto-style31">&nbsp;</td>
         <td class="auto-style6" style="font-family: Arial, Helvetica, sans-serif">Sexo</td>
         </tr>
        <tr>
         <td class="auto-style28" style="font-family: Arial, Helvetica, sans-serif">Fecha<br />
             <br />
             Desde:&nbsp;&nbsp;&nbsp; 
             <asp:TextBox ID="txtFecha_Desde" CssClass="textbox" runat="server" TextMode="Date"></asp:TextBox>
             <br />
             <br />
&nbsp; Hasta:&nbsp;&nbsp;&nbsp; 
             <asp:TextBox ID="txtFecha_Hasta" CssClass="textbox" runat="server" TextMode="Date"></asp:TextBox>
             <br />
             <br />
             <asp:Button ID="btn_VerInforme" runat="server" CssClass="my-button" OnClick="btn_VerInforme_Click" Text="Ver Informe" />
         </td>
         <td class="auto-style30">
             <asp:Chart ID="chartAsistencias" runat="server" Palette="SeaGreen">
                 <series>
                     <asp:Series ChartType="Pie" Name="Series1">
                     </asp:Series>
                 </series>
                 <chartareas>
                     <asp:ChartArea Name="ChartArea1">
                     </asp:ChartArea>
                 </chartareas>
             </asp:Chart>
         </td>
            <td class="auto-style31">&nbsp;</td>
         <td class="auto-style17">
             <asp:Chart ID="chartSexo" runat="server" Palette="Berry">
                 <Series>
                     <asp:Series ChartType="Pie" Name="Series1">
                     </asp:Series>
                 </Series>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1">
                     </asp:ChartArea>
                 </ChartAreas>
             </asp:Chart>
         </td>
         </tr>
        <tr>
            <td class="auto-style33" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style34">&nbsp;</td>
            <td class="auto-style29">Distribución de Pacientes por Rangos de Edad    <td class="auto-style31">&nbsp;</td>
            <td>Horarios mas concurridos</td>
        </tr>
        <tr>
            <td class="auto-style34">&nbsp;</td>
         <td class="auto-style21">
             <asp:Chart ID="chartEdades" runat="server" Palette="Pastel" Width="369px">
                 <Series>
                     <asp:Series Name="Series1" YValuesPerPoint="4">
                     </asp:Series>
                 </Series>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1">
                     </asp:ChartArea>
                 </ChartAreas>
             </asp:Chart>
         </td>
            <td class="auto-style31">&nbsp;</td>
         <td class="auto-style25">
             <asp:Chart ID="chartHorarios" runat="server" Width="369px">
                 <Series>
                     <asp:Series Name="Series1">
                     </asp:Series>
                 </Series>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1">
                     </asp:ChartArea>
                 </ChartAreas>
             </asp:Chart>
         </td>
         </tr>
        <tr>
            <td class="auto-style34">&nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style31">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
