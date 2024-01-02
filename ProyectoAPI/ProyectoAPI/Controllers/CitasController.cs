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
    public class CitasController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public CitasController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }




        //CONSUTLA DE LAS CITAS

        [HttpGet]
        [AllowAnonymous] 
        [Route("ConsultarCitas")]
        public IActionResult ConsultarCitas()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CitaEnt>("ConsultarCitas",
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


        //CONSULTA DE LOS TIPOS DE CITAS


        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarTiposCitas")]
        public IActionResult ConsultarTiposCitas()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<TipoCitasEnt>("ConsultarTiposCitas",
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



        //Registro de Citas en caso de que lo use el usuario o el admin


        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarCitas")]
        public IActionResult RegistrarCitas(CitaEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<long>("RegistrarCitas",
                        new { entidad.FechaHora, entidad.TipoCita, entidad.IdUsuario},
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        //Registro de Tipo Citas

        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarTipoCitas")]
        public IActionResult RegistrarTipoCitas(TipoCitasEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<long>("RegistrarTipoCitas",
                        new { entidad.Nombre, entidad.Descripcion},
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }





        //CONSULTA DE CITA POR ID



        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarCitaPorId/{id}")]
        public IActionResult ConsultarCitaPorId(long id)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CitaEnt>("ConsultarCitaPorId",
                        new { IdCita = id },
                        commandType: CommandType.StoredProcedure).SingleOrDefault();

                    if (datos != null)
                    {
                        return Ok(datos);
                    }
                    else
                    {
                        return NotFound($"No se encontró la cita con ID: {id}");
                    }
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        //CONSULTA DE TIPO DE CITA POR ID

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarTipoCitaPorId/{id}")]
        public IActionResult ConsultarTipoCitaPorId(long id)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<TipoCitasEnt>("ConsultarTipoCitaPorId",
                        new { IdTipoCita = id },
                        commandType: CommandType.StoredProcedure).SingleOrDefault();

                    if (datos != null)
                    {
                        return Ok(datos);
                    }
                    else
                    {
                        return NotFound($"No se encontró un tipo de cita  con ID: {id}");
                    }
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }







        //ACTUALIZACION DE CITAS


        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarCita")]
        public IActionResult ActualizarCita(CitaEnt entidad)
        {
            try
            {

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarCita",
                        new { entidad.FechaHora, entidad.TipoCita, entidad.IdCita },
                        commandType: CommandType.StoredProcedure);

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



        //ACTUALIZACION DE TIPOS DE CITAS

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarTipoCita")]
        public IActionResult ActualizarTipoCita(TipoCitasEnt entidad)
        {
            try
            {

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarTipoCita",
                        new { entidad.Nombre, entidad.Descripcion, entidad.IdTipoCita },
                        commandType: CommandType.StoredProcedure);

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }








        //PARA DROPDOWN DE CONSULTAR EL TIPO DE CITA OBENTER EL NOMBRE/DESCRIPCION



        [HttpGet] //PARA EL DROPDOWN
        [AllowAnonymous]
        [Route("ConsultarTipoCitas")]
        public IActionResult ConsultarTipoCitas()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarTipoCitas",
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





        //PARA ACTIVAR O INACTIVAR LAS CITAS

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarEstadoCita")]
        public IActionResult ActualizarEstadoCita(CitaEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarEstadoCita",
                        new { entidad.IdCita },
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
        [Route("ConsultarCitasReservadas")]
        public IActionResult ConsultarCitasReservadas()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var fechasReservadas = context.Query<DateTime>("ConsultarCitasReservadas",
                        new { },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(fechasReservadas);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }





        ////PARA ACTIVAR O INACTIVAR LOS TIPO DE CITAS SE COMENTO POR UN PROBLEMA A LA HORA DE CREAR LA BASE DE DATOS REVISAR LUEGO

        //[HttpPut]
        //[AllowAnonymous]
        //[Route("ActualizarEstadoTipoCita")]
        //public IActionResult ActualizarEstadoTipoCita(TipoCitasEnt entidad)
        //{
        //    try
        //    {
        //        using (var context = new SqlConnection(_connection))
        //        {
        //            var datos = context.Execute("ActualizarEstadoTipoCita",
        //                new { entidad.IdTipoCita },
        //                commandType: CommandType.StoredProcedure);

        //            return Ok(datos);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(ex.Message);
        //    }
        //}
















        //VERIFICAR SI SE VA A USAR
        [HttpGet]
        [AllowAnonymous]
        [Route("BuscarCitas/{IdCita}")]
        public IActionResult BuscarCitas(string IdCita)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CitaEnt>("BuscarCitas",
                        new { IdCita },
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




