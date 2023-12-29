using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Net.Http.Headers;
using ProyectoWeb.Entities;
using Newtonsoft.Json;
using System.Text;

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


        public DescuentosEnt ConsultarDescuentoPorId(long id)
        {
            string url = $"{_urlApi}api/Registros/ConsultarDescuentoPorId/{id}";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<DescuentosEnt>().Result;
            else
                return null;
        }





        public int ActualizarDescuento(DescuentosEnt entidad)
        {
            string url = _urlApi + "api/Registros/ActualizarDescuento";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }



        public long RegistrarDescuento(DescuentosEnt entidad)
        {
            string url = _urlApi + "api/Registros/RegistrarDescuentos";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<long>().Result;
            else
                return 0;
        }
    






        public decimal VerificarDescuento(string codigoDescuento)
        {
            try
            {
                string url = $"{_urlApi}api/Registros/VerificarCodigoDescuento?codigoIngresado={codigoDescuento}";

                string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);


                var resp = _httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                {
                    var responseData = resp.Content.ReadAsStringAsync().Result;
                    var porcentajeDescuento = JsonConvert.DeserializeObject<decimal>(responseData);
                    return porcentajeDescuento;
                }
                else
                {
                    // Aquí puedes manejar la respuesta de error si es necesario
                    // Por ejemplo, lanzar una excepción o manejar un valor por defecto
                    return 0; // Valor por defecto en caso de error
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones si ocurre algún error en la llamada
                // Por ejemplo, loguear el error
                Console.WriteLine($"Error al verificar el descuento: {ex.Message}");
                throw; // Puedes manejar el error según tu necesidad
            }
        }






        //public decimal VerificarDescuento(string codigoDescuento)
        //{
        //    try
        //    {
        //        string url = $"{_urlApi}api/Registros/VerificarDescuento";

        //        var content = new StringContent(JsonConvert.SerializeObject(new { codigoDescuento }), Encoding.UTF8, "application/json");

        //        string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");
        //        _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        //        var response = _httpClient.PostAsync(url, content).Result;

        //        if (response.IsSuccessStatusCode)
        //        {
        //            var responseData = response.Content.ReadAsStringAsync().Result;
        //            var porcentajeDescuento = JsonConvert.DeserializeObject<decimal>(responseData);
        //            return porcentajeDescuento;
        //        }
        //        else
        //        {
        //            // Aquí puedes manejar la respuesta de error si es necesario
        //            // Por ejemplo, lanzar una excepción o manejar un valor por defecto
        //            return 0; // Valor por defecto en caso de error
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Manejo de excepciones si ocurre algún error en la llamada
        //        // Por ejemplo, loguear el error
        //        Console.WriteLine($"Error al verificar el descuento: {ex.Message}");
        //        throw; // Puedes manejar el error según tu necesidad
        //    }
        //}





    }

}



