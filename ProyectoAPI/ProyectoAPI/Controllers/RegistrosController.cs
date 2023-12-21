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
    public class RegistrosController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public RegistrosController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }



        //ANTES DE HACER EL FILTRO

        //[HttpGet]
        //[Route("ConsultaDeProductosMasComprados")]
        //public IActionResult ConsultaDeProductosMasComprados()
        //{
        //    try
        //    {
        //        using (var connection = new SqlConnection(_connection))
        //        {
        //            var productosMasComprados = connection.Query<ProductosEnt>("ConsultaDeProductosMasComprados",
        //                commandType: CommandType.StoredProcedure).ToList();

        //            return Ok(productosMasComprados);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(ex.Message);
        //    }
        //}




        [HttpGet]
        [Route("ConsultaDeProductosMasComprados")]
        public IActionResult ConsultaDeProductosMasComprados(string ordenamiento = "mayorAMenorVecesComprado")
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@ordenamiento", ordenamiento, DbType.String, ParameterDirection.Input);

                    var productosMasComprados = connection.Query<ProductosEnt>(
                        "ConsultaDeProductosMasComprados",
                        parameters,
                        commandType: CommandType.StoredProcedure
                    ).ToList();

                    return Ok(productosMasComprados);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarDescuentos")]
        public IActionResult ConsultarDescuentos()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<DescuentosEnt>("ConsultarDescuentos",
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
        [Route("ActualizarEstadoDescuento")]
        public IActionResult ActualizarEstadoDescuento(DescuentosEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarEstadoDescuento",
                        new { entidad.IdDescuento },
                        commandType: CommandType.StoredProcedure);

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
