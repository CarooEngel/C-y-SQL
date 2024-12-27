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
    public class DAOaltaMedicoHorario
    {
        Conexion cn = new Conexion();

        public bool GetValidarLegajo(string legajo)
        {
            return cn.existe("SELECT * FROM Medicos WHERE Estado_Me=1 AND Legajo_Me ='" + legajo + "'");
        }

        public int agregarHoraioMedicoSQL(ref AltaMedicoHorario objAltaMeHS)
        {

       

            SqlCommand comando = new SqlCommand();
            ArmarParametrosInsertarHs(ref comando, objAltaMeHS);
            return cn.EjecutarProcedimientoAlmacenado(comando, "sp_InsertarDiasLaborales");
          

        }

        public void ArmarParametrosInsertarHs(ref SqlCommand comando, AltaMedicoHorario objAltaMeHS)
        {
           
            SqlParameter sqlP = new SqlParameter();
            sqlP = comando.Parameters.Add("@LegajoMedico", SqlDbType.Char);
            sqlP.Value = objAltaMeHS.getLegajoMedico_DL();

            sqlP = comando.Parameters.Add("@Semana", SqlDbType.Char);
            sqlP.Value = objAltaMeHS.getDiaSemana_DL();



            sqlP = comando.Parameters.Add("@Mes", SqlDbType.Int);
            sqlP.Value = objAltaMeHS.getIDmes_DL();



            sqlP = comando.Parameters.Add("@HoraInicio", SqlDbType.Time);
            sqlP.Value = objAltaMeHS.gethora_inicio_DL();



            sqlP = comando.Parameters.Add("@HoraFin", SqlDbType.Time);
            sqlP.Value = objAltaMeHS.gethora_fin_DL();
            





        }




        public Boolean existeLegajoMedico(AltaMedicoHorario objCargadoHs)
        {

            string consulta = "Select * from Medicos where Estado_Me = 1 AND Legajo_Me ='" + objCargadoHs.getLegajoMedico_DL() + "'";


            return cn.existe(consulta);
        }

        public Boolean existeMesYsemana(AltaMedicoHorario objExyeValorYAexiste)
        {

            string consulta = "SELECT * FROM DiasLaborales WHERE DiaActivo_DL = 1 and LegajoMedico_DL = '"+objExyeValorYAexiste.getLegajoMedico_DL()+"' AND IdMes_DL = "+objExyeValorYAexiste.getIDmes_DL()+" AND Seman_DL = '"+objExyeValorYAexiste.getDiaSemana_DL()+"'";


            return cn.existe(consulta);
        }


         public DataTable getTablaHoraiosMedicos(AltaMedicoHorario objAltahsMostrar)
        {
            DataTable tabla = cn.ObtenerTabla ("DiasLaborales", " select  IdDiaLaborable_DL AS ID,  LegajoMedico_DL AS Legajo,  CONVERT(VARCHAR(10), Dia_DL, 23)  AS Fecha,    CONVERT(VARCHAR(5), HoraInicio_DL, 108) AS HorarioDisponible FROM  DiasLaborales WHERE     DiaActivo_DL = 1     AND LegajoMedico_DL = '" + objAltahsMostrar.getLegajoMedico_DL() + "'  AND ((Dia_DL >= CONVERT(DATE, GETDATE()) and  CONVERT(VARCHAR(5), HoraInicio_DL, 108) >= CONVERT(VARCHAR(5), GETDATE(), 108)) OR Dia_DL >= CONVERT(DATE, GETDATE()))");
            return tabla;
        }



        
    }


}





