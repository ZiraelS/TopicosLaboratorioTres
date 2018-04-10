using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLApplication.Dominio.Especificaciones
{
    public class Libros
    {
        public LaboratorioTres.Model.Libro ObtenerPorId(int LibroId)
        {
            var laAccion = new Dominio.Acciones.Libros();
            return laAccion.ObtenerPorId(LibroId);
        }
    }
}