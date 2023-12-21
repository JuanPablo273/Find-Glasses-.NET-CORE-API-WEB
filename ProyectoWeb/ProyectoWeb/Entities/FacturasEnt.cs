namespace ProyectoWeb.Entities
{
    public class FacturasEnt
    {
        public long IdFactura { get; set; }
        public DateTime FechaPago { get; set; }
        public decimal TotalPago { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public decimal Impuesto { get; set; }
        public decimal SubTotal { get; set; }
        public decimal ImpuestoTotal { get; set; }
        public decimal Total { get; set; }
        public string Nombre { get; set; } = string.Empty;



		public string NombreProducto { get; set; } = string.Empty;

		public long IdFacturaDetalle { get; set; }


		public long IdFacturaEncabezado { get; set; }

		public long IdUsuario { get; set; }


	}
}
