using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using DAO;


namespace Negocio
{
    public class GestionAltaMedicoHorario
    {


        DAOaltaMedicoHorario dao = new DAOaltaMedicoHorario();


        public bool agregarAltaMedicoHs(AltaMedicoHorario objAltaMeHS, AltaMedicoHorario objExyeValorYAexiste)
        {


            int cantFilas = 0;



            if (dao.existeLegajoMedico(objAltaMeHS) == true && dao.existeMesYsemana(objExyeValorYAexiste) == false)
            {

                objAltaMeHS.setdiaAtivo_DL(true);
                cantFilas = dao.agregarHoraioMedicoSQL(ref objAltaMeHS);



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

        public bool validarlegajo(string legajo)
        {
            return dao.GetValidarLegajo(legajo);
        }


        public DataTable getTabla(AltaMedicoHorario objAltahsMostrar)
        {
            return dao.getTablaHoraiosMedicos(objAltahsMostrar);
        }


        //listar los horarios
        public bool ExistelLegajo(AltaMedicoHorario objLeagjo)
        {

            return dao.existeLegajoMedico(objLeagjo);
        }
        public DataTable cargarGridConLegajo(AltaMedicoHorario objLeagjo)
        {
            return dao.getTablaHoraiosMedicos(objLeagjo);
        }
    }

}    
