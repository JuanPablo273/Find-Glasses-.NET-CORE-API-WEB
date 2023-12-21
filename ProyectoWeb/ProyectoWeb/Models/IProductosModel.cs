using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public interface IProductosModel
    {
        public List<ProductosEnt>? ConsultarProductos();
        public long RegistrarProducto(ProductosEnt entidad);
        public ProductosEnt ConsultarProductoPorId(long id);
        public int ActualizarProducto2(ProductosEnt entidad);
        public List<SelectListItem>? ConsultarTipoProducto();
        public int ActualizarEstadoProducto(ProductosEnt entidad);
        public List<ProductosEnt>? BuscarProductos(string nombreProducto);

    }
}
