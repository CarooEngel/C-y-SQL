using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class altaMedicoHorario : System.Web.UI.Page
    {
        GestionMes gesMes = new GestionMes();
        GestionSemana gesDia = new GestionSemana();
        GestionAltaMedicoHorario gesAltaMedicaHS = new GestionAltaMedicoHorario();
        AltaMedicoHorario objAltaMeHS = new AltaMedicoHorario();
        AltaMedicoHorario objEsteValorYAexiste = new AltaMedicoHorario();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                CargarMeses();
                CargarDiasSemana();

            }
        }

        private void CargarMeses()
        {
            DropMES.DataSource = gesMes.CargarDdlMes();
            DropMES.DataValueField = "IdMes_Mes";
            DropMES.DataTextField = "DescripcionMes_Mes";
            DropMES.DataBind();
            DropMES.Items.Insert(0, new ListItem("Seleccione Mes", "0"));
        }

        private void CargarDiasSemana()
        {
            DropSemana.DataSource = gesDia.CargarDdlDia();
            DropSemana.DataValueField = "IdSemana_Sem";
            DropSemana.DataTextField = "Descripcion_Sem";
            DropSemana.DataBind();
            DropSemana.Items.Insert(0, new ListItem("Seleccione Semana", "0"));
        }

        protected void btn_AgregarHs_Click(object sender, EventArgs e)
        {
            lbl_altaHorariomedica_msn.Text = "";
            try
            {


                string SEMANADescripcion = DropSemana.SelectedItem.Text;
                string MESdescripcion = DropMES.SelectedItem.Text;
                bool estado = false;

                string idMedico = Text_Legajo.Text;
                int mes = int.Parse(DropMES.SelectedValue);
                string Semana = DropSemana.SelectedValue;

                TimeSpan horaInicio = TimeSpan.Parse(Text_Desdes.Text);
                TimeSpan horaFin = TimeSpan.Parse(Text_Hasta.Text);

                objAltaMeHS.setLegajoMedico_DL(idMedico);
                objAltaMeHS.setIDmes_DL(mes);
                objAltaMeHS.setDiaSemana_DL(Semana);
                objAltaMeHS.sethorainicio_DL(horaInicio);
                objAltaMeHS.sethorafin_DL(horaFin);

                objEsteValorYAexiste.setDiaSemana_DL(SEMANADescripcion);//quieroescrito  lunes
                objEsteValorYAexiste.setIDmes_DL(mes);//quiero el mnumero del mes para asi me fijoq ue onda
                objEsteValorYAexiste.setLegajoMedico_DL(idMedico);


                TimeSpan horaMinima = new TimeSpan(9, 0, 0);  // 09:00
                TimeSpan horaMaxima = new TimeSpan(17, 0, 0); // 17:00


                if (horaInicio >= horaMinima && horaFin <= horaMaxima)
                {


                    estado = gesAltaMedicaHS.agregarAltaMedicoHs(objAltaMeHS, objEsteValorYAexiste);
                    if (estado == true)
                    {
                        lbl_altaHorariomedica_msn.Text = "Agrego el horario de  " + horaInicio + " a " + horaFin + "  los  " + SEMANADescripcion + "  del mes de " + MESdescripcion;
                        LimpiarCampos();
                    }
                    else
                    {
                        lbl_altaHorariomedica_msn.Text = "Error al querer agregar Horario";
                        lbl_altaHorariomedica_msn.ForeColor = System.Drawing.Color.Red;
                        LimpiarCampos();
                    }
                }
                else
                {

                    lbl_altaHorariomedica_msn.Text = "Las horas deben estar entre 09:00 y 17:00 HS y deben escribirse de esa forma";
                    lbl_altaHorariomedica_msn.ForeColor = System.Drawing.Color.Red;
                    LimpiarCampos();

                }

            }
            catch (Exception ex)
            {
                lbl_altaHorariomedica_msn.Text = "ERROR: se produjo un error en la carga : " + ex.Message;
                lbl_altaHorariomedica_msn.ForeColor = System.Drawing.Color.Red;
                LimpiarCampos();
            }
        }

        private void LimpiarCampos()
        {
            Text_Legajo.Text = "";
            Text_Desdes.Text = "";
            Text_Hasta.Text = "";
            DropMES.SelectedIndex = 0;
            DropSemana.SelectedIndex = 0;
        }

        protected void btnValidar_Click(object sender, EventArgs e)
        {
            Text_Desdes.Text = "";
            Text_Hasta.Text = "";
            DropMES.SelectedIndex = 0;
            DropSemana.SelectedIndex = 0;
            lbl_altaHorariomedica_msn.Text = " ";

            if (gesAltaMedicaHS.validarlegajo(Text_Legajo.Text))
            {
                lblExiste.Text = "El Medico Existe";
            }
            else
            {
                lblExiste.Text = "El Medico No Existe";
            }
        }
    }
}