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

        public static bool AgregarAdmin(Administrador a)
        {
            return PersistenciaAdministrador.AgregarAdmin(a);
        }

        public static bool ModificarAdmin(Administrador a)
        {
            return PersistenciaAdministrador.ModificarAdmin(a);
        }

        public static bool EliminarAdmin(Administrador a)
        {
            return PersistenciaAdministrador.EliminarAdmin(a);
        }
    }
}
