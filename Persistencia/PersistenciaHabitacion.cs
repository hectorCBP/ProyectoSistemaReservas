﻿using System;
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
    }
}
