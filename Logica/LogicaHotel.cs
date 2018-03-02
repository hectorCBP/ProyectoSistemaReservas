using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaHotel
    {
        public static List<Hotel> ListaHoteles()
        {
            List<Hotel> listaHotel = PersistenciaHotel.ListaHoteles();

            if (listaHotel.Count == 0)
                throw new Exception("No exisiten hoteles registrados");

            return listaHotel;
        }

        public static List<Hotel> ListaCat(int cat)
        {
            List<Hotel> listaCat1 = PersistenciaHotel.ListaHotelesCategoria(cat);

            if (listaCat1.Count == 0)
                throw new Exception("No exisiten hoteles con esta categoria");

            return listaCat1;
        }

        public static Hotel Buscar(string nombre)
        {
            Hotel hotel = PersistenciaHotel.Buscar(nombre);

            if (hotel == null)
                throw new Exception("Nombre de hotel no registrado");

            return hotel;
        }

        public static void Agregar(Hotel hotel)
        {
            PersistenciaHotel.Agregar(hotel);
        }

        public static void Modificar(Hotel hotel)
        {
            PersistenciaHotel.Modificar(hotel);
        }

        public static void Eliminar(string nombre)
        {
            PersistenciaHotel.Eliminar(nombre);
        }
    }
}
