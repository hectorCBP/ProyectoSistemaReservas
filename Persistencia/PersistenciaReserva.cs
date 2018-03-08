using System;
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
            List<Reserva> lstRes = new List<Reserva>();
            SqlConnection cnn = new SqlConnection(Constantes.CONEXION);
            SqlCommand cmd = new SqlCommand("reservasActivas", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    //Reserva reserva = new Reserva(
                  //      (int)lector["numero"],
                 //       (DateTime)lector["fecha_inicio"],
                 //       (DateTime)lector["fecha_final"],
                  //      (string)lector["nombre_cliente"],          ESTA MAL USADO ESTE CONSTRUCTOR, hay que usar el buscar usuario para pasarle usuarios como parametro
                  //      (int)lector["numero_hab"],
                  //      (string)lector["nombre_hotel"],
                  //      (string)lector["estado_reserva"]);
                  //  lstRes.Add(reserva);
                }
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
            return lstRes;
        }
    }
}
