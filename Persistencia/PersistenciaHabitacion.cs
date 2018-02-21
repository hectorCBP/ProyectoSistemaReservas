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
        public static List<Habitacion> ConReservasActivas()
        {
            List<Habitacion> listaHab = new List<Habitacion>();
            
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("listarHabitacionesActivas", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            Habitacion habitacion = null;
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    habitacion = new Habitacion((int)lector["numero"],
                                                (string)lector["nombre_hotel"],
                                                (string)lector["descripcion"],
                                                (int)lector["cant_huesped"],
                                                (decimal)lector["costo"],
                                                (int)lector["piso"],
                                                (string)lector["estado_reserva"]);
                    listaHab.Add(habitacion);
                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }


            return listaHab;
        }
    }
}
