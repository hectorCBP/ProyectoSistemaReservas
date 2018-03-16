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
            set { telefono = value; }
        }
        public string Fax
        {
            get { return fax; }
            set { fax = value; }
        }
        public string UrlFoto
        {
            get { return url_foto; }
            set { url_foto = value; }
        }
        public int Numero
        {
            get { return numero;}
            set { numero = value; }
        }
        public int Categoria
        {
            get { return categoria; }
            set { categoria = value; }
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

