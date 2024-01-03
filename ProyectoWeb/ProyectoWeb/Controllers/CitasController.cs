using Microsoft.AspNetCore.Mvc; // Ejemplo de directiva para utilizar características de MVC
using Microsoft.AspNetCore.Hosting; // Ejemplo de directiva para utilizar elementos de hosting en ASP.NET Core
using Microsoft.AspNetCore.SignalR.Protocol;
using ProyectoWeb.Entities;
using ProyectoWeb.Models;
using System.Diagnostics;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc; // Para controladores y características de MVC
using Microsoft.AspNetCore.Hosting; // Para configuración del servidor y hosting en ASP.NET Core
using Microsoft.AspNetCore.Http;

namespace ProyectoWeb.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class CitasController : Controller
    {
        private readonly ICitasModel _citasModel;
        /*private readonly ICarritoModel _carritoModel;*/
        private IHostEnvironment _hostingEnvironment;

        public CitasController(ICitasModel citasModel, /*ICarritoModel carritoModel,*/ IHostEnvironment hostingEnvironment)
        {
            _citasModel = citasModel;
            /*_carritoModel = carritoModel;*/
            _hostingEnvironment = hostingEnvironment;
        }



        [HttpGet]

        public IActionResult ConsultarCitas()
        {
            ViewBag.ConsultarTipoUsuario = _citasModel.ConsultarTipoUsuario();
            ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
            var citas = _citasModel.ConsultarCitas();

            return View(citas);
        }



        [HttpGet]
        [FiltroSeguridad]
        public IActionResult RegistrarCitas()
        {

            ViewBag.ConsultarTipoUsuario = _citasModel.ConsultarTipoUsuario();

            var fechasReservadas = _citasModel.ConsultarFechasReservadas();
            ViewBag.FechasReservadas = fechasReservadas;

            var tiposCita = _citasModel.ConsultarTipoCita();
            ViewBag.ConsultarTipoCita = tiposCita;

            return View();
        }


        //PARA EL AJAX
        [HttpGet]
        public JsonResult ObtenerFechasReservadas()
        {
            var fechasReservadas = _citasModel.ConsultarFechasReservadas(); // Obtener fechas reservadas desde la base de datos
            return Json(fechasReservadas);
        }




        [HttpPost]
        [FiltroSeguridad]
        public IActionResult RegistrarCitas(CitaEnt entidad)
        {


            ViewBag.ConsultarTipoUsuario = _citasModel.ConsultarTipoUsuario();

            ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
            var IdCita = _citasModel.RegistrarCitas(entidad);


            if (IdCita > 0)
            {

                ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
                return RedirectToAction("ConsultarCitas", "Citas");
            }

            ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
            ViewBag.MensajePantalla = "No se pudo registrar la Cita ";
            return View();

        }






        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarEstadoCita(long q)
        {
            var entidad = new CitaEnt();
            entidad.IdCita = q;

            _citasModel.ActualizarEstadoCita(entidad);
            return RedirectToAction("ConsultarCitas", "Citas");
        }



        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarCita(long id)
        {
            var fechasReservadas = _citasModel.ConsultarFechasReservadas();
            ViewBag.FechasReservadas = fechasReservadas;

            var tiposCita = _citasModel.ConsultarTipoCita();
            ViewBag.ConsultarTipoCita = tiposCita;

            var datos = _citasModel.ConsultarCitaPorId(id);


            return View(datos);
        }



        [HttpPost]
        [FiltroSeguridad]
        public IActionResult ActualizarCita(CitaEnt entidad)
        {


            ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
            var IdCita = _citasModel.ActualizarCita(entidad);




            if (IdCita > 0)
            {

                ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
                return RedirectToAction("ConsultarCitas", "Citas");
            }

            ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
            ViewBag.MensajePantalla = "No se pudo Actualizar la Cita ";
            return View();

        }


        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ReservarCitasCliente()
        {
            // Recuperar el IdUsuario de la sesión
            string idUsuario = HttpContext.Session.GetString("IdUsuario");

            // Verificar si el IdUsuario está disponible en la sesión
            if (!string.IsNullOrEmpty(idUsuario))
            {
                // Aquí puedes utilizar el IdUsuario en tu lógica de negocio, por ejemplo, pasarlo a la vista
                // para usarlo en el formulario de reserva de citas o realizar otras operaciones según sea necesario

                // Ejemplo: Pasar el IdUsuario a la vista usando ViewBag
                ViewBag.IdUsuario = idUsuario;

                // También puedes realizar otras operaciones con el IdUsuario aquí

                var fechasReservadas = _citasModel.ConsultarFechasReservadas();
                ViewBag.FechasReservadas = fechasReservadas;

                var tiposCita = _citasModel.ConsultarTipoCita();
                ViewBag.ConsultarTipoCita = tiposCita;

                return View();
            }
            else
            {
                // Si el IdUsuario no está en la sesión, puedes redirigir a una página de error o a otra acción según tu lógica
                return RedirectToAction("Error", "Home"); // Por ejemplo, redirigir a una acción de error en el controlador Home
            }
        }

    }
}







