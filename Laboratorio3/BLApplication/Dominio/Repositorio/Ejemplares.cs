using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaboratorioTres.Model;

namespace BLApplication.Dominio.Repositorio
{
    public class Ejemplares
    {
        private static LaboratorioTres.Model.LaboratorioTresEntities _context = new LaboratorioTresEntities();

        public Ejemplares()
        {
            _context.Configuration.ProxyCreationEnabled = false;
            _context.Configuration.LazyLoadingEnabled = true;
        }

        public Ejemplares(bool enableLazyLoading)
        {
            _context.Configuration.LazyLoadingEnabled = enableLazyLoading;
        }

        internal IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre)
        {
            IList<LaboratorioTres.Model.Ejemplar> resultado = null;

            resultado = _context.Ejemplar.Where(p => p.Libro.NombreOriginal.Contains(elNombre) || p.Libro.NombreTraducido.Contains(elNombre)).ToList();
            return resultado;

        }
        public LaboratorioTres.Model.Ejemplar ObtenerPorId(int EjemplarId)
        {
            LaboratorioTres.Model.Ejemplar Ejemplar = new LaboratorioTres.Model.Ejemplar();
            Ejemplar = _context.Ejemplar.Find(EjemplarId);
            return Ejemplar;

        }
        internal IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos)
        {
            IList<LaboratorioTres.Model.Ejemplar> resultado = null;
            if (vencidos)
                resultado = _context.Ejemplar.Where(p =>p.PrestamoEjemplar.Where(a => a.FechaDevolucion >= DateTime.Now));
            else
                resultado = _context.Ejemplar.Where(p => p.PrestamoEjemplar.Where(a => a.FechaDevolucion < DateTime.Now));
            return resultado;

        }

    }
}