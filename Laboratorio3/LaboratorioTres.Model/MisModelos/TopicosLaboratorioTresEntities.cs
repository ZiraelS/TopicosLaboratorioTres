using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LaboratorioTres.Model.MisModelos
{
    public partial class TopicosLaboratorioTresEntities : DbContext
    {
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<PrestamoEjemplar>().HasKey(p=>p.PrestamoEjemplarID);
            //modelBuilder.Entity<PrestamoEjemplar>().ToTable("PrestamoEjemplar");
            //modelBuilder.Entity<Ejemplar>().ToTable("Ejemplar");
        }
    }
}
