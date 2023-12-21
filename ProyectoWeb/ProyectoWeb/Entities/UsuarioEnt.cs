using System.ComponentModel.DataAnnotations;

namespace ProyectoWeb.Entities
{
    public class UsuarioEnt
    {
        public long IdUsuario { get; set; }

        [Required(ErrorMessage = "El campo usuario es obligatorio.")]
        public string usuario { get; set; } = string.Empty;

        [Required(ErrorMessage = "El campo correo es obligatorio.")]
        public string correo { get; set; } = string.Empty;

        [Required(ErrorMessage = "El campo contrasenna es obligatorio.")]
        public string contrasenna { get; set; } = string.Empty;

        [Required(ErrorMessage = "El campo identificacion es obligatorio.")]
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
