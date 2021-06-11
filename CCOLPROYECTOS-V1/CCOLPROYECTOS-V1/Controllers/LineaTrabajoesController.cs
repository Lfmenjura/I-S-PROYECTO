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
    public class LineaTrabajoesController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: LineaTrabajoes
        public ActionResult Index()
        {
            return View(db.LineaTrabajo.ToList());
        }

        // GET: LineaTrabajoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LineaTrabajo lineaTrabajo = db.LineaTrabajo.Find(id);
            if (lineaTrabajo == null)
            {
                return HttpNotFound();
            }
            return View(lineaTrabajo);
        }

        // GET: LineaTrabajoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LineaTrabajoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nombreLineaT")] LineaTrabajo lineaTrabajo)
        {
            if (ModelState.IsValid)
            {
                db.LineaTrabajo.Add(lineaTrabajo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lineaTrabajo);
        }

        // GET: LineaTrabajoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LineaTrabajo lineaTrabajo = db.LineaTrabajo.Find(id);
            if (lineaTrabajo == null)
            {
                return HttpNotFound();
            }
            return View(lineaTrabajo);
        }

        // POST: LineaTrabajoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombreLineaT")] LineaTrabajo lineaTrabajo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lineaTrabajo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lineaTrabajo);
        }

        // GET: LineaTrabajoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LineaTrabajo lineaTrabajo = db.LineaTrabajo.Find(id);
            if (lineaTrabajo == null)
            {
                return HttpNotFound();
            }
            return View(lineaTrabajo);
        }

        // POST: LineaTrabajoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LineaTrabajo lineaTrabajo = db.LineaTrabajo.Find(id);
            db.LineaTrabajo.Remove(lineaTrabajo);
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
