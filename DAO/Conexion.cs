using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class Conexion
    {
        
        string ruta = "Data Source=localhost\\sqlexpress;Initial Catalog=BDGrupo6;Integrated Security = True";


        public Conexion()
        {
            //cosntructor
        }

        public SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(ruta);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlCommand ObtenerCommand()
        {
            SqlConnection conn = new SqlConnection(ruta);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            conn.Close();
            return cmd;
        }

        public int EjecutarCommand(string consulta)
        {
            SqlConnection conn = new SqlConnection(ruta);
            conn.Open();
            SqlCommand cmd = new SqlCommand(consulta, conn);
            int filas = cmd.ExecuteNonQuery(); //INSERT-UPDATE-DELETE
            conn.Close();
            return filas;
        }

        public Boolean existe(String consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }
        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public int EjecutarProcedimientoAlmacenadoMODIFICAR(SqlCommand Comando, String NombreSP)
        {
            SqlConnection conn = new SqlConnection(ruta);
            using (var conexion = ObtenerConexion())
            {
                Comando.Connection = conexion;
                Comando.CommandType = CommandType.StoredProcedure;
                Comando.CommandText = NombreSP;
                return Comando.ExecuteNonQuery();
            }
        }

    }
}
