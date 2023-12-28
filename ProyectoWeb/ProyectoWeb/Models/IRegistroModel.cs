using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public interface IRegistroModel
    {


        public List<ProductosEnt>? ProductosMasVendidosLista(string ordenamiento);


        public List<DescuentosEnt>? ConsultarDescuentos();

        public int ActualizarEstadoDescuento(DescuentosEnt entidad);


        public DescuentosEnt ConsultarDescuentoPorId(long id);


        public int ActualizarDescuento(DescuentosEnt entidad);



        public long RegistrarDescuento(DescuentosEnt entidad);



    }
}
