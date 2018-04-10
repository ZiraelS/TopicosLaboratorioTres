using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Especificaciones
{
    public class Ejemplares
    {
        internal IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre)
        {
            var laAccion = new Dominio.Acciones.Ejemplares();
            return laAccion.ListarAproximadaEjemplares(busquedaExacta,elNombre);
        }
        public LaboratorioTres.Model.Ejemplar ObtenerPorId(int EjemplarId)
        {
            var laAccion = new Dominio.Acciones.Ejemplares();
            return laAccion.ObtenerPorId(EjemplarId);
        }
        internal IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos)
        {
            var laAccion = new Dominio.Acciones.Ejemplares();
            return laAccion.EjemplaresNoDevueltos(vencidos);
        }
    }


}