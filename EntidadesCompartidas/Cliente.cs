using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Cliente : Usuario
    {
        // atributos
        private string direccion,tarjeta;
        // propiedades
        public string Direccion
        { 
            get { return direccion; }
            set { direccion = value; }
        }
        public string Tarjeta
        {
            get { return tarjeta; }
            set
            {
                long a;
                string b = value;

                if (long.TryParse(b, out a))
                {
                    if (value.Length != 16)
                        throw new Exception("El numero de tarjeta debe contener 16 digitos");
                    else
                        tarjeta = value;
                }
                else
                {
                    throw new Exception("La tarjeta solo permite numeros");
                }
            } 
        }
        // constructor
        public Cliente(string pNombre, string pNombreCompleto, string pClave, string pDireccion, string pTarjeta)
            : base(pNombre, pNombreCompleto, pClave)
        {
            Direccion = pDireccion;
            Tarjeta = pTarjeta;
        }
    }
}
