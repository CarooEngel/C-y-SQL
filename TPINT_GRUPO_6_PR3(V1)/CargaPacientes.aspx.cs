using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using System.Data;
using Negocio;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class CargaPacientes : System.Web.UI.Page
    {
        GestionPacientes negocioPaciente = new GestionPacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (IsPostBack == false)
            {

                cargarddlProvincia();
                
            }
        }

        public void cargarddlProvincia()
        {
            DdlProvincia.DataSource = negocioPaciente.cargarProvincia();
            DdlProvincia.DataTextField = "descripcionProvincia_Pr";
            DdlProvincia.DataValueField = "IdProvincias_Pr";
            DdlProvincia.DataBind();
        }

       
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {

                String nombre = TxtNombre.Text;
                string apellido = TxtApellido.Text;
                string dniPaciente = TxtDni.Text;
                string sexo = Rbsexo.Text;
                string edad = txtEdadPaciente.Text;
                string idLoca = DdlLocalidad.SelectedValue;
                string idProvincia = DdlProvincia.SelectedValue;
                string nacion = TxtNacionalidad.Text;
                string fechaNac = TxtFechaNac.Text;
                string direccion = TxtDireccion.Text;
                string corre = TxtCorreo.Text;
                string telefono = TxtTelefono.Text;
                Pacientes pacientes = new Pacientes();
                pacientes.setApellido(apellido);
                pacientes.setNombre(nombre);
                pacientes.setDni(dniPaciente);
                pacientes.setSexo(sexo);
                pacientes.setEdad(Convert.ToInt32(edad));
                pacientes.setIdProvincia(idProvincia);
                pacientes.setIdLocalidad(idLoca);
                pacientes.setNacionalidad(nacion);
                pacientes.setFechaNacimiento(Convert.ToDateTime(fechaNac));
                pacientes.setDireccion(direccion);
                pacientes.setCorreo(corre);
                pacientes.setTelefono(telefono);
                negocioPaciente.cargarPaciente(pacientes);
                lbl_falla.Text = "¡Carga exitosa!";
                LimpiarCampos();
            }
            catch (Exception EX)
            {
                lbl_falla.Text = "" + EX.Message;
                LimpiarCampos();
            }
        }

        public void LimpiarCampos()
        {
            TxtNombre.Text = "";
            TxtApellido.Text = "";
            TxtDni.Text = "";
            Rbsexo.Text = "";
            txtEdadPaciente.Text = "";
            DdlLocalidad.SelectedIndex = 0;
            DdlProvincia.SelectedIndex = 0;
            TxtNacionalidad.Text = "";
            TxtFechaNac.Text = "";
            TxtDireccion.Text = "";
            TxtCorreo.Text = "";
            TxtTelefono.Text = "";
        }

        protected void DdlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            String idConvertido = DdlProvincia.SelectedValue;
            DdlLocalidad.DataSource = negocioPaciente.cargarDdlLoc(idConvertido);
            DdlLocalidad.DataTextField = "descripcionLocalidad_Loc";
            DdlLocalidad.DataValueField = "IdLocalidad_Loc";
            DdlLocalidad.DataBind();
        }
    }
}