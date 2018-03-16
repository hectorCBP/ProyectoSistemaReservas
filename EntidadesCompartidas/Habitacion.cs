using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Habitacion
    {
        // atributos
        private string nombre_hotel, descripcion, estado;
        private int numero, cant_huesped, piso;
        private decimal costo;

        // propiedades
        public string NombreHotel
        { 
            get { return nombre_hotel; }
            set { nombre_hotel = value; }
        }
        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        public int Numero
        {
            get { return numero; }
            set { numero = value; }
        }// TO DO control no negativo y mayor a cero
        public int CantHuesped
        {
            get { return cant_huesped; }
            set { cant_huesped = value; }
        }// TO DO control no negativo
        public int Piso
        {
            get { return piso; }
            set { piso = value; }
        }// TO DO control no negativo
        public decimal Costo
        {
            get { return costo; }
            set { costo = value; }
        }// TO DO control no negativo y mayor a cero

        // constructor
        public Habitacion(  int pNumero, string pNombreHotel, string pDescripcion, 
                            int pCantHuesped, decimal pCosto, int pPiso) 
        {
            Numero = pNumero;
            NombreHotel = pNombreHotel;
            Descripcion = pDescripcion;
            CantHuesped = pCantHuesped;
            Costo = pCosto;
            Piso = pPiso;
        }
    }
}
