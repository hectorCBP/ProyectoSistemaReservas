using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaAdministrador
    {
        public static List<Administrador> ListarAdmins()
        {
            List<Administrador> lista = PersistenciaAdministrador.ListarAdmins();
            return lista;
        }

    }
}
