 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using Entidades;
using System.Net;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class ListadoPacientes : System.Web.UI.Page
    {
        GestionPacientes gestionPaciente = new GestionPacientes();
        Pacientes objPaciente = new Pacientes();
        Pacientes objPaFiltro = new Pacientes();
        Pacientes objNombreApellido = new Pacientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                listarGrdPaciente();
            }
        }
        protected void listarGrdPaciente()
        {
            DataTable tabla = gestionPaciente.ListarPaciente();
            grdPaciente.DataSource = tabla;
            grdPaciente.DataBind();
        }

        protected void grdPaciente_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdPaciente.EditIndex = e.NewEditIndex;
            listarGrdPaciente();
        }

        protected void grdPaciente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdPaciente.EditIndex = -1;
            listarGrdPaciente();
        }

        protected void grdPaciente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlProvincia = (DropDownList)e.Row.FindControl("ddl_eit_provincia");
                DropDownList ddlLocalidad = (DropDownList)e.Row.FindControl("ddl_eit_Localidad");

                if (ddlProvincia != null)
                {
                    ddlProvincia.DataSource = gestionPaciente.cargarProvincia();
                    //ddlProvincia.DataTextField = "idProvincia";
                    //ddlProvincia.DataValueField = "idProvincia";
                    ddlProvincia.DataBind();
                }
                if (ddlLocalidad != null)
                {
                    ddlLocalidad.DataSource = gestionPaciente.cargarDdlLoc();
                    //ddlLocalidad.DataTextField = "idLocalidad";
                    //ddlLocalidad.DataValueField = "idLocalidad";
                    ddlLocalidad.DataBind();
                }
            }
        }

        protected void grdPaciente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_DNI = ((Label)grdPaciente.Rows[e.RowIndex].FindControl("lbl_edt_DNI")).Text;
            String s_Apellido = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            String s_Nombre = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;

            String s_Sexo = ((CheckBoxList)grdPaciente.Rows[e.RowIndex].FindControl("chkbx_eit_Sexo")).SelectedValue;
            String s_Edad = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Edad")).Text;
            String s_Telefono = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Telefono")).Text;
            String s_Direccion = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Direccion")).Text;
            String s_Nacionalidad = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Nacionalidad")).Text;


            String s_Provincia = ((DropDownList)grdPaciente.Rows[e.RowIndex].FindControl("ddl_eit_provincia")).SelectedValue;
            String s_Localidad = ((DropDownList)grdPaciente.Rows[e.RowIndex].FindControl("ddl_eit_Localidad")).SelectedValue;
            String s_Email = ((TextBox)grdPaciente.Rows[e.RowIndex].FindControl("txt_eit_Email")).Text;

            objPaciente.setDni(s_DNI);
            objPaciente.setApellido(s_Apellido);
            objPaciente.setNombre(s_Nombre);
            objPaciente.setSexo(s_Sexo);
            objPaciente.setEdad(Convert.ToInt32(s_Edad));
            objPaciente.setTelefono(s_Telefono);
            objPaciente.setDireccion(s_Direccion);
            objPaciente.setNacionalidad(s_Nacionalidad);
            objPaciente.setIdProvincia(s_Provincia);
            objPaciente.setIdLocalidad(s_Localidad);
            objPaciente.setCorreo(s_Email);

            bool actualizar = gestionPaciente.ActualizarSQLPaciente(objPaciente);

            if (actualizar)
            {
                grdPaciente.EditIndex = -1;
                listarGrdPaciente();
            }
        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {
            lbl_error.Text = "";
            string DNI = txt_FiltrarPacientexDNI.Text;
            objPaFiltro.setDni(DNI);

            if (gestionPaciente.BuscarExisteDNI(objPaFiltro))
            {
                DataTable tabla = gestionPaciente.cragarGriConFiltroDNI(objPaFiltro);
                grdPaciente.DataSource = tabla;
                grdPaciente.DataBind();


            }
            else
            {
                lbl_error.Text = "no hubo coincidencias  ";
                txt_FiltrarPacientexDNI.Text = "";

            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            lbl_error.Text = "";
            string nombreApellido = txt_BuscarxNomApe.Text;
            objNombreApellido.setNombre(nombreApellido);
            objNombreApellido.setApellido(nombreApellido);

            if (gestionPaciente.ExisteNombreYapellidoSql(objNombreApellido))
            {
                DataTable tabla = gestionPaciente.cargarGridConFiltroNyA(objNombreApellido);
                grdPaciente.DataSource = tabla;
                grdPaciente.DataBind();


            }
            else
            {
                lbl_error.Text = "NO hubo coincidencias  ";
                txt_BuscarxNomApe.Text = "";

            }
        }

        protected void grdPaciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPaciente.PageIndex = e.NewPageIndex;
            listarGrdPaciente();
        }

        protected void btn_LimpiarTabla_Click(object sender, EventArgs e)
        {
            txt_BuscarxNomApe.Text = "";
            txt_FiltrarPacientexDNI.Text = "";
            listarGrdPaciente();
        }

    }
}