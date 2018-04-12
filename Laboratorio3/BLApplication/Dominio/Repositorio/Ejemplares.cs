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

        public IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre)
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
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos)
        {
            IList<LaboratorioTres.Model.PrestamoEjemplar> PrestamoEjemplar = null;
            IList<LaboratorioTres.Model.Ejemplar> Ejemplares = null;

            if (vencidos)
                PrestamoEjemplar = _context.PrestamoEjemplar.Where(p => p.FechaDevolucion >= DateTime.Now).ToList();
            else
                PrestamoEjemplar = _context.PrestamoEjemplar.Where(p => p.FechaDevolucion < DateTime.Now).ToList();

            Ejemplares = PrestamoEjemplar.Select(r => r.Ejemplar).ToList();

            return Ejemplares;
        }

        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresPorCliente(int IdCliente)
        {
            IList<LaboratorioTres.Model.PrestamoEjemplar> PrestamoEjemplar = null;
            IList<LaboratorioTres.Model.Ejemplar> Ejemplares = null;

            PrestamoEjemplar = _context.PrestamoEjemplar.Where(p => p.IdCliente == IdCliente).ToList();
            Ejemplares = PrestamoEjemplar.Select (r => r.Ejemplar).ToList();

            return Ejemplares;
        }

        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresPerdidos(DateTime FechaInicio, DateTime FechaFin)
        {
            IList<LaboratorioTres.Model.Ejemplar> Ejemplares = null;

            var ejemplaresPerdidos = _context.PrestamoEjemplar.Where(p => (p.FechaPrestamo >= FechaInicio && p.FechaDevolucion <= FechaFin) && p.EjemplarPerdido == "S").ToList();
            Ejemplares = ejemplaresPerdidos.Select(r => r.Ejemplar).ToList();
            return Ejemplares;

        }

    }
}