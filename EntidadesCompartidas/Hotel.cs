using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Hotel
    {
        // atributos
        private string nombre, calle, ciudad, telefono, fax, url_foto;
        private int numero, categoria;
        private bool playa, piscina;

        // propiedades
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string Calle
        {
            get { return calle; }
            set { calle = value; }
        }
        public string Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }
        public string Telefono
        {
            get { return telefono; }
            set
            {
                double a;
                string b = value;
                
                    if (double.TryParse(b, out a))
                    {
                        telefono = value;
                    }
                    else
                    {
                        throw new Exception("El teléfono sólo permite numeros");
                    }
                
            }
        }
        public string Fax
        {
            get { return fax; }
            set
            {
                double a;
                string b = value;

                if (double.TryParse(b, out a))
                {
                    fax = value;
                }
                else
                {
                    throw new Exception("El fax sólo permite numeros");
                }
            }
        }
        public string UrlFoto
        {
            get { return url_foto; }
            set { url_foto = value; }
        }
        public int Numero
        {
            get { return numero;}
            set
            {
                if (value >= 0)
                    numero = value;
                else
                    throw new Exception("El número de calle debe ser positivo.");
            }
        }
        public int Categoria
        {
            get { return categoria; }
            set {
                if ((value == 1) || (value == 2) || (value == 3) || (value == 4) || (value == 5)) 
                {
                    categoria = value;
                }
                else
                    throw new Exception("El número de categoría debe debe ser 1, 2, 3, 4 o 5.");
            }
        }
        public bool Playa
        {
            get { return playa; }
            set { playa = value; }
        }
        public bool Piscina
        {
            get { return piscina; }
            set { piscina = value; }
        }

        // constructor
        public Hotel( string pNombre,string pCalle,int pNumero, string pCiudad,int pCat,
                      string pTel,string pFax,string pFoto, bool pPlaya,bool pPiscina)
        {
            Nombre = pNombre;
            Calle = pCalle;
            Ciudad = pCiudad;
            Telefono = pTel;
            Fax = pFax;
            UrlFoto = pFoto;
            Numero = pNumero;
            Categoria = pCat;
            Playa = pPlaya;
            Piscina = pPiscina;
        }

    }   
}

