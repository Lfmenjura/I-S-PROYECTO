using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CCOLPROYECTOS_V1;

namespace CCOLPROYECTOS_V1.Controllers
{
    public class ServiciosController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: Servicios
        public ActionResult Index()
        {
            var servicio = db.Servicio.Include(s => s.Usuario).Include(s => s.Ciudad).Include(s => s.Cliente).Include(s => s.EstadoSerPro).Include(s => s.LineaTrabajo).Include(s => s.RecursoTecnico);
            return View(servicio.ToList());
        }

        // GET: Servicios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Servicio servicio = db.Servicio.Find(id);
            if (servicio == null)
            {
                return HttpNotFound();
            }
            return View(servicio);
        }

        // GET: Servicios/Create
        public ActionResult Create()
        {
            ViewBag.idUsuarioSer = new SelectList(db.Usuario, "id", "correoUsuario");
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad");
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente");
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro");
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT");
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT");
            return View();
        }

        // POST: Servicios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,codigoServicio,nombreServicio,fechaServicio,valorServicio,lineaServicio,idUsuarioSer,idCliente,idEstadoSP,idCiudad,idRecursoT,idLineaT")] Servicio servicio)
        {
            if (ModelState.IsValid)
            {
                db.Servicio.Add(servicio);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuarioSer = new SelectList(db.Usuario, "id", "correoUsuario", servicio.idUsuarioSer);
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", servicio.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", servicio.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", servicio.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", servicio.idLineaT);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", servicio.idRecursoT);
            return View(servicio);
        }

        // GET: Servicios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Servicio servicio = db.Servicio.Find(id);
            if (servicio == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuarioSer = new SelectList(db.Usuario, "id", "correoUsuario", servicio.idUsuarioSer);
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", servicio.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", servicio.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", servicio.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", servicio.idLineaT);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", servicio.idRecursoT);
            return View(servicio);
        }

        // POST: Servicios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,codigoServicio,nombreServicio,fechaServicio,valorServicio,lineaServicio,idUsuarioSer,idCliente,idEstadoSP,idCiudad,idRecursoT,idLineaT")] Servicio servicio)
        {
            if (ModelState.IsValid)
            {
                db.Entry(servicio).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuarioSer = new SelectList(db.Usuario, "id", "correoUsuario", servicio.idUsuarioSer);
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", servicio.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", servicio.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", servicio.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", servicio.idLineaT);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", servicio.idRecursoT);
            return View(servicio);
        }

        // GET: Servicios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Servicio servicio = db.Servicio.Find(id);
            if (servicio == null)
            {
                return HttpNotFound();
            }
            return View(servicio);
        }

        // POST: Servicios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Servicio servicio = db.Servicio.Find(id);
            db.Servicio.Remove(servicio);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
