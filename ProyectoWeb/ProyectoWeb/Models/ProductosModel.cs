using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Net.Http.Headers;
using ProyectoWeb.Entities;
using System.Threading.Tasks;
using System.Net;
using NuGet.Common;

namespace ProyectoWeb.Models
{
    public class ProductosModel : IProductosModel
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _HttpContextAccessor;
        private string _urlApi;

        public ProductosModel(HttpClient httpClient, IConfiguration configuration, IHttpContextAccessor httpContextAccessor)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _HttpContextAccessor = httpContextAccessor;
            _urlApi = _configuration.GetSection("Llaves:urlApi").Value;
        }

        public List<ProductosEnt>? ConsultarProductos()
        {
            string url = _urlApi + "api/Productos/ConsultarProductos";
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<ProductosEnt>>().Result;
            else
                return null;
        }

        public long RegistrarProducto(ProductosEnt entidad)
        {
            string url = _urlApi + "api/Productos/RegistrarProducto";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<long>().Result;
            else
                return 0;
        }

        public ProductosEnt ConsultarProductoPorId(long id)
        {
            string url = $"{_urlApi}api/Productos/ConsultarProductoPorId/{id}";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<ProductosEnt>().Result;
            else
                return null;
        }

        public int ActualizarProducto2(ProductosEnt entidad)
        {
            string url = _urlApi + "api/Productos/ActualizarProducto";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        // Para el Dropdown
        public List<SelectListItem>? ConsultarTipoProducto()
        {

            string url = _urlApi + "api/Productos/ConsultarTipoProducto";
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<SelectListItem>>().Result;
            else
                return null;
        }

        public int ActualizarEstadoProducto(ProductosEnt entidad)
        {
            string url = _urlApi + "api/Productos/ActualizarEstadoProducto";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            JsonContent obj = JsonContent.Create(entidad);
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.PutAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public List<ProductosEnt>? BuscarProductos(string nombreProducto)
        {
            string url = $"{_urlApi}api/Productos/BuscarProductos/{nombreProducto}";
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<ProductosEnt>>().Result;
            else
                return null;
        }

    }
}
