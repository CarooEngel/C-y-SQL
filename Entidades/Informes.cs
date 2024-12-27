using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Informes
    {
        private string fechaInicio;
        private string fechaFinal;

        public Informes() { }
        public void setFechaInicio(string fInicio) { this.fechaInicio = fInicio; }
        public string getFechaInicio() { return fechaInicio; }
        public void setFechaFinal (string fFinal) { this.fechaFinal = fFinal; }
        public string getFechaFinal() { return fechaFinal; }
    }
}
