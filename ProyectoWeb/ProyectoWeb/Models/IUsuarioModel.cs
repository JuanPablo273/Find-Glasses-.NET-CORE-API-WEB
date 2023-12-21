using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoWeb.Entities;

namespace ProyectoWeb.Models
{
    public interface IUsuarioModel
    {
        public UsuarioEnt? IniciarSesion(UsuarioEnt entidad);

        public int RegistrarCuenta(UsuarioEnt entidad);

        public int RecuperarCuenta(UsuarioEnt entidad);

        public int CambiarClaveCuenta(UsuarioEnt entidad);

        public UsuarioEnt? ConsultarUsuario(long q);

        public List<UsuarioEnt>? ConsultarUsuarios();

        public int ActualizarCuenta(UsuarioEnt entidad);

        public int CambiarClave(UsuarioEnt entidad);

        public int ActualizarEstadoUsuario(UsuarioEnt entidad);

        public List<SelectListItem>? ConsultarProvincias();
    }
}
