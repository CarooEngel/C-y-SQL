using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAO;
using Entidades;
using Negocio;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class ListarMedico : System.Web.UI.Page
    {
        GestionMedicos gest = new GestionMedicos();
        Medicos objMedico = new Medicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            DataTable dt;

            if (!IsPostBack)
            {
                listarMedicos();

                dt = gest.cargarDDLprovincias();
                ddlProvinciasFiltro.DataSource = dt;
                ddlProvinciasFiltro.DataTextField = "descripcionProvincia_Pr";
                ddlProvinciasFiltro.DataValueField = "IdProvincias_Pr";
                ddlProvinciasFiltro.DataBind();

                inicializarddls();
            }
        }
        public void listarMedicos()
        {
            DataTable tabla = gest.cargaGrillaMedicos();
            grdMedico.DataSource = tabla;
            grdMedico.DataBind();
        }
        public void inicializarddls()
        {
            ddlFiltroDni.Items.Insert(0, "--------------Seleccionar--------------");
            ddlFiltroDni.Items.Insert(1, "-------------------Mayor----------------");
            ddlFiltroDni.Items.Insert(2, "-------------------Menor----------------");
            ddlProvinciasFiltro.Items.Insert(0, "-------------------Seleccionar-------------------");
        }

        public void limpiarcampos()
        {
            txtFechaNac.Text = "";
            txt_buscar_bomApe_ME.Text = "";
            txt_buscar_DNI_ME.Text = "";
            ddlProvinciasFiltro.SelectedIndex = 0;
            ddlFiltroDni.SelectedIndex = 0;
        }

        protected void btn_buscar_HC_ME_Click(object sender, EventArgs e)
        {
            string dni = txt_buscar_DNI_ME.Text;
            CargarGrillaDni(dni);
            limpiarcampos();
        }

        void CargarGrillaDni(string dni)
        {
            try
            {
                DataTable dt = gest.cargarGrillaDni(dni);
                grdMedico.DataSource = dt;
                grdMedico.DataBind();

            }
            catch
            {

            }

        }
        protected void btn_buscra_nomAPe_ME_Click(object sender, EventArgs e)
        {
            string nombre = txt_buscar_bomApe_ME.Text;
            DataTable dt = gest.cargarGrillaNomApe(nombre);
            grdMedico.DataSource = dt;
            grdMedico.DataBind();
            limpiarcampos();
        }
        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            DataTable dt = gest.cargaGrillaMedicos();
            grdMedico.DataSource = dt;
            grdMedico.DataBind();
            limpiarcampos();
        }

        protected void btnBuscarProv_Click(object sender, EventArgs e)
        {
            DataTable dt = gest.filtroProvincia(ddlProvinciasFiltro.SelectedValue.ToString());
            grdMedico.DataSource = dt;
            grdMedico.DataBind();
            limpiarcampos();
        }

        protected void grdMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMedico.PageIndex = e.NewPageIndex;
            DataTable dt = gest.cargaGrillaMedicos();
            grdMedico.DataSource = dt;
            grdMedico.DataBind();
        }

        protected void ddlFiltroDni_SelectedIndexChanged(object sender, EventArgs e)
        {
            string nacimiento = txtFechaNac.Text;

            //mayor
            if (ddlFiltroDni.SelectedIndex == 1)
            {
                DataTable dt = gest.FiltrarMayor(nacimiento);
                grdMedico.DataSource = dt;
                grdMedico.DataBind();
                limpiarcampos();
            }

            //menor
            if (ddlFiltroDni.SelectedIndex == 2)
            {
                DataTable dt = gest.FiltrarMenor(nacimiento);
                grdMedico.DataSource = dt;
                grdMedico.DataBind();
                limpiarcampos();
            }
        }

        protected void grdMedico_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdMedico.EditIndex = e.NewEditIndex;
            listarMedicos();
        }

        protected void grdMedico_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdMedico.EditIndex = -1;
            listarMedicos();
        }

        protected void grdMedico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlProvincia = (DropDownList)e.Row.FindControl("ddl_eit_provincia");
                DropDownList ddlLocalidad = (DropDownList)e.Row.FindControl("ddl_eit_Localidad");
                DropDownList ddlEspecialidad = (DropDownList)e.Row.FindControl("ddl_eit_especialidad");

                if (ddlProvincia != null)
                {
                    ddlProvincia.DataSource = gest.cargarDDLprovincias();
                    ddlProvincia.DataTextField = "descripcionProvincia_Pr";
                    ddlProvincia.DataValueField = "IdProvincias_Pr";
                    ddlProvincia.DataBind();
                }
                if (ddlLocalidad != null)
                {
                    ddlLocalidad.DataSource = gest.cargarDdlLoc();
                    ddlLocalidad.DataTextField = "descripcionLocalidad_Loc";
                    ddlLocalidad.DataValueField = "IdLocalidad_Loc";
                    ddlLocalidad.DataBind();
                }
                if (ddlEspecialidad != null)
                {
                    ddlEspecialidad.DataSource = gest.cargarDDLEspecialidades();
                    ddlEspecialidad.DataTextField = "descripcion_Esp";
                    ddlEspecialidad.DataValueField = "IdEspecialidad_Esp";
                    ddlEspecialidad.DataBind();
                }
            }
        }



        protected void grdMedico_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = ((Label)grdMedico.Rows[e.RowIndex].FindControl("lblLegajoE")).Text;
            string s_EspecialidadMedico = ((DropDownList)grdMedico.Rows[e.RowIndex].FindControl("ddl_eit_especialidad")).SelectedValue;
            string s_NombreMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtNombreE")).Text;
            string s_ApellidoMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtApellido")).Text;
            string s_DNIMedico = ((Label)grdMedico.Rows[e.RowIndex].FindControl("txtDniE")).Text;
            string s_FNacMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtNacimientoE")).Text;
            string s_DireccionMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtDirecionE")).Text;
            string s_CorreoMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtCorreroEE")).Text;
            string s_TelefonoMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtTelefonoE")).Text;
            string s_SexoMedico = ((RadioButtonList)grdMedico.Rows[e.RowIndex].FindControl("rbsexo")).SelectedValue;
            string s_NacionalidadMedico = ((TextBox)grdMedico.Rows[e.RowIndex].FindControl("txtNacionalidadE")).Text;
            string s_ProvinciaMedico = ((DropDownList)grdMedico.Rows[e.RowIndex].FindControl("ddl_eit_provincia")).SelectedValue;
            string s_LocalidadMedico = ((DropDownList)grdMedico.Rows[e.RowIndex].FindControl("ddl_eit_Localidad")).SelectedValue;

            objMedico.setLegajoMedico(legajo);
            objMedico.setEspecialidad(s_EspecialidadMedico);
            objMedico.setNombreMedico(s_NombreMedico);
            objMedico.setApellidoMedico(s_ApellidoMedico);
            objMedico.setDNIMedico(s_DNIMedico);
            objMedico.setFechaNacimiento(s_FNacMedico);
            objMedico.setDireccion(s_DireccionMedico);
            objMedico.setCorreo(s_CorreoMedico);
            objMedico.setTelefonoMedico(s_TelefonoMedico);
            objMedico.setSexoMedicos(s_SexoMedico);
            objMedico.setNacionalidadMedico(s_NacionalidadMedico);
            objMedico.setProvincia(s_ProvinciaMedico);
            objMedico.setLocalidad(s_LocalidadMedico);

            bool actualizar = gest.ActualizarSQLMedicos(objMedico);

            if (actualizar)
            {
                grdMedico.EditIndex = -1;
                listarMedicos();
            }
        }
    }
}