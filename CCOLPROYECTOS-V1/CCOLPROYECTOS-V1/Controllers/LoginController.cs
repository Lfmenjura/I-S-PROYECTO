using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CCOLPROYECTOS_V1.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string User, string Pass)
        {
            try
            {
                using (CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1())
                {
                    var oUser = (from d in db.Usuario
                                 where d.correoUsuario == User.Trim() && d.contrasenaUsuario == Pass.Trim()
                                 select d).FirstOrDefault();
                    if (oUser == null)
                    {
                        ViewBag.Error = "Usuario o contraseña invalida";
                        return View();
                    }

                    Session["User"] = oUser;

                }

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View();
            }

        }
    }
}