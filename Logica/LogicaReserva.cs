using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaReserva
    {
        /*obtiene el listado de reservas
         con estado activo*/
        public static List<Reserva> Listado()
        {
            List<Reserva> lstRes = new List<Reserva>();
            lstRes = PersistenciaReserva.Listado();

            if (lstRes.Count == 0)
                throw new Exception("No existen reservas activas");

            return lstRes;
        }

        /**/
        public static List<Reserva> ListadoCliente(string nombre)
        {
            List<Reserva> lstRes = new List<Reserva>();
            lstRes = PersistenciaReserva.ListadoCliente(nombre);

            if (lstRes.Count == 0)
                throw new Exception("No existen reservas activas");

            return lstRes;
        }

        /**/
        public static void Agregar(Reserva pRes)
        {
            PersistenciaReserva.Agregar(pRes);
        }
        
        /**/
        public static void Cancelar(Reserva pRes)
        {
            PersistenciaReserva.Cancelar(pRes);
        }
        
        /**/
        public static Reserva Buscar(int num)
        {
            return PersistenciaReserva.Buscar(num);
        }

        /*retorna el listado de reservas
        para una habitacion especifica*/
        public static List<Reserva> ListarPorHabitacion(Habitacion hab, string filtro)
        {
            List<Reserva> lstRes = new List<Reserva>();
            lstRes = PersistenciaReserva.ListarPorHabitacion(hab, filtro);

            if (lstRes.Count == 0)
                throw new Exception("No existen reservas en está habitación");

            return lstRes;
        }

        /*actualiza el estado de una reserva
         a finalizado*/
        public static void FinalizarReszerva(Reserva pRes) ////////////arreglar esto (solucionado en BD queda en Logica)
        {
            PersistenciaReserva.FinalizarReserva(pRes);
        }


    }
}
