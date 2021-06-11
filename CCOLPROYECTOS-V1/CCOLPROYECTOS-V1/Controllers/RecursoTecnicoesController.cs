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
    public class RecursoTecnicoesController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: RecursoTecnicoes
        public ActionResult Index()
        {
            return View(db.RecursoTecnico.ToList());
        }

        // GET: RecursoTecnicoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecursoTecnico recursoTecnico = db.RecursoTecnico.Find(id);
            if (recursoTecnico == null)
            {
                return HttpNotFound();
            }
            return View(recursoTecnico);
        }

        // GET: RecursoTecnicoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RecursoTecnicoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,tipoRecursoT,referenciaRecursoT,marcaRecursoT,valorRecursoT,descripRecursoT")] RecursoTecnico recursoTecnico)
        {
            if (ModelState.IsValid)
            {
                db.RecursoTecnico.Add(recursoTecnico);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(recursoTecnico);
        }

        // GET: RecursoTecnicoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecursoTecnico recursoTecnico = db.RecursoTecnico.Find(id);
            if (recursoTecnico == null)
            {
                return HttpNotFound();
            }
            return View(recursoTecnico);
        }

        // POST: RecursoTecnicoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,tipoRecursoT,referenciaRecursoT,marcaRecursoT,valorRecursoT,descripRecursoT")] RecursoTecnico recursoTecnico)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recursoTecnico).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(recursoTecnico);
        }

        // GET: RecursoTecnicoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecursoTecnico recursoTecnico = db.RecursoTecnico.Find(id);
            if (recursoTecnico == null)
            {
                return HttpNotFound();
            }
            return View(recursoTecnico);
        }

        // POST: RecursoTecnicoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RecursoTecnico recursoTecnico = db.RecursoTecnico.Find(id);
            db.RecursoTecnico.Remove(recursoTecnico);
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
