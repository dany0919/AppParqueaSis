using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppParqueaSis.Entidades
{
    public class Persona
    {
        public int Id { get; set; }

        public string Identificacion { get; set; }

        public string Nombres { get; set; }
        
        public bool Estado { get; set; }
    }
}
