using CCOLPROYECTOS_V1.Controllers;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CCOLPROYECTOS_V1.Filters
{
    public class VerificaSession : ActionFilterAttribute
    {
        private Usuario oUsuario;
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                base.OnActionExecuting(filterContext);

                oUsuario = (Usuario)HttpContext.Current.Session["User"];
                if (oUsuario == null)
                {

                    if (filterContext.Controller is LoginController  == false )
                    {
                        filterContext.HttpContext.Response.Redirect("/Login/Login");
                    }



                }

            }
            catch (Exception)
            {
                filterContext.Result = new RedirectResult("~/Login/Login");
            }

        }
    }
}