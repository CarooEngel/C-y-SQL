using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DAO
{
    public class DAOsemana
    {
        Conexion cn= new Conexion();
    
        public DataTable CargarDDl()
        {
            string consulta = "SELECT IdSemana_Sem, Descripcion_Sem FROM Semana";
            DataTable tabla = cn.ObtenerTabla("Semana", consulta);
            return tabla;
        }
    }
}
