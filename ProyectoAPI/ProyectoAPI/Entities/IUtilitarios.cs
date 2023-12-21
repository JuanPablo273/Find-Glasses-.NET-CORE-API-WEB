using System.Security.Claims;

namespace ProyectoAPI.Entities
{
    public interface IUtilitarios
    {
        public string ArmarHTML(UsuarioEnt datos, string claveTemporal);

        public string GenerarCodigo();

        public void EnviarCorreo(string Destinatario, string Asunto, string Mensaje);

        public string GenerarToken(string idUsuario, string conRol);

        public string Encrypt(string texto);

        public string Decrypt(string texto);

        public long ObtenerUsuario(IEnumerable<Claim> valores);

        public bool IsAdmin(IEnumerable<Claim> valores);

        public string ArmarHTMLFactura(List<FacturasEnt> datosFactura);

    }
}
