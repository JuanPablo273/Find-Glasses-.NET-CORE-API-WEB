using System.Net.Http.Headers;
using System.Security.Policy;
using System.Text;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public class CarritoModel : ICarritoModel
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _HttpContextAccessor;
        private string _urlApi;

        public CarritoModel(HttpClient httpClient, IConfiguration configuration, IHttpContextAccessor httpContextAccessor)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _HttpContextAccessor = httpContextAccessor;
            _urlApi = _configuration.GetSection("Llaves:urlApi").Value;
        }

        public long RegistrarCarrito(CarritoEnt entidad)
        {
            string url = _urlApi + "api/Carrito/RegistrarCarrito";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<long>().Result;
            else
                return 0;
        }

        public List<CarritoEnt>? ConsultarCarrito()
        {
            string url = _urlApi + "api/Carrito/ConsultarCarrito";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<CarritoEnt>>().Result;
            else
                return null;
        }

        public string PagarCarrito()
        {
            var entidad = new CarritoEnt();
            string url = _urlApi + "api/Carrito/PagarCarrito";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            JsonContent obj = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
                //return resp.Content.ReadFromJsonAsync<string>().Result;
                return resp.Content.ReadAsStringAsync().Result;
            else
                return string.Empty;
        }

        public int EliminarProductoCarrito(long q)
        {
            string url = _urlApi + "api/Carrito/EliminarProductoCarrito?q=" + q;
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.DeleteAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<int>().Result;
            else
                return 0;
        }

        public List<FacturasEnt>? ConsultarFacturas()
        {
            string url = _urlApi + "api/Carrito/ConsultarFacturas";
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<FacturasEnt>>().Result;
            else
                return null;
        }

        public List<FacturasEnt>? ConsultarUltimaFacturaYDetalles(long q)
        {
            string url = _urlApi + "api/Carrito/ConsultarUltimaFacturaYDetalles?q=" + q;
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<FacturasEnt>>().Result;
            else
                return null;
        }


        //METODO DE ENVIAR CORREO






        //EN MI OPINION ESTA BIEN SOLO QUE NO LLEGA AL API



        public string EnviarCorreoFactura(long idUsuario)
        {
            string url = _urlApi + "api/Carrito/EnviarCorreoFactura?idUsuario=" + idUsuario;
            string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            // Puedes enviar un objeto vacío si la solicitud no requiere un cuerpo específico
            JsonContent obj = JsonContent.Create(idUsuario);
            var resp = _httpClient.PostAsync(url, obj).Result;

            if (resp.IsSuccessStatusCode)
            {
                // Si la solicitud es exitosa, devuelve el contenido de la respuesta como string
                return resp.Content.ReadAsStringAsync().Result;
            }
            else
            {
                // Si ocurre algún error, devuelve un string vacío o maneja el error según tu lógica
                return string.Empty;
            }
        }



        //JsonContent obj = JsonContent.Create(entidad);
        //var resp = _httpClient.PostAsync(url, obj).Result;




        //public string EnviarCorreoFactura(long idUsuario)
        //{
        //    string url = _urlApi + "api/Carrito/EnviarCorreoFactura?idUsuario=" + idUsuario;
        //    string token = _HttpContextAccessor.HttpContext.Session.GetString("TokenUsuario");

        //    _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        //    // Puedes enviar un objeto vacío si la solicitud no requiere un cuerpo específico
        //    var content = new StringContent("", Encoding.UTF8, "application/json");
        //    var resp = _httpClient.PostAsync(url, content).Result;

        //    if (resp.IsSuccessStatusCode)
        //    {
        //        // Si la solicitud es exitosa, devuelve el contenido de la respuesta como string
        //        return resp.Content.ReadAsStringAsync().Result;
        //    }
        //    else
        //    {
        //        // Si ocurre algún error, devuelve un string vacío o maneja el error según tu lógica
        //        return string.Empty;
        //    }
        //}


    }


}

