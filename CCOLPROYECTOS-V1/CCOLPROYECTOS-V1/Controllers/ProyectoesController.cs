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
    public class ProyectoesController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: Proyectoes
        public ActionResult Index()
        {
            var proyecto = db.Proyecto.Include(p => p.Usuario).Include(p => p.Ciudad).Include(p => p.Cliente).Include(p => p.EstadoSerPro).Include(p => p.LineaTrabajo).Include(p => p.RecursoTecnico);
            return View(proyecto.ToList());
        }

        // GET: Proyectoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyecto proyecto = db.Proyecto.Find(id);
            if (proyecto == null)
            {
                return HttpNotFound();
            }
            return View(proyecto);
        }

        // GET: Proyectoes/Create
        public ActionResult Create()
        {
            ViewBag.idUsuario = new SelectList(db.Usuario, "id", "correoUsuario");
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad");
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente");
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro");
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT");
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT");
            return View();
        }

        // POST: Proyectoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,codigoProyecto,nombreProyecto,fechaProyecto,valorProyecto,lineaProyecto,idUsuario,idCliente,idEstadoSP,idCiudad,idRecursoT,idLineaT")] Proyecto proyecto)
        {
            if (ModelState.IsValid)
            {
                db.Proyecto.Add(proyecto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idUsuario = new SelectList(db.Usuario, "id", "correoUsuario", proyecto.idUsuario);
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", proyecto.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", proyecto.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", proyecto.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", proyecto.idLineaT);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", proyecto.idRecursoT);
            return View(proyecto);
        }

        // GET: Proyectoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyecto proyecto = db.Proyecto.Find(id);
            if (proyecto == null)
            {
                return HttpNotFound();
            }
            ViewBag.idUsuario = new SelectList(db.Usuario, "id", "correoUsuario", proyecto.idUsuario);
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", proyecto.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", proyecto.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", proyecto.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", proyecto.idLineaT);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", proyecto.idRecursoT);
            return View(proyecto);
        }

        // POST: Proyectoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,codigoProyecto,nombreProyecto,fechaProyecto,valorProyecto,lineaProyecto,idUsuario,idCliente,idEstadoSP,idCiudad,idRecursoT,idLineaT")] Proyecto proyecto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(proyecto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idUsuario = new SelectList(db.Usuario, "id", "correoUsuario", proyecto.idUsuario);
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", proyecto.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", proyecto.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", proyecto.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", proyecto.idLineaT);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", proyecto.idRecursoT);
            return View(proyecto);
        }

        // GET: Proyectoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Proyecto proyecto = db.Proyecto.Find(id);
            if (proyecto == null)
            {
                return HttpNotFound();
            }
            return View(proyecto);
        }

        // POST: Proyectoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Proyecto proyecto = db.Proyecto.Find(id);
            db.Proyecto.Remove(proyecto);
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
