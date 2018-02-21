using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
     public abstract class Usuario
    {
         // atributos
         private string nombre, nombreCompleto, clave;
         // propiedates
         public string Nombre
         {
             get { return nombre; }
             set { nombre = value;}
         }
         public string NombreCompleto
         {
             get { return nombreCompleto; }
             set { nombreCompleto = value; }
         }
         public string Clave
         {
             get { return clave; }
             set { clave = value; }// TO DO restriccion minimo 8 caracteres
         }
         // contructor
         public Usuario(string pNombre, string pNombreCompleto, string pClave)
         {
             Nombre = pNombre;
             NombreCompleto = pNombreCompleto;
             Clave = pClave;
         }
    }
}
