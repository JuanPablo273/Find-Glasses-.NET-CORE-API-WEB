﻿using Microsoft.AspNetCore.Http;
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



        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarDescuento(long id)
        {
            // Obtener el producto por id 
            var descuento = _registroModel.ConsultarDescuentoPorId(id);



            if (descuento != null)
            {
                return View(descuento);
            }
            else
            {
                return NotFound();
            }
        }




        [HttpPost]
        [FiltroSeguridad]
        public IActionResult ActualizarDescuento(DescuentosEnt entidad)
        {
            var resp = _registroModel.ActualizarDescuento(entidad);

            if (resp == 1)
            {
                return RedirectToAction("ConsultarDescuentos", "Registro");
            }
            else
            {
                ViewBag.MensajePantalla = "No se pudo actualizar el Descuento";
                return View();
            }
        }


        [HttpGet]
        [FiltroSeguridad]
        public IActionResult RegistrarDescuento()
        {

            return View();


        }


        [HttpPost]
        [FiltroSeguridad]
        public IActionResult RegistrarDescuento(DescuentosEnt entidad)
        {




            var IdDescuento = _registroModel.RegistrarDescuento(entidad);


            if (IdDescuento > 0)
            {


                return RedirectToAction("ConsultarDescuentos", "Registro");
            }

            ViewBag.MensajePantalla = "No se pudo registrar el Descuento";
            return View();

        }



        //DESCUENTO EN LA VISTA PAGAR



        [HttpPost]
        public IActionResult VerificarDescuento(string codigoDescuento)
        {
            try
            {
                // Llama al método en tu modelo para verificar el descuento utilizando el servicio API
                decimal porcentajeDescuento = _registroModel.VerificarDescuento(codigoDescuento);

                if (porcentajeDescuento > 0)
                {
                    // Si el porcentaje es mayor que cero, consideramos que el descuento es válido
                    return Json(new { valido = true, porcentajeDescuento = porcentajeDescuento });
                }
                else
                {
                    // Si el porcentaje es cero o negativo, se considera que el descuento no es válido
                    return Json(new { valido = false });
                }
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción que pueda ocurrir durante la verificación del descuento
                return BadRequest("Error al verificar el código de descuento: " + ex.Message);
            }
        }



    }
}






