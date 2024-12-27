using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class ABMLmedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaMedico.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("altaMedicoHorario.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarMedico.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("BajaLogicaMedico.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarAltaMedicoHorario.aspx");
        }

       

        protected void Button7_Click(object sender, EventArgs e)
        {
Response.Redirect("AltaUsuarioNuevo.aspx");
        }
    }
    
}