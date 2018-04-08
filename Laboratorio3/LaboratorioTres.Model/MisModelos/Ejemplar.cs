using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace LaboratorioTres.Model
{
    public partial class Ejemplar
    {
        [DataMember]
        [NotMapped]
        public int Antiguedad
        {
            get
            {
                DateTime FechaDeDonacion = FechaDonacion == null ? DateTime.Today : (DateTime)FechaDonacion;
                return (int)((DateTime.Today - (DateTime)FechaDeDonacion).TotalDays / (365.25 / 12));
            }
            //set { }
        }
    }
}
