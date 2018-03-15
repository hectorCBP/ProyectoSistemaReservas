using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaCliente
    {
        public static bool Agregar( Cliente cliente )
        {
            return PersistenciaCliente.nuevo(cliente);

        }

        public static object ListarClientes()
        {
            List<Cliente> lista = PersistenciaCliente.ListarClientes();
            return lista;
        }

        public static bool AgregarTelefono(Cliente cliente)
        {
            return PersistenciaCliente.TelefonosCliente(cliente);
        }
    }
}
