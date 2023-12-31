using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ProyectoAPI.Entities
{
    public class CitaEnt
    {
        public long IdCita { get; set; }

        public DateTime FechaHora { get; set; }

        public long TipoCita { get; set; }

        public long IdUsuario { get; set; }

        public bool estado { get; set; }

    }
}
