namespace ProyectoAPI.Entities
{
    public class UsuarioEnt
    {
        public long IdUsuario { get; set; }
        public string usuario { get; set; } = string.Empty;
        public string correo { get; set; } = string.Empty;
        public string contrasenna { get; set; } = string.Empty;
        public string identificacion { get; set; } = string.Empty;
        public string nombre { get; set; } = string.Empty;
        public bool estado { get; set; }
        public string contrasennaTemporal { get; set; } = string.Empty;
        public string IdUsuarioSeguro { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
        public long ConRol { get; set; }
        public long ConProvincia { get; set; }
		public string contrasennaAnterior { get; set; } = string.Empty;

	}
}