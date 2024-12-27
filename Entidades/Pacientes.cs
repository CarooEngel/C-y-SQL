using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pacientes
    {
        private String Dni;
        private String nombre;
        private String apellido;
        private String sexo;
        private int edad;
        private String idLocalidad;
        private String idProvincia;
        private String nacionalidad;
        private DateTime fechaNacimiento;
        private String direccion;
        private String correo;
        private String telefono;
        private bool asistencia;
        private String observacion;
        private bool estado;
        public Pacientes() { }
        public string GetDni()
        {
            return Dni;
        }

        public void setDni(string _dni)
        {
            Dni = _dni;
        }

        public string getNombre()
        {
            return nombre;
        }

        public void setNombre(string _nombre)
        {
            nombre = _nombre;
        }

        public string getApellido()
        {
            return apellido;
        }

        public void setApellido(string _apellido)
        {
            apellido = _apellido;
        }

        public string getSexo()
        {
            return sexo;
        }

        public void setSexo(string _sexo)
        {
            sexo = _sexo;
        }

        public int getEdad()
        {
            return edad;
        }

        public void setEdad(int _edad)
        {
            edad = _edad;
        }

        public string getIdLocalidad()
        {
            return idLocalidad;
        }

        public void setIdLocalidad(string _idLocalidad)
        {
            idLocalidad = _idLocalidad;
        }

        public string getIdProvincia()
        {
            return idProvincia;
        }

        public void setIdProvincia(string _idProvincia)
        {
            idProvincia = _idProvincia;
        }

        public string getNacionalidad()
        {
            return nacionalidad;
        }

        public void setNacionalidad(string _nacionalidad)
        {
            nacionalidad = _nacionalidad;
        }

        public DateTime getFechaNacimiento()
        {
            return fechaNacimiento;
        }

        public void setFechaNacimiento(DateTime _fechaNacimiento)
        {
            fechaNacimiento = _fechaNacimiento;
        }

        public string getDireccion()
        {
            return direccion;
        }

        public void setDireccion(string _direccion)
        {
            direccion = _direccion;
        }

        public string getCorreo()
        {
            return correo;
        }

        public void setCorreo(string _correo)
        {
            correo = _correo;
        }

        public string getTelefono()
        {
            return telefono;
        }

        public void setTelefono(string _telefono)
        {
            telefono = _telefono;
        }

        public bool getAsistencia()
        {
            return asistencia;
        }

        public void setAsistencia(bool _asistencia)
        {
            asistencia = _asistencia;
        }

        public string getObservacion()
        {
            return observacion;
        }

        public void setObservacion(string _observacion)
        {
            observacion = _observacion;
        }

        public bool getEstado()
        {
            return estado;
        }

        public void setEstado(bool _estado)
        {
            estado = _estado;
        }

}
}
