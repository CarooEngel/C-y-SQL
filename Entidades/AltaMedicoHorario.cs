using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class AltaMedicoHorario
    {
        string IdDiaLaboral_DL;
        string LegajoMedico_DL;
        int IDmes_DL;
        string Semana_DL;
        DateTime Dia_DL;
        TimeSpan hora_inicio_DL;
        TimeSpan hora_fin_DL;
        bool diaAtivo_DL;

        public AltaMedicoHorario()
        {
            //constructor 
        }

        //set y get 
        public string getIdDiaLaboral_DL() { return IdDiaLaboral_DL; }
        public void setIdDiaLaboral_DL(string IdDiaLaboral_DL)
        {
            this.IdDiaLaboral_DL = IdDiaLaboral_DL;
        }
        public string getLegajoMedico_DL() { return LegajoMedico_DL; }
        public void setLegajoMedico_DL(string LegajoMedico_DL)
        {
            this.LegajoMedico_DL = LegajoMedico_DL;
        }
        public DateTime getfecha_DL() { return Dia_DL; }
        public void setfecha_DL(DateTime fecha_DL)
        {
            this.Dia_DL = fecha_DL;
        }
        public TimeSpan gethora_inicio_DL() { return hora_inicio_DL; }
        public void sethorainicio_DL(TimeSpan hora_inicio_DL)
        {
            this.hora_inicio_DL = hora_inicio_DL;
        }
        public TimeSpan gethora_fin_DL() { return hora_fin_DL; }
        public void sethorafin_DL(TimeSpan hora_fin_DL)
        {
            this.hora_fin_DL = hora_fin_DL;
        }
        public bool getdiaAtivo_DL() { return diaAtivo_DL; }
        public void setdiaAtivo_DL(bool diaAtivo_DL)
        {
            this.diaAtivo_DL = diaAtivo_DL;
        }

        //agregege etsos 
        public int getIDmes_DL()
        {
            return IDmes_DL;
        }
        public void setIDmes_DL(int IDmes_DL)
        {
            this.IDmes_DL = IDmes_DL;
        }

        public string getDiaSemana_DL()
        {
            return Semana_DL;
        }
        public void setDiaSemana_DL(string DiaSemana_DL)
        {
            this.Semana_DL = DiaSemana_DL;
        }
    }
}
