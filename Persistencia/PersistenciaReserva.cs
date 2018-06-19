﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaReserva
    {
        public static List<Reserva> Listado()
        {
            List<Reserva> resp = new List<Reserva>();
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("reservasActivas", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {       
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {

                    Cliente cliente = PersistenciaCliente.BuscarCliente((string)lector["nombre_cli"]);
                    Habitacion habitacion = PersistenciaHabitacion.ObtenerHabitacion((string)lector["nombre_hotel"], (int)lector["numero_hab"]);
                    Reserva reserva = new Reserva(
                        (int)lector["numero"],
                        (DateTime)lector["fecha_inicio"],
                        (DateTime)lector["fecha_final"],
                        (string)lector["estado_reserva"],
                         cliente,
                         habitacion);
                    resp.Add(reserva);

                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
            return resp;
        }

        public static void Agregar(Reserva pRes)
        {   
            
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("RealizarReserva", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@F_fin", pRes.FechaFin);
            cmd.Parameters.AddWithValue("@F_inicio", pRes.FechaIni);
            cmd.Parameters.AddWithValue("@Nombre_Cli", pRes.Cli.Nombre);
            cmd.Parameters.AddWithValue("@Numero_Hab", pRes.Hab.Numero);
            cmd.Parameters.AddWithValue("@Nombre_Hotel", pRes.Hab.Hotel.Nombre);

            SqlParameter prmRetorno = new SqlParameter();
            prmRetorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(prmRetorno);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                int resp = (int)prmRetorno.Value;
                if (resp == -1)
                    throw new Exception("No existe el cliente ingresado.");
                if (resp == -2)
                    throw new Exception("Fecha de fin debe ser posterior a la fecha de inicio.");
                if (resp == -3)
                    throw new Exception("Esta habitación ya se encuentra reservada en la fecha solicitada.");
                
                if ((resp < 0) && (resp != -1) && (resp != -2) && (resp != -3) && (resp != -4))
                    throw new Exception("ERROR de SQL.");

            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
        }

        public static void Cancelar(int num)
        {
            
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("CancelarReserva", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@numero", num);
            

            SqlParameter prmRetorno = new SqlParameter();
            prmRetorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(prmRetorno);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                int resp = (int)prmRetorno.Value;
                if (resp == 1)
                    throw new Exception("Reserva cancelada satisfactoriamente.");
                

                if ((resp < 0))
                    throw new Exception("ERROR de SQL.");

            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
            
        }

        public static Reserva Buscar(int num)
        {
            Reserva resp = null;
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("BuscarReserva", cnn);
            cmd.Parameters.AddWithValue("@Numero", num);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Cliente cli = PersistenciaCliente.BuscarCliente((string)lector["nombre_cli"]);

                    var hab = PersistenciaHabitacion.ObtenerHabitacion((string)lector["nombre_hotel"], (int)lector["numero_hab"]);

                    resp = new Reserva((int)lector["numero"], (DateTime)lector["fecha_inicio"], (DateTime)lector["fecha_final"], (string)lector["estado_reserva"],
                         cli, hab);
                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
            return resp;
        }

        public static List<Reserva> ListadoCliente(string nombre_cliente)
        {
            List<Reserva> resp = new List<Reserva>();
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("reservasActivasCliente", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", nombre_cliente);
            try
            {

                //int numero_res=-1;
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {


                    Cliente cli = PersistenciaCliente.BuscarCliente((string)lector["nombre_cli"]);

                    Habitacion hab = PersistenciaHabitacion.ObtenerHabitacion((string)lector["nombre_hotel"], (int)lector["numero_hab"]);
                    Reserva r = new Reserva((int)lector["numero"], (DateTime)lector["fecha_inicio"], (DateTime)lector["fecha_final"], (string)lector["estado_reserva"],
                         cli, hab);

                    //resp.Add(r);
                    //numero_res = (int)lector["numero"];
                    resp.Add(r);

                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
            return resp;
        }

        public static List<Reserva> ListarPorHabitacion(string numeroHab, string nomHotel, string filtro)
        {
            List<Reserva> lstRes = new List<Reserva>();
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);

            SqlCommand cmd = new SqlCommand("listadoReservasCronologica", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@numeroHab", Convert.ToInt32(numeroHab));
            cmd.Parameters.AddWithValue("@nombreHotel", nomHotel);
            cmd.Parameters.AddWithValue("@filtro", filtro);

            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Cliente cliente = PersistenciaCliente.BuscarCliente((string)lector["nombre_cli"]);
                    Habitacion habitacion = PersistenciaHabitacion.ObtenerHabitacion((string)lector["nombre_hotel"], (int)lector["numero_hab"]);
                    Reserva reserva = new Reserva(
                        (int)lector["numero"], 
                        (DateTime)lector["fecha_inicio"], 
                        (DateTime)lector["fecha_final"], 
                        (string)lector["estado_reserva"],
                         cliente,
                         habitacion);
                    lstRes.Add(reserva);
                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
            return lstRes;
        }

        public static void FinalizarReserva(int numero)
        {
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("finalizarReserva", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", numero);

            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                int res = (int)resSQL.Value;
                if (res == -1)
                    throw new Exception("ERROR - No se completo la actualización");
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
        }
    }
}
