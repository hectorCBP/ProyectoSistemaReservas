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

        public static void AgregarAdmin(Administrador a)
        {
            PersistenciaAdministrador.AgregarAdmin(a);
        }

        public static void ModificarAdmin(Administrador a)
        {
            PersistenciaAdministrador.ModificarAdmin(a);
        }

        public static void EliminarAdmin(Administrador a)
        {
            PersistenciaAdministrador.EliminarAdmin(a);
        }

        public static Administrador BuscarAdmin(string nombre)
        {
            return PersistenciaAdministrador.BuscarAdmin(nombre);
        }

        //CLIENTE
        public static void AgregarCliente(Cliente cliente)
        {
            PersistenciaCliente.nuevo(cliente);

        }

        public static Cliente BuscarCliente(string pNombre)
        {
            Cliente cli = null;
            cli = PersistenciaCliente.BuscarCliente(pNombre);

            return cli;
        }

        public static List<Cliente> ListarClientes()
        {
            List<Cliente> lista = PersistenciaCliente.ListarClientes();
            return lista;
        }

        public static void AgregarTelefono(Cliente cliente)
        {
            PersistenciaCliente.TelefonosCliente(cliente);
        }
    }
}
