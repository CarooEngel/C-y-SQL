using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class bajaLogicaPacientes : System.Web.UI.Page
    {
        Pacientes objPacientes = new Pacientes();
        GestionPacientes GesPAcientes = new GestionPacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


        }

        protected void btn_Baja_Click(object sender, EventArgs e)
        {
            lbl_bajaPaciente.Text = " ";
          // bool accionExitosa=false; 
            bool estado = false;
            string dniPaciente = txt_DNI.Text;

       // accionExitosa= SioNo();
            
         
             if(dniPaciente!=" ")// && accionExitosa == true)
            {
               
                objPacientes.setDni(dniPaciente);
                    estado = GesPAcientes.DarLabaja(objPacientes);

                if (estado == true )
                { 
                 lbl_bajaPaciente.Text = "Se dio la baja Logica al DNI: " + dniPaciente;
                    LimpiarCampos();
              
                }
                else
                {
                    lbl_bajaPaciente.Text = "**Error al querer dar la baja";
                    LimpiarCampos();
                }
             }
             else

             {
                lbl_bajaPaciente.Text = "**Error al querer dar la baja";
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
        //--fin cartel
        private void LimpiarCampos()
        {
            txt_DNI.Text = " ";

        }
    }

}