using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace ProyectoWeb.Entities
{
    public class FiltroSeguridad : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Session.GetString("TokenUsuario") == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    { "controller","Login"},
                    { "action","IniciarSesion"}
                });
            }

            base.OnActionExecuting(context);
        }

    }
}
