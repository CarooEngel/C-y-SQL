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
   public class GestionMes
    {

        DAOmes dao = new DAOmes();
        public DataTable CargarDdlMes ()
        {
            DataTable tabla = dao.CargarDDl();
            return tabla;
        }
    }
}
