using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Net.Http.Headers;
using ProyectoWeb.Entities;
using System.Threading.Tasks;
using System.Net;
using NuGet.Common;
using ProyectoAPI.Entities;

namespace ProyectoWeb.Models
{
    public class CitasModel : ICitasModel
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _HttpContextAccessor;
        private string _urlApi;

        public CitasModel(HttpClient httpClient, IConfiguration configuration, IHttpContextAccessor httpContextAccessor)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _HttpContextAccessor = httpContextAccessor;
            _urlApi = _configuration.GetSection("Llaves:urlApi").Value;
        }



        public List<CitaEnt>? ConsultarCitas()
        {

            string url = _urlApi + "api/Citas/ConsultarCitas";

            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
            {
                return resp.Content.ReadFromJsonAsync<List<CitaEnt>>().Result;
            }
            else
            {
                // Manejo de error si la solicitud no es exitosa
                // Puedes manejar el error de la manera que consideres apropiada
                // Aquí, se está devolviendo null en caso de error, pero puedes manejarlo de otra forma según tu lógica de la aplicación.
                return null;
            }
        }
        

        //PARA EL VIEWBAG DE LAS CITAS RESERVADAS

       


             public List<DateTime>? ConsultarFechasReservadas()
            {

            string url = _urlApi + "api/Citas/ConsultarCitasReservadas";

            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
            {
                return resp.Content.ReadFromJsonAsync<List<DateTime>>().Result;
            }
            else
            {
                // Manejo de error si la solicitud no es exitosa
                // Puedes manejar el error de la manera que consideres apropiada
                // Aquí, se está devolviendo null en caso de error, pero puedes manejarlo de otra forma según tu lógica de la aplicación.
                return null;
            }
        }

        public long RegistrarCitas(CitaEnt entidad)
        {
            string url = _urlApi + "api/Citas/RegistrarCitas";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<long>().Result;
            else
                return 0;
        }

        //DROPDOWN PARA LOS TIPOS DE PRODUCTOS
        public List<SelectListItem>? ConsultarTipoCita()
        {

            string url = _urlApi + "api/Citas/ConsultarTipoCitas";
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<SelectListItem>>().Result;
            else
                return null;
        }





    }
}
