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
        public IList<LaboratorioTres.Model.Cliente> BuscaAproximadaNombreClientes(string elNombre)
        {
            var laEspecificacion = new Dominio.Especificaciones.Clients();
            IList<LaboratorioTres.Model.Cliente> elResultado;
            elResultado = laEspecificacion.ListarAproximadaNombreClientes(elNombre);
            return elResultado;
        }
        public IList<LaboratorioTres.Model.Cliente> ClientesEjemplarLibro(int idLibro)
        {
            var laEspecificacion = new Dominio.Especificaciones.Clients();
            IList<LaboratorioTres.Model.Cliente> elResultado;
            elResultado = laEspecificacion.ClientesEjemplarLibro(idLibro);
            return elResultado;
        }
        public IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre)
        {
            var laEspecificacion = new Dominio.Especificaciones.Ejemplares();
            IList < LaboratorioTres.Model.Ejemplar> elResultado;
            elResultado = laEspecificacion.ListarAproximadaEjemplares(busquedaExacta, elNombre);
            return elResultado;
        }

        public LaboratorioTres.Model.Ejemplar ObtenerPorId(int EjemplarId)
        {
            var laEspecificacion = new Dominio.Especificaciones.Ejemplares();
            LaboratorioTres.Model.Ejemplar elResultado;
            elResultado = laEspecificacion.ObtenerPorId(EjemplarId);
            return elResultado;
        }
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos)
        {
            var laEspecificacion = new Dominio.Especificaciones.Ejemplares();
            IList<LaboratorioTres.Model.Ejemplar> elResultado;
            elResultado = laEspecificacion.EjemplaresNoDevueltos(vencidos);
            return elResultado;
        }
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresPorCliente(int IdCliente)
        {
            var laEspecificacion = new Dominio.Especificaciones.Ejemplares();
            IList<LaboratorioTres.Model.Ejemplar> elResultado;
            elResultado = laEspecificacion.EjemplaresPorCliente(IdCliente);
            return elResultado;
        }
        public IList<LaboratorioTres.Model.Ejemplar> EjemplaresPerdidos(DateTime FechaInicio, DateTime FechaFin)
        {
            var laEspecificacion = new Dominio.Especificaciones.Ejemplares();
            IList<LaboratorioTres.Model.Ejemplar> elResultado;
            elResultado = laEspecificacion.EjemplaresPerdidos(FechaInicio, FechaFin);
            return elResultado;
        }
        public LaboratorioTres.Model.Libro ObtenerLibroPorId(int LibroId)
        {
            var laEspecificacion = new Dominio.Especificaciones.Libros();
            LaboratorioTres.Model.Libro elResultado;
            elResultado = laEspecificacion.ObtenerPorId(LibroId);
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
