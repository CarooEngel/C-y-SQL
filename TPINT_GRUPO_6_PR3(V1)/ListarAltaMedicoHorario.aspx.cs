using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class ListarAltaMedicoHorario : System.Web.UI.Page
    {
        GestionAltaMedicoHorario GaltaMedicoHS= new GestionAltaMedicoHorario();
        AltaMedicoHorario objAltahsMostrar= new AltaMedicoHorario();
        protected void Page_Load(object sender, EventArgs e)
        {
         
          
        }
        


        protected void btn_buscar_Click(object sender, EventArgs e)

        {
            lbl_error.Text = " ";
            string legajoM = Txt_LegajoM.Text;

            objAltahsMostrar.setLegajoMedico_DL(legajoM);

            if (GaltaMedicoHS.ExistelLegajo(objAltahsMostrar))
            {
                // Guardar el legajo en Session para los PostBacks
                Session["LegajoMedico"] = legajoM;

                DataTable tabla = GaltaMedicoHS.cargarGridConLegajo(objAltahsMostrar);
                Grid_ListarHSMedico.DataSource = tabla;
                Grid_ListarHSMedico.DataBind();
            }
            else
            {
                lbl_error.Text = "NO hubo coincidencias";
                Txt_LegajoM.Text = "";
            }
        }

        protected void Grid_ListarHSMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid_ListarHSMedico.PageIndex = e.NewPageIndex;

            // Recuperar el legajo desde Session
            if (Session["LegajoMedico"] != null)
            {
                string legajoM = Session["LegajoMedico"].ToString();
                objAltahsMostrar.setLegajoMedico_DL(legajoM);

                DataTable tabla = GaltaMedicoHS.cargarGridConLegajo(objAltahsMostrar);
                Grid_ListarHSMedico.DataSource = tabla;
                Grid_ListarHSMedico.DataBind();
            }
        }

        protected void btn_limpiat_Click(object sender, EventArgs e)
        {
            Txt_LegajoM.Text = "";
            lbl_error.Text = " ";
        }
    }
}