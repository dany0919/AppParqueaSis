using AppParqueaSis.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppParqueaSis.AccesoDatos
{
    public class DatosPersona : BaseDatos
    {
        public static List<Persona> ObtenerPersonas()
        {
            List<Persona> personas = new List<Persona>();
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter() { ParameterName = "ACCION", Value = "TODOS", Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "@ID_PERSONA", Value = 0, Direction = ParameterDirection.Input },
            };

            DataSet resultado = EjecutarConsulta("PRO_CONSULTA_PERSONA", sqlParameters);

            if(resultado != null && resultado.Tables.Count > 0)
            {
                foreach(DataRow fila in resultado.Tables[0].Rows)
                {
                    Persona persona = new Persona();
                    persona.Id = int.Parse(fila[0].ToString());
                    persona.Identificacion = fila[1].ToString();
                    persona.Nombres = fila[2].ToString();
                    persona.Estado = bool.Parse(fila[3].ToString());
                    personas.Add(persona);
                }
            }

            return personas;
        }

        public static Persona ObtenerPersona(int id)
        {
            Persona persona = null;
            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter() { ParameterName = "ACCION", Value = "UNICO", Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "@ID_PERSONA", Value = id, Direction = ParameterDirection.Input },
            };

            DataSet resultado = EjecutarConsulta("PRO_CONSULTA_PERSONA", sqlParameters);

            if (resultado != null && resultado.Tables.Count > 0)
            {
                foreach (DataRow fila in resultado.Tables[0].Rows)
                {
                    persona = new Persona();
                    persona.Id = int.Parse(fila[0].ToString());
                    persona.Identificacion = fila[1].ToString();
                    persona.Nombres = fila[2].ToString();
                    persona.Estado = bool.Parse(fila[3].ToString());
                }
            }

            return persona;
        }

        public static Respuesta InsertarPersona(Persona persona)
        {
            Respuesta respuesta = new Respuesta();

            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter() { ParameterName = "IDENTIFICACION", Value = persona.Identificacion, Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "NOMBRES", Value = persona.Nombres, Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "CODIGO_ERROR", Value = persona.Nombres, Direction = ParameterDirection.Output },
                new SqlParameter() { ParameterName = "DESCRIPCION_ERROR", Value = persona.Nombres, Direction = ParameterDirection.Output, Size = 50 }
            };

            int resultado = EjecutarNoQuery("PRO_INSERTA_PERSONA", sqlParameters);
            if (resultado == 1)
            {
                respuesta.Codigo = int.Parse(sqlParameters.ToList().Find(x => x.ParameterName == "CODIGO_ERROR").Value.ToString());
                respuesta.Mensaje = sqlParameters.ToList().Find(x => x.ParameterName == "DESCRIPCION_ERROR").Value.ToString();
            }
            else
            {
                respuesta.Codigo = -1;
                respuesta.Mensaje = "ERROR AL EJECUTAR SQL";
            }

            return respuesta;
        }

        public static Respuesta ActualizarPersona(Persona persona)
        {
            Respuesta respuesta = new Respuesta();

            SqlParameter[] sqlParameters = new SqlParameter[]
            {
                new SqlParameter() { ParameterName = "ID_PERSONA", Value = persona.Id, Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "IDENTIFICACION", Value = persona.Identificacion, Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "NOMBRES", Value = persona.Nombres, Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "ESTADO", Value = persona.Estado, Direction = ParameterDirection.Input },
                new SqlParameter() { ParameterName = "CODIGO_ERROR", Value = persona.Nombres, Direction = ParameterDirection.Output },
                new SqlParameter() { ParameterName = "DESCRIPCION_ERROR", Value = persona.Nombres, Direction = ParameterDirection.Output, Size = 50 }
            };

            int resultado = EjecutarNoQuery("PRO_ACTUALIZA_PERSONA", sqlParameters);
            if (resultado == 1)
            {
                respuesta.Codigo = int.Parse(sqlParameters.ToList().Find(x => x.ParameterName == "CODIGO_ERROR").Value.ToString());
                respuesta.Mensaje = sqlParameters.ToList().Find(x => x.ParameterName == "DESCRIPCION_ERROR").Value.ToString();
            }
            else
            {
                respuesta.Codigo = -1;
                respuesta.Mensaje = "ERROR AL EJECUTAR SQL";
            }

            return respuesta;
        }
    }
}
