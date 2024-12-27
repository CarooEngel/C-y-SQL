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
    public class GestionSemana
    {
        DAOsemana dao = new DAOsemana();

        public DataTable CargarDdlDia()
        {
            DataTable tabla = dao.CargarDDl();
            return tabla;
        }

    }
}
