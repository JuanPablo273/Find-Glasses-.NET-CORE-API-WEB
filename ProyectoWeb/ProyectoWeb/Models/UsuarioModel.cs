using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Net.Http.Headers;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public class UsuarioModel : IUsuarioModel
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _HttpContextAccessor;
        private string _urlApi;

        public UsuarioModel(HttpClient httpClient, IConfiguration configuration, IHttpContextAccessor httpContextAccessor)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _HttpContextAccessor = httpContextAccessor;
            _urlApi = _configuration.GetSection("Llaves:urlApi").Value;
        }

        public UsuarioEnt? IniciarSesion(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Login/IniciarSesion";
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioEnt>().Result;
            else
                return null;
        }

        //public int RegistrarCuenta(UsuarioEnt entidad)
        //{
        //    string url = _urlApi + "api/Login/RegistrarCuenta";
        //    JsonContent obj = JsonContent.Create(entidad);
        //    var resp = _httpClient.PostAsync(url, obj).Result;

        //    if (resp.IsSuccessStatusCode)
        //        return resp.Content.ReadFromJsonAsync<int>().Result;
        //    else
        //        return 0;
        //}

        public int RegistrarCuenta(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Login/RegistrarCuenta";
            JsonContent obj = JsonContent.Create(entidad);

            try
            {
                var resp = _httpClient.PostAsync(url, obj).Result;

                if (resp.IsSuccessStatusCode)
                {
                    int codigoRespuesta = resp.Content.ReadFromJsonAsync<int>().Result;

                    if (codigoRespuesta == 1)
                    {
                        // Mantenemos el retorno definido en el método
                        return 1;
                    }
                    else if (codigoRespuesta == 2)
                    {
                        // Mantenemos el retorno definido en el método
                        return 2;
                    }
                    // Mantenemos el retorno definido en el método
                    return 3;
                }
                else
                {
                    // Mantenemos el retorno definido en el método
                    return 0;
                }
            }
            catch (Exception ex)
            {
                // Mantenemos el retorno definido en el método
                Console.WriteLine("Error: " + ex.Message);
                return 0;
            }
        }

    




    public int RecuperarCuenta(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Login/RecuperarCuenta";
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public int CambiarClaveCuenta(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Login/CambiarClaveCuenta";
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public UsuarioEnt? ConsultarUsuario(long q)
        {
            string url = _urlApi + "api/Usuario/ConsultarUsuario?q=" + q;
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioEnt>().Result;
            else
                return null;
        }

        public List<UsuarioEnt>? ConsultarUsuarios()
        {
            string url = _urlApi + "api/Usuario/ConsultarUsuarios";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<UsuarioEnt>>().Result;
            else
                return null;
        }

        public int ActualizarCuenta(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Usuario/ActualizarCuenta";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public int CambiarClave(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Usuario/CambiarClave";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public int ActualizarEstadoUsuario(UsuarioEnt entidad)
        {
            string url = _urlApi + "api/Usuario/ActualizarEstadoUsuario";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public List<SelectListItem>? ConsultarProvincias()
        {
            string url = _urlApi + "api/Usuario/ConsultarProvincias";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<SelectListItem>>().Result;
            else
                return null;
        }

    }
}
