using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using Entidades;

namespace Negocio
{
    public class GestionLogin
    {
        DAOlogin dao = new DAOlogin();
        public Boolean ExisteUsuarioUsuarioYContrasenaYad(UsuarioLogin objCargado)
        {

            return dao.existeUsuarioYcontrasenaADMIN(objCargado);
        }

        public Boolean ExisteUsuarioUsuarioYContrasenaYme(UsuarioLogin objCargado)
        {

            return dao.existeUsuarioYcontrasenaME(objCargado);
        }

        public Boolean ExisteLegajo(string Cargado)
        {

            return dao.existeLegajoSQL(Cargado);
        }

        public int AgregarUsuarioNuevo(ref UsuarioLogin objCargado)
        {
            return dao.AgregarASQL(ref objCargado);
        }

   

    }
}
