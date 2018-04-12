using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace BLApplication
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        //WCF
        [OperationContract]
        IList<LaboratorioTres.Model.Cliente> BuscaAproximadaNombreClientes(string elNombre);

        [OperationContract]
        IList<LaboratorioTres.Model.Cliente> ClientesEjemplarLibro(int idLibro);

        [OperationContract]
        IList<LaboratorioTres.Model.Ejemplar> ListarAproximadaEjemplares(bool busquedaExacta, string elNombre);

        [OperationContract]
        LaboratorioTres.Model.Ejemplar ObtenerPorId(int EjemplarId);

        [OperationContract]
        IList<LaboratorioTres.Model.Ejemplar> EjemplaresNoDevueltos(bool vencidos);

        [OperationContract]
        IList<LaboratorioTres.Model.Ejemplar> EjemplaresPorCliente(int IdCliente);

        [OperationContract]
        IList<LaboratorioTres.Model.Ejemplar> EjemplaresPerdidos(DateTime FechaInicio, DateTime FechaFin);

        [OperationContract]
        LaboratorioTres.Model.Libro ObtenerLibroPorId(int LibroId);

        //Otro
        [OperationContract]
        string GetData(int value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);
        // TODO: Add your service operations here
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
