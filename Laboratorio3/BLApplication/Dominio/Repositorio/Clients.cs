using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaboratorioTres.Model;


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

        internal IList<LaboratorioTres.Model.Cliente> ListarAproximadaNombreClientes(bool busquedaExacta, string elNombre)
        {
            IList<LaboratorioTres.Model.Cliente> resultado = null;

            if (busquedaExacta)
                resultado = _context.Cliente.Where(p => p.Nombre.Equals(elNombre)).OrderBy(p => p.Nombre).ToList();
            else
                resultado = _context.Cliente.Where(p => p.Nombre.Contains(elNombre)).OrderByDescending(p => p.Nombre).ToList();
  
            return resultado;

        }
    }
}