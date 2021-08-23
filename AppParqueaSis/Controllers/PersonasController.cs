using AppParqueaSis.Entidades;
using AppParqueaSis.Negocio;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Net.Http;

namespace AppParqueaSis.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonasController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetPersonas()
        {
            return Ok(NegocioPersona.ObtenerPersonas());
        }

        [HttpGet("{id}")]
        public IActionResult GetPersona(int id)
        {
            Persona persona = NegocioPersona.ObtenerPersona(id);
            if (persona != null)
            {
                return Ok(persona);
            }
            else
            {
                return NotFound();
            }
            
        }

        [HttpPost]
        public IActionResult PostPersona(Persona persona)
        {
            Respuesta respuesta = NegocioPersona.InsertarPersona(persona);
            if(respuesta.Codigo == 0)
            {
                return Ok();
            }
            else
            {
                return Conflict();
            }
        }

        [HttpPut]
        public IActionResult PutPersona(Persona persona)
        {
            Respuesta respuesta = NegocioPersona.ActualizarPersona(persona);
            if (respuesta.Codigo == 0)
            {
                return Ok();
            }else if(respuesta.Codigo == 99)
            {
                return NotFound();
            }
            else
            {
                return Conflict();
            }
        }

        [HttpDelete("{id}")]
        public IActionResult DeletePersona(int id)
        {
            Respuesta respuesta = NegocioPersona.InactivarPersona(id);
            if (respuesta.Codigo == 0)
            {
                return Ok();
            }
            else if (respuesta.Codigo == 99)
            {
                return NotFound();
            }
            else
            {
                return Conflict();
            }
        }
    }
}
