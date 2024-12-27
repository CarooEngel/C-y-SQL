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
    public partial class BajaLogicaMedico : System.Web.UI.Page
    {
        Medicos medico = new Medicos();
        GestionMedicos gMedicos = new GestionMedicos();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        public void LimpiarCampos()
        {
            txtBajaLogicaMedico.Text = "";
            
        }

        protected void btn_ver_Click(object sender, EventArgs e)
        {
            string ingreso = txtBajaLogicaMedico.Text;
            DataTable dt = gMedicos.FiltrarLegajoBajaLogica(ingreso);
            grdMedico.DataSource = dt;
            grdMedico.DataBind();   

            //terminar --Dani
            if (grdMedico.Visible == true)
            {                
                btnBaja.Visible = true;
            }
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            string legajoMedico = txtBajaLogicaMedico.Text;
            bool estado = false;

            if(legajoMedico != "")
            {
                medico.setLegajoMedico(legajoMedico);
                estado = gMedicos.bajaLogicaMedico(medico);


                if (estado == true)
                {
                    lblBajaMedico.Text = "Baja Exitosa de =" + legajoMedico ;
                    LimpiarCampos();
                }
                else
                {
                    lblBajaMedico.Text = "Error al querer dar la baja";
                    LimpiarCampos();
                }
            }
            else
            {
                lblBajaMedico.Text = "**Error al querer dar la baja";
                LimpiarCampos();
            }

        }
        //-----cartel
        private bool SioNo()
        {
            try
            {
                return true;
            }
            catch
            {

                return false;
            }
        }

    }
}