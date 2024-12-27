using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DAO
{
    public class DAOlogin
    {


        Conexion cn = new Conexion();
        public Boolean existeUsuarioYcontrasenaADMIN(UsuarioLogin objcargado)
        {
            string consulta = "SELECT * FROM Usuarios where Rol_Usu = 'A' and Nombre_Usu = '" + objcargado.getIDUsuario_Usu() + "' AND Contrasenia_Usu ='" + objcargado.getContrasenia_Usu() + "'";
            return cn.existe(consulta);
        }
        public Boolean existeUsuarioYcontrasenaME(UsuarioLogin objcargado)
        {
            string consulta = "SELECT * FROM Usuarios where Rol_Usu = 'M' and Nombre_Usu = '" + objcargado.getIDUsuario_Usu() + "' AND Contrasenia_Usu ='" + objcargado.getContrasenia_Usu() + "'";
            return cn.existe(consulta);
        }
        public Boolean existeLegajoSQL(string cargado)
        {
            string consulta = "select* from  Medicos  where Legajo_Me='" + cargado + "'";
            return cn.existe(consulta);
        }

        //agregagr nuevo usuario
        public int AgregarASQL(ref UsuarioLogin objcargado)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosInsertarUsuario(ref comando, objcargado);
            return cn.EjecutarProcedimientoAlmacenado(comando, "sp_InsertarNuevoUsuario");


        }

        public void ArmarParametrosInsertarUsuario(ref SqlCommand comando, UsuarioLogin objcargado)
        {

            SqlParameter sqlP = new SqlParameter();

            sqlP = comando.Parameters.Add("@Legajo", SqlDbType.Char, 5);
            sqlP.Value = objcargado.getLegajo_Usu();



            sqlP = comando.Parameters.Add("@Nombre ", SqlDbType.VarChar, 8);
            sqlP.Value = objcargado.getUsuario_Usi();


            sqlP = comando.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 8);
            sqlP.Value = objcargado.getContrasenia_Usu();
            sqlP = comando.Parameters.Add("@Rol", SqlDbType.Char, 1);
            sqlP.Value = objcargado.getRol_Usu();
        }

        //consulta para ver cual es el legajo de ese uusuario
    }
}
