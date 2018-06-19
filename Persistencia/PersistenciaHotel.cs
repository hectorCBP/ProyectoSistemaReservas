using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;

namespace Persistencia
{
    public class PersistenciaHotel
    {
        public static List<Hotel> ListaHoteles()
        {
            List<Hotel> listaHoteles = new List<Hotel>();

            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("obtenerHoteles", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            Hotel hotel = null;
            try 
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();

                while (lector.Read())
                { 
                   
                    hotel = new Hotel(  (string)lector["nombre"],
                                        (string)lector["calle"],
                                        (int)lector["numero"],
                                        (string)lector["ciudad"],
                                        (int)lector["categoria"],
                                        (string)lector["telefono"],
                                        (string)lector["fax"],
                                        (string)lector["url_foto"],
                                        (bool)lector["playa"],
                                        (bool)lector["piscina"]);
                    listaHoteles.Add(hotel);
                }
                lector.Close();
            }
            catch(Exception ex)
            { throw ex; }
            finally{cnn.Close();}
            return listaHoteles;
        }

        public static List<Hotel> ListaHotelesCategoria(int cat)
        {
            List<Hotel> listaCat1 = new List<Hotel>();

            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);
            SqlCommand cmd = new SqlCommand("ListarCategoria", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cat", cat);

            Hotel hotel = null;
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();

                while (lector.Read())
                {

                    hotel = new Hotel((string)lector["nombre"],
                                        (string)lector["calle"],
                                        (int)lector["numero"],
                                        (string)lector["ciudad"],
                                        (int)lector["categoria"],
                                        (string)lector["telefono"],
                                        (string)lector["fax"],
                                        (string)lector["url_foto"],
                                        (bool)lector["playa"],
                                        (bool)lector["piscina"]);
                    listaCat1.Add(hotel);
                }
                lector.Close();
            }
            catch (Exception ex)
            { throw ex; }
            finally { cnn.Close(); }
            return listaCat1;
        }
        /*BUSCAR*/
        public static Hotel Buscar(string nombre)
        {
            Hotel hotel = null;

            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);

            SqlCommand cmd = new SqlCommand("buscarHotel", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", nombre);
            try
            {
                cnn.Open();
                SqlDataReader lector = cmd.ExecuteReader();

                while (lector.Read())
                {
                    hotel = new Hotel((string)lector["nombre"],
                                        (string)lector["calle"],
                                        (int)lector["numero"],
                                        (string)lector["ciudad"],
                                        (int)lector["categoria"],
                                        (string)lector["telefono"],
                                        (string)lector["fax"],
                                        (string)lector["url_foto"],
                                        (bool)lector["playa"],
                                        (bool)lector["piscina"]);
                }
                lector.Close();
            }
            catch (Exception ex)
            { throw ex; }
            finally { cnn.Close(); }
            return hotel;
        }
        /*AGREGAR*/
        public static void Agregar(Hotel hotel)
        {
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);

            SqlCommand cmd = new SqlCommand("agregarHotel",cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre",hotel.Nombre);
            cmd.Parameters.AddWithValue("@calle", hotel.Calle);
            cmd.Parameters.AddWithValue("@numero", hotel.Numero);
            cmd.Parameters.AddWithValue("@ciudad", hotel.Ciudad);
            cmd.Parameters.AddWithValue("@categoria",hotel.Categoria);
            cmd.Parameters.AddWithValue("@telefono", hotel.Telefono);
            cmd.Parameters.AddWithValue("@fax",hotel.Fax);
            cmd.Parameters.AddWithValue("@url_foto", hotel.UrlFoto);
            cmd.Parameters.AddWithValue("@playa", hotel.Playa);
            cmd.Parameters.AddWithValue("@piscina", hotel.Piscina);

            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);
            int respuesta;

            try 
            { 
                cnn.Open();
                cmd.ExecuteNonQuery();
                respuesta = (int)resSQL.Value;

                if (respuesta == -1)
                    throw new Exception("Nombre de hotel ya existe");

            } 
            catch(Exception ex)
            { throw ex; } 
            finally
            { cnn.Close();}
        }
        /*MODIFICAR*/
        public static void Modificar(Hotel hotel)
        {
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);

            SqlCommand cmd = new SqlCommand("modificarHotel", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nombre", hotel.Nombre);
            cmd.Parameters.AddWithValue("@calle", hotel.Calle);
            cmd.Parameters.AddWithValue("@numero", hotel.Numero);
            cmd.Parameters.AddWithValue("@ciudad", hotel.Ciudad);
            cmd.Parameters.AddWithValue("@categoria", hotel.Categoria);
            cmd.Parameters.AddWithValue("@telefono", hotel.Telefono);
            cmd.Parameters.AddWithValue("@fax", hotel.Fax);
            cmd.Parameters.AddWithValue("@url_foto", hotel.UrlFoto);
            cmd.Parameters.AddWithValue("@playa", hotel.Playa);
            cmd.Parameters.AddWithValue("@piscina", hotel.Piscina);

            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                int respuesta = (int)resSQL.Value;
                if (respuesta == -1)
                    throw new Exception("ERROR SQL, no se pudo completar su petición");
            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }       
        }
        /*ELIMINAR*/
        public static void Eliminar(Hotel pHotel)
        {
            SqlConnection cnn = new SqlConnection(BaseDeDatos.CONEXION);

            SqlCommand cmd = new SqlCommand("eliminarHotel", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nomHotel", pHotel.Nombre);

            SqlParameter resSQL = new SqlParameter();
            resSQL.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(resSQL);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                int respuesta = (int)resSQL.Value;
                if (respuesta == -1)
                    throw new Exception("ERROR SQL, no se pudo completar su petición");

            }
            catch (Exception ex)
            { throw ex; }
            finally
            { cnn.Close(); }
        }
    }
}
