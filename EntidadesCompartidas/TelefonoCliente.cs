using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class TelefonoCliente
    {
        // atributos
        private string nombreCliente, numero;
        // propeidades
        public string NombreCliente
        {
            get { return nombreCliente; }
            set { nombreCliente = value; }
        }
        public string Telefono
        {
            get { return numero; }
            set { numero = value; }
        }
        // constructor
        public TelefonoCliente(string pNombreCliente, string pNumero)
        {
            NombreCliente = pNombreCliente;
            Telefono = pNumero; 
        }
    }
}
