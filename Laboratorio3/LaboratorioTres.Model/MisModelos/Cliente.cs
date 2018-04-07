using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace LaboratorioTres.Model
{

    public partial class Cliente
    {
        [DataMember]
        [NotMapped]
        public int EdadCliente
        {
            get
            {
                DateTime? Nacimiento = FechaNacimiento;
                DateTime Hoy = DateTime.Today;
                return (int)((Hoy - (DateTime)Nacimiento).TotalDays / (365.25 / 12));
            }
            set { }
        }
    }
}
