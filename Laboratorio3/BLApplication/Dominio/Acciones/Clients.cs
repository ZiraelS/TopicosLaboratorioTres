﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Acciones
{
    public class Clients
    {
        public IList<LaboratorioTres.Model.Cliente> ListarAproximadaNombreClientes(string elNombre)
        {
            var elRepositorio = new Dominio.Repositorio.Clients();
            return elRepositorio.ListarAproximadaNombreClientes(false,elNombre);
        }
        public IList<LaboratorioTres.Model.Cliente> ClientesEjemplarLibro(int idLibro)
        {
            var elRepositorio = new Dominio.Repositorio.Clients();
            return elRepositorio.ClientesEjemplarLibro(idLibro);
        }
     }
}