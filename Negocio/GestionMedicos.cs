using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Entidades;

namespace Negocio
{
    public class GestionMedicos
    {
        DAOMedicos dao = new DAOMedicos();

        //CARGA
        public DataTable cargarDDLprovincias()
        {
            DataTable dt = dao.GetTableProvincia();
            return dt;
        }
        public DataTable cargarDdlLoc(String idProvincia)
        {
            return dao.GetTableLocalidad(idProvincia);
        }
        public DataTable cargarDdlLoc()
        {
            return dao.GetTableLocalidadTodo();
        }
        public DataTable cargarDDLEspecialidades()
        {
            return dao.GetTableEspecialidad();
            
        }

        //MOSTRAR TODO

        public DataTable cargaGrillaMedicos()
        {
            DataTable dt = dao.GetTableMedicos();
            return dt;
        }

        //FILTROS

        public DataTable FiltroAsistencia(string asistencia)
        {
            return dao.Getfiltroasistencia(asistencia);
        }

        public DataTable FiltrarLegajoBajaLogica(String ingreso)
        {
            return dao.GetTableLegajoBajaLogica(ingreso);
        }

        public DataTable cargarDDLLocalidades(string provincia)
        {
            DataTable dt = dao.GetTableLocalidad(provincia);
            return dt;
        }
        public DataTable filtroProvincia(string provincia)
        {
            DataTable dt = dao.GetTableFiltroProvincia(provincia);
            return dt;
        }
        public DataTable cargarGrillaDni(string dni)
        {
            DataTable dt = dao.GetTableFiltroDni(dni);
            return dt;
        }

        public DataTable cargarGrillaDniVM(string dni, UsuarioLogin obj)
        {
            DataTable dt = dao.GetTableFiltroDniVM(dni, obj);
            return dt;
        }

        public DataTable cargarGrillaNomApe(string nombre)
        {
            DataTable dt = dao.GetTableFiltroNomApe(nombre);
            return dt;
        }

        public DataTable cargarGrillaNomApeVM(string nombre, UsuarioLogin obj)
        {
            DataTable dt = dao.GetTableFiltroNomApeVM(nombre, obj);
            return dt;
        }
        public DataTable FiltrarMayor(string mayor)
        {
            DataTable dt = dao.GetTableFiltroMayor(mayor);
            return dt;
        }
        public DataTable FiltrarMenor(string menor)
        {
            DataTable dt = dao.GetTableFiltroMenor(menor);
            return dt;
        }

        //ALTA
        public int AltaMedico(string sexo, Medicos obj)
        {
            SqlCommand comando = new SqlCommand();
            dao.ParametrosAltaMedico(ref comando, obj, sexo);
            return dao.EjecucionSpInsMed("sp_InsertarMedico", comando);
        }

        //MODIFICAR

        public int ModiUsuarioMedico(string legajo, string usuario, string contra)
        {
            SqlCommand cmd = dao.ParametroModiMedUsu(legajo, usuario, contra);
            return dao.EjecutarSpModiUsuMed("sp_ModificarUsuarioMedico", cmd);
        }

        //VALIDACION EXISTE
        public bool VerificarLegaRepetido(string legajo)
        {
            return dao.VerificarLegajo(legajo);
        }

        public bool VerificarDniRepetido(string dni)
        {
            return dao.VerificarDni(dni);
        }

        //BAJAS

        public bool bajaLogicaMedico(Medicos medico)
        {
            int cantFilas = 0;
            if (dao.existeElMedico(medico) == true)
            {
                cantFilas = dao.bajaLogicaMedico(medico);
            }

            if (cantFilas > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public bool ActualizarSQLMedicos(Medicos objCargadoMedico)
        {

            int cantidadFilas = 0;
            cantidadFilas = dao.ActualizarMedico(objCargadoMedico);
            if (cantidadFilas > 0)
            {
                return true;
            }
            else return false;
        }
    }
}
