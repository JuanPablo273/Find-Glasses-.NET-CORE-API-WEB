using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using ProyectoWeb.Entities;
using ProyectoWeb.Models;
using System.Diagnostics;
using System.Text.Json;

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

            ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
            var citas = _citasModel.ConsultarCitas();

            return View(citas);
        }







        [HttpGet]
        [FiltroSeguridad]
        public IActionResult RegistrarCitas()
        {
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


        //[HttpGet]
        //[FiltroSeguridad]
        //public IActionResult RegistrarCitas()
        //{
        //    var fechasReservadas = _citasModel.ConsultarFechasReservadas();

        //    ViewBag.FechasReservadas = fechasReservadas;

        //    ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();


        //    return View();
        //}



        //[HttpGet]
        //[FiltroSeguridad]
        //public IActionResult RegistrarCitas()
        //{
        //    var fechasReservadas = _citasModel.ConsultarFechasReservadas();
        //    ViewBag.FechasReservadas = JsonSerializer.Serialize(fechasReservadas);

        //    var tiposCita = _citasModel.ConsultarTipoCita();
        //    ViewBag.ConsultarTipoCita = tiposCita;

        //    return View();
        //}



        //FUNCIONAL

        //[HttpGet]
        //[FiltroSeguridad]
        //public IActionResult RegistrarCitas()
        //{

        //    //PARA PODER TRAER LA INFO DE LAS CITAS RESERVADAS Y DE ESTA MANERA QUITAR LAS QUE YA ESTAN RESERVADAS
        //    ViewBag.FechasReservadas = _citasModel.ConsultarFechasReservadas();


        //    ViewBag.ConsultarTipoCita = _citasModel.ConsultarTipoCita();
        //    return View();


        //}

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult RegistrarCitas(CitaEnt entidad)
        {


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

    }


    }

