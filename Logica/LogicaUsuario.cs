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
        //USUARIO
        public static Usuario Logueo(string pUsu, string pPass)
        {
            Usuario usuario = null;
            usuario = PersistenciaCliente.InicioSesion(pUsu, pPass);

            
            if (usuario == null)
                usuario = PersistenciaAdministrador.InicioSesion(pUsu, pPass);
            
            return usuario;
        }

        //ADMINISTRADOR
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

        public static Administrador BuscarAdmin(string nombre)
        {
            return PersistenciaAdministrador.BuscarAdmin(nombre);
        }

        //CLIENTE
        public static bool AgregarCliente(Cliente cliente)
        {
            return PersistenciaCliente.nuevo(cliente);

        }

        public static Cliente BuscarCliente(string pNombre)
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

        public static bool AgregarTelefono(Cliente cliente)
        {
            return PersistenciaCliente.TelefonosCliente(cliente);
        }
    }
}
