using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaUsuario
    {
        public static Usuario Logueo(string pUsu, string pPass)
        {
            Usuario usuario = null;
            usuario = PersistenciaCliente.InicioSesion(pUsu, pPass);

            
            if (usuario == null)
                usuario = PersistenciaAdministrador.InicioSesion(pUsu, pPass);
            
            return usuario;
        }
    }
}
