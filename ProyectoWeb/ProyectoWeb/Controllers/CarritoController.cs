using Microsoft.AspNetCore.Mvc;
using ProyectoWeb.Entities;
using ProyectoWeb.Models;

namespace ProyectoWeb.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class CarritoController : Controller
    {
        private readonly ICarritoModel _carritoModel;
        private readonly IUsuarioModel _usuarioModel;
        private readonly IRegistroModel _registroModel;

        public CarritoController(ICarritoModel carritoModel, IUsuarioModel usuarioModel, IRegistroModel registroModel)
        {
            _carritoModel = carritoModel;
            _usuarioModel = usuarioModel;
            _registroModel = registroModel;
        }

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult RegistrarCarrito(long IdProducto, int cantidadComprar)
        {
            var entidad = new CarritoEnt();
            entidad.Cantidad = cantidadComprar;
            entidad.IdProducto = IdProducto;

            _carritoModel.RegistrarCarrito(entidad);

            var datos = _carritoModel.ConsultarCarrito();
            HttpContext.Session.SetString("Total", datos.Sum(x => x.Total).ToString());
            HttpContext.Session.SetString("Cantidad", datos.Sum(x => x.Cantidad).ToString());

            return Json("OK");
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ConsultarCarrito()
        {


            var datos = _carritoModel.ConsultarCarrito();
            return View(datos);
        }






        [HttpGet]
        [FiltroSeguridad]
        public IActionResult Pagar()
        {
            var usuario = _usuarioModel.ConsultarUsuario(0); // Suponiendo que ConsultarUsuario devuelve un UsuarioEnt
            var carritoItems = _carritoModel.ConsultarCarrito(); // Suponiendo que ConsultarCarrito devuelve una lista de CarritoEnt


            var viewModel = new CombinacionEnt
            {
                Usuario = usuario,
                CarritoItems = carritoItems
            };

            ViewBag.Provincias = _usuarioModel.ConsultarProvincias();

            return View(viewModel); // Pasar el ViewModel a la vista
        }







        [HttpPost]
		[FiltroSeguridad]
		public IActionResult PagarCarrito()
		{
			var respuesta = _carritoModel.PagarCarrito();
			var datos = _carritoModel.ConsultarCarrito();

			HttpContext.Session.SetString("Total", datos.Sum(x => x.Total).ToString());
			HttpContext.Session.SetString("Cantidad", datos.Sum(x => x.Cantidad).ToString());

			if (respuesta.Contains("verifique"))
			{
				ViewBag.MensajePantalla = respuesta;
				return View("ConsultarCarrito", datos);
			}
			else
			{
				// Obtener IdUsuario almacenado en la sesión
				if (HttpContext.Session.TryGetValue("IdUsuario", out byte[] idUsuarioBytes) && idUsuarioBytes != null)
				{
					string idUsuario = System.Text.Encoding.UTF8.GetString(idUsuarioBytes);

					if (!string.IsNullOrEmpty(idUsuario) && long.TryParse(idUsuario, out long idUsuarioParsed))
					{
						return RedirectToAction("Factura", "Carrito", new { q = idUsuarioParsed });
					}
					else
					{
						return View("Error");
					}
				}
				else
				{
					return View("Error");
				}
			}
		}






		[HttpGet]
		[FiltroSeguridad]
		public IActionResult Factura(long q)
		{


			var datos = _carritoModel.ConsultarUltimaFacturaYDetalles(q);


            // Obtener el IdUsuario desde la sesión
            var idUsuario = HttpContext.Session.GetString("IdUsuario");

            // Asignar el valor a ViewBag para accederlo en la vista
            ViewBag.IdUsuario = idUsuario;


            return View(datos);
		}






		//SIRVE PERFECTO

		//[HttpPost]
		//[FiltroSeguridad]
		//public IActionResult PagarCarrito()
		//{
		//	var respuesta = _carritoModel.PagarCarrito();
		//	var datos = _carritoModel.ConsultarCarrito();

		//	HttpContext.Session.SetString("Total", datos.Sum(x => x.Total).ToString());
		//	HttpContext.Session.SetString("Cantidad", datos.Sum(x => x.Cantidad).ToString());

		//	if (respuesta.Contains("verifique"))
		//	{
		//		ViewBag.MensajePantalla = respuesta;
		//		return View("ConsultarCarrito", datos);
		//	}
		//	else
		//	{
		//		return RedirectToAction("Index", "Login");
		//	}
		//}








		[HttpGet]
        [FiltroSeguridad]
        public IActionResult EliminarProductoCarrito(long q)
        {
            _carritoModel.EliminarProductoCarrito(q);

            var datos = _carritoModel.ConsultarCarrito();
            HttpContext.Session.SetString("Total", datos.Sum(x => x.Total).ToString());
            HttpContext.Session.SetString("Cantidad", datos.Sum(x => x.Cantidad).ToString());

            return RedirectToAction("Pagar", "Carrito");
        }



        //METODO QUE FUNCIONA ANTES DE TOCARLO 

        //[HttpGet]
        //[FiltroSeguridad]
        //public IActionResult ConsultarFacturas()
        //{
        //    var datos = _carritoModel.ConsultarFacturas();
        //    return View(datos);
        //}



        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ConsultarFacturas()
        {
            var datos = _carritoModel.ConsultarFacturas();

            // Obtener el IdUsuario desde la sesión
            var idUsuario = HttpContext.Session.GetString("IdUsuario");

            // Asignar el valor a ViewBag para accederlo en la vista
            ViewBag.IdUsuario = idUsuario;

            return View(datos);
        }





        //[HttpGet]
        //[FiltroSeguridad]
        //public IActionResult ConsultarDetalleFactura(long q)
        //{
        //    var datos = _carritoModel.ConsultarUltimaFacturaYDetalles(q);
        //    return View(datos);
        //}


        //METODO DE ENVIAR CORREO




        [HttpPost]
        [FiltroSeguridad]
        public IActionResult EnviarCorreoFactura(long IdUsuario )
        {
            var idUsuario = HttpContext.Session.GetString("IdUsuario");

            if (string.IsNullOrEmpty(idUsuario))
            {
                // Manejo de error si el IdUsuario no está en la sesión
                return BadRequest("Id de usuario no encontrado en la sesión");
            }

            try
            {
                // Llama al método del modelo para enviar el correo de la factura
                var respuesta = _carritoModel.EnviarCorreoFactura(long.Parse(idUsuario));

                // Devuelve una respuesta de éxito
                return Ok("Correo enviado correctamente");
            }
            catch (Exception ex)
            {
                // Manejo del error si ocurre alguna excepción
                return BadRequest("Error al enviar el correo electrónico: " + ex.Message);
            }
        }












        //[HttpPost]
        //[FiltroSeguridad]
        //public IActionResult EnviarCorreoFactura(long idUsuario)
        //{

        //    HttpContext.Session.SetString("IdUsuario", resp.IdUsuario.ToString());

        //    try
        //    {
        //        // Llama al método del modelo para enviar el correo de la factura
        //        var respuesta = _carritoModel.EnviarCorreoFactura(idUsuario);

        //        // Aquí podrías devolver algo más específico en la respuesta según la lógica de tu aplicación
        //        return Ok("Correo enviado correctamente");
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest("Error al enviar el correo electrónico: " + ex.Message);
        //    }
        //}
    }


}




