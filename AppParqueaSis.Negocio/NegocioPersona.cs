using AppParqueaSis.AccesoDatos;
using AppParqueaSis.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppParqueaSis.Negocio
{
    public class NegocioPersona
    {
        public static List<Persona> ObtenerPersonas()
        {
            return DatosPersona.ObtenerPersonas();
        }

        public static Persona ObtenerPersona(int id)
        {
            return DatosPersona.ObtenerPersona(id);
        }

        public static Respuesta InsertarPersona(Persona persona)
        {
            return DatosPersona.InsertarPersona(persona);
        }

        public static Respuesta ActualizarPersona(Persona persona)
        {
            Respuesta respuesta = new Respuesta();
            Persona personaExistente = DatosPersona.ObtenerPersona(persona.Id);
            if (personaExistente != null && personaExistente.Estado)
            {
                respuesta = DatosPersona.ActualizarPersona(persona);
            }
            else
            {
                respuesta.Codigo = 99;
                respuesta.Mensaje = "Persona no existe";
            }
            return respuesta;
        }

        public static Respuesta InactivarPersona(int id)
        {
            Respuesta respuesta = new Respuesta();
            Persona persona = NegocioPersona.ObtenerPersona(id);
            if (persona != null)
            {
                persona.Estado = false;
                respuesta = ActualizarPersona(persona);
            }
            else
            {
                respuesta.Codigo = 99;
                respuesta.Mensaje = "Persona no existe";
            }

            return respuesta;
        }
    }
}
