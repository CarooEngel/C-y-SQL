using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DAO
{
    public class DAOmes
    {
        Conexion cn = new Conexion();
        public DataTable CargarDDl()
        {
            string consulta = "select IdMes_Mes,DescripcionMes_Mes FROM Meses";
            DataTable tabla = cn.ObtenerTabla("Meses", consulta);
            return tabla;
        }
    }
}
