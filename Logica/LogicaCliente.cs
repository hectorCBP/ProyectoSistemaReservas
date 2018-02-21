﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    public class LogicaCliente
    {
        public static void Agregar( Cliente cliente, List<TelefonoCliente> listaTelefonos )
        {
            PersistenciaCliente.nuevo(cliente);

            // TO DO FIX THIS
            // ERROR NOT ROLLBACK NEW CLIENT IF PHONE
            // IS ALREADY INSERT
            /*
            foreach(TelefonoCliente tel in listaTelefonos)
            {
                PersistenciaCliente.nuevo(tel);
            }
            */
        }
    }
}
