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
    }
}
