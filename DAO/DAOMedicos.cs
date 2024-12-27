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
    public class DAOMedicos
    {
        Conexion acceso = new Conexion();

        public DataTable GetTableLegajoBajaLogica(string ingreso)
        {
            DataTable dt = acceso.ObtenerTabla("filtrolegajobaja", "SELECT Legajo_Me,Dni_Me,CONCAT (Nombre_Me,' ',Apellido_Me) AS Nombre,descripcion_Esp FROM Medicos INNER JOIN Especialidades on IdEspecialidad_Esp = IdEspecialidad_Me WHERE Estado_Me = 1 AND Legajo_Me ='" + ingreso + "' OR Dni_Me = '" + ingreso + "'");
            return dt;
        }
        public bool VerificarDni(string dni)
        {
            return acceso.existe("SELECT * FROM Medicos WHERE Estado_Me=1 AND Dni_Me ='" + dni + "'");
        }
        public bool VerificarLegajo(string Legajo)
        {
            return acceso.existe("SELECT * FROM Medicos  WHERE Estado_Me=1 AND Legajo_Me ='" + Legajo + "'");
        }

        public DataTable GetTableProvincia()
        {
            string consulta = "SELECT*FROM Provincias";
            DataTable tabla = acceso.ObtenerTabla("Provincias", consulta);
            return tabla;
        }


        public DataTable GetTableLocalidad(string provincia)
        {
            string consulta = "SELECT * FROM Localidades WHERE Localidades.IdProvincia_Loc = @idProvincia";
            SqlCommand sqlCommand = new SqlCommand(consulta, acceso.ObtenerConexion());
            sqlCommand.Parameters.AddWithValue("@idProvincia", provincia);
            SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            return tabla;
        }
        public DataTable GetTableLocalidadTodo()
        {
            return acceso.ObtenerTabla("Localidad", "SELECT IdLocalidad_Loc,descripcionLocalidad_Loc FROM Localidades");
        }

        public DataTable GetTableEspecialidad()
        {
            return acceso.ObtenerTabla("Especialidades", "SELECT descripcion_Esp,IdEspecialidad_Esp FROM Especialidades");
        }
        public DataTable GetTableHorarioIni()
        {
            return acceso.ObtenerTabla("HorarioIni", "SELECT HoraFinal_DL,HoraInicio_DL  FROM DiasLaborales");
        }

        public DataTable GetTableHorarioFin()
        {
            return acceso.ObtenerTabla("HorarioFin", "SELECT HoraFinal_DL,HoraInicio_DL FROM DiasLaborales");
        }
        public DataTable GetTableMedicos()
        {
            return acceso.ObtenerTabla("Medico", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,IdProvincia_Me,IdLocalidad_Me,Dni_Me,descripcion_Esp ,IdEspecialidad_Esp,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Estado_Me=1");
        }

        //FILTROS

        public DataTable Getfiltroasistencia(string asistencia)
        {
            return acceso.ObtenerTabla("FiltroAsistencia", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,Dni_Me,descripcion_Esp ,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Estado_Me=1");
        }

        public DataTable GetTableFiltroDni(string dni)
        {
            return acceso.ObtenerTabla("MedicoDni", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,Dni_Me,descripcion_Esp ,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Estado_Me=1 AND Dni_Me = '" + dni + "'");
        }
       
        public DataTable GetTableFiltroNomApe(string nombre)
        {
            return acceso.ObtenerTabla("MedicoNombre", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,Dni_Me,descripcion_Esp ,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Nombre_Me LIKE SUBSTRING('" + nombre + "',1,1) + '%' AND Estado_Me = 1");
        }

        //--------------------este bes el filtro en ususario medico - busac x nmombre pa
        public DataTable GetTableFiltroNomApeVM(string nombre, UsuarioLogin obj)
        {
            return acceso.ObtenerTabla("Turnos", " select Turnos.IdTurno_Tr as ID , Turnos.IdEspecialidad_Tr as Espacialidad,Pacientes.DniPaciente_Pa as DNI , Pacientes.Nombre_Pa as Nombre, Pacientes.Apellido_Pa as Apellido, Turnos.FechaTurno_Tr as Fecha, Turnos.Horario_Tr as Horario, Turnos.Asistencia_Tr as Asistencia,   Turnos.Observacion_Tr  as Observacion from Turnos  inner join  Usuarios on Usuarios.Legajo_Usu= Turnos.LegajoMedico_Tr inner join Pacientes on Turnos.DniPaciente_Tr= Pacientes.DniPaciente_Pa where  Usuarios.Nombre_Usu='" + obj.getUsuario_Usi()+"' and  Usuarios.Contrasenia_Usu= '"+obj.getContrasenia_Usu()+"' and Pacientes.Nombre_Pa LIKE  '%"+nombre+ "%' and Turnos.Estado_Tr=1 ");
        }

        public DataTable GetTableFiltroDniVM(string dni, UsuarioLogin obj)
        {
            return acceso.ObtenerTabla("MedicoDniVM", " select Turnos.IdTurno_Tr as ID , Turnos.IdEspecialidad_Tr as Espacialidad,Pacientes.DniPaciente_Pa as DNI , Pacientes.Nombre_Pa as Nombre, Pacientes.Apellido_Pa as Apellido, Turnos.FechaTurno_Tr as Fecha, Turnos.Horario_Tr as Horario, Turnos.Asistencia_Tr as Asistencia,   Turnos.Observacion_Tr  as Observacion from Turnos  inner join  Usuarios on Usuarios.Legajo_Usu= Turnos.LegajoMedico_Tr inner join Pacientes on Turnos.DniPaciente_Tr= Pacientes.DniPaciente_Pa where  Usuarios.Nombre_Usu='" + obj.getUsuario_Usi()+"' and  Usuarios.Contrasenia_Usu= '"+obj.getContrasenia_Usu()+"' and Pacientes.DniPaciente_Pa ='"+dni+ "' and Turnos.Estado_Tr=1 ");
        }



        //-----------------------
        public DataTable GetTableFiltroMayor(string mayor)
        {
            return acceso.ObtenerTabla("mayor", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,Dni_Me,descripcion_Esp ,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Estado_Me=1 AND FechaNacimiento_Me > '" + mayor + "'");
        }
        public DataTable GetTableFiltroMenor(string menor)
        {
            return acceso.ObtenerTabla("menor", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,Dni_Me,descripcion_Esp ,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Estado_Me=1 AND FechaNacimiento_Me < '" + menor + "'");
        }

        public DataTable GetTableFiltroProvincia(string provincia)
        {
            return acceso.ObtenerTabla("filtroProv", "SELECT Legajo_Me,Nombre_Me,Apellido_Me,Dni_Me,descripcion_Esp ,descripcionLocalidad_Loc,descripcionProvincia_Pr,Nacionalidad_Me,FechaNacimiento_Me,Direccion_Me,CorreoElectronico_Me,Telefono_Me,Sexo_Me FROM Medicos INNER JOIN Especialidades ON IdEspecialidad_Me = IdEspecialidad_Esp INNER JOIN Localidades  ON IdLocalidad_Me = IdLocalidad_Loc INNER JOIN Provincias ON IdProvincias_Pr = IdProvincia_Loc WHERE Estado_Me=1 AND IdProvincia_Loc = '" + provincia + "'");
        }

        //PARAMETROS

        public void ParametrosAltaMedico(ref SqlCommand comando, Medicos objCargadoMedico, string sexo)
        {
            SqlParameter sqlParametro = new SqlParameter();
            sqlParametro = comando.Parameters.Add("@Legajo", SqlDbType.Char, 5);
            sqlParametro.Value = objCargadoMedico.getLegajoMedico();
            sqlParametro = comando.Parameters.Add("@Especialidad", SqlDbType.Char, 2);
            sqlParametro.Value = objCargadoMedico.getEspecialidad();
            sqlParametro = comando.Parameters.Add("@Localidad", SqlDbType.Char, 2);
            sqlParametro.Value = objCargadoMedico.getLocalidad();
            sqlParametro = comando.Parameters.Add("@Provincia", SqlDbType.Char, 2);
            sqlParametro.Value = objCargadoMedico.getProvincia();
            sqlParametro = comando.Parameters.Add("@Dni", SqlDbType.VarChar, 8);
            sqlParametro.Value = objCargadoMedico.getDNIMedico();
            sqlParametro = comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            sqlParametro.Value = objCargadoMedico.getNombreMedico();
            sqlParametro = comando.Parameters.Add("@Apellido", SqlDbType.VarChar, 50);
            sqlParametro.Value = objCargadoMedico.getApellidoMedico();
            sqlParametro = comando.Parameters.Add("@Sexo", SqlDbType.Char, 1);
            sqlParametro.Value = sexo;
            sqlParametro = comando.Parameters.Add("@Nacionalidad", SqlDbType.VarChar, 50);
            sqlParametro.Value = objCargadoMedico.getNacionalidadMedico();
            sqlParametro = comando.Parameters.Add("@FechaNacimiento", SqlDbType.Date);
            sqlParametro.Value = objCargadoMedico.getFechaNacimiento();
            sqlParametro = comando.Parameters.Add("@Direccion", SqlDbType.VarChar, 100);
            sqlParametro.Value = objCargadoMedico.getDireccion();
            sqlParametro = comando.Parameters.Add("@CorreoElectronico", SqlDbType.VarChar, 100);
            sqlParametro.Value = objCargadoMedico.getCorreo();
            sqlParametro = comando.Parameters.Add("@Telefono", SqlDbType.VarChar, 20);
            sqlParametro.Value = objCargadoMedico.getTelefonoMedico();
        }

        public SqlCommand ParametroModiMedUsu(string legajo, string usuario, string contra)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@Legajo", legajo);
            cmd.Parameters.AddWithValue("@Usuario", usuario);
            cmd.Parameters.AddWithValue("@Contrasenia", contra);
            return cmd;
        }

        public SqlCommand ParametrosAltaUsuario(string legajo, string usuario, string contra)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@Legajo", legajo);
            cmd.Parameters.AddWithValue("@Usuario", usuario);
            cmd.Parameters.AddWithValue("@Contrasenia", contra);
            return cmd;
        }

        public int EjecucionSpInsMed(string sp, SqlCommand cmd)
        {
            return acceso.EjecutarProcedimientoAlmacenado(cmd, sp);
        }

        public int EjecutarSpModiUsuMed(string sp, SqlCommand cmd)
        {
            return acceso.EjecutarProcedimientoAlmacenado(cmd, sp);
        }

        public Boolean existeElMedico(Medicos medico)
        {
            string consulta = "SELECT * FROM Medicos WHERE Estado_Me = 1 AND Legajo_Me ='" + medico.getLegajoMedico() + "'";
            return acceso.existe(consulta);
        }

        public int bajaLogicaMedico(Medicos medico)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaLogicaMedico(ref comando, medico);
            return acceso.EjecutarProcedimientoAlmacenado(comando, "sp_BajaLogicaMedico");
        }
        public void ArmarParametrosBajaLogicaMedico(ref SqlCommand comando, Medicos medico)
        {
            SqlParameter sqlP = new SqlParameter();

            sqlP = comando.Parameters.Add("@LEGAJOMEDICO", SqlDbType.Char, 5);

            sqlP.Value = medico.getLegajoMedico();

        }

        public int ActualizarMedico(Medicos objCargadoMedico)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosActualizarSQLMedico(ref comando, objCargadoMedico);
            return acceso.EjecutarProcedimientoAlmacenadoMODIFICAR(comando, "sp_ModificarMedico");
        }

        private void ArmarParametrosActualizarSQLMedico(ref SqlCommand comando, Medicos objCargadoMedico)
        {
            SqlParameter sqlParametro = new SqlParameter();
            sqlParametro = comando.Parameters.Add("@Legajo_Me", SqlDbType.Char);
            sqlParametro.Value = objCargadoMedico.getLegajoMedico();
            sqlParametro = comando.Parameters.Add("@IdEspecialidad_Me", SqlDbType.Char);
            sqlParametro.Value = objCargadoMedico.getEspecialidad();
            sqlParametro = comando.Parameters.Add("@IdLocalidad_Me", SqlDbType.Char);
            sqlParametro.Value = objCargadoMedico.getLocalidad();
            sqlParametro = comando.Parameters.Add("@IdProvincia_Me", SqlDbType.Char);
            sqlParametro.Value = objCargadoMedico.getProvincia();
            sqlParametro = comando.Parameters.Add("@Dni_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getDNIMedico();
            sqlParametro = comando.Parameters.Add("@Nombre_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getNombreMedico();
            sqlParametro = comando.Parameters.Add("@Apellido_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getApellidoMedico();
            sqlParametro = comando.Parameters.Add("@Sexo_Me", SqlDbType.Char);
            sqlParametro.Value = objCargadoMedico.getSexoMedicos();
            sqlParametro = comando.Parameters.Add("@Nacionalidad_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getNacionalidadMedico();
            sqlParametro = comando.Parameters.Add("@FechaNacimiento_Me", SqlDbType.Date);
            sqlParametro.Value = objCargadoMedico.getFechaNacimiento();
            sqlParametro = comando.Parameters.Add("@Direccion_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getDireccion();
            sqlParametro = comando.Parameters.Add("@CorreoElectronico_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getCorreo();
            sqlParametro = comando.Parameters.Add("@Telefono_Me", SqlDbType.VarChar);
            sqlParametro.Value = objCargadoMedico.getTelefonoMedico();
        }
    }
}
