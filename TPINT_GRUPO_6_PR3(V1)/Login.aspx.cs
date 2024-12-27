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
    public partial class Login : System.Web.UI.Page
    {
        GestionLogin Glogin = new GestionLogin();
        UsuarioLogin objLogin = new UsuarioLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

           
            string Usuario = txtUsuario.Text;
            string contrasena = txtContrasena.Text;

            Session["UsuarioNombre"] = Usuario;

            objLogin.setIDUsuario_Usu(Usuario);
            objLogin.setContrasenia_Usu(contrasena);

            if (Glogin.ExisteUsuarioUsuarioYContrasenaYad(objLogin))
            {
                Response.Redirect("Administrador.aspx");
            }
            else if (Glogin.ExisteUsuarioUsuarioYContrasenaYme(objLogin))

            {
                
                Response.Redirect("Medico.aspx?usuario="+Usuario+ "&cont="+contrasena);

            }
            else
            {
                lbl_usuario.Text = "Usuario o contraseña incorrectos";
            }


        }
       
    }
}