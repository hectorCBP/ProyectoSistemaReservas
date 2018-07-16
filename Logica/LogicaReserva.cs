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
            
            return lstRes;
        }

        /**/
        public static void Agregar(Reserva pRes)
        {
            var lst = Listado();
            if (pRes.FechaFin < DateTime.Today) { throw new Exception("La fecha de fin debe ser porsterior o igual a la fecha actual"); }
            if (pRes.FechaFin < pRes.FechaIni) { throw new Exception("La fecha de fin debe ser porsterior o igual a la fecha de inicio"); }
            if (pRes.FechaIni < DateTime.Today) { throw new Exception("La fecha de inicio debe ser porsterior o igual a la fecha actual"); }

            foreach(Reserva res in lst){
                if((pRes.Hab.Numero==res.Hab.Numero && pRes.Hab.Hotel.Nombre==res.Hab.Hotel.Nombre)&&((pRes.FechaIni>=res.FechaIni && pRes.FechaIni<=res.FechaFin)||(pRes.FechaFin>=res.FechaIni && pRes.FechaFin<=res.FechaFin)||(pRes.FechaIni<=res.FechaIni && pRes.FechaFin>=res.FechaFin))){
                    throw new Exception("Esta habitación ya se encuentra reservada en la fecha solicitada.");
                }
            }
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
                throw new Exception("No existen reservas en esta habitación.");

            return lstRes;
        }

        /*actualiza el estado de una reserva
         a finalizado*/
        public static void FinalizarReszerva(Reserva pRes) 
        {

            if (DateTime.Today < pRes.FechaFin)
                throw new Exception("No se puede finalizar reserva, aún no culminó.");
            PersistenciaReserva.FinalizarReserva(pRes);
        }


    }
}
