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
    public class GestionPacientes
    {

        DAOPacientes daoPaciente = new DAOPacientes();
        public DataTable ListarPaciente()
        {
            return daoPaciente.listar();

        }

        public void cargarPaciente(Pacientes pacientes)
        {
            daoPaciente.insertarPaciente(pacientes);
        }

        public DataTable cargarDdlLoc(String idProvincia)
        {
            return daoPaciente.getLoc(idProvincia);
        }
        public DataTable cargarDdlLoc()
        {
            return daoPaciente.getLoc();
        }
        public DataTable cargarProvincia()
        {
            return daoPaciente.getProvincias();
        }

        // para la baja logica de pacientes
        public bool DarLabaja(Pacientes objPacientes)
        {
            int cantFilas = 0;
            if (daoPaciente.existeElPaciente(objPacientes) == true)
            {
                cantFilas = daoPaciente.ModificarEstadoPaciente(objPacientes);
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
        //actualizar pacientes
        public bool ActualizarSQLPaciente(Pacientes objCargadoPaciente)
        {

            int cantidadFilas = 0;
            cantidadFilas = daoPaciente.ActualizarPaciente(objCargadoPaciente);
            if (cantidadFilas > 0)

            {
                return true;
            }
            else return false;
        }
        //existe el paciente
        public bool BuscarExisteDNI(Pacientes objPaDNI)
        {

            return daoPaciente.ExisteDNIsql(objPaDNI);
        }
        //cargar el filtro
        public DataTable cragarGriConFiltroDNI(Pacientes objPaDNI)
        {
            return daoPaciente.getTablaPacientes(objPaDNI);
        }
        //cargar el filtro nombre y apellido
        public bool ExisteNombreYapellidoSql(Pacientes objPNyP)
        {

            return daoPaciente.ExisteDNIsql(objPNyP);
        }
        public DataTable cargarGridConFiltroNyA(Pacientes objNombreYape)
        {
            return daoPaciente.ExisteNombreApellidosql(objNombreYape);
        }
    }

}
