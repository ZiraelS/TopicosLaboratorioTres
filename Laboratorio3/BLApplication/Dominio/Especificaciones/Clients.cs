using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaboratorioTres.Model;

namespace BLApplication.Dominio.Especificaciones
{
    public class Clients
    {
        public IList<LaboratorioTres.Model.Cliente> ListarAproximadaNombreClientes(string elNombre)
        {
            var laAccion = new Dominio.Acciones.Clients();
            return laAccion.ListarAproximadaNombreClientes(elNombre);
        }

        //public IList<LaboratorioTres.Model.Cliente> ListarLibrosSolicitadosPorCliente(string elCliente)
        //{
        //    var laAccion = new Dominio.Acciones.Clients();
        //    return laAccion.ListarLibrosSolicitadosPorCliente(elCliente);
        //}
    }
}