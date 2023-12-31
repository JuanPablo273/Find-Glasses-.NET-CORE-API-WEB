using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace ProyectoAPI.Entities
{
    public class TipoCitasEnt
    {
        public long IdTipoCita { get; set; }

        public string Nombre { get; set; } = string.Empty;

        public string Descripcion { get; set; } = string.Empty;

   
    }
}
