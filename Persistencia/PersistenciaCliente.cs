using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaCliente
    {
        public static Cliente InicioSesion(string pNombre, string pClave)
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("buscarCliente", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", pNombre);
            cmd.Parameters.AddWithValue("@clave", pClave);

            Cliente cliente = null;

            try {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();

                if (lector.HasRows)
                {
                    lector.Read();

                    string nombre = (string)lector["nombre"];
                    string direccion = (string)lector["direccion"];
                    string tarjeta = (string)lector["numero_tarjeta_credito"];
                    string nombreCompleto = (string)lector["nombre_completo"];
                    string clave = (string)lector["clave"];

                    cliente = new Cliente(nombre, nombreCompleto, clave, direccion, tarjeta);
                }
                lector.Close();
            }
            catch (Exception e)
            { throw e; }
            finally
            { cnn.Close(); }
            return cliente;
        }

        public static void nuevo( Cliente cliente )
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);

            // TO DO make a sp with phones insert!
            SqlCommand cmd = new SqlCommand("agregarCliente", cnn);
            cmd.CommandType = CommandType.StoredProcedure; 
            cmd.Parameters.AddWithValue("@nombre",cliente.Nombre);
            cmd.Parameters.AddWithValue("@clave",cliente.Clave);
            cmd.Parameters.AddWithValue("@nombreCompleto",cliente.NombreCompleto);
            cmd.Parameters.AddWithValue("@direccion",cliente.Direccion);
            cmd.Parameters.AddWithValue("@numeroTarjeta",cliente.Tarjeta);

            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);

            try 
            { 
                cnn.Open();
                cmd.ExecuteNonQuery();
                int resp = (int)resSQL.Value;

                if (resp == -1)
                    throw new Exception("Ya existe éste usuario");
            } 
            catch(Exception ex)
            { throw ex; }
            finally { cnn.Close(); }
        }

        // THIS IS A BUG!!!!!!!
        /*
        public static void nuevo(TelefonoCliente telefono)
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);

            SqlCommand cmd = new SqlCommand("agregarTelefonosCliente", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", telefono.NombreCliente);
            cmd.Parameters.AddWithValue("@telefono", telefono.Telefono);
            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int resp = (int)resSQL.Value;

                if (resp == -1)
                    throw new Exception("Ya existe éste teléfono");
            }
            catch (Exception ex)
            { throw ex; }
            finally { cnn.Close(); }         
        }
        */

        public static List<Cliente> ListarClientes()
        {
            List<Cliente> resp = new List<Cliente>(); //creo una lista para guardar los clientes que saque de la base
            Cliente a;
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("ListarClientes", cnn); //le digo al comando que quiero traer ese sp
            cmd.CommandType = CommandType.StoredProcedure; // es un sp
            try
            {
                cnn.Open();
                SqlDataReader dr = cmd.ExecuteReader(); //ejecuto 
                while (dr.Read()) //leo
                {
                    a = new Cliente((string)dr[0], (string)dr[2], (string)dr[1], (string)dr[3], (string)dr[4]); // creo un admin con los datos del reader

                    resp.Add(a);

                }
            }
            catch (Exception ex) { throw ex; }

            return resp;
        }
    }
}
