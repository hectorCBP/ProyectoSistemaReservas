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
        public static void Agregar( Cliente cliente, List<TelefonoCliente> listaTelefonos )
        {
            PersistenciaCliente.nuevo(cliente);

            // TO DO FIX THIS
            // ERROR NOT ROLLBACK NEW CLIENT IF PHONE
            // IS ALREADY INSERT
            /*
            foreach(TelefonoCliente tel in listaTelefonos)
            {
                PersistenciaCliente.nuevo(tel);
            }
            */
        }

        public static Cliente Buscar(string pNombre)
        {
            Cliente cli = null;
            cli = PersistenciaCliente.BuscarCliente(pNombre);

            return cli;
        }

        public static object ListarClientes()
        {
            List<Cliente> lista = PersistenciaCliente.ListarClientes();
            return lista;
        }
    }
}
