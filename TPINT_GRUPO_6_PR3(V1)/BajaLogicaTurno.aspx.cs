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
    public partial class BajaLogicaTurno : System.Web.UI.Page
    {
        NegocioTurnos gest = new NegocioTurnos();
        Turnos turno=new Turnos();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn_ver_Click(object sender, EventArgs e)
        {
            string id = txtBajaLogicaTurno.Text;
            DataTable dt = gest.FiltrarLegajoBajaLogica(id);
            grdMedico.DataSource = dt;
            grdMedico.DataBind();
            if (grdMedico.Visible)
            {
                btnBaja.Visible = true;
            }            
        }
        protected void LimpiarCampos()
        {
            txtBajaLogicaTurno.Text = string.Empty;

        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
           string id = txtBajaLogicaTurno.Text;
                //;
            bool cambio = false;
            // codigo be-hind



            if (id != " ")
            {
                turno.set_IdDelHsMedico(Convert.ToInt32(id));
                cambio = gest.bajaLogicaTurno(turno);



                if (cambio)
                {
                    lblmensaje.Text = "no se dio de baja";
                    LimpiarCampos();
                }
                else
                {
                    lblmensaje.Text = "se dio de baja";
                    LimpiarCampos();
                }
            }
            else
            {
                lblmensaje.Text = "**Error al querer dar la baja";
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
