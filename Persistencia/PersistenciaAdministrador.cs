﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaAdministrador
    {
        public static Administrador InicioSesion(string pNombre, string pClave)
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("buscarAdministrador", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", pNombre);
            cmd.Parameters.AddWithValue("@clave", pClave);

            Administrador admin = null;

            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();

                if (lector.HasRows)
                {
                    lector.Read();

                    string nombre = (string)lector["nombre"];
                    string nombreCompleto = (string)lector["nombre_completo"];
                    string clave = (string)lector["clave"];
                    string cargo = (string)lector["cargo"];

                    admin = new Administrador(nombre, nombreCompleto, clave, cargo);
                }
                lector.Close();
            }
            catch (Exception e)
            { throw e; }
            finally
            { cnn.Close(); }
            return admin;
        }

        public static List<Administrador> ListarAdmins()
        {

            List<Administrador> resp = new List<Administrador>(); //creo una lista para guardar los admins que saque de la base
            Administrador a;
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("ListarAdmins", cnn); //le digo al comando que quiero traer ese sp
            cmd.CommandType = CommandType.StoredProcedure; // es un sp
            try
            {
                cnn.Open();
                SqlDataReader dr = cmd.ExecuteReader(); //ejecuto 
                while (dr.Read()) //leo
                {
                    a = new Administrador((string)dr[0], (string)dr[2], (string)dr[1], (string)dr[3]); // creo un admin con los datos del reader

                    resp.Add(a);

                }
            }
            catch (Exception ex) { throw ex; }

            return resp;
        }

        public static bool AgregarAdmin(Administrador a)
        {
            bool resp = false;

            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("agregarAdministrador", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            //le paso como parametros la devolucion de las propiedades del cliente que recibe
            cmd.Parameters.AddWithValue("nombre", a.Nombre);
            cmd.Parameters.AddWithValue("nombreCompleto", a.NombreCompleto);
            cmd.Parameters.AddWithValue("clave", a.Clave);
            cmd.Parameters.AddWithValue("cargo", a.Cargo);

            SqlParameter pReturn = new SqlParameter(); //para capturar el retorno
            pReturn.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(pReturn);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                int ret = (int)pReturn.Value; //paso el retorno a un int para tenerlo mas facil
                if (ret == 1) //si es 1 se agrego correctamente
                    resp = true; //cambio el bool de respuesta a true
                else if (ret == -1)
                    throw new Exception("Ya existe un Administrador con ese nombre.");
                else if (ret == -2)
                    throw new Exception("Error con la base de datos");

            }
            catch (Exception ex) { throw ex; }
            finally { cnn.Close(); }

            return resp;
        }

        public static bool ModificarAdmin(Administrador a)
        {
            return false;
        }
    }
}
