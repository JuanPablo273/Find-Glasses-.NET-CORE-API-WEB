namespace ProyectoAPI.Entities
{
    public class DescuentosEnt
    {


        public long IdDescuento { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public decimal PorcentajeDescuento { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string CodigoDescuento { get; set; } = string.Empty;

        public bool Estado { get; set; } 


    }
}
