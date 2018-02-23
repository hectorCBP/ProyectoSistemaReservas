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
        private string estado_reserva, nombre_cliente, nombre_hotel;
        private DateTime fechaIni, fechaFin;

        // propiedades
        public int Numero
        {
            get { return numero; }
            set { numero = value; }
        }
        public int NumeroHab 
        {
            get { return numero_hab; }
            set { numero_hab = value; }
        }
        public string EstadoRes
        {
            get { return estado_reserva; }
            set { estado_reserva = value; }
        }
        public string NombreCli
        {
            get { return nombre_cliente; }
            set { nombre_cliente = value; }
        }
        public string NombreHotel
        {
            get { return nombre_hotel; }
            set { nombre_hotel = value; }
        }
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
        public Reserva(int pNumero, DateTime pFechaIni, DateTime pFechaFin,
                       string pNomCli, int pNumHab, string pNomHotel, string pEstadoRes)
        {
            Numero = pNumero;
            FechaIni = pFechaIni;
            FechaFin = pFechaFin;
            NombreCli = pNomCli;
            NumeroHab = pNumHab;
            NombreHotel = pNomHotel;
            EstadoRes = pEstadoRes;
        }
    }
}
