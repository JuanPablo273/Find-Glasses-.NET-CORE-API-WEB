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

        public int ActualizarEstadoCita(CitaEnt entidad);


        public int ActualizarCita(CitaEnt entidad);


        public CitaEnt ConsultarCitaPorId(long id);


        public List<SelectListItem>? ConsultarTipoUsuario();
    }

}
