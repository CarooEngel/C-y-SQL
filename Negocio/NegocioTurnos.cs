using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Entidades;


namespace Negocio
{
    public class NegocioTurnos
    {
        Conexion conexion = new Conexion();
        DAOTurnos DAOTurnos = new DAO.DAOTurnos();
        Turnos objTurno = new Turnos();

        public DataTable cargaGrillaMedicos()
        {
            DataTable dt = DAOTurnos.GetTableMedicos();
            return dt;
        }

        public DataTable FiltrarMayor(string mayor)
        {
            DataTable dt = DAOTurnos.GetTableFiltroMayor(mayor);
            return dt;
        }
        public DataTable FiltrarMenor(string menor)
        {
            DataTable dt = DAOTurnos.GetTableFiltroMenor(menor);
            return dt;
        }

        public DataTable FiltrarLegajoBajaLogica(String ingreso)
        {
            return DAOTurnos.GetTableLegajoBajaLogica(ingreso);
        }

        public DataTable listarTurnos()
        {
            return DAOTurnos.listarTurnos();
        }
        public DataTable getTablaConFiltroPorDNI(string ingreso)
        {
            DataTable dt = DAOTurnos.filtrarXDNI(ingreso);
            return dt;
        }

        public DataTable obtenerEspecialidadFiltro(string especialidad)
        {
            return DAOTurnos.getfiltroespecialidad(especialidad);
        }

        public DataTable cargarDDLEspecialidades()
        {
            DataTable dt = DAOTurnos.GetTableEspecialidad();
            return dt;
        }

        public DataTable obtenerMedicoEspecialidad(string especialidad)
        {
            DataTable dt = DAOTurnos.GetTableMedEsp(especialidad);
            return dt;
        }


        //parte del alta turno
        public DataTable cargarGridConLegajo(Turnos objLeagjo)
        {
            return DAOTurnos.getTablaHoraiosMedicos(objLeagjo);
        }

        //fijarce si existe el dni delpaciente??

        //agreggar ala SQL el turno

        public bool agregarTurno(Turnos objCargadoTurnos)
        {


            int cantFilas = 0;



            if (DAOTurnos.existeDniPaciente(objCargadoTurnos) == true)
            {


                cantFilas = DAOTurnos.agregarTurnoSQL(ref objCargadoTurnos);
                if (cantFilas > 0)
                {

                    return true;
                }
                else
                {
                    return false;
                }



            }
            else return false;


        }
        // ESTO ES PARA LA PARTE ADMIN MEDICO QUE ES LOQUEVE DE LSOTURNOS TODOS
        public DataTable cargaGrillaMedicosTurnoTODA(UsuarioLogin objLogin)
        {
            DataTable dt = DAOTurnos.GetTableMedicoTurnos(objLogin);
            return dt;
        }
        // ESTO ES PARA LA PARTE ADMIN MEDICO QUE ES LOQUEVE DE LSOTURNOS  por fecha
        public DataTable cargaGrillaMedicosTurnoSoloFecha(UsuarioLogin objLogin, String fecha)
        {
            DataTable dt = DAOTurnos.GetTableMedicoTurnosFecha(objLogin, fecha);
            return dt;
        }



            //actualizamos sql con modificar
            public bool ActualizarAsistenciaYObservacion(Turnos objTurnos)
        {
            int cantidadFilas = 0;
            cantidadFilas = DAOTurnos.ActualizarAsistenciYonservacion(objTurnos);
            if (cantidadFilas > 0)

            {
                return true;
            }
            else return false;

        }

        public bool bajaLogicaTurno(Turnos turno)
        {
            int cantFilas = DAOTurnos.bajaLogicaTurno(turno);  

            if (cantFilas > 0)
            {
                return DAOTurnos.existeElTurno(turno);
            }
            else
            {
                return false;
            }

        }
        public DataTable buscarLegajo(String legajo) {
            return DAOTurnos.TurnoXlegajo(legajo);

        }

    }
}
