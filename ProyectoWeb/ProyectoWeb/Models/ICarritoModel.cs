using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public interface ICarritoModel
    {
        public long RegistrarCarrito(CarritoEnt entidad);

        public List<CarritoEnt>? ConsultarCarrito();

        public string PagarCarrito(decimal porcentajeDescuento);

        public int EliminarProductoCarrito(long q);

        public List<FacturasEnt>? ConsultarFacturas();

        public List<FacturasEnt>? ConsultarUltimaFacturaYDetalles(long q);


        public string EnviarCorreoFactura(long idUsuario);
    }
}
