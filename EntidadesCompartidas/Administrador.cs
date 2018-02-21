using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Administrador : Usuario
    {
        // atributos
        private string cargo;
        // propiedades
        public string Cargo
        {
            get { return cargo; }
            set { cargo = value; }
        }
        // constructor
        public Administrador(string pNombre, string pNombreCompleto, string pClave, string pCargo)
            : base(pNombre, pNombreCompleto, pClave)
        {
            Cargo = pCargo;
        }
    }
}
