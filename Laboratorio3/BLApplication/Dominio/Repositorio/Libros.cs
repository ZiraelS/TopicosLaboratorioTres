using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaboratorioTres.Model;

namespace BLApplication.Dominio.Repositorio
{
    public class Libros
    {
        private static LaboratorioTres.Model.LaboratorioTresEntities _context = new LaboratorioTresEntities();

        public Libros()
        {
            _context.Configuration.ProxyCreationEnabled = false;
            _context.Configuration.LazyLoadingEnabled = true;
        }

        public Libros(bool enableLazyLoading)
        {
            _context.Configuration.LazyLoadingEnabled = enableLazyLoading;
        }

        public LaboratorioTres.Model.Libro ObtenerPorId(int LibroId)
        {
            LaboratorioTres.Model.Libro Libro = new LaboratorioTres.Model.Libro();
            Libro = _context.Libro.Find(LibroId);
            return Libro;

        }
        public IList<LaboratorioTres.Model.Libro> LibrosEjemplaresPerdidos()
        {
            IList<LaboratorioTres.Model.Libro> Libros = null;

            var prestamoEjemplarPerdido = _context.PrestamoEjemplar.Where(p => p.EjemplarPerdido == "S").ToList();
            Libros = prestamoEjemplarPerdido.Select(p => p.Ejemplar.Libro).ToList();

            return Libros;
        }
    }
}