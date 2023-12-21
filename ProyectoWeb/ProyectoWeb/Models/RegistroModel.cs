using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Net.Http.Headers;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public class RegistroModel : IRegistroModel
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _HttpContextAccessor;
        private string _urlApi;

        public RegistroModel(HttpClient httpClient, IConfiguration configuration, IHttpContextAccessor httpContextAccessor)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _HttpContextAccessor = httpContextAccessor;
            _urlApi = _configuration.GetSection("Llaves:urlApi").Value;
        }



        //public List<ProductosEnt>? ProductosMasVendidosLista()
        //{
        //    string url = _urlApi + "api/Registros/ConsultaDeProductosMasComprados";
        //    var resp = _httpClient.GetAsync(url).Result;

        //    if (resp.IsSuccessStatusCode)
        //        return resp.Content.ReadFromJsonAsync<List<ProductosEnt>>().Result;
        //    else
        //        return null;

        //}






        public List<ProductosEnt>? ProductosMasVendidosLista(string ordenamiento)
        {
            string url = _urlApi + "api/Registros/ConsultaDeProductosMasComprados?ordenamiento=" + ordenamiento;


            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
            {
                return resp.Content.ReadFromJsonAsync<List<ProductosEnt>>().Result;
            }
            else
            {
                // Manejo de error si la solicitud no es exitosa
                // Puedes manejar el error de la manera que consideres apropiada
                // Aquí, se está devolviendo null en caso de error, pero puedes manejarlo de otra forma según tu lógica de la aplicación.
                return null;
            }
        }




        //DESCUENTOS VISTAS 


        public List<DescuentosEnt>? ConsultarDescuentos()
        {

            string url = _urlApi + "api/Registros/ConsultarDescuentos";

            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
            {
                return resp.Content.ReadFromJsonAsync<List<DescuentosEnt>>().Result;
            }
            else
            {
                // Manejo de error si la solicitud no es exitosa
                // Puedes manejar el error de la manera que consideres apropiada
                // Aquí, se está devolviendo null en caso de error, pero puedes manejarlo de otra forma según tu lógica de la aplicación.
                return null;
            }
        }




        public int ActualizarEstadoDescuento(DescuentosEnt entidad)
        {
            string url = _urlApi + "api/Registros/ActualizarEstadoDescuento";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }






    }

    }



