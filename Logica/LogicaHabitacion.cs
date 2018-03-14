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
        public static List<Habitacion> ListadoHabitaciones(string nombreHotel)
        {
            List<Habitacion> lstHab = PersistenciaHabitacion.ListadoHabitaciones(nombreHotel);

            if (lstHab.Count == 0)
                throw new Exception("No existen habitaciones registradas");

            return lstHab;
        }

        public static Habitacion ObtenerHabitacion(string nomHotel, int numeroHab) 
        {
            Habitacion habitacion = PersistenciaHabitacion.ObtenerHabitacion(nomHotel, numeroHab);

            if (habitacion == null)
                throw new Exception("No existe número de habitación");

            return habitacion;
        }

        public static void Agregar(Habitacion habitacion)
        {
            PersistenciaHabitacion.Agregar(habitacion);
        }

        public static void Modificar(Habitacion habitacion)
        {
            PersistenciaHabitacion.Modificar(habitacion);
        }

    }
}
