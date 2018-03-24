using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Acciones
{
    public class Clients
    {
        public IList<Model.Client> ListarAproximadaNombreClientes(string elNombre)
        {
            var elRepositorio = new Dominio.Repositorio.Clients();
            return elRepositorio.ListarAproximadaNombreClientes(elNombre);
        }

        public IList<Model.Client> ListarLibrosSolicitadosPorCliente(string elCliente)
        {
            var elRepositorio = new Dominio.Repositorio.Clients();
            return elRepositorio.ListarAproximadaNombreClientes(elCliente);
        }
    }
}