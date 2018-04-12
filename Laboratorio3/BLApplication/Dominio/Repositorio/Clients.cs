using LaboratorioTres.Model;
using System.Collections.Generic;
using System.Linq;


namespace BLApplication.Dominio.Repositorio
{
    public class Clients
    {
        private static LaboratorioTres.Model.LaboratorioTresEntities _context = new LaboratorioTresEntities();


        public Clients()
        {
            _context.Configuration.ProxyCreationEnabled = false;
            _context.Configuration.LazyLoadingEnabled = true;
        }

        public Clients(bool enableLazyLoading)
        {
            _context.Configuration.LazyLoadingEnabled = enableLazyLoading;
        }

        public IList<LaboratorioTres.Model.Cliente> ListarAproximadaNombreClientes(bool busquedaExacta, string elNombre)
        {
            IList<LaboratorioTres.Model.Cliente> resultado = null;

            if (busquedaExacta)
                resultado = _context.Cliente.Where(p => p.Nombre.Equals(elNombre)).OrderBy(p => p.Nombre).ToList();
            else
                resultado = _context.Cliente.Where(p => p.Nombre.Contains(elNombre)).OrderByDescending(p => p.Nombre).ToList();

            return resultado;

        }

        public IList<LaboratorioTres.Model.Cliente> ClientesEjemplarLibro(int idLibro)
        {
            IList<LaboratorioTres.Model.Cliente> Clientes = null;
            IList<LaboratorioTres.Model.PrestamoEjemplar> PrestamoEjemplar = null;


            //Clientes que han solicitado algún ejemplar de un determinado libro	
            PrestamoEjemplar = _context.PrestamoEjemplar.Where(p => p.Ejemplar.IdLibro == idLibro).ToList();
            Clientes = PrestamoEjemplar.Select(p => p.Cliente).ToList();
            return Clientes;

        }
    }
}