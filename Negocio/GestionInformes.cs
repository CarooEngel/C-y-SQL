using DAO;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class GestionInformes
    {
        DAOInformes DAOInformes = new DAOInformes();

        public DataTable ObtenerInformeAsistencia(string fechaInicio, string fechaFinal) 
        { 
            return DAOInformes.listarInformeAsistencia(fechaInicio, fechaFinal); 
        }
        public DataTable ObtenerInformeSexo(string fechaInicio, string fechaFinal)
        {
            return DAOInformes.listarInformeSexo(fechaInicio, fechaFinal);
        }
        public DataTable ObtenerInformeEdades(string fechaInicio, string fechaFinal)
        {
            return DAOInformes.listarInformeEdades(fechaInicio, fechaFinal);
        }
        public DataTable ObtenerInformeHorarios(string fechaInicio, string fechaFinal)
        {
            return DAOInformes.listarInformeHorarios(fechaInicio, fechaFinal);
        }
    }
}
