﻿using System;
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
    public class UsuariosController : Controller
    {
        private CCOLPROYECTOSEntities1 db = new CCOLPROYECTOSEntities1();

        // GET: Usuarios
        public ActionResult Index()
        {
            var usuario = db.Usuario.Include(u => u.Administrador).Include(u => u.Cargo).Include(u => u.Persona);
            return View(usuario.ToList());
        }

        // GET: Usuarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return HttpNotFound();
            }
            return View(usuario);
        }

        // GET: Usuarios/Create
        public ActionResult Create()
        {
            ViewBag.idAdmin = new SelectList(db.Administrador, "id", "correoAdmin");
            ViewBag.idCargo = new SelectList(db.Cargo, "id", "nombreCargo");
            ViewBag.idPersona = new SelectList(db.Persona, "id", "nombrePersona");
            return View();
        }

        // POST: Usuarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,codigoUsuario,correoUsuario,contrasenaUsuario,idCargo,idAdmin,idPersona")] Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                db.Usuario.Add(usuario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idAdmin = new SelectList(db.Administrador, "id", "correoAdmin", usuario.idAdmin);
            ViewBag.idCargo = new SelectList(db.Cargo, "id", "nombreCargo", usuario.idCargo);
            ViewBag.idPersona = new SelectList(db.Persona, "id", "nombrePersona", usuario.idPersona);
            return View(usuario);
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return HttpNotFound();
            }
            ViewBag.idAdmin = new SelectList(db.Administrador, "id", "correoAdmin", usuario.idAdmin);
            ViewBag.idCargo = new SelectList(db.Cargo, "id", "nombreCargo", usuario.idCargo);
            ViewBag.idPersona = new SelectList(db.Persona, "id", "nombrePersona", usuario.idPersona);
            return View(usuario);
        }

        // POST: Usuarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,codigoUsuario,correoUsuario,contrasenaUsuario,idCargo,idAdmin,idPersona")] Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usuario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idAdmin = new SelectList(db.Administrador, "id", "correoAdmin", usuario.idAdmin);
            ViewBag.idCargo = new SelectList(db.Cargo, "id", "nombreCargo", usuario.idCargo);
            ViewBag.idPersona = new SelectList(db.Persona, "id", "nombrePersona", usuario.idPersona);
            return View(usuario);
        }

        // GET: Usuarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return HttpNotFound();
            }
            return View(usuario);
        }

        // POST: Usuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Usuario usuario = db.Usuario.Find(id);
            db.Usuario.Remove(usuario);
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
