using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DAO
{
    public class DAOTurnos
    {
        Conexion cn = new Conexion();

        public DataTable GetTableMedicos()
        {
            return cn.ObtenerTabla("Medico", "SELECT IdTurno_Tr,CONCAT (HoraInicio_DL,' a ',HoraFinal_DL) AS Horario ,CONCAT (Nombre_Pa,' ',Apellido_Pa) AS Paciente, Especialidades.descripcion_Esp AS Area,FechaTurno_Tr AS Fecha, (Medicos.Nombre_Me + ' ' + Medicos.Apellido_Me) AS Medico,Observacion_Tr AS Observaciones, Turnos.Asistencia_Tr AS Asistencia FROM Turnos   INNER JOIN DiasLaborales ON LegajoMedico_DL = LegajoMedico_Tr INNER JOIN Medicos ON Turnos.LegajoMedico_Tr = Medicos.Legajo_Me   INNER JOIN Pacientes ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa    INNER JOIN Especialidades ON Turnos.IdEspecialidad_Tr = Especialidades.IdEspecialidad_Esp WHERE Estado_Me=1");
        }
        public DataTable GetTableFiltroMayor(string mayor)
        {
            return cn.ObtenerTabla("mayor", "SELECT(Horario_Tr) AS Horario, (Pacientes.Nombre_Pa + ' ' + Pacientes.Apellido_Pa) AS Paciente, Especialidades.descripcion_Esp AS Area, FechaTurno_Tr AS Fecha, (Medicos.Nombre_Me + ' ' + Medicos.Apellido_Me) AS Medico, Observacion_Tr AS Observaciones, Turnos.Asistencia_Tr AS Asistencia FROM Turnos   INNER JOIN Medicos ON Turnos.LegajoMedico_Tr = Medicos.Legajo_Me   INNER JOIN Pacientes ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa   INNER JOIN Especialidades ON Turnos.IdEspecialidad_Tr = Especialidades.IdEspecialidad_Esp WHERE(Estado_Me = 1 AND Estado_Pa = 1) AND(FechaTurno_Tr > '" + mayor + "')");
        }
        public DataTable GetTableFiltroMenor(string menor)
        {
            return cn.ObtenerTabla("menor", "SELECT(Horario_Tr) AS Horario, (Pacientes.Nombre_Pa + ' ' + Pacientes.Apellido_Pa) AS Paciente, Especialidades.descripcion_Esp AS Area, FechaTurno_Tr AS Fecha, (Medicos.Nombre_Me + ' ' + Medicos.Apellido_Me) AS Medico, Observacion_Tr AS Observaciones, Turnos.Asistencia_Tr AS Asistencia FROM Turnos   INNER JOIN Medicos ON Turnos.LegajoMedico_Tr = Medicos.Legajo_Me   INNER JOIN Pacientes ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa   INNER JOIN Especialidades ON Turnos.IdEspecialidad_Tr = Especialidades.IdEspecialidad_Esp WHERE(Estado_Me = 1 AND Estado_Pa = 1) AND(FechaTurno_Tr < '" + menor + "')");
        }

        public DataTable GetTableLegajoBajaLogica(string ingreso)
        {
            DataTable dt = cn.ObtenerTabla("filtrolegajobaja", " SELECT Legajo_Me, CONCAT (Nombre_Me,' ',Apellido_Me) AS NombreMedico,descripcion_Esp , (Turnos.DniPaciente_Tr)  as DNIpaciente FROM Medicos INNER JOIN Turnos ON Legajo_Me = LegajoMedico_Tr INNER JOIN Especialidades on IdEspecialidad_Esp = IdEspecialidad_Me WHERE IdTurno_Tr ="+ingreso+"  AND Estado_Tr = 1");
            return dt;
        }

        public DataTable listarTurnos()
        {
          String query = "SELECT Nombre_Pa as NombrePaciente ,Apellido_Pa as ApellidoPaciente,Medicos.Nombre_Me as NombreTurno,Medicos.Apellido_Me as ApellidoTurno,Turnos.Horario_Tr as Horario," +
            " Turnos.LegajoMedico_Tr as LegajoMedico,Turnos.FechaTurno_Tr AS Dia" +
         "FROM Turnos JOIN Pacientes ON Pacientes.DniPaciente_Pa = Turnos.DniPaciente_Tr JOIN Medicos ON Medicos.Legajo_Me = Turnos.LegajoMedico_Tr";

            string consulta = "SELECT Nombre_Pa ,Apellido_Pa,Medicos.Nombre_Me,Medicos.Apellido_Me,Turnos.Horario_Tr,Turnos.LegajoMedico_Tr,Turnos.FechaTurno_Tr FROM Turnos JOIN Pacientes ON Pacientes.DniPaciente_Pa = Turnos.DniPaciente_Tr JOIN Medicos ON Medicos.Legajo_Me = Turnos.LegajoMedico_Tr";
            
            DataTable tablaTurnos = cn.ObtenerTabla("Turnos", consulta);
            return tablaTurnos;
        }

        public DataTable filtrarXDNI(string ingreso)
        {

            string query = "SELECT Nombre_Pa, Apellido_Pa, Medicos.Nombre_Me,Medicos.Apellido_Me,Turnos.Horario_Tr,Turnos.LegajoMedico_Tr,Turnos.FechaTurno_Tr FROM Turnos INNER JOIN Pacientes ON Pacientes.DniPaciente_Pa = Turnos.DniPaciente_Tr INNER JOIN Medicos ON Medicos.Legajo_Me = Turnos.LegajoMedico_Tr WHERE Pacientes.DniPaciente_Pa = @paraDni AND Pacientes.Estado_Pa = 1";
            SqlCommand sql = new SqlCommand(query,cn.ObtenerConexion());
            sql.Parameters.AddWithValue("@paraDni", ingreso);
            SqlDataAdapter sda = new SqlDataAdapter(sql);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            return tabla;
        }


        public DataTable TurnoXlegajo(String legajo) {

            String query = "SELECT Nombre_Pa ,Apellido_Pa,Medicos.Nombre_Me,Medicos.Apellido_Me,Turnos.Horario_Tr,Turnos.LegajoMedico_Tr,Turnos.FechaTurno_Tr" +
    "FROM Turnos JOIN Pacientes ON Pacientes.DniPaciente_Pa = Turnos.DniPaciente_Tr" +
    "JOIN Medicos ON Medicos.Legajo_Me = Turnos.LegajoMedico_Tr WHERE Medicos.Legajo_Me = @paraLegajo";

            string consulta = "SELECT Nombre_Pa ,Apellido_Pa,Medicos.Nombre_Me,Medicos.Apellido_Me,Turnos.Horario_Tr,Turnos.LegajoMedico_Tr,Turnos.FechaTurno_Tr FROM Turnos inner JOIN Pacientes ON Pacientes.DniPaciente_Pa = Turnos.DniPaciente_Tr inner JOIN Medicos ON Medicos.Legajo_Me = Turnos.LegajoMedico_Tr WHERE Medicos.Legajo_Me =@paraLegajo";
            SqlCommand sql = new SqlCommand(consulta, cn.ObtenerConexion());
            sql.Parameters.AddWithValue("@paraLegajo", legajo);
            SqlDataAdapter sda = new SqlDataAdapter(sql);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            return tabla;


        }
        public DataTable getfiltroespecialidad(string especialidad)
        {
            return cn.ObtenerTabla("FiltroEspecialidad", "SELECT (Horario_Tr) AS Horario, (Pacientes.Nombre_Pa + ' ' + Pacientes.Apellido_Pa) AS Paciente, Especialidades.descripcion_Esp AS Area,FechaTurno_Tr AS Fecha, (Medicos.Nombre_Me + ' ' + Medicos.Apellido_Me) AS Medico,Observacion_Tr AS Observaciones, Turnos.Asistencia_Tr AS Asistencia FROM Turnos   INNER JOIN Medicos ON Turnos.LegajoMedico_Tr = Medicos.Legajo_Me   INNER JOIN Pacientes ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa   INNER JOIN Especialidades ON Turnos.IdEspecialidad_Tr = Especialidades.IdEspecialidad_Esp WHERE (Estado_Me = 1 AND Estado_Pa = 1) AND (IdEspecialidad_Esp = '" + especialidad + "')");
        }

        public DataTable GetTableEspecialidad()
        {
            return cn.ObtenerTabla("Especialidad", "SELECT descripcion_Esp,IdEspecialidad_Esp FROM Especialidades");
        }

        public DataTable GetTableMedEsp(string especialidad)
        {
            return cn.ObtenerTabla("MedEsp", "SELECT CONCAT(Legajo_Me, ' - ', Nombre_Me, ' ', Apellido_Me) AS Medico from Especialidades  inner join Medicos on IdEspecialidad_Esp = IdEspecialidad_Me where IdEspecialidad_Esp ='" + especialidad + "'");
        }




        //parte alta turno que me cargue la grid co los horarios disponiibles
        public DataTable getTablaHoraiosMedicos(Turnos objCArgadoTuenos)
        {
            DataTable tabla = cn.ObtenerTabla("DiasLaborales", " select  IdDiaLaborable_DL AS ID,  LegajoMedico_DL AS Legajo,  CONVERT(VARCHAR(10), Dia_DL, 23)  AS Fecha,    CONVERT(VARCHAR(5), HoraInicio_DL, 108) AS HorarioDisponible FROM  DiasLaborales WHERE     DiaActivo_DL = 1     AND LegajoMedico_DL = '" + objCArgadoTuenos.get_LegajoMedico() + "'  AND ((Dia_DL >= CONVERT(DATE, GETDATE()) and  CONVERT(VARCHAR(5), HoraInicio_DL, 108) >= CONVERT(VARCHAR(5), GETDATE(), 108)) OR Dia_DL >= CONVERT(DATE, GETDATE()))");
            return tabla;
        }

        //consultas para agreggar turno 

        public Boolean existeDniPaciente(Turnos objCargado)
        {

            string consulta = "select * from  Pacientes where Estado_Pa=1 and DniPaciente_Pa= '" + objCargado.getDNIPaciente() + "' ";


            return cn.existe(consulta);
        }


        public int agregarTurnoSQL(ref Turnos objCargadoTunos)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosInsertarTurnos(ref comando, ref objCargadoTunos);
            return cn.EjecutarProcedimientoAlmacenado(comando, "sp_InsertarTurnos");

        }

        public void ArmarParametrosInsertarTurnos(ref SqlCommand comando, ref Turnos objCargadoTunos)
        {

            SqlParameter sqlP = new SqlParameter();
            sqlP = comando.Parameters.Add("@idDiasLaborales", SqlDbType.Int);
            sqlP.Value = objCargadoTunos.get_IdDelHsMedico();

            sqlP = comando.Parameters.Add("@LegajoMedico", SqlDbType.Char);
            sqlP.Value = objCargadoTunos.get_LegajoMedico();



            sqlP = comando.Parameters.Add("@IdEspecialidad", SqlDbType.VarChar);
            sqlP.Value = objCargadoTunos.get_IdEspecialidad();



            sqlP = comando.Parameters.Add("@NombreMedico", SqlDbType.VarChar);
            sqlP.Value = objCargadoTunos.getnombreMedicoe();



            sqlP = comando.Parameters.Add("@DniPaciente", SqlDbType.VarChar);
            sqlP.Value = objCargadoTunos.getDNIPaciente();
            sqlP = comando.Parameters.Add("@FechaTurno", SqlDbType.VarChar);
            sqlP.Value = objCargadoTunos.get_FechaTurno();
            sqlP = comando.Parameters.Add("@Horario", SqlDbType.VarChar);
            sqlP.Value = objCargadoTunos.get_Horario();

        }

        //ESTA ES PÀRTE DE VISTA MEDICO  Y LOS TURNOS me devulve los turno de ese numero de legajo en especial "NO ME TOQUEN LA CONSULTA!!"
        public DataTable GetTableMedicoTurnos(UsuarioLogin obj)
        {
            return cn.ObtenerTabla("Turnos", "select Turnos.IdTurno_Tr as ID , Turnos.IdEspecialidad_Tr as Espacialidad,Pacientes.DniPaciente_Pa as DNI , Pacientes.Nombre_Pa as Nombre, Pacientes.Apellido_Pa as Apellido, Turnos.FechaTurno_Tr as Fecha, Turnos.Horario_Tr as Horario, Turnos.Asistencia_Tr as Asistencia,   Turnos.Observacion_Tr  as Observacion from Turnos  inner join  Usuarios on Usuarios.Legajo_Usu= Turnos.LegajoMedico_Tr inner join Pacientes on Turnos.DniPaciente_Tr= Pacientes.DniPaciente_Pa where  Usuarios.Nombre_Usu='" + obj.getUsuario_Usi() + "' and  Usuarios.Contrasenia_Usu= '" + obj.getContrasenia_Usu() + "' and Turnos.Estado_Tr=1");
        }
        //busca por fecha
        public DataTable GetTableMedicoTurnosFecha(UsuarioLogin obj, string fecha)
        {
            return cn.ObtenerTabla("Turnos", "select Turnos.IdTurno_Tr as ID , Turnos.IdEspecialidad_Tr as Espacialidad,Pacientes.DniPaciente_Pa as DNI , Pacientes.Nombre_Pa as Nombre, Pacientes.Apellido_Pa as Apellido, Turnos.FechaTurno_Tr as Fecha, Turnos.Horario_Tr as Horario, Turnos.Asistencia_Tr as Asistencia,   Turnos.Observacion_Tr  as Observacion from Turnos  inner join  Usuarios on Usuarios.Legajo_Usu= Turnos.LegajoMedico_Tr inner join Pacientes on Turnos.DniPaciente_Tr= Pacientes.DniPaciente_Pa where  Usuarios.Nombre_Usu='" + obj.getUsuario_Usi() + "' and  Usuarios.Contrasenia_Usu= '" + obj.getContrasenia_Usu() + "' and Turnos.FechaTurno_Tr= '"+fecha+ "'and Turnos.Estado_Tr=1");
        }


        //actualizar la asisitencia y onserbacion de un paciente

        public int ActualizarAsistenciYonservacion(Turnos objCargadoTurnos)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosActualizarSQLturnos(ref comando, objCargadoTurnos);
            return cn.EjecutarProcedimientoAlmacenado(comando, "sp_ActualizarTurno");
        }


        private void ArmarParametrosActualizarSQLturnos(ref SqlCommand comando, Turnos objCargadoTurnos)
        {
            SqlParameter sqlParametro = new SqlParameter();
            sqlParametro = comando.Parameters.Add("@IdTurno", SqlDbType.Int);
            sqlParametro.Value = objCargadoTurnos.get_IdDelHsMedico();
            sqlParametro = comando.Parameters.Add("@Asistencia", SqlDbType.Char);
            sqlParametro.Value = objCargadoTurnos.get_Asistencia();
            sqlParametro = comando.Parameters.Add("@Observacion", SqlDbType.Text);
            sqlParametro.Value = objCargadoTurnos.get_Observacion();
        }

        public int bajaLogicaTurno(Turnos turno)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametrosBajaLogicaTurno(ref comando, turno);
            return cn.EjecutarProcedimientoAlmacenado (comando, "sp_bajaLogicaTurno");
        }

        public bool existeElTurno(Turnos turno)
        {
            string consulta = "SELECT * FROM Turnos WHERE Estado_Tr = 1 AND IdTurno_Tr ='" + turno.get_IdDelHsMedico() + "'";
            return cn.existe(consulta);
        }

        public void ArmarParametrosBajaLogicaTurno(ref SqlCommand comando, Turnos turno)
        {
            SqlParameter sqlP = new SqlParameter();

            sqlP = comando.Parameters.Add("@idturno", SqlDbType.Int);

            sqlP.Value = turno.get_IdDelHsMedico();

        }

    }
}
