using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoAPI.Entities;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public interface ICitasModel
    {

        public List<CitaEnt>? ConsultarCitas();


        public List<SelectListItem>? ConsultarTipoCita();


        public long RegistrarCitas(CitaEnt entidad);

        public List<DateTime>? ConsultarFechasReservadas();
    }
}
