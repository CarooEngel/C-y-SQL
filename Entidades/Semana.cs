using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Semana
    {
        int IdSemana_Sem;
        string Descripcion_Sem;

        public Semana() { }

        public int get_Semana()
        {
            return IdSemana_Sem;
        }

        public void set_Semana(int id)
        {
            this.IdSemana_Sem = id;
        }

        public string get_DescripcionSem()
        {
            return Descripcion_Sem;
        }
        public void set_DescripcionSem(string descripcion)
        {
            this.Descripcion_Sem = descripcion;
        }
    }
}
