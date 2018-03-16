using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaHabitacion
    {
        public static List<Habitacion> ListadoHabitaciones(string nombreHotel)
        {
            List<Habitacion> lstHab = new List<Habitacion>();
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("listarHabitacionesDeHotel", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", nombreHotel);
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Habitacion habitacion = new Habitacion(
                        (int)lector["numero"],
                        (string)lector["nombre_hotel"],
                        (string)lector["descripcion"],
                        (int)lector["cant_huesped"],
                        (decimal)lector["costo"],
                        (int)lector["piso"]);
                    lstHab.Add(habitacion);
                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }

            return lstHab;
        }


        public static Habitacion ObtenerHabitacion(string nomHotel, int numeroHab)

        {
            Habitacion habitacion = null;
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("obtenerHabitacionDeHotel", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombreHotel", nomHotel);
            cmd.Parameters.AddWithValue("@numeroHabitacion", numeroHab);
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while(lector.Read())
                {
                    habitacion = new Habitacion(
                        (int)lector["numero"],
                        (string)lector["nombre_hotel"],
                        (string)lector["descripcion"],
                        (int)lector["cant_huesped"],
                        (decimal)lector["costo"],
                        (int)lector["piso"]);
                }
            }
             catch (Exception e)
            { throw e; }
            finally
            { cnn.Close(); }
            return habitacion;
        }
        /*AGREGAR*/
        public static void Agregar(Habitacion habitacion)
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);

            SqlCommand cmd = new SqlCommand("agregarHabitacion", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@numero", habitacion.Numero);
            cmd.Parameters.AddWithValue("@nombreHotel",habitacion.NombreHotel);
            cmd.Parameters.AddWithValue("@descripcion",habitacion.Descripcion);
            cmd.Parameters.AddWithValue("@cantHuesped",habitacion.CantHuesped);
            cmd.Parameters.AddWithValue("@costo",habitacion.Costo);
            cmd.Parameters.AddWithValue("@piso",habitacion.Piso);

            SqlParameter respSQL = new SqlParameter();
            respSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(respSQL);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int respuesta = (int)respSQL.Value;
                if (respuesta == -1)
                    throw new Exception("Este número de habitación ya existe");
                if (respuesta == -2)
                    throw new Exception("ERROR SQL");

            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
        }
        /*MODIFICAR*/
        public static void Modificar(Habitacion habitacion)
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);

            SqlCommand cmd = new SqlCommand("modificarHabitacion", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@numero", habitacion.Numero);
            cmd.Parameters.AddWithValue("@nombreHotel", habitacion.NombreHotel);
            cmd.Parameters.AddWithValue("@descripcion", habitacion.Descripcion);
            cmd.Parameters.AddWithValue("@cantHuesped", habitacion.CantHuesped);
            cmd.Parameters.AddWithValue("@costo", habitacion.Costo);
            cmd.Parameters.AddWithValue("@piso", habitacion.Piso);

            SqlParameter respSQL = new SqlParameter();
            respSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(respSQL);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int respuesta = (int)respSQL.Value;
                if (respuesta == -1)
                    throw new Exception("Este número de habitación no existe");
                if (respuesta == -2)
                    throw new Exception("ERROR SQL");
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
        }
        /*ELIMINAR*/
        public static void Eliminar(string nomHotel, string numeroHab)
        {
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("eliminarHabitacion", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nomHotel", nomHotel);
            cmd.Parameters.AddWithValue("@numeroHab", Convert.ToInt32(numeroHab));

            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int res = (int)resSQL.Value;
                if(res == -1)
                    throw new Exception ("ERROR - Numero de habitación no registrado");
                if(res == -2)
                    throw new Exception ("ERROR al eliminar reservas asociadas");
                if(res == -3)
                    throw new Exception ("ERROR SQL al eliminar habitación");
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
        }
    }
}
