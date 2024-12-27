using Negocio;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class ListadoTurnos : System.Web.UI.Page
    {
        NegocioTurnos nt = new NegocioTurnos();
        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                ListarTurnos();
                DataTable dt = nt.cargarDDLEspecialidades();

            }
        }

      

        protected void btnFiltrarxDNI_Click(object sender, EventArgs e)
        {
            string ingreso = txtDniP.Text.Trim();

            DataTable tablaFiltrada = nt.getTablaConFiltroPorDNI(ingreso);

           
                grd_ListarTurnos.DataSource = tablaFiltrada;
                grd_ListarTurnos.DataBind();
            txtDniP.Text = String.Empty;
        }

        private void ListarTurnos()
        {
           
            DataTable tablaTurnoJoin = nt.listarTurnos();
            grd_ListarTurnos.DataSource = tablaTurnoJoin;
            grd_ListarTurnos.DataBind();
        }
        protected void LimpiarTabla()
        {
            grd_ListarTurnos.DataSource = null;
            grd_ListarTurnos.DataBind();
        }

       
        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            DataTable dt = nt.listarTurnos();
            grd_ListarTurnos.DataSource = dt;
            grd_ListarTurnos.DataBind();
        }

       

      
        protected void btnXlegajo_Click(object sender, EventArgs e)
        {
            String legajo = txtLegajo.Text;
            

            DataTable tabla = nt.buscarLegajo(legajo);
            grd_ListarTurnos.DataSource = tabla;
            grd_ListarTurnos.DataBind();
            txtLegajo.Text = String.Empty;
        }
    }
}