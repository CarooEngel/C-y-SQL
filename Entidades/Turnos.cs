using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turnos
    {
        int IdPerodeLaTablaHsMedicos;
        string LegajoMedico_Tr;
        string IdEspecialidad_Tr;
        string nombreMedico;
        public string DniPaciente_Tr;
        string FechaTurno_Tr;
        string Horario_Tr;
     
        string Asistencia_Tr;
        string Observacion_Tr;
        bool Estado_Tr;

        public Turnos() { }

        public void setDNIPaciente(string dniPaciente) { this.DniPaciente_Tr = dniPaciente; }
        public string getDNIPaciente() { return DniPaciente_Tr; }


        //agregue set  y get 
        public string get_LegajoMedico()
        {
            return LegajoMedico_Tr;
        }

        public void set_LegajoMedico(string legajo)
        {
            this.LegajoMedico_Tr = legajo;
        }

        public void setnombreMedico(string n) { this.nombreMedico = n; }
        public string getnombreMedicoe() { return nombreMedico; }

        public int get_IdDelHsMedico()
        {
            return IdPerodeLaTablaHsMedicos;
        }

        public void set_IdDelHsMedico(int idTurno)
        {
            this.IdPerodeLaTablaHsMedicos = idTurno;
        }

      

        public string get_IdEspecialidad()
        {
            return IdEspecialidad_Tr;
        }

        public void set_IdEspecialidad(string idEspecialidad)
        {
            this.IdEspecialidad_Tr = idEspecialidad;
        }

       

        public string get_FechaTurno()
        {
            return FechaTurno_Tr;
        }

        public void set_FechaTurno(string fechaTurno)
        {
            this.FechaTurno_Tr = fechaTurno;
        }

        public string get_Horario()
        {
            return Horario_Tr;
        }

        public void set_Horario(string horario)
        {
            this.Horario_Tr = horario;
        }

        public string get_Asistencia()
        {
            return Asistencia_Tr.ToString();
        }

        public void set_Asistencia(string asistencia)
        {
            this.Asistencia_Tr = asistencia;
        }

        public string get_Observacion()
        {
            return Observacion_Tr;
        }

        public void set_Observacion(string observacion)
        {
            this.Observacion_Tr = observacion;
        }

        public bool get_Estado()
        {
            return Estado_Tr;
        }

        public void set_Estado(bool estado)
        {
            this.Estado_Tr = estado;
        }

    }
}
