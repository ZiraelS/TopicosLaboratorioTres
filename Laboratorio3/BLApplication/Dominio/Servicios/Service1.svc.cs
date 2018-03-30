using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace BLApplication
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        //WCF
        public IList<Modelo.Client> BuscaAproximadaNombreClientes(string elNombre)
        {
            var laEspecificacion = new Dominio.Especificaciones.Clients();
            IList<Model.Client> elResultado;
            elResultado = laEspecificacion.ListarAproximadaNombreClientes(elNombre);
            return elResultado;
        }

        public IList<Modelo.Library> BuscaAproximadaTituloLibro(string elTitulo)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarAproximadaTituloLibro(elTitulo);
            return elResultado;
        }

        public IList<Modelo.Library> BuscaExactaIdentificadorLibro(string elIdentificador)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarExactaIdentificadorLibro(elIdentificador);
            return elResultado;
        }

        public IList<Modelo.Library> LibrosNoDevueltosEntregaNoVencida(string Valididacion)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarLibrosNoDevueltosEntregaNoVencida(Valididacion);
            return elResultado;
        }

        public IList<Modelo.Library> LibrosNoDevueltosEntregaVencida(string Valididacion)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarLibrosNoDevueltosEntregaVencida(Valididacion);
            return elResultado;
        }

        public IList<Modelo.Client> LibrosSolicitadosPorCliente(string elCliente)
        {
            var laEspecificacion = new Dominio.Especificaciones.Clients();
            IList<Model.Client> elResultado;
            elResultado = laEspecificacion.ListarLibrosSolicitadosPorCliente(elCliente);
            return elResultado;
        }

        public IList<Modelo.Library> ClientesSolicitadoLibro(string elLibro)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarClientesSolicitadoLibro(elLibro);
            return elResultado;
        }

        public IList<Modelo.Library> LibrosPerdidosIntervalo(string ValidacionPerdido, DateTime fecha1, DateTime fecha2)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarLibrosPerdidosIntervalo(ValidacionPerdido, fecha1, fecha2);
            return elResultado;
        }

        public IList<Modelo.Library> LibrosPerdidos(string ValidacionPerdido)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libraries();
            IList<Model.Library> elResultado;
            elResultado = laEspecificacion.ListarLibrosPerdidos(ValidacionPerdido);
            return elResultado;
        }








        //Otro
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
