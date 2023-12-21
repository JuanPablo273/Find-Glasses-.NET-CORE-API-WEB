namespace ProyectoAPI.Entities
{
    public class ProductosEnt
    {
        public long IdProducto { get; set; }
        public string nombreProducto { get; set;} = string.Empty;
        public string descripcion { get; set;} = string.Empty;
        public decimal precio { get; set; } 
        public long cantidadStock { get; set; } 
        public string marca { get; set; } = string.Empty;
        public long tipoProducto { get; set; }
        public bool estado { get; set; }
        public string Imagen { get; set; } = string.Empty;


        public string VecesComprado { get; set; } = string.Empty;



        public string TotalGanado { get; set; } = string.Empty;
    }
}
