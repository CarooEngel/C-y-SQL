using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class AltaUsuarioNuevo : System.Web.UI.Page
    {
        GestionLogin Gusuario = new GestionLogin();
        UsuarioLogin objUsuario = new UsuarioLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnNuevoUsuario_Click(object sender, EventArgs e)
        {
            string lejago = txtLegajo.Text;
            string nombre = txtNombreUsuario.Text;
            string contrasena = txtContra.Text;

            objUsuario.setLegajo_Usu(lejago);
            objUsuario.setUsuario_Usi(nombre);
            objUsuario.setContrasenia_Usu(contrasena);
            objUsuario.setRol_Usu('M');

            if (Gusuario.ExisteLegajo(lejago)==false)
            {
                int filas = 0;

                filas = Gusuario.AgregarUsuarioNuevo(ref objUsuario);

                if (filas > 0)
                {
                    lbl_mensaje.Text = "El Usuario fue agregado con exito";
                    LimpiarCampos();
                }
                else
                {
                    lbl_mensaje.Text = "Error al agregar el Usuario";
                    LimpiarCampos();
                }
            }
            else
            {
                lbl_mensaje.Text = "El legajo ya existe";
                LimpiarCampos();
            }
        }
        public void LimpiarCampos()
        {
            txtLegajo.Text = " ";
            txtNombreUsuario.Text = " ";
            txtContra.Text = " ";
        }

        protected void cmContra_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(args.Value.Length <= 8)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}