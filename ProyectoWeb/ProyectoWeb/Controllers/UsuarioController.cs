using Microsoft.AspNetCore.Mvc;
using ProyectoWeb.Entities;
using ProyectoWeb.Models;

namespace ProyectoWeb.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class UsuarioController : Controller
    {
        private readonly IUsuarioModel _usuarioModel;

        public UsuarioController(IUsuarioModel usuarioModel)
        {
            _usuarioModel = usuarioModel;
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult PerfilUsuario()
        {
            var datos = _usuarioModel.ConsultarUsuario(0);
            ViewBag.Provincias = _usuarioModel.ConsultarProvincias();
            return View(datos);
        }

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult PerfilUsuario(UsuarioEnt entidad)
        {
            var resp = _usuarioModel.ActualizarCuenta(entidad);

            if (resp == 1)
            {
                HttpContext.Session.SetString("NombreUsuario", entidad.nombre);
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.MensajePantalla = "No se pudo actualizar su cuenta";
                ViewBag.Provincias = _usuarioModel.ConsultarProvincias();
                return View();
            }
        }

        [HttpGet]
		[FiltroSeguridad]
		public IActionResult CambiarClave()
		{
			return View();
		}

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult CambiarClave(UsuarioEnt entidad)
        {
            if (entidad.contrasennaAnterior.Trim() == entidad.contrasenna.Trim())
            {
                ViewBag.MensajePantalla = "Debe ingresar una contraseña nueva";
                return View();
            }

            var resp = _usuarioModel.CambiarClave(entidad);

            if (resp == 1)
                return RedirectToAction("Index", "Login");
            else
            {
                ViewBag.MensajePantalla = "No se pudo actualizar su contraseña";
                return View();
            }
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ConsultarUsuarios()
        {
            var datos = _usuarioModel.ConsultarUsuarios();
            return View(datos);
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarEstadoUsuario(long q)
        {
            var entidad = new UsuarioEnt();
            entidad.IdUsuario = q;

            _usuarioModel.ActualizarEstadoUsuario(entidad);
            return RedirectToAction("ConsultarUsuarios", "Usuario");
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarUsuario(long q)
        {
            var datos = _usuarioModel.ConsultarUsuario(q);
            ViewBag.Provincias = _usuarioModel.ConsultarProvincias();
            return View(datos);
        }

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult ActualizarUsuario(UsuarioEnt entidad)
        {
            var resp = _usuarioModel.ActualizarCuenta(entidad);

            if (resp == 1)
            {
                return RedirectToAction("ConsultarUsuarios", "Usuario");
            }
            else
            {
                ViewBag.MensajePantalla = "No se pudo actualizar su cuenta";
                ViewBag.Provincias = _usuarioModel.ConsultarProvincias();
                return View();
            }
        }

    }
}
