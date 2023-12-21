using ProyectoAPI.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc.Rendering;


namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public ProductosController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        [HttpGet]
        [AllowAnonymous] 
        [Route("ConsultarProductos")]
        public IActionResult ConsultarProductos()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<ProductosEnt>("ConsultarProductos",
                        new { },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarProducto")]
        public IActionResult RegistrarProducto(ProductosEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<long>("RegistrarProducto",
                        new { entidad.nombreProducto, entidad.descripcion, entidad.precio, entidad.cantidadStock, entidad.marca, entidad.tipoProducto },
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarProductoPorId/{id}")]
        public IActionResult ConsultarProductoPorId(long id)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<ProductosEnt>("ConsultarProductoPorId",
                        new { IdProducto = id },
                        commandType: CommandType.StoredProcedure).SingleOrDefault();

                    if (datos != null)
                    {
                        return Ok(datos);
                    }
                    else
                    {
                        return NotFound($"No se encontró el producto con ID: {id}");
                    }
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarProducto")]
        public IActionResult ActualizarProducto(ProductosEnt entidad)
        {
            try
            {

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarProducto",
                        new { entidad.nombreProducto, entidad.descripcion, entidad.precio, entidad.cantidadStock, entidad.marca, entidad.tipoProducto, entidad.IdProducto },
                        commandType: CommandType.StoredProcedure);

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet] //PARA EL DROPDOWN
        [AllowAnonymous]
        [Route("ConsultarTipoProducto")]
        public IActionResult ConsultarTipoProducto()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarTipoProducto",
                        new { },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarEstadoProducto")]
        public IActionResult ActualizarEstadoProducto(ProductosEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarEstadoProducto",
                        new { entidad.IdProducto },
                        commandType: CommandType.StoredProcedure);

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("BuscarProductos/{nombreProducto}")]
        public IActionResult BuscarProductos(string nombreProducto)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<ProductosEnt>("BuscarProductos",
                        new { nombreProducto },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


    }
}




