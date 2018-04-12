using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaboratorioTres.Model;

namespace BLApplication.Dominio.Acciones
{
    public class Libros
    {
        public LaboratorioTres.Model.Libro ObtenerPorId(int LibroId)
        {
            var elRepositorio = new Dominio.Repositorio.Libros();
            return elRepositorio.ObtenerPorId(LibroId);
        }
        public IList<LaboratorioTres.Model.Libro> LibrosEjemplaresPerdidos()
        {
            var elRepositorio = new Dominio.Repositorio.Libros();
            return elRepositorio.LibrosEjemplaresPerdidos();
        }

    }
}