using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppParqueaSis.Entidades
{
    public class Contrato
    {
        public int Id { get; set; }

        public Persona Propietario { get; set; }

        public Parqueadero Lugar { get; set; }

        public string Estado { get; set; }

        public DateTime FechaInicioContrato { get; set; }

        public DateTime FechaFinContrato { get; set; }
    }
}
