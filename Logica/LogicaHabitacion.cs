using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaHabitacion
    {
        /*listar habitacion de hotel*/
        public static List<Habitacion> ListadoHabitaciones(string nombreHotel)
        {
            List<Habitacion> lstHab = PersistenciaHabitacion.ListadoHabitaciones(nombreHotel);

            if (lstHab.Count == 0)
                throw new Exception("No existen habitaciones registradas");

            return lstHab;
        }

        /*obtener habitacion de un hotel*/
        public static Habitacion ObtenerHabitacion(string nomHotel, int numeroHab) //preguntar si esto esta bien asi
        {
            return PersistenciaHabitacion.ObtenerHabitacion(nomHotel, numeroHab);
        }

        /*agregar una habitacion*/
        public static void Agregar(Habitacion habitacion)
        {
            try
            {
                if (habitacion.Costo <= 0)
                    throw new Exception("El costo de habitción debe ser mayor a cero");

                PersistenciaHabitacion.Agregar(habitacion);
            }
            catch (Exception ex)
            { throw ex; }

        }

        /*modificar una habitacion*/
        public static void Modificar(Habitacion habitacion)
        {
            try
            {
                if (habitacion.Costo <= 0)
                    throw new Exception("El costo de habitción debe ser mayor a cero");
                    
                PersistenciaHabitacion.Modificar(habitacion);
            }
            catch (Exception ex)
            { throw ex; }
        }

        /*eliminar una habitacion*/
        public static void Eliminar(Habitacion pHabitacion)
        {
            PersistenciaHabitacion.Eliminar(pHabitacion);
        }

    }
}
