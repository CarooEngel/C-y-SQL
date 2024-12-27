using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Mes
    {
        int IdMes_Mes;
        string DescripcionMes_Mes;
        int cantidadDias_Mes;

        public Mes() { }

        public int get_IdMes_Mes()
        {
            return IdMes_Mes;
        }
        public void set_IdMes_Mes(int id)
        {
            this.IdMes_Mes = id;
        }
        public string get_DescripcionMes_Mes()
        {
            return DescripcionMes_Mes;
        }
        public void set_DescripcionMes_Mes(string descripcion)
        {
            this.DescripcionMes_Mes = descripcion;
        }
        public int get_CantidadDias_Mes()
        {
            return cantidadDias_Mes;
        }
        public void set_CantidadDias_Mes(int cantidad)
        {
            this.cantidadDias_Mes = cantidad;
        }
    }
}
