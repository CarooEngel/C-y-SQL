using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medicos
    {
        private string Legajo_Me;
        string IdEspecialidad_Me;
        string IdLocalidad_Me;
        string IdProvincia_Me;
        string Dni_Me;
        string Nombre_Me;
        string Apellido_Me;
        int Sexo_Me;
        string Sexo_Med;
        string Nacionalidad_Me;
        string FechaNacimiento_Me;
        string Direccion_Me;
        string CorreoElectronico_Me;
        string Telefono_Me;
        string Dia_Me;
        string Horario_Me;
        string Usuario_Me;
        string Contrasenia_Me;
        public Medicos() { }

        public void setLegajoMedico(string legajo_me) { this.Legajo_Me = legajo_me; }
        public string getLegajoMedico() { return Legajo_Me; }
        public void setEspecialidad(string esp) { this.IdEspecialidad_Me = esp; }
        public string getEspecialidad() { return IdEspecialidad_Me; }
        public void setProvincia(string prov) { this.IdProvincia_Me = prov; }
        public string getProvincia() { return IdProvincia_Me; }
        public void setLocalidad(string loc) { this.IdLocalidad_Me = loc; }
        public string getLocalidad() { return IdLocalidad_Me; }
        public void setDNIMedico(string dni) { this.Dni_Me = dni; }
        public string getDNIMedico() { return Dni_Me; }
        public void setNombreMedico(string nom) { this.Nombre_Me = nom; }
        public string getNombreMedico() { return Nombre_Me; }
        public void setApellidoMedico(string ape) { this.Apellido_Me = ape; }
        public string getApellidoMedico() { return Apellido_Me; }
        public void setSexoMedico(int sexo) { this.Sexo_Me = sexo; }
        public int getSexoMedico() { return Sexo_Me; }
        //
        public void setSexoMedicos(string sexo_) { this.Sexo_Med = sexo_; }
        public string getSexoMedicos() { return Sexo_Med; }
        //
        public void setNacionalidadMedico(string nac) { this.Nacionalidad_Me = nac; }
        public string getNacionalidadMedico() { return Nacionalidad_Me; }
        public void setFechaNacimiento(string fnac) { this.FechaNacimiento_Me = fnac; }
        public string getFechaNacimiento() { return FechaNacimiento_Me; }
        public void setDireccion(string dir) { this.Direccion_Me = dir; }
        public string getDireccion() { return Direccion_Me; }
        public void setCorreo(string co) { this.CorreoElectronico_Me = co; }
        public string getCorreo() { return CorreoElectronico_Me; }
        public void setTelefonoMedico(string tel) { this.Telefono_Me = tel; }
        public string getTelefonoMedico() { return Telefono_Me; }
    }
}
