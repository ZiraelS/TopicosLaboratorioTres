using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace LaboratorioTres.Model
{
    public partial class PrestamoEjemplar
    {
        [DataMember]
        [NotMapped]
        public int DiasDeAtraso
        {
            get
            {
                DateTime FechaEnQueFueDevuelto = FechaDevuelto == null ? (DateTime)FechaDevolucion : (DateTime)FechaDevuelto;
                return Math.Abs(((FechaEnQueFueDevuelto - (DateTime)FechaDevolucion).Days));
            }
            //set { }
        }

        [DataMember]
        [NotMapped]
        public int DiasHabilesDePrestamo
        {
            get
            {
                //https://stackoverflow.com/questions/1617049/calculate-the-number-of-business-days-between-two-dates?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

                DateTime from = (DateTime)FechaDevolucion;
                DateTime to = FechaDevuelto == null ? (DateTime)FechaDevolucion : (DateTime)FechaDevuelto;

                var dayDifference = (int)to.Subtract(from).TotalDays;
                return Enumerable
                    .Range(1, dayDifference)
                    .Select(x => from.AddDays(x))
                    .Count(x => x.DayOfWeek != DayOfWeek.Saturday && x.DayOfWeek != DayOfWeek.Sunday);
            }
            //set { }
        }

    }
}
