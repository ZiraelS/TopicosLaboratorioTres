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
                DateTime FechaDeNacimiento = FechaNacimiento == null ? DateTime.Today : (DateTime)FechaNacimiento;
                return (int)((DateTime.Today - (DateTime)FechaDeNacimiento).TotalDays / (365.25 / 12));
            }
            //set { }
        }

        [DataMember]
        [NotMapped]
        public String DescripcionSexo
        {
            get
            {
                String LetraSexo = Sexo == null ? "D" : (String)Sexo;
                if (LetraSexo == "F")
                {
                    return "Femenino";
                }
                else if (LetraSexo == "M")
                {
                    return "Maculino";
                }
                else
                {
                    return "Desconocido";
                }
            }
            //set { }
        }
    }
}
