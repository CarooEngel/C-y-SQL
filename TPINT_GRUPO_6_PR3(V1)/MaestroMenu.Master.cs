using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class MaestroMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioNombre"] != null)
                {
                    lbl_UsuarioMaster.Text = "Bienvenido, " + Session["UsuarioNombre"].ToString();
                }

            }
        }

        protected void btn_cerrar_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}