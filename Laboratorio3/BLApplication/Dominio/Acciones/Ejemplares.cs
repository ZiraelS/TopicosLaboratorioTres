using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Acciones
{
    public class Ejemplares
    {

        internal IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.ListarAproximadaEjemplares(false, elNombre);
        }

        public LaboratorioTres.Model.Ejemplar ObtenerPorId(int EjemplarId)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.ObtenerPorId(EjemplarId);

        }
        internal IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos)
        {
            var elRepositorio = new Dominio.Repositorio.Ejemplares();
            return elRepositorio.EjemplaresNoDevueltos(vencidos);
        }

    }
}