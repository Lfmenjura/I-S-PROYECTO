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
    public class EstadoSerProesController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: EstadoSerProes
        public ActionResult Index()
        {
            return View(db.EstadoSerPro.ToList());
        }

        // GET: EstadoSerProes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EstadoSerPro estadoSerPro = db.EstadoSerPro.Find(id);
            if (estadoSerPro == null)
            {
                return HttpNotFound();
            }
            return View(estadoSerPro);
        }

        // GET: EstadoSerProes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: EstadoSerProes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nombreEstadoSerPro,codEstado")] EstadoSerPro estadoSerPro)
        {
            if (ModelState.IsValid)
            {
                db.EstadoSerPro.Add(estadoSerPro);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(estadoSerPro);
        }

        // GET: EstadoSerProes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EstadoSerPro estadoSerPro = db.EstadoSerPro.Find(id);
            if (estadoSerPro == null)
            {
                return HttpNotFound();
            }
            return View(estadoSerPro);
        }

        // POST: EstadoSerProes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombreEstadoSerPro,codEstado")] EstadoSerPro estadoSerPro)
        {
            if (ModelState.IsValid)
            {
                db.Entry(estadoSerPro).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(estadoSerPro);
        }

        // GET: EstadoSerProes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EstadoSerPro estadoSerPro = db.EstadoSerPro.Find(id);
            if (estadoSerPro == null)
            {
                return HttpNotFound();
            }
            return View(estadoSerPro);
        }

        // POST: EstadoSerProes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EstadoSerPro estadoSerPro = db.EstadoSerPro.Find(id);
            db.EstadoSerPro.Remove(estadoSerPro);
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
