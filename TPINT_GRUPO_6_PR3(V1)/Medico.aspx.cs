using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAO;
using Entidades;
using Negocio;

//PROBAR QUE FILTRE DEPENDIENDO EL USUARIO MEDICO EN EL MOMENTO

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class Medico : System.Web.UI.Page
    {
        GestionMedicos gest = new GestionMedicos();
        NegocioTurnos GesTurnos= new NegocioTurnos();   
        Turnos objTurnos = new Turnos();
        UsuarioLogin objLogin=new UsuarioLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
            
                
            }
           
        }

      




        protected void btn_buscra_nomAPe_ME_Click(object sender, EventArgs e)
        {

            string nombre = txt_buscar_bomApe_ME.Text;

            string usuario = Request.QueryString["usuario"];
            string contrasena = Request.QueryString["cont"];

            objLogin.setUsuario_Usi(usuario);
            objLogin.setContrasenia_Usu(contrasena);
            CargarGrillaNombre(nombre, objLogin);

            txt_buscar_bomApe_ME.Text = "";
        }
        void CargarGrillaNombre(string nombre,UsuarioLogin objLogin)
        {
            DataTable dt = gest.cargarGrillaNomApeVM(nombre, objLogin);
            GridMedico_turno.DataSource = dt;
            GridMedico_turno.DataBind();
        }    
        protected void grdMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridMedico_turno.PageIndex = e.NewPageIndex;
            DataTable dt = gest.cargaGrillaMedicos();
            GridMedico_turno.DataSource = dt;
            GridMedico_turno.DataBind();
        }
     

        //aprtir de aca esta lo ed mostrar la grid con todos los turnos dependiendo del legajo delm edico
        //-mando unos valores  que vienene viajando desde el login para poder usarlos

        protected void listarGridMedico_turno()
        {
            string usuario = Request.QueryString["usuario"];
            string contrasena = Request.QueryString["cont"];

            objLogin.setUsuario_Usi(usuario);
            objLogin.setContrasenia_Usu(contrasena);

            DataTable dt = GesTurnos.cargaGrillaMedicosTurnoTODA(objLogin);

            GridMedico_turno.DataSource = dt;
            GridMedico_turno.DataBind();
        }
     protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {                  
           listarGridMedico_turno();
           txt_buscar_bomApe_ME.Text = "";
           txt_buscar_DNI.Text = "";
        }

       protected void GridMedico_turno_PageIndexChanging(object sender, GridViewPageEventArgs e)    
        {           
            GridMedico_turno.PageIndex = e.NewPageIndex;
            listarGridMedico_turno();
        }

        protected void GridMedico_turno_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridMedico_turno.EditIndex = e.NewEditIndex;
            listarGridMedico_turno();
        }
        protected void GridMedico_turno_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridMedico_turno.EditIndex = -1;
            listarGridMedico_turno();
        }

        protected void GridMedico_turno_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string idTurno =((Label)GridMedico_turno.Rows[e.RowIndex].FindControl("lbl_it_IdTurno")).Text;
            string nuevaAsistencia = ((CheckBox)GridMedico_turno.Rows[e.RowIndex].FindControl("chkbx_Et_Asistencia")).Checked ?"A" : "P"; 
            string nuevaObservacion = ((TextBox)GridMedico_turno.Rows[e.RowIndex].FindControl("txt_Et_Observacion")).Text;

            if(nuevaAsistencia == "P")
            {

            objTurnos.set_IdDelHsMedico(Convert.ToInt16(idTurno));
            objTurnos.set_Asistencia(nuevaAsistencia);
            objTurnos.set_Observacion(nuevaObservacion);

            GesTurnos.ActualizarAsistenciaYObservacion(objTurnos);

           
            GridMedico_turno.EditIndex = -1;
            listarGridMedico_turno(); 

            }

        }


        protected void btn_buscarFecha_Click(object sender, EventArgs e)
        {
            string fecha = txt_buscar_fecha.Text;
       

            string usuario = Request.QueryString["usuario"];
            string contrasena = Request.QueryString["cont"];

            objLogin.setUsuario_Usi(usuario);
            objLogin.setContrasenia_Usu(contrasena);

            DataTable dt = GesTurnos.cargaGrillaMedicosTurnoSoloFecha(objLogin, fecha);

            GridMedico_turno.DataSource = dt;
            GridMedico_turno.DataBind();

        }

        protected void btn_buscar_DNI_Click(object sender, EventArgs e)
        {
            string dni = txt_buscar_DNI.Text;
            string usuario = Request.QueryString["usuario"];
            string contrasena = Request.QueryString["cont"];

            objLogin.setUsuario_Usi(usuario);
            objLogin.setContrasenia_Usu(contrasena);
            CargarGrillaDNI(dni, objLogin);

            txt_buscar_DNI.Text = "";
        }
        void CargarGrillaDNI(string dni, UsuarioLogin objLogin)
        {
            DataTable dt = gest.cargarGrillaDniVM(dni, objLogin);
            GridMedico_turno.DataSource = dt;
            GridMedico_turno.DataBind();
        }
    }

}