namespace ProyectoWeb.Entities
{
    public class CombinacionEnt
    {
      public UsuarioEnt Usuario { get; set; }
      public List<CarritoEnt> CarritoItems { get; set; }

     public List<DescuentosEnt> DescuentoItems { get; set;}

    }
}
