using ProyectoAPI.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarritoController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public CarritoController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        [HttpPost]
        [Authorize]
        [Route("RegistrarCarrito")]
        public IActionResult RegistrarCarrito(CarritoEnt entidad)
        {
            try
            {
                long IdUsuario = _utilitarios.ObtenerUsuario(User.Claims);

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("RegistrarCarrito",
                        new { IdUsuario, entidad.IdProducto, entidad.Cantidad },
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
        [Authorize]
        [Route("ConsultarCarrito")]
        public IActionResult ConsultarCarrito()
        {
            try
            {
                long IdUsuario = _utilitarios.ObtenerUsuario(User.Claims);

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CarritoEnt>("ConsultarCarrito",
                        new { IdUsuario },
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
        [Authorize]
        [Route("PagarCarrito")]
        public IActionResult PagarCarrito(decimal porcentajeDescuento)
        {
            try
            {
                long IdUsuario = _utilitarios.ObtenerUsuario(User.Claims);

                

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<string>("PagarCarrito",
                        new { IdUsuario, porcentajeDescuento },
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete]
        //[Authorize]
        [Route("EliminarProductoCarrito")]
        public IActionResult EliminarProductoCarrito(long q)
        {
            try
            {
                long IdCarrito = q;

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ReducirCantidadProductoCarrito",
                        new { IdCarrito },
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
        [Authorize]
        [Route("ConsultarFacturas")]
        public IActionResult ConsultarFacturas()
        {
            try
            {
                long IdUsuario = _utilitarios.ObtenerUsuario(User.Claims);

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<FacturasEnt>("ConsultarFacturas",
                        new { IdUsuario },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        //[Authorize]
        [Route("ConsultarUltimaFacturaYDetalles")]
        public IActionResult ConsultarUltimaFacturaYDetalles(long q)
        {
            try
            {
                long IdUsuario = q;

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<FacturasEnt>("ConsultarUltimaFacturaYDetalles",
                        new { IdUsuario },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        //METODO DE ENVIAR CORREO FUNCIONAL

        [HttpPost]
        [Route("EnviarCorreoFactura")]
        public IActionResult EnviarCorreoFactura([FromBody] long idUsuario)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connection))
                {
                    connection.Open();

                    // Consultar el correo del usuario
                    var correoUsuario = connection.QueryFirstOrDefault<string>("ConsultarCorreoUsuario", new { IdUsuario = idUsuario }, commandType: CommandType.StoredProcedure);

                    // Verificar que se encontró el correo
                    if (!string.IsNullOrEmpty(correoUsuario))
                    {
                        // Obtener detalles de factura utilizando el procedimiento almacenado CORREOFACTURA
                        var datos = connection.Query<FacturasEnt>("CORREOFACTURA",
                            new { idUsuario },
                            commandType: CommandType.StoredProcedure).ToList();

                        // Verificar que se encontraron datos de factura
                        if (datos != null && datos.Any())
                        {
                            // Aquí obtienes los datos para armar el HTML del correo
                            string contenidoCorreo = _utilitarios.ArmarHTMLFactura(datos);

                            // Utilizar el correo obtenido para enviar el mensaje
                            _utilitarios.EnviarCorreo(correoUsuario, "Detalles de la factura", contenidoCorreo);

                            return Ok("Correo enviado correctamente");
                        }
                        else
                        {
                            return BadRequest("No se encontraron detalles de factura para el usuario");
                        }
                    }
                    else
                    {
                        return BadRequest("No se encontró el correo del usuario");
                    }
                }
            }
            catch (Exception ex)
            {
                return BadRequest("Error al enviar el correo electrónico: " + ex.Message);
            }
        }






        //MEJOR VERSION DE MOMENTO

        //[HttpPost]
        //[Route("EnviarCorreoFactura")]
        //public IActionResult EnviarCorreoFactura([FromBody] long idUsuario)
        //{
        //    try
        //    {
        //        using (SqlConnection connection = new SqlConnection(_connection))
        //        {
        //            connection.Open();

        //            using (var context = new SqlConnection(_connection))
        //            {
        //                var datos = context.Query<FacturasEnt>("CORREOFACTURA",
        //                    new { idUsuario },
        //                    commandType: CommandType.StoredProcedure).ToList();


        //                // Obtener datos de factura utilizando Dapper
        //                //var facturaDetalles = connection.Query<FacturasEnt>("SELECT * FROM FacturaDetalleTemp WHERE IdUsuario = @IdUsuario", new { IdUsuario = idUsuario });

        //                // Verificar que facturaDetalles tenga datos
        //                if (datos != null && datos.Any())
        //                {
        //                    // Aquí s los datos obtenidos para armar el HTML del correo
        //                    string contenidoCorreo = _utilitarios.ArmarHTMLFactura((List<FacturasEnt>)datos);




        //                    _utilitarios.EnviarCorreo(datos.correo, "Detalles de la factura", contenidoCorreo);

        //                    return Ok("Correo enviado correctamente");
        //                }
        //                else
        //                {
        //                    return BadRequest("No se encontraron detalles de factura para el usuario");
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest("Error al enviar el correo electrónico: " + ex.Message);
        //    }
        //}

















        //PROBLEMA CON ESTE ES QUE AL ENVIAR UNA LISTA Y TENER QUE BUSCAR EL CORREO EN EL PRODIMIENTO TENGO QUE PASAR POR TODA LA LISTA (SE CAE EN EL ENVIAR POR EL CORREO)


        //[HttpPost]
        //[Route("EnviarCorreoFactura")]
        //public IActionResult EnviarCorreoFactura([FromBody] long idUsuario)
        //{
        //    try
        //    {
        //        using (SqlConnection connection = new SqlConnection(_connection))
        //        {
        //            connection.Open();

        //            using (var context = new SqlConnection(_connection))
        //            {
        //                var datos = context.Query<FacturasEnt>("CORREOFACTURA",
        //                    new { idUsuario },
        //                    commandType: CommandType.StoredProcedure).ToList();


        //                // Obtener datos de factura utilizando Dapper
        //                //var facturaDetalles = connection.Query<FacturasEnt>("SELECT * FROM FacturaDetalleTemp WHERE IdUsuario = @IdUsuario", new { IdUsuario = idUsuario });

        //                // Verificar que facturaDetalles tenga datos
        //                if (datos != null && datos.Any())
        //                {
        //                    // Aquí s los datos obtenidos para armar el HTML del correo
        //                    string contenidoCorreo = _utilitarios.ArmarHTMLFactura((List<FacturasEnt>)datos);




        //                    _utilitarios.EnviarCorreo(datos.correo, "Detalles de la factura", contenidoCorreo);

        //                    return Ok("Correo enviado correctamente");
        //                }
        //                else
        //                {
        //                    return BadRequest("No se encontraron detalles de factura para el usuario");
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest("Error al enviar el correo electrónico: " + ex.Message);
        //    }
        //}


















        //[HttpPost]
        //[Route("EnviarCorreoFactura")]
        //public IActionResult EnviarCorreoFactura([FromBody] long idUsuario)
        //{
        //    try
        //    {
        //        using (SqlConnection connection = new SqlConnection(_connection))
        //        {
        //            connection.Open();


        //            SqlCommand command = new SqlCommand("CORREOFACTURA", connection);
        //            command.CommandType = CommandType.StoredProcedure;
        //            command.Parameters.AddWithValue("@IdUsuario", idUsuario);
        //            command.ExecuteNonQuery();

        //            // Obtener datos de factura utilizando Dapper
        //            var facturaDetalles = connection.Query<FacturasEnt>("SELECT * FROM FacturaDetalleTemp WHERE IdUsuario = @IdUsuario", new { IdUsuario = idUsuario });

        //            // Verificar que facturaDetalles tenga datos
        //            if (facturaDetalles != null && facturaDetalles.Any())
        //            {
        //                // Aquí s los datos obtenidos para armar el HTML del correo
        //                string contenidoCorreo = _utilitarios.ArmarHTMLFactura((List<FacturasEnt>)facturaDetalles);


        //                // _utilitarios.EnviarCorreo(correoDestino, "Detalles de la factura", contenidoCorreo);

        //                return Ok("Correo enviado correctamente");
        //            }
        //            else
        //            {
        //                return BadRequest("No se encontraron detalles de factura para el usuario");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest("Error al enviar el correo electrónico: " + ex.Message);
        //    }
        //}



    }
}
