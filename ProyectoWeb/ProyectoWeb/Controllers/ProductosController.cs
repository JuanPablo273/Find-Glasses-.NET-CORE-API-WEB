using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using ProyectoWeb.Entities;
using ProyectoWeb.Models;
using System.Diagnostics;

namespace ProyectoWeb.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class ProductosController : Controller
    {
        private readonly IProductosModel _productosModel;
		/*private readonly ICarritoModel _carritoModel;*/
		private IHostEnvironment _hostingEnvironment;

        public ProductosController(IProductosModel productoModel, /*ICarritoModel carritoModel,*/ IHostEnvironment hostingEnvironment)
        {
            _productosModel = productoModel;
			/*_carritoModel = carritoModel;*/
			_hostingEnvironment = hostingEnvironment;
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ProductosLista() //Consultar productos
        {
            var productos = _productosModel.ConsultarProductos();
            return View(productos);
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult RegistrarProducto()
        {

            ViewBag.TipoProducto = _productosModel.ConsultarTipoProducto();
            return View();
        }

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult RegistrarProducto(IFormFile ImgProducto, ProductosEnt entidad)
        {
            string ext = Path.GetExtension(Path.GetFileName(ImgProducto.FileName));
            string folder = Path.Combine(_hostingEnvironment.ContentRootPath, "wwwroot\\images");

            if (ext.ToLower() != ".png")
            {
                ViewBag.MensajePantalla = "La imagen debe ser .png";
                return View();
            }

            var IdProducto = _productosModel.RegistrarProducto(entidad);
            ViewBag.ConsultarTipoProducto = _productosModel.ConsultarTipoProducto();

            if (IdProducto > 0)
            {
                string archivo = Path.Combine(folder, IdProducto + ext);
                using (Stream fileStream = new FileStream(archivo, FileMode.Create))
                {
                    ImgProducto.CopyTo(fileStream);
                }

                return RedirectToAction("ProductosLista", "Productos");
            }

            ViewBag.MensajePantalla = "No se pudo registrar el producto";
            return View();
            
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult DetalleProducto(long id)
        {
            var producto = _productosModel.ConsultarProductoPorId(id);

            if (producto != null)
            {
                return View(producto);
            }
            else
            {
                return RedirectToAction("ProductosLista", "Productos");
            }
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarEstadoProducto(long q)
        {
            var entidad = new ProductosEnt();
            entidad.IdProducto = q;

            _productosModel.ActualizarEstadoProducto(entidad);
            return RedirectToAction("ProductosLista", "Productos");
        }

        [HttpGet]
        [FiltroSeguridad]
        public IActionResult ActualizarProducto(long id)
        {
            // Obtener el producto por id 
            var producto = _productosModel.ConsultarProductoPorId(id);
            ViewData["tipoProducto"] = _productosModel.ConsultarTipoProducto();


            if (producto != null)
            {
                return View(producto);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult ActualizarProducto2(IFormFile ImgProducto, ProductosEnt entidad)
        {
            string ext = string.Empty;
            string folder = string.Empty;
            string archivo = string.Empty;

            if (ImgProducto != null)
            {
                ext = Path.GetExtension(Path.GetFileName(ImgProducto.FileName));
                folder = Path.Combine(_hostingEnvironment.ContentRootPath, "wwwroot\\images");
                archivo = Path.Combine(folder, entidad.IdProducto + ext);

                if (ext.ToLower() != ".png")
                {
                    ViewBag.MensajePantalla = "La imagen debe ser .png";
                    return View();
                }
            }

            var resp = _productosModel.ActualizarProducto2(entidad);
            ViewData["tipoProducto"] = _productosModel.ConsultarTipoProducto();

            if (resp == 1)
            {
                if (ImgProducto != null)
                {
                    using (Stream fileStream = new FileStream(archivo, FileMode.Create))
                    {
                        ImgProducto.CopyTo(fileStream);
                    }
                }

                return RedirectToAction("ProductosLista", "Productos");
            }
            else
            {
                ViewBag.MensajePantalla = "No se pudo actualizar el producto";
                return View(entidad);
            }
        }
        
        [HttpGet]
        public IActionResult ConsultarTipoProducto()
        {
            ViewBag.ConsultarTipoProducto = _productosModel.ConsultarTipoProducto();
            return View();
        }

        [HttpPost]
        [FiltroSeguridad]
        public IActionResult BuscarProductos(string nombreProducto)
        {
            var productos = _productosModel.BuscarProductos(nombreProducto);
            // Modificar las rutas de las imágenes para que sean relativas a wwwroot
            foreach (var producto in productos)
            {
                producto.Imagen = $"~/images/{producto.Imagen}";
            }
            return View("BuscarProducto", productos);
        }


    }
}