using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Entidades
{
    public class UsuarioLogin
    {

        string IDUsuario_Usu;
        string Legajo_Usu;
        string Usuario_Usi;
        string Contrasenia_Usu;
        char Rol_Usu;





        public UsuarioLogin()
        {
            //contsrucotr vacio
        }


        public string getIDUsuario_Usu()
        {
            return IDUsuario_Usu;
        }
        public void setIDUsuario_Usu(string L)
        {
            this.IDUsuario_Usu = L;
        }

        public string getLegajo_Usu()
        {
            return Legajo_Usu;
        }
        public void setLegajo_Usu(string l)
        {
            this.Legajo_Usu = l;
        }


        public string getUsuario_Usi()
        {
            return Usuario_Usi;
        }
        public void setUsuario_Usi(string m)
        {
            this.Usuario_Usi = m;
        }

        public string getContrasenia_Usu()
        {
            return Contrasenia_Usu;
        }
        public void setContrasenia_Usu(string c)
        {
            this.Contrasenia_Usu = c;
        }

        public char getRol_Usu()
        {
            return Rol_Usu;
        }
        public void setRol_Usu(char c)
        {
            this.Rol_Usu = c;
        }
    }
}
