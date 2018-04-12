using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Acciones
{
    public class Ejemplares
    {

        public IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.ListarAproximadaEjemplares(false, elNombre);
        }

        public LaboratorioTres.Model.Ejemplar ObtenerPorId(int EjemplarId)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.ObtenerPorId(EjemplarId);

        }
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.EjemplaresNoDevueltos(vencidos);
        }
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresPorCliente(int IdCliente)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.EjemplaresPorCliente(IdCliente);
        }
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresPerdidos(DateTime FechaInicio, DateTime FechaFin)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.EjemplaresPerdidos(FechaInicio,FechaFin);
        }
    }
}