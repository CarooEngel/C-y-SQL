using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using Negocio;
using System.Drawing;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class AgregarTurnos : System.Web.UI.Page
    {
        NegocioTurnos nt = new NegocioTurnos();
        Turnos ObjCargadoAgregarTurnoSQL = new Turnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                DataTable dt = nt.cargarDDLEspecialidades();
                ddlEspecialidad.DataSource = dt;
                ddlEspecialidad.DataTextField = "descripcion_Esp";
                ddlEspecialidad.DataValueField = "IdEspecialidad_Esp";
                ddlEspecialidad.DataBind();
               ddlEspecialidad.Items.Insert(0, "--------------Seleccionar--------------");
             
            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string especialidad = ddlEspecialidad.SelectedValue.ToString();
            DataTable dt = nt.obtenerMedicoEspecialidad(especialidad);
            ddlMedico.DataSource = dt;
            ddlMedico.DataTextField = "Medico";
            ddlMedico.DataBind();
        }

        //turnos logica

        //con esto cargo la drid con los turnos disponibles con ese legajo que campture y en la funcion de abajo hago la paginacion de la grid

        protected void btn_buscarTunoDisponible_Click(object sender, EventArgs e)
        {
            string legajoSolo = ddlMedico.SelectedValue.Split('-')[0].Trim();

            //el objQueme carga solo el legajo para cargar la grid con los turnos disponibles del medico
            ObjCargadoAgregarTurnoSQL.set_LegajoMedico(legajoSolo);

            // Guardar el legajo en Session para los PostBacks
            Session["LegajoMedico"] = legajoSolo;

            DataTable tabla = nt.cargarGridConLegajo(ObjCargadoAgregarTurnoSQL);
            GridTurnosDisponibles.DataSource = tabla;
            GridTurnosDisponibles.DataBind();
        }

        protected void GridTurnosDisponibles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTurnosDisponibles.PageIndex = e.NewPageIndex;

            // Recuperar el legajo desde Session
            if (Session["LegajoMedico"] != null)
            {
                string legajoM = Session["LegajoMedico"].ToString();
                ObjCargadoAgregarTurnoSQL.set_LegajoMedico(legajoM);

                DataTable tabla = nt.cargarGridConLegajo(ObjCargadoAgregarTurnoSQL);
                GridTurnosDisponibles.DataSource = tabla;
                GridTurnosDisponibles.DataBind();
            }
        }

        //la parte de sellecionar un turno disponible en la grid selecioanando depende de la columna  y captura la info de la fina y columna
        protected void GridTurnosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Especidad = ddlEspecialidad.SelectedItem.Text.Trim();
            string dniPaciente = txtDni.Text.Trim();
            string NombreMedico = ddlMedico.SelectedValue.Split('-')[1].Trim();

            ObjCargadoAgregarTurnoSQL.setDNIPaciente(dniPaciente);
            ObjCargadoAgregarTurnoSQL.set_IdEspecialidad(Especidad);
            ObjCargadoAgregarTurnoSQL.setnombreMedico(NombreMedico);

            if (GridTurnosDisponibles.SelectedIndex >= 0)
            {
                // Obtén la fila seleccionada
                GridViewRow filaSeleccionada = GridTurnosDisponibles.SelectedRow;


                string seleccionID = filaSeleccionada.Cells[1].Text; // Cambia el índice según la columna qeu quiera agarrar 
                string selecionLegajoMedico = filaSeleccionada.Cells[2].Text;
                string seleccionFecha = filaSeleccionada.Cells[3].Text;
                string seleccionHorario = filaSeleccionada.Cells[4].Text;

                ObjCargadoAgregarTurnoSQL.set_IdDelHsMedico(Convert.ToInt16(seleccionID));
                ObjCargadoAgregarTurnoSQL.set_FechaTurno(seleccionFecha);
                ObjCargadoAgregarTurnoSQL.set_Horario(seleccionHorario);
                ObjCargadoAgregarTurnoSQL.set_LegajoMedico(selecionLegajoMedico);

            }
            try
            {

                bool estado;
                estado = nt.agregarTurno(ObjCargadoAgregarTurnoSQL);
                if (estado == true)
                {
                    lbl_error.Text = " Turno asignado:  " + ObjCargadoAgregarTurnoSQL.get_Horario() + " el  " + ObjCargadoAgregarTurnoSQL.get_FechaTurno() + "  con  " + ObjCargadoAgregarTurnoSQL.getnombreMedicoe();
                    LimpiarCampos();
                }
                else
                {
                    lbl_error.Text = "Error al querer agreggar Turno el dni no existe";

                    LimpiarCampos();
                    DataTable tabla = nt.cargarGridConLegajo(ObjCargadoAgregarTurnoSQL);
                    GridTurnosDisponibles.DataSource = tabla;
                    GridTurnosDisponibles.DataBind();

                }

            }
            catch (Exception ex)
            {
                lbl_error.Text = "ERROR: se produjo un error en la carga : " + ex.Message;

                LimpiarCampos();
            }

        }
        public void LimpiarCampos()
        {
            txtDni.Text = " ";

            ddlEspecialidad.Items.Insert(0, "--------------Seleccionar--------------");
            ddlEspecialidad.SelectedIndex = 0;
            ddlMedico.Items.Insert(0, " ");
            ddlMedico.SelectedIndex = 0;
        }

        //LUEGO EN LA BD UN TRIGGER ME ACTULAIZA EL ESTADO DEL DIA LABORABLE, COSA QUE DEJE DE APARECE COMO OPCION PARA SELLCIONAR

    }
}