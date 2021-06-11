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
    public class SerProesController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: SerProes
        public ActionResult Index()
        {
            var serPro = db.SerPro.Include(s => s.Ciudad).Include(s => s.Cliente).Include(s => s.EstadoSerPro).Include(s => s.LineaTrabajo).Include(s => s.Proyecto).Include(s => s.RecursoTecnico).Include(s => s.Servicio);
            return View(serPro.ToList());
        }

        // GET: SerProes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SerPro serPro = db.SerPro.Find(id);
            if (serPro == null)
            {
                return HttpNotFound();
            }
            return View(serPro);
        }

        // GET: SerProes/Create
        public ActionResult Create()
        {
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad");
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente");
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro");
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT");
            ViewBag.idProyecto = new SelectList(db.Proyecto, "id", "codigoProyecto");
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT");
            ViewBag.idServicio = new SelectList(db.Servicio, "id", "codigoServicio");
            return View();
        }

        // POST: SerProes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,idServicio,idProyecto,idCliente,idEstadoSP,idCiudad,idRecursoT,idLineaT")] SerPro serPro)
        {
            if (ModelState.IsValid)
            {
                db.SerPro.Add(serPro);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", serPro.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", serPro.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", serPro.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", serPro.idLineaT);
            ViewBag.idProyecto = new SelectList(db.Proyecto, "id", "codigoProyecto", serPro.idProyecto);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", serPro.idRecursoT);
            ViewBag.idServicio = new SelectList(db.Servicio, "id", "codigoServicio", serPro.idServicio);
            return View(serPro);
        }

        // GET: SerProes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SerPro serPro = db.SerPro.Find(id);
            if (serPro == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", serPro.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", serPro.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", serPro.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", serPro.idLineaT);
            ViewBag.idProyecto = new SelectList(db.Proyecto, "id", "codigoProyecto", serPro.idProyecto);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", serPro.idRecursoT);
            ViewBag.idServicio = new SelectList(db.Servicio, "id", "codigoServicio", serPro.idServicio);
            return View(serPro);
        }

        // POST: SerProes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,idServicio,idProyecto,idCliente,idEstadoSP,idCiudad,idRecursoT,idLineaT")] SerPro serPro)
        {
            if (ModelState.IsValid)
            {
                db.Entry(serPro).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCiudad = new SelectList(db.Ciudad, "id", "nombreCiudad", serPro.idCiudad);
            ViewBag.idCliente = new SelectList(db.Cliente, "id", "nombreCliente", serPro.idCliente);
            ViewBag.idEstadoSP = new SelectList(db.EstadoSerPro, "id", "nombreEstadoSerPro", serPro.idEstadoSP);
            ViewBag.idLineaT = new SelectList(db.LineaTrabajo, "id", "nombreLineaT", serPro.idLineaT);
            ViewBag.idProyecto = new SelectList(db.Proyecto, "id", "codigoProyecto", serPro.idProyecto);
            ViewBag.idRecursoT = new SelectList(db.RecursoTecnico, "id", "tipoRecursoT", serPro.idRecursoT);
            ViewBag.idServicio = new SelectList(db.Servicio, "id", "codigoServicio", serPro.idServicio);
            return View(serPro);
        }

        // GET: SerProes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SerPro serPro = db.SerPro.Find(id);
            if (serPro == null)
            {
                return HttpNotFound();
            }
            return View(serPro);
        }

        // POST: SerProes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SerPro serPro = db.SerPro.Find(id);
            db.SerPro.Remove(serPro);
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
