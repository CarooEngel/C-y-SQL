using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DAO
{
    public class DAOPacientes
    {


        Conexion conexion = new Conexion();
        public DataTable listar()
        {
            string consulta = "select DniPaciente_Pa , Apellido_Pa, Nombre_Pa, Sexo_Pa, Edad_Pa,Telefono_Pa, Direccion_Pa, Nacionalidad_Pa,  IdLocalidad_Pa,  IdProvincia_Pa, CorreoElectronico_Me from Pacientes where  Pacientes.Estado_Pa=1";
            DataTable tabla = conexion.ObtenerTabla("Pacientes", consulta);
            return tabla;
        }

        public void armarParametroInsertar(ref SqlCommand comando, Pacientes pacientes)
        {
            comando.Parameters.Add("@Nombre_Pa", SqlDbType.VarChar, 50).Value = pacientes.getNombre();
            comando.Parameters.Add("@Apellido_Pa", SqlDbType.VarChar, 50).Value = pacientes.getApellido();
            comando.Parameters.Add("@DniPaciente_Pa", SqlDbType.Char, 8).Value = pacientes.GetDni();
            comando.Parameters.Add("@Sexo_Pa", SqlDbType.Char, 1).Value = pacientes.getSexo();
            comando.Parameters.Add("@Edad_Pa", SqlDbType.TinyInt).Value = pacientes.getEdad();
            comando.Parameters.Add("@IdProvincia_Pa", SqlDbType.Char, 2).Value = pacientes.getIdProvincia();
            comando.Parameters.Add("@IdLocalidad_Pa", SqlDbType.Char, 2).Value = pacientes.getIdLocalidad();

            comando.Parameters.Add("@Nacionalidad_Pa", SqlDbType.VarChar, 50).Value = pacientes.getNacionalidad();
            comando.Parameters.Add("@FechaNacimiento_Pa", SqlDbType.Date).Value = pacientes.getFechaNacimiento();
            comando.Parameters.Add("@Direccion_Pa", SqlDbType.VarChar, 100).Value = pacientes.getDireccion();
            comando.Parameters.Add("@CorreoElectronico_Me", SqlDbType.VarChar, 100).Value = pacientes.getCorreo();
            comando.Parameters.Add("@Telefono_Pa", SqlDbType.VarChar, 20).Value = pacientes.getTelefono();

            // comando.Parameters.Add("@Estado_Pa", SqlDbType.Bit).Value = pacientes.getEstado();
        }
        public void insertarPaciente(Pacientes paciente)
        {
            using (SqlConnection cn = conexion.ObtenerConexion())
            {
                SqlCommand comando = new SqlCommand();
                armarParametroInsertar(ref comando, paciente);
                conexion.EjecutarProcedimientoAlmacenado(comando, "sp_CargaPaciente");

            }

        }
        public DataTable getProvincias()
        {
            string consulta = "SELECT*FROM Provincias";
            DataTable tabla = conexion.ObtenerTabla("Provincias", consulta);
            return tabla;
        }
        public DataTable getLoc(String idProvincia)
        {

            string consulta = "SELECT * FROM Localidades WHERE Localidades.IdProvincia_Loc = @idProvincia";
            SqlCommand sqlCommand = new SqlCommand(consulta, conexion.ObtenerConexion());
            sqlCommand.Parameters.AddWithValue("@idProvincia", idProvincia);
            SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            return tabla;

        }
        public DataTable getLoc()
        {
            string consulta = "SELECT * FROM Localidades";
            SqlCommand sqlCommand = new SqlCommand();

            DataTable tabla = conexion.ObtenerTabla("Localidades", consulta);
            return tabla;
        }

        //para la baja 
        public bool existeElPaciente(Pacientes objPacientes)
        {

            string consulta = "Select * from Pacientes where Estado_Pa = 1 AND DniPaciente_Pa ='" + objPacientes.GetDni() + "'";


            return conexion.existe(consulta);
        }

        public int ModificarEstadoPaciente(Pacientes objPacientes)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaLocgicaPaciente(ref comando, objPacientes);
            return conexion.EjecutarProcedimientoAlmacenado(comando, "sp_ModificarEstadoPaciente");
        }

        public void ArmarParametrosBajaLocgicaPaciente(ref SqlCommand comando, Pacientes pacientes)
        {
            SqlParameter sqlP = new SqlParameter();

            sqlP = comando.Parameters.Add("@DNI", SqlDbType.Char, 8);

            sqlP.Value = pacientes.GetDni();

        }
        //actualizar en la sql los datos de los pacientes
        public int ActualizarPaciente(Pacientes objCargadoPaciente)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosActualizarSQLPaciente(ref comando, objCargadoPaciente);
            return conexion.EjecutarProcedimientoAlmacenadoMODIFICAR(comando, "sp_ModificarPaciente");
        }

        private void ArmarParametrosActualizarSQLPaciente(ref SqlCommand comando, Pacientes objCargadoPaciente)
        {
            SqlParameter sqlParametro = new SqlParameter();
            sqlParametro = comando.Parameters.Add("@DniPaciente_Pa", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.GetDni();
            sqlParametro = comando.Parameters.Add("@Apellido_Pa", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.getApellido();
            sqlParametro = comando.Parameters.Add("@Nombre_Pa", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.getNombre();
            sqlParametro = comando.Parameters.Add("@Sexo_Pa", SqlDbType.Char);
            sqlParametro.Value = objCargadoPaciente.getSexo();
            sqlParametro = comando.Parameters.Add("@Edad_Pa", SqlDbType.TinyInt);
            sqlParametro.Value = objCargadoPaciente.getEdad();
            sqlParametro = comando.Parameters.Add("@Telefono_Pa", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.getTelefono();
            sqlParametro = comando.Parameters.Add("@Direccion_Pa", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.getDireccion();
            sqlParametro = comando.Parameters.Add("@Nacionalidad_Pa", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.getNacionalidad();
            sqlParametro = comando.Parameters.Add("@IdProvincia_Pa", SqlDbType.Char);
            sqlParametro.Value = objCargadoPaciente.getIdProvincia();
            sqlParametro = comando.Parameters.Add("@IdLocalidad_Pa", SqlDbType.Char);
            sqlParametro.Value = objCargadoPaciente.getIdLocalidad();
            sqlParametro = comando.Parameters.Add("@CorreoElectronico_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoPaciente.getCorreo();
        }
        //filtros dni

        public bool ExisteDNIsql(Pacientes objDNI)
        {
            string consulta = "Select * from Pacientes WHERE Estado_Pa = 1 AND DniPaciente_Pa LIKE'%" + objDNI.GetDni() + "%'";
            return conexion.existe(consulta);
        }

        public DataTable getTablaPacientes(Pacientes objDNI)
        {
            string consulta = "select DniPaciente_Pa , Apellido_Pa, Nombre_Pa, Sexo_Pa, Edad_Pa,Telefono_Pa, Direccion_Pa, Nacionalidad_Pa, IdLocalidad_Pa,  IdProvincia_Pa, CorreoElectronico_Me from Pacientes where  Pacientes.Estado_Pa=1 and  Pacientes.DniPaciente_Pa LIKE '%" + objDNI.GetDni() + "%'";
            DataTable tabla = conexion.ObtenerTabla("Pacientes", consulta);
            return tabla;
        }
        //filtro nombre aplellido
        public bool ExisteNombreYapellidoSql(Pacientes objNyA)
        {
            string consulta = "select DniPaciente_Pa , Apellido_Pa, Nombre_Pa, Sexo_Pa, Edad_Pa,Telefono_Pa, Direccion_Pa, Nacionalidad_Pa, IdLocalidad_Pa,  IdProvincia_Pa, CorreoElectronico_Me from Pacientes where  Pacientes.Estado_Pa=1 and Nombre_Pa like '%" + objNyA.getNombre() + "%' or Apellido_Pa like '%" + objNyA.getApellido() + "%'";
            return conexion.existe(consulta);
        }

        public DataTable ExisteNombreApellidosql(Pacientes objNyA)
        {
            string consulta = "select * from Pacientes where Estado_Pa=1 and Nombre_Pa like '%" + objNyA.getNombre() + "%'";
            DataTable tabla = conexion.ObtenerTabla("Pacientes", consulta);
            return tabla;
        }

    }
}

