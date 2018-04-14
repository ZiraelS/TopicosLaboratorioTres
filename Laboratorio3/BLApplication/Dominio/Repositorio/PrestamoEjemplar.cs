using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LaboratorioTres.Model;

namespace BLApplication.Dominio.Repositorio
{
    public class PrestamoEjemplar
    {

        private static LaboratorioTres.Model.TopicosLaboratorioTresEntities _context = new TopicosLaboratorioTresEntities();

        public PrestamoEjemplar()
        {
            _context.Configuration.ProxyCreationEnabled = false;
            _context.Configuration.LazyLoadingEnabled = true;
        }

        public PrestamoEjemplar(bool enableLazyLoading)
        {
            _context.Configuration.LazyLoadingEnabled = enableLazyLoading;
        }

    }
}