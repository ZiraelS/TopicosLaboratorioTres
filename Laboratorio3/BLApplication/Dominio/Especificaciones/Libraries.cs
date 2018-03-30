using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Especificaciones
{
    public class Libraries
    {
        internal IList<Model.Library> ListarAproximadaTituloLibro(string elTitulo)
        {
            throw new NotImplementedException();
        }

        internal IList<Model.Library> ListarExactaIdentificadorLibro(string elIdentificador)
        {
            throw new NotImplementedException();
        }

        internal IList<Model.Library> ListarLibrosNoDevueltosEntregaNoVencida(string valididacion)
        {
            throw new NotImplementedException();
        }

        internal IList<Model.Library> ListarLibrosNoDevueltosEntregaVencida(string valididacion)
        {
            throw new NotImplementedException();
        }

        internal IList<Model.Library> ListarClientesSolicitadoLibro(string elLibro)
        {
            throw new NotImplementedException();
        }

        internal IList<Model.Library> ListarLibrosPerdidosIntervalo(string validacionPerdido, DateTime fecha1, DateTime fecha2)
        {
            throw new NotImplementedException();
        }

        internal IList<Model.Library> ListarLibrosPerdidos(string validacionPerdido)
        {
            throw new NotImplementedException();
        }
    }
}