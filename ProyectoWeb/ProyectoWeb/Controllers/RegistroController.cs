using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoWeb.Entities;
using ProyectoWeb.Models;
using System.Diagnostics;

namespace ProyectoWeb.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class RegistroController : Controller
    {
        private readonly IUsuarioModel _usuarioModel;
        private readonly IProductosModel _productoModel;
        private readonly ICarritoModel _carritoModel;
        private readonly IRegistroModel _registroModel;

        public RegistroController(IUsuarioModel usuarioModel, IProductosModel productoModel, ICarritoModel carritoModel, IRegistroModel registroModel)
        {
            _usuarioModel = usuarioModel;
            _productoModel = productoModel;
            _carritoModel = carritoModel;
            _registroModel = registroModel;
        }



        //SIRVE ANTES DEL FILTRO

        //[HttpGet]
        //public IActionResult ProductosMasVendidosLista()
        //{


        //    var datos = _registroModel.ProductosMasVendidosLista();

        //    return View("ProductosMasVendidos", datos);

        //}



        [HttpGet]
        public IActionResult ProductosMasVendidosLista(string ordenamiento = "mayorAMenorVecesComprado")
        {
            try
            {
                // Aquí, asumiendo que _registroModel es una instancia de tu modelo.
                var datos = _registroModel.ProductosMasVendidosLista(ordenamiento);

                return View("ProductosMasVendidos", datos);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
       public IActionResult ConsultarDescuentos()
        {


            var descuentos = _registroModel.ConsultarDescuentos();

            return View(descuentos);
        
        }



        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarEstadoDescuento(long q)
        {
            var entidad = new DescuentosEnt();
            entidad.IdDescuento = q;

            _registroModel.ActualizarEstadoDescuento(entidad);
            return RedirectToAction("ConsultarDescuentos", "Registro");
        }




    }
}