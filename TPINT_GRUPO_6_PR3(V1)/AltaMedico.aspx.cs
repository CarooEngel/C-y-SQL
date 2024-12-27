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

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class AltaMedico : System.Web.UI.Page
    {
        GestionMedicos gest = new GestionMedicos();
        Medicos objMedico = new Medicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            DataTable dt;

            if (!IsPostBack)
            {
                dt = gest.cargarDDLprovincias();
                ddlProvincia.DataSource = dt;
                ddlProvincia.DataTextField = "descripcionProvincia_Pr";
                ddlProvincia.DataValueField = "IdProvincias_Pr";
                ddlProvincia.DataBind();
                ddlProvincia.Items.Insert(0, "--------------Seleccionar--------------");

                dt = gest.cargarDDLEspecialidades();
                ddlEspecialidad.DataSource = dt;
                ddlEspecialidad.DataTextField = "descripcion_Esp";
                ddlEspecialidad.DataValueField = "IdEspecialidad_Esp";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, "--------------Seleccionar--------------");

            }
        }

        //Ejecuta parametros y da de alta
        protected void BtnAceptaAlta_Click(object sender, EventArgs e)
        {
            string sexo = selectsexo();

            objMedico.setLegajoMedico(txtLegajo.Text.ToString());
            objMedico.setNombreMedico(txtNombre.Text.ToString());
            objMedico.setApellidoMedico(txtApellido.Text.ToString());
            objMedico.setDNIMedico(txtDni.Text.ToString());
            objMedico.setCorreo(txtCorreoElectronico.Text.ToString());
            objMedico.setTelefonoMedico(txtTelefono.Text.ToString());
            objMedico.setDireccion(txtDireccion.Text.ToString());
            objMedico.setNacionalidadMedico(txtNacionalidad.Text.ToString());
            objMedico.setProvincia(ddlProvincia.SelectedValue);
            objMedico.setLocalidad(ddlLocalidad.SelectedValue);
            objMedico.setEspecialidad(Session["EspecialidadSeleccionada"].ToString());
            objMedico.setFechaNacimiento(txtFechaNacimiento.Text);

            if (gest.VerificarDniRepetido(txtDni.Text.ToString()) || gest.VerificarLegaRepetido(txtLegajo.Text.ToString()))
            {
                LblConfirmaAlta.Text = "DNI, LEGAJO o USUARIO YA EXISTEN";
                limpiarcontroles();
            }
            else
            {
                int validacion = gest.AltaMedico(sexo, objMedico);

                if (validacion != 0)
                {
                    LblConfirmaAlta.Text = "SE AGREGÓ CORRECTAMENTE";
                    limpiarcontroles();
                }
            }
        }

        public string selectsexo()
        {
            List<string> selecSexo = new List<string>();

            foreach (ListItem item in rbsexo.Items)
            {
                if (item.Selected)
                {
                    return item.Value;
                }

            }
            return null;
        }
        public void limpiarcontroles()
        {
            txtLegajo.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDni.Text = "";
            txtCorreoElectronico.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtNacionalidad.Text = "";
            ddlProvincia.Items.Insert(0, "--------------Seleccionar--------------");
            ddlLocalidad.Items.Insert(0, "--------------Seleccionar--------------");
            ddlEspecialidad.Items.Insert(0, "--------------Seleccionar--------------");
            txtFechaNacimiento.Text = "";
            rbsexo.SelectedIndex = 0; 
        }

        //guarda en una session lo elegido para el parametro
        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {


            String idConvertido = ddlProvincia.SelectedValue;
            // DataTable dllcargadaDinamica = negocioPaciente.cargarDdlLoc(idConvertido);
            ddlLocalidad.DataSource = gest.cargarDdlLoc(idConvertido);
            //   DdlLocalidad.DataSource = dllcargadaDinamica;
            ddlLocalidad.DataTextField = "descripcionLocalidad_Loc";
            ddlLocalidad.DataValueField = "IdLocalidad_Loc";
            ddlLocalidad.DataBind();
        }

        //igual
        /* protected void ddlLocalidad_SelectedIndexChanged(object sender, EventArgs e)
         {
             string selectedValueLoc = ddlLocalidad.SelectedValue;

             Session["LocalidadSeleccionada"] = selectedValueLoc;
         }*/

        //igual
        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValueEsp = ddlEspecialidad.SelectedValue;

            Session["EspecialidadSeleccionada"] = selectedValueEsp;
        }

        //Guardar el valor de lo seleccionado
        protected void rbsexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListItem selectedItem = rbsexo.SelectedItem;

            foreach (ListItem item in rbsexo.Items)
            {
                item.Selected = false;
            }

            if (selectedItem != null)
            {
                selectedItem.Selected = true;
            }
        }
    }
}



