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
        public static List<Habitacion> ConReservasActivas()
        {
            List<Habitacion> listHab = PersistenciaHabitacion.ConReservasActivas();

            if (listHab.Count() == 0)
                throw new Exception("No existen habitaciones con reservas activas");

            return listHab;
        }
    }
}
