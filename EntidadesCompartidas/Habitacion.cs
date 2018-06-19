using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Habitacion
    {
        // atributos
        private string descripcion;
        private int numero, cant_huesped, piso;
        private decimal costo;
        Hotel hotel;

        // propiedades
        public Hotel Hotel
        { 
            get { return hotel; }
            set
            {
                if (value == null)
                    throw new Exception("La habitacion debe tener un hotel");
                else
                    hotel = value; 
            }
        }
        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        public int Numero
        {
            get { return numero; }
            set
            {
                if (value >= 0)
                    numero = value;
                else
                    throw new Exception("El número de la habitación debe ser positivo.");
            }
        }
        public int CantHuesped
        {
            get { return cant_huesped; }
            set
            {
                if (value >= 0)
                    cant_huesped = value;
                else
                    throw new Exception("La cantidad de huespedes debe ser positiva.");
            }
        }
        public int Piso
        {
            get { return piso; }

            set
            {
                if (value >= 0)
                    piso = value;
                else
                    throw new Exception("El piso de la habitación debe ser positivo.");
            }
        }
        public decimal Costo
        {
            get { return costo; }
            set
            {
                if (value >= 0)
                    costo = value;
                else
                    throw new Exception("El costo de la habitación debe ser positivo.");
            }
        }

        // constructor
        public Habitacion(  int pNumero, Hotel photel, string pDescripcion, 
                            int pCantHuesped, decimal pCosto, int pPiso) 
        {
            Numero = pNumero;
            Hotel = photel;
            Descripcion = pDescripcion;
            CantHuesped = pCantHuesped;
            Costo = pCosto;
            Piso = pPiso;
        }
    }
}
