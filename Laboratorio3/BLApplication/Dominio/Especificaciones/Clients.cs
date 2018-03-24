using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Especificaciones
{
    public class Clients
    {
        public IList<Model.Client> ListarAproximadaNombreClientes(string elNombre)
        {
            var laAccion = new Dominio.Acciones.Clients();
            return laAccion.ListarAproximadaNombreClientes(elNombre);
        }

        public IList<Model.Client> ListarLibrosSolicitadosPorCliente(string elCliente)
        {
            var laAccion = new Dominio.Acciones.Clients();
            return laAccion.ListarLibrosSolicitadosPorCliente(elCliente);
        }
    }
}