using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Reserva
    {
        // atributos
        private int numero, numero_hab;
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
            set { estado_reserva = value; }
        }
        public Cliente Cli
        { get { return cli; } }

        public Habitacion Hab
        { get { return hab; } }

        public DateTime FechaIni
        {
            get { return fechaIni; }
            set { fechaIni = value; }
        }
        public DateTime FechaFin
        {
            get { return fechaFin; }
            set { fechaFin = value; }
        }

        // constructor
        public Reserva(int pNumero, DateTime pFechaIni, DateTime pFechaFin, string pEstadoRes, Cliente pCli, Habitacion pHab)
        {
            Numero = pNumero;
            FechaIni = pFechaIni;
            FechaFin = pFechaFin;
            cli = pCli;
            hab = pHab;           
            EstadoRes = pEstadoRes;
        }
    }
}
