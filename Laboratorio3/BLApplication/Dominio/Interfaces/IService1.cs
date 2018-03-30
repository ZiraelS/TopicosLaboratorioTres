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
        IList<Modelo.Client> BuscaAproximadaNombreClientes(string elNombre);

        [OperationContract]
        IList<Modelo.Library> BuscaAproximadaTituloLibro(string elTitulo);

        [OperationContract]
        IList<Modelo.Library> BuscaExactaIdentificadorLibro(string elIdentificador);

        [OperationContract]
        IList<Modelo.Library> LibrosNoDevueltosEntregaNoVencida(string Valididacion);

        [OperationContract]
        IList<Modelo.Library> LibrosNoDevueltosEntregaVencida(string Valididacion);

        [OperationContract]
        IList<Modelo.Client> LibrosSolicitadosPorCliente(string elCliente);

        [OperationContract]
        IList<Modelo.Library> ClientesSolicitadoLibro(string elLibro);

        [OperationContract]
        IList<Modelo.Library> LibrosPerdidosIntervalo(string ValidacionPerdido, DateTime fecha1, DateTime fecha2);

        [OperationContract]
        IList<Modelo.Library> LibrosPerdidos(string ValidacionPerdido);


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
