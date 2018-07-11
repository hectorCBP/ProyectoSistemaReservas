using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Reserva
    {
        // atributos
        private int numero;
        private string estado_reserva;
        private Cliente cli;
        private Habitacion hab;
        private DateTime fechaIni, fechaFin;

        // propiedades
        public int Numero
        {
            get { return numero; }
            set { numero = value; }
        }       
        public string EstadoRes
        {
            get { return estado_reserva; }
            set
            {
                if (value.Trim().ToUpper() == "ACTIVA" || value.Trim().ToUpper() == "CANCELADA" || value.Trim().ToUpper() == "FINALIZADA")
                { estado_reserva = value; }
                else throw new Exception("El valor ingresado no es válido. \n\tEl estado de la reserva debe ser CINTURON, ISOFIX O LATCH.");
            }
        }
        public Cliente Cli
        {
            set {
                if (value == null)
                    throw new Exception("La reserva debe tener cliente");
                else
                    cli = value;
            }
            get { return cli; } 
        }

        public Habitacion Hab
        {
            set
            {
                if (value == null)
                    throw new Exception("La reserva debe tener habitacion");
                else
                    hab = value;
            }
            get { return hab; }
        }

        public DateTime FechaIni
        {
            get { return fechaIni; }
            set
            {
                fechaIni = value;

            }
        }
        public DateTime FechaFin
        {
            get { return fechaFin; }
            set
            {
                int dias = (int)(value - fechaIni).TotalDays + 1;

                if (dias < 0)
                    throw new Exception("La fecha de fin de la reserva debe ser posterior a la fecha de inicio.");
                else
                fechaFin = value;
            }
        }

        // constructor
        public Reserva(int pNumero, DateTime pFechaIni, DateTime pFechaFin, string pEstadoRes, Cliente pCli, Habitacion pHab)
        {
            Numero = pNumero;
            FechaIni = pFechaIni;
            FechaFin = pFechaFin;
            Cli = pCli;
            Hab = pHab;           
            EstadoRes = pEstadoRes;
        }

        //operaciones
        public decimal CalcularCosto() { 
            decimal resp;

            int dias = (int)(fechaFin - fechaIni).TotalDays + 1;
            resp = dias * hab.Costo;

            return resp;
        }
    }
}
